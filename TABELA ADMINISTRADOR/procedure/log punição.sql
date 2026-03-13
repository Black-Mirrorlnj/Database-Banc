SELECT 
j.nome AS jogador,
a.username AS administrador,
p.tipo_punicao,
p.motivo,
p.data_punicao
FROM punicoes p
JOIN jogadores j ON p.jogador_id = j.id
JOIN administrador a ON p.id_admin = a.id_admin;
