DELIMITER //

CREATE PROCEDURE finalizar_partida_completa(
    IN p_jogador_id INT,
    IN p_partida_id INT,
    IN p_score_final INT,
    IN p_kills INT,
    IN p_deaths INT
)
BEGIN

-- Atualiza score final --
UPDATE pontuacoes
SET score_final = p_score_final
WHERE jogador_id = p_jogador_id
AND partida_id = p_partida_id;

-- Atualiza estatísticas --
UPDATE estatisticas
SET 
    kills = kills + p_kills,
    deaths = deaths + p_deaths,
    experiencia = experiencia + p_score_final
WHERE jogador_id = p_jogador_id;

-- Atualiza nível --
UPDATE estatisticas
SET nivel = FLOOR(experiencia / 100) + 1
WHERE jogador_id = p_jogador_id;

-- Atualiza ranking global --
UPDATE ranking_global
SET pontos = pontos + p_score_final
WHERE jogador_id = p_jogador_id;

INSERT INTO logs (tabela, acao, descricao)
VALUES (
    'pontuacoes',
    'UPDATE',
    CONCAT(
        'Jogador ', p_jogador_id,
        ' finalizou partida ', p_partida_id,
        ' com score ', p_score_final
    )
);

END //

DELIMITER ;


--Execute do procedimento--
CALL finalizar_partida_completa(2, 3, 250, 12, 4);


