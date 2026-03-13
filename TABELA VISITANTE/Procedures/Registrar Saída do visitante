-----------Procedures registrar saída do visitante-------

DELIMITER //

CREATE PROCEDURE registrar_saida (
    IN p_id INT,
    IN p_kills INT
)
BEGIN
    UPDATE visitante
    SET horario_saida = NOW(),
        kills = p_kills
    WHERE id_visitante = p_id;
END //

DELIMITER ;
CALL registrar_saida(1, 8);

-----------Procedures registrar saída do visitante-------
