--Inserção dos Dados--

DELIMITER //

CREATE TRIGGER log_insert_partidas
AFTER INSERT ON partidas
FOR EACH ROW
BEGIN

INSERT INTO logs (tabela, acao, descricao)
VALUES (
    'partidas',
    'INSERT',
    CONCAT(
        'Partida criada no mapa ', NEW.mapa,
        ' (ID: ', NEW.id, ')'
    )
);

END //

DELIMITER ;

--Atualização dos Dados--

DELIMITER //

CREATE TRIGGER log_update_partidas
AFTER UPDATE ON partidas
FOR EACH ROW
BEGIN

IF OLD.data_fim IS NULL AND NEW.data_fim IS NOT NULL THEN

INSERT INTO logs (tabela, acao, descricao)
VALUES (
    'partidas',
    'UPDATE',
    CONCAT(
        'Partida ', NEW.id,
        ' finalizada no mapa ', NEW.mapa
    )
);

END IF;

END //

DELIMITER ;