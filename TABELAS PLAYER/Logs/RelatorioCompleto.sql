SELECT 
DATE_FORMAT(data_evento, '%d/%m/%Y %H:%i') AS data_formatada,
tabela,
acao,
descricao
FROM logs
ORDER BY data_evento DESC;