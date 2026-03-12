CREATE TABLE estatisticas (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     jogador_id INT,
    ->     kills INT DEFAULT 0,
    ->     deaths INT DEFAULT 0,
    ->     dinheiro INT DEFAULT 0,
    ->     nivel INT DEFAULT 1,
    ->     experiencia INT DEFAULT 0,
    ->     FOREIGN KEY (jogador_id) REFERENCES jogadores(id)
    -> );

    INSERT INTO estatisticas (jogador_id, kills, deaths, dinheiro, nivel, experiencia)
VALUES
(1, 15, 8, 1200, 2, 45),
(2, 32, 12, 3400, 4, 120),
(3, 7, 20, 800, 1, 25),
(4, 50, 18, 5600, 6, 210),
(5, 22, 14, 2700, 3, 95);

-- Relação de estatisticas com jogadores--

SELECT j.nome, e.kills, e.deaths, e.nivel
FROM jogadores j
JOIN estatisticas e ON j.id = e.jogador_id;