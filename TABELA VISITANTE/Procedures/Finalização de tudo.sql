---------Procedures Listar Visitante--------

DELIMITER //

CREATE PROCEDURE listar_visitantes()
BEGIN
    SELECT * FROM visitante;
END //

DELIMITER ;
CALL listar_visitantes();

---------Procedures Listar Visitante--------


-----------Procedures Ranking de Kills----------

DELIMITER //

CREATE PROCEDURE ranking_kills()
BEGIN
    SELECT nome_usuario, kills
    FROM visitante
    ORDER BY kills DESC;
END //

DELIMITER ;
CALL ranking_kills();

-----------Procedures Ranking de Kills----------


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

-------Procedures Registra entrada------------

DELIMITER //

CREATE PROCEDURE registrar_entrada (
    IN p_nome VARCHAR(50)
)
BEGIN
    INSERT INTO visitante (nome_usuario, horario_entrada)
    VALUES (p_nome, NOW());
END //

DELIMITER ;
CALL registrar_entrada('Julio');

-----Prodecures Registrar entrada-----------

-------Procedures Registra entrada------------

DELIMITER //

CREATE PROCEDURE registrar_entrada (
    IN p_nome VARCHAR(50)
)
BEGIN
    INSERT INTO visitante (nome_usuario, horario_entrada)
    VALUES (p_nome, NOW());
END //

DELIMITER ;
CALL registrar_entrada('Julio');

-----Prodecures Registrar entrada-----------
