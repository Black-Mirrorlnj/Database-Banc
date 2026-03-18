DELIMITER //

CREATE TRIGGER trg_log_saida
AFTER UPDATE ON visitante
FOR EACH ROW
BEGIN
    IF NEW.horario_saida IS NOT NULL AND OLD.horario_saida IS NULL THEN
        INSERT INTO logs (id_visitante, acao, descricao)
        VALUES (
            NEW.id_visitante,
            'SAIDA',
            CONCAT('Usuário ', NEW.nome_usuario, ' saiu com ', NEW.kills, ' kills')
        );
    END IF;
END //

DELIMITER ;