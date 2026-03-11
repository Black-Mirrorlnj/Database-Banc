 CREATE TABLE pontuacoes (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     jogador_id INT,
    ->     partida_id INT,
    ->     score_inicial INT DEFAULT 0,
    ->     score_final INT DEFAULT 0,
    ->     FOREIGN KEY (jogador_id) REFERENCES jogadores(id),
    ->     FOREIGN KEY (partida_id) REFERENCES partidas(id)
    -> );