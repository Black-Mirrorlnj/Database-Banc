-------Registro------

DELIMITER $$

CREATE TRIGGER trg_match_insert
AFTER INSERT ON matches
FOR EACH ROW
BEGIN
    INSERT INTO log_gameplay (userId, action, details)
    VALUES (
        NEW.userId,
        'MATCH_PLAYED',
        CONCAT('Resultado: ', NEW.result, ' | Score: ', NEW.score)
    );
END$$

DELIMITER ;
