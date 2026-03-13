-- Chat interno entre administradores

CREATE TABLE chat_admin (
    id_mensagem INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT,
    mensagem TEXT,
    data_envio DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_admin) REFERENCES administrador(id_admin)
  INSERT INTO chat_admin (id_admin, mensagem)
VALUES
(1, 'Servidor reiniciará em 10 minutos'),
(2, 'Detectei um jogador suspeito usando exploit');
);
