-- ================================================================
--  BANCO DE DADOS — GMOD VISITANTE
--  Projeto: com.score.garrys
--  Gerado em: 2026-04-18
-- ================================================================

-- ────────────────────────────────────────────────────────────────
-- 1. BANCO
-- ────────────────────────────────────────────────────────────────

CREATE DATABASE IF NOT EXISTS gmod
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE gmod;

-- ────────────────────────────────────────────────────────────────
-- 2. TABELAS
-- ────────────────────────────────────────────────────────────────

-- Tabela principal: visitante
CREATE TABLE IF NOT EXISTS visitante (
    id_visitante    INT             AUTO_INCREMENT  PRIMARY KEY,
    nome_usuario    VARCHAR(50)     NOT NULL,
    kills           INT             NOT NULL DEFAULT 0,
    horario_entrada DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    horario_saida   DATETIME        NULL,

    -- Garante que não haja visitante com nome vazio
    CONSTRAINT chk_nome_nao_vazio   CHECK (CHAR_LENGTH(TRIM(nome_usuario)) >= 3),
    -- Kills nunca negativo
    CONSTRAINT chk_kills_positivo   CHECK (kills >= 0),
    -- Saída só pode ser depois da entrada
    CONSTRAINT chk_saida_apos_entrada CHECK (
        horario_saida IS NULL OR horario_saida >= horario_entrada
    )
);

-- Tabela de logs: registra todas as ações automaticamente via trigger
CREATE TABLE IF NOT EXISTS logs (
    id_log          INT             AUTO_INCREMENT  PRIMARY KEY,
    id_visitante    INT             NOT NULL,
    acao            VARCHAR(20)     NOT NULL,       -- 'ENTRADA' | 'SAIDA' | 'UPDATE_KILLS'
    descricao       TEXT            NULL,
    data_hora       DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_logs_visitante
        FOREIGN KEY (id_visitante)
        REFERENCES visitante(id_visitante)
        ON DELETE CASCADE   -- ao remover visitante, remove os logs dele também
        ON UPDATE CASCADE
);

-- ────────────────────────────────────────────────────────────────
-- 3. ÍNDICES  (melhora performance nas queries mais comuns)
-- ────────────────────────────────────────────────────────────────

-- Ranking por kills (ORDER BY kills DESC — usado em ranking_kills())
CREATE INDEX idx_visitante_kills
    ON visitante(kills DESC);

-- Busca por nome (útil se o sistema crescer)
CREATE INDEX idx_visitante_nome
    ON visitante(nome_usuario);

-- Busca de logs por visitante
CREATE INDEX idx_logs_visitante
    ON logs(id_visitante);

-- ────────────────────────────────────────────────────────────────
-- 4. TRIGGERS  (disparam automaticamente a cada ação)
-- ────────────────────────────────────────────────────────────────

-- 4.1 — Registra log quando visitante ENTRA (INSERT)
DELIMITER //
CREATE TRIGGER trg_log_entrada
AFTER INSERT ON visitante
FOR EACH ROW
BEGIN
    INSERT INTO logs (id_visitante, acao, descricao)
    VALUES (
        NEW.id_visitante,
        'ENTRADA',
        CONCAT('Usuário "', NEW.nome_usuario, '" entrou no servidor')
    );
END //
DELIMITER ;

-- 4.2 — Registra log quando visitante SAI (UPDATE em horario_saida)
DELIMITER //
CREATE TRIGGER trg_log_saida
AFTER UPDATE ON visitante
FOR EACH ROW
BEGIN
    IF NEW.horario_saida IS NOT NULL AND OLD.horario_saida IS NULL THEN
        INSERT INTO logs (id_visitante, acao, descricao)
        VALUES (
            NEW.id_visitante,
            'SAIDA',
            CONCAT('Usuário "', NEW.nome_usuario, '" saiu com ', NEW.kills, ' kill(s)')
        );
    END IF;
END //
DELIMITER ;

-- 4.3 — Registra log quando kills é atualizado
DELIMITER //
CREATE TRIGGER trg_log_kills
AFTER UPDATE ON visitante
FOR EACH ROW
BEGIN
    IF NEW.kills <> OLD.kills THEN
        INSERT INTO logs (id_visitante, acao, descricao)
        VALUES (
            NEW.id_visitante,
            'UPDATE_KILLS',
            CONCAT('Kills de "', NEW.nome_usuario, '" atualizado: ', OLD.kills, ' → ', NEW.kills)
        );
    END IF;
END //
DELIMITER ;

-- ────────────────────────────────────────────────────────────────
-- 5. PROCEDURES  (chamadas pelo VisitanteRepository via CALL)
-- ────────────────────────────────────────────────────────────────

-- 5.1 — Registrar entrada de um visitante
DELIMITER //
CREATE PROCEDURE registrar_entrada(IN p_nome VARCHAR(50))
BEGIN
    -- Valida nome antes de inserir
    IF p_nome IS NULL OR CHAR_LENGTH(TRIM(p_nome)) < 3 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nome deve ter pelo menos 3 caracteres';
    END IF;

    INSERT INTO visitante (nome_usuario, horario_entrada)
    VALUES (TRIM(p_nome), NOW());
END //
DELIMITER ;

-- 5.2 — Registrar saída e atualizar kills
DELIMITER //
CREATE PROCEDURE registrar_saida(IN p_id INT, IN p_kills INT)
BEGIN
    -- Verifica se o visitante existe
    IF NOT EXISTS (SELECT 1 FROM visitante WHERE id_visitante = p_id) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Visitante não encontrado';
    END IF;

    -- Valida kills
    IF p_kills < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Kills não pode ser negativo';
    END IF;

    UPDATE visitante
    SET horario_saida = NOW(),
        kills = p_kills
    WHERE id_visitante = p_id;
END //
DELIMITER ;

-- 5.3 — Listar todos os visitantes
DELIMITER //
CREATE PROCEDURE listar_visitantes()
BEGIN
    SELECT
        id_visitante,
        nome_usuario,
        kills,
        horario_entrada,
        horario_saida
    FROM visitante
    ORDER BY horario_entrada DESC;
END //
DELIMITER ;

-- 5.4 — Ranking por kills (top visitantes)
DELIMITER //
CREATE PROCEDURE ranking_kills()
BEGIN
    SELECT
        nome_usuario,
        kills
    FROM visitante
    ORDER BY kills DESC
    LIMIT 50;   -- evita carregar tabela inteira
END //
DELIMITER ;

-- 5.5 — Remover visitante por ID (com verificação)
DELIMITER //
CREATE PROCEDURE remover_visitante(IN p_id INT)
BEGIN
    -- Verifica se existe antes de deletar
    IF NOT EXISTS (SELECT 1 FROM visitante WHERE id_visitante = p_id) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Visitante não encontrado para remoção';
    END IF;

    DELETE FROM visitante WHERE id_visitante = p_id;
END //
DELIMITER ;

-- ────────────────────────────────────────────────────────────────
-- 6. DADOS DE TESTE  (remova antes de ir para produção)
-- ────────────────────────────────────────────────────────────────

CALL registrar_entrada('PlayerOne');
CALL registrar_entrada('SniperXZ');
CALL registrar_entrada('Noob123');

-- Simula saída com kills
CALL registrar_saida(1, 15);
CALL registrar_saida(2, 32);

-- ────────────────────────────────────────────────────────────────
-- 7. VERIFICAÇÃO RÁPIDA  (rode para confirmar que tudo foi criado)
-- ────────────────────────────────────────────────────────────────

-- Ver visitantes cadastrados
CALL listar_visitantes();

-- Ver ranking
CALL ranking_kills();

-- Ver logs gerados automaticamente pelos triggers
SELECT * FROM logs ORDER BY data_hora DESC;

-- ================================================================
--  FIM DO SCRIPT
-- ================================================================
