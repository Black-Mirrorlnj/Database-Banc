create table jogadores(
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> steam_id VARCHAR(50) UNIQUE,
    -> NOME VARCHAR(100),
    -> criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> ultimo_login DATETIME
    -> );

    INSERT INTO jogadores (steam_id, nome, ultimo_login)
VALUES
('STEAM_0:1:111111', 'Carlos', NOW()),
('STEAM_0:1:222222', 'Ana', NOW()),
('STEAM_0:1:333333', 'Pedro', NOW()),
('STEAM_0:1:444444', 'Marcos', NOW()),
('STEAM_0:1:555555', 'Julia', NOW());

DELIMITER //

CREATE TRIGGER log_insert_jogadores
AFTER INSERT ON jogadores
FOR EACH ROW
BEGIN

INSERT INTO logs (tabela, acao, descricao)
VALUES (
    'jogadores',
    'INSERT',
    CONCAT('Novo jogador criado: ', NEW.nome, ' (ID: ', NEW.id, ')')
);

END //

DELIMITER ;