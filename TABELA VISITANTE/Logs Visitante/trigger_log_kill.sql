DELIMITER //

CREATE TRIGGER trg_log_kills
AFTER UPDATE ON visitante
FOR EACH ROW
BEGIN
    IF NEW.kills <> OLD.kills THEN
        INSERT INTO logs (id_visitante, acao, descricao)
        VALUES (
            NEW.id_visitante,
            'UPDATE_KILLS',
            CONCAT('Kills atualizado de ', OLD.kills, ' para ', NEW.kills)
        );
    END IF;
END //

DELIMITER ;