-- Tabela que registra ações realizadas pelos administradores
-- Serve para auditoria e histórico de atividades

CREATE TABLE logs_admin (
    id_log INT AUTO_INCREMENT PRIMARY KEY, -- ID do log
    id_admin INT, -- Admin responsável pela ação
    acao VARCHAR(255), -- Descrição da ação
    ip_admin VARCHAR(50), -- IP de onde o admin executou a ação
    data_acao DATETIME DEFAULT CURRENT_TIMESTAMP, -- Data da ação

    FOREIGN KEY (id_admin) REFERENCES administrador(id_admin)
  INSERT INTO logs_admin (id_admin, acao, ip_admin)
VALUES
(1, 'Baniu jogador Carlos', '192.168.0.10'),
(2, 'Kickou jogador Pedro', '192.168.0.15'),
(1, 'Resetou ranking global', '192.168.0.10');
);
