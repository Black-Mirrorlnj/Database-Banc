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