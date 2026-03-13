----------Procedures Remover visitante-----------

DELIMITER //

CREATE PROCEDURE remover_visitante (
    IN p_id INT
)
BEGIN
    DELETE FROM visitante
    WHERE id_visitante = p_id;
END //

DELIMITER ;
CALL remover_visitante(3);
----------Procedures Remover visitante-----------
