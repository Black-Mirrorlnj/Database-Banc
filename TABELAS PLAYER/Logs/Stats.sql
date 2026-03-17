DELIMITER //

CREATE TRIGGER log_update_estatisticas
AFTER UPDATE ON estatisticas
FOR EACH ROW
BEGIN

INSERT INTO logs (tabela, acao, descricao)
VALUES (
    'estatisticas',
    'UPDATE',
    CONCAT(
        'Jogador ', NEW.jogador_id,
        ' | Kills: ', OLD.kills, ' -> ', NEW.kills,
        ' | Deaths: ', OLD.deaths, ' -> ', NEW.deaths,
        ' | Exp: ', OLD.experiencia, ' -> ', NEW.experiencia
    )
);

END //

DELIMITER ;