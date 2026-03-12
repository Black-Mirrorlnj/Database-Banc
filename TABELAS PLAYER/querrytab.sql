SELECT 
j.nome AS jogador,
p.partida_id AS partida,
pa.mapa,
e.kills,
e.deaths,
p.score_inicial,
p.score_final,
e.nivel,
e.dinheiro
FROM pontuacoes p
JOIN jogadores j ON p.jogador_id = j.id
JOIN estatisticas e ON j.id = e.jogador_id
JOIN partidas pa ON p.partida_id = pa.id
ORDER BY p.score_final DESC;