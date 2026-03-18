DELIMITER //

CREATE TRIGGER trg_log_entrada
AFTER INSERT ON visitante
FOR EACH ROW
BEGIN
    INSERT INTO logs (id_visitante, acao, descricao)
    VALUES (
        NEW.id_visitante,
        'ENTRADA',
        CONCAT('Usuário ', NEW.nome_usuario, ' entrou no jogo')
    );
END //

DELIMITER ;