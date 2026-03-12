CREATE TABLE partidas (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     mapa VARCHAR(100),
    ->     data_inicio DATETIME,
    ->     data_fim DATETIME
    -> );

    INSERT INTO partidas (mapa, data_inicio, data_fim)
VALUES
('gm_construct', '2026-03-10 14:00:00', '2026-03-10 14:45:00'),
('gm_flatgrass', '2026-03-10 15:00:00', '2026-03-10 15:30:00'),
('gm_bigcity', '2026-03-10 16:00:00', '2026-03-10 16:50:00'),
('gm_construct', '2026-03-11 18:10:00', '2026-03-11 18:55:00'),
('gm_flatgrass', '2026-03-11 19:05:00', '2026-03-11 19:40:00');