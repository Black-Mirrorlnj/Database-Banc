--------buscar usuário por ID--------

DELIMITER $$

CREATE PROCEDURE sp_get_user_by_id (
    IN p_userId INT
)
BEGIN
    SELECT * FROM users
    WHERE userId = p_userId;
END $$

DELIMITER ;
