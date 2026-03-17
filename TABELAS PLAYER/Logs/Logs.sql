Create Table logs(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabela VARCHAR(50),
    acao VARCHAR(20),
    descricao TEXT,
    data_evento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO logs (tabela, acao, descricao)
VALUES 
('pontuacoes', 'UPDATE', 'Jogador 1 finalizou a partida 1 com score 120'),
('estatisticas', 'UPDATE', 'Jogador 3 teve kills atualizados de 7 para 12'),
('ranking_global', 'UPDATE', 'Jogador 4 subiu para o topo do ranking com 3200 pontos'),
('partidas', 'INSERT', 'Nova partida criada no mapa gm_construct'),
('jogadores', 'INSERT', 'Novo jogador Julia registrado no sistema');


