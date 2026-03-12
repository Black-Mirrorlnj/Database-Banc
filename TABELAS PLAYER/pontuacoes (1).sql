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