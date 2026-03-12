CREATE TABLE ranking_global (
    jogador_id INT PRIMARY KEY,
    pontos INT DEFAULT 0,
    posicao INT,
    FOREIGN KEY (jogador_id) REFERENCES jogadores(id)
);

INSERT INTO ranking_global (jogador_id, pontos, posicao)
VALUES
(1, 1200, 3),
(2, 2100, 2),
(3, 900, 4),
(4, 3200, 1),
(5, 1500, 5);