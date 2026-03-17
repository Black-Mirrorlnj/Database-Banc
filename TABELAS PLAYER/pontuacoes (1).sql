 CREATE TABLE pontuacoes (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     jogador_id INT,
    ->     partida_id INT,
    ->     score_inicial INT DEFAULT 0,
    ->     score_final INT DEFAULT 0,
    ->     FOREIGN KEY (jogador_id) REFERENCES jogadores(id),
    ->     FOREIGN KEY (partida_id) REFERENCES partidas(id)
    -> );

    INSERT INTO pontuacoes (jogador_id, partida_id, score_inicial, score_final)
VALUES
(1, 1, 0, 120),
(2, 1, 0, 200),
(3, 2, 0, 85),
(4, 3, 0, 310),
(5, 4, 0, 150);

--Mostrar nome do jogador + score--

SELECT j.nome, p.partida_id, p.score_final
FROM pontuacoes p
JOIN jogadores j ON p.jogador_id = j.id;

--Atualização dos Pontos--

DELIMITER //

CREATE TRIGGER log_update_pontuacoes
AFTER UPDATE ON pontuacoes
FOR EACH ROW
BEGIN

INSERT INTO logs (tabela, acao, descricao)
VALUES (
    'pontuacoes',
    'UPDATE',
    CONCAT(
        'Jogador ', NEW.jogador_id,
        ' na partida ', NEW.partida_id,
        ' | Score: ', OLD.score_final, ' -> ', NEW.score_final
    )
);

END //

DELIMITER ;