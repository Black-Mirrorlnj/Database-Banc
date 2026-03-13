-- Eventos administrativos importantes

CREATE TABLE eventos_admin (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT,
    titulo VARCHAR(100),
    descricao TEXT,
    data_evento DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_admin) REFERENCES administrador(id_admin)
  INSERT INTO eventos_admin (id_admin, titulo, descricao)
VALUES
(1, 'Atualização do servidor', 'Atualização do mapa e correção de bugs'),
(2, 'Evento especial', 'Evento de XP dobrado durante o fim de semana');
);
