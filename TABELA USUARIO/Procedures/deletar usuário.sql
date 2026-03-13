-------deletar usuário-------

DELIMITER $$

CREATE PROCEDURE sp_delete_user (
    IN p_userId INT
)
BEGIN
    DELETE FROM users
    WHERE userId = p_userId;
END $$

DELIMITER ;
