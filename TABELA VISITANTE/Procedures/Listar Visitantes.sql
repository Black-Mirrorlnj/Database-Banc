---------Procedures Listar Visitante--------

DELIMITER //

CREATE PROCEDURE listar_visitantes()
BEGIN
    SELECT * FROM visitante;
END //

DELIMITER ;
CALL listar_visitantes();

---------Procedures Listar Visitante--------
