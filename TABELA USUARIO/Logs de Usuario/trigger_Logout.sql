DELIMITER $$

CREATE TRIGGER trg_game_logout
AFTER INSERT ON log_gameplay
FOR EACH ROW
BEGIN
    IF NEW.action = 'LOGOUT' THEN
        UPDATE game_sessions
        SET logoutAt = CURRENT_TIMESTAMP
        WHERE userId = NEW.userId
        AND logoutAt IS NULL;
    END IF;
END$$

DELIMITER ;
