------Ban------

DELIMITER $$

CREATE TRIGGER trg_ban
AFTER INSERT ON log_security
FOR EACH ROW
BEGIN
    IF NEW.event = 'BAN' THEN
        INSERT INTO log_gameplay (userId, action, details)
        VALUES (NEW.userId, 'USER_BANNED', NEW.details);
    END IF;
END$$

DELIMITER ;
