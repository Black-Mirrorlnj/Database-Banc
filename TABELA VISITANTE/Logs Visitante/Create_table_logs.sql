CREATE TABLE logs (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_visitante INT NOT NULL,
    acao VARCHAR(20) NOT NULL,
    descricao TEXT,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_visitante)
    REFERENCES visitante(id_visitante)
    ON DELETE CASCADE
);