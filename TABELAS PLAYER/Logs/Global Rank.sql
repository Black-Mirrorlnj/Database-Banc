--Atualizar Rank Global--

DELIMITER //

CREATE TRIGGER log_update_ranking
AFTER UPDATE ON ranking_global
FOR EACH ROW
BEGIN

INSERT INTO logs (tabela, acao, descricao)
VALUES (
    'ranking_global',
    'UPDATE',
    CONCAT(
        'Jogador ', NEW.jogador_id,
        ' | Pontos: ', OLD.pontos, ' -> ', NEW.pontos
    )
);

END //

DELIMITER ;