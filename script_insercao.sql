USE lab_impressao_3d;

INSERT INTO usuario (nome_completo, email, telefone, categoria) VALUES
('Ana Beatriz Souza',     'ana.souza@aluno.imbr.edu.br',   '(11) 91111-1111', 'Aluno'),
('Carlos Eduardo Lima',   'carlos.lima@aluno.imbr.edu.br', '(11) 92222-2222', 'Aluno'),
('Marcos Vinícius Rocha', 'marcos.rocha@imbr.edu.br',      '(11) 93333-3333', 'Professor'),
('Juliana Prado Martins', 'juliana.prado@email.com',       '(11) 94444-4444', 'Cliente Externo'),
('Rafael Mendes Alves',   'rafael.alves@aluno.imbr.edu.br','(11) 95555-5555', 'Aluno');

INSERT INTO maquina (patrimonio, marca, modelo, tecnologia, status) VALUES
('PAT-001', 'Creality', 'Ender-3 V2',       'FDM',        'Operando'),
('PAT-002', 'Prusa',    'i3 MK3S+',         'FDM',        'Disponível'),
('PAT-003', 'Anycubic', 'Photon Mono X',    'SLA/Resina', 'Operando'),
('PAT-004', 'Elegoo',   'Mars 3',           'SLA/Resina', 'Em Manutenção');

INSERT INTO material (tipo_polimero, cor, quantidade_estoque, unidade) VALUES
('PLA',           'Branco', 1000.00, 'g'),
('PLA',           'Preto',   750.00, 'g'),
('ABS',           'Cinza',   500.00, 'g'),
('PETG',          'Azul',    800.00, 'g'),
('Resina Padrão', 'Cinza',   500.00, 'ml');

INSERT INTO pedido
(id_usuario, patrimonio, id_material, data_solicitacao, arquivo_3d, tempo_estimado_min, peso_estimado, status) VALUES

(1, 'PAT-001', 1, '2026-10-01', 'suporte_celular.stl',   180,  45.50, 'Concluído'),
(2, 'PAT-002', 4, '2026-10-03', 'engrenagem_motor.stl',  240,  60.00, 'Concluído'),
(3, 'PAT-003', 5, '2026-10-05', 'mini_busto.stl',        300,  80.00, 'Concluído'),

(1, 'PAT-001', 2, '2026-10-20', 'peca_motor.stl',        360, 120.00, 'Imprimindo'),
(4, 'PAT-003', 5, '2026-10-22', 'prototipo_caixa.stl',   150,  35.00, 'Imprimindo'),

(5, NULL, NULL,   '2026-10-25', 'carcaca_arduino.stl',   210,  70.00, 'Na Fila'),
(2, NULL, NULL,   '2026-10-26', 'chaveiro_logo.stl',      45,  10.00, 'Na Fila'),
(3, NULL, NULL,   '2026-10-27', 'suporte_sensor.stl',    120,  30.00, 'Na Fila'),

(5, 'PAT-002', 3, '2026-10-10', 'gancho_abs.stl',        200,  55.00, 'Falhou'),

(4, NULL, NULL,   '2026-10-12', 'vaso_decorativo.stl',   480, 150.00, 'Cancelado');

INSERT INTO manutencao (patrimonio, data_manutencao, descricao, custo) VALUES
('PAT-001', '2026-09-20', 'Manutenção preventiva: lubrificação dos eixos e limpeza do bico', 35.50),
('PAT-002', '2026-09-25', 'Manutenção preventiva: calibração da mesa e troca de correia',    20.00),
('PAT-004', '2026-10-15', 'Manutenção corretiva: troca da tela LCD de cura',                180.00);