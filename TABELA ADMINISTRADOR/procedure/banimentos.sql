-- Banimentos aplicados a jogadores

CREATE TABLE bans (
    id_ban INT AUTO_INCREMENT PRIMARY KEY,
    jogador_id INT,
    id_admin INT,
    motivo VARCHAR(255),
    tipo_ban VARCHAR(50), -- permanente ou temporario
    data_ban DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_expiracao DATETIME,
    ip_banido VARCHAR(50),

    FOREIGN KEY (jogador_id) REFERENCES jogadores(id),
    FOREIGN KEY (id_admin) REFERENCES administrador(id_admin)
  INSERT INTO bans (jogador_id, id_admin, motivo, tipo_ban, data_expiracao)
VALUES
(3, 1, 'Uso de cheat', 'permanente', NULL),
(4, 2, 'Exploit de bug', 'temporario', '2026-03-20 12:00:00');
);
