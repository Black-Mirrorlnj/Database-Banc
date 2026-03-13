-- Tabela principal de administradores do sistema
-- Controla usuários com permissões especiais no servidor

CREATE TABLE administrador (
    id_admin INT AUTO_INCREMENT PRIMARY KEY, -- ID único do administrador
    username VARCHAR(50) NOT NULL UNIQUE, -- Nome de login do admin
    password VARCHAR(100) NOT NULL, -- Senha do admin
    email VARCHAR(100), -- Email para contato
    nivel_acesso INT DEFAULT 1, -- Nível de permissão
    status VARCHAR(20) DEFAULT 'ativo', -- ativo / suspenso
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP, -- Data de criação
    ultimo_login DATETIME -- Último login do administrador
    INSERT INTO administrador (username, password, email, nivel_acesso)
VALUES
('admin_master', 'admin123', 'master@server.com', 3),
('moderador1', 'mod123', 'mod1@server.com', 1),
('admin_gm', 'admin456', 'admin@server.com', 2);
);
