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