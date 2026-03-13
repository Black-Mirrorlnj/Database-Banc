-- Tabela de advertências aplicadas a jogadores

CREATE TABLE punicoes (
    id_punicao INT AUTO_INCREMENT PRIMARY KEY,
    jogador_id INT, -- jogador punido
    id_admin INT, -- admin responsável
    tipo_punicao VARCHAR(50), -- aviso, mute, kick
    motivo VARCHAR(255), -- motivo da punição
    duracao_minutos INT, -- duração da punição
    data_punicao DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (jogador_id) REFERENCES jogadores(id),
    FOREIGN KEY (id_admin) REFERENCES administrador(id_admin)
  INSERT INTO punicoes (jogador_id, id_admin, tipo_punicao, motivo, duracao_minutos)
VALUES
(2, 1, 'mute', 'Spam no chat', 10),
(3, 2, 'aviso', 'Linguagem ofensiva', NULL),
(5, 1, 'kick', 'AFK prolongado', NULL);
);
