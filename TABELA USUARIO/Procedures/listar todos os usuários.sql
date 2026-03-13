--------Procedures listar todos usuários--------

DELIMITER $$

CREATE PROCEDURE sp_list_users ()
BEGIN
    SELECT * FROM users;
END $$

DELIMITER ;
