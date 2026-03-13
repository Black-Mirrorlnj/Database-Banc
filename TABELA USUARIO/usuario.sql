CREATE TABLE users (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users (username, password) VALUES
('gabriel', '123456'),
('ana', 'senha123'),
('carlos', 'abc123'),
('mariana', 'mariana2024'),
('joao', 'joao321'),
('fernanda', 'fernanda@123'),
('lucas', 'lucaspass'),
('beatriz', 'bia12345'),
('rodrigo', 'rod123'),
('patricia', 'patricia789');
