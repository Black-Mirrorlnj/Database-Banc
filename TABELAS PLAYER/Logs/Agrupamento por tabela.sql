SELECT tabela, COUNT(*) AS total_eventos
FROM logs
GROUP BY tabela
ORDER BY total_eventos DESC;