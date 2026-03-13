-------atualizar usuário--------

DELIMITER $$

CREATE PROCEDURE sp_update_user (
    IN p_userId INT,
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(100)
)
BEGIN
    UPDATE users
    SET username = p_username,
        password = p_password
    WHERE userId = p_userId;
END $$

DELIMITER ;
