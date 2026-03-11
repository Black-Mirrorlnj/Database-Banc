create table jogadores(
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> steam_id VARCHAR(50) UNIQUE,
    -> NOME VARCHAR(100),
    -> criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> ultimo_login DATETIME
    -> );