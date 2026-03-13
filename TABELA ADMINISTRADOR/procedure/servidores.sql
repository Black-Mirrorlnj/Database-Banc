-- Servidores disponíveis no sistema

CREATE TABLE servidores (
    id_servidor INT AUTO_INCREMENT PRIMARY KEY,
    nome_servidor VARCHAR(100),
    ip VARCHAR(50),
    porta INT,
    mapa_atual VARCHAR(100),
    max_jogadores INT,
    status_servidor VARCHAR(20) DEFAULT 'online',
    id_admin INT,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_admin) REFERENCES administrador(id_admin)
  INSERT INTO servidores (nome_servidor, ip, porta, mapa_atual, max_jogadores, id_admin)
VALUES
('GMOD Brasil #1', '192.168.0.50', 27015, 'gm_construct', 32, 1),
('GMOD Sandbox', '192.168.0.51', 27016, 'gm_flatgrass', 24, 2);
);
