USE lab_impressao_3d;

SELECT *
FROM pedido
WHERE status = 'Na Fila';

SELECT SUM(quantidade_estoque) AS total_pla_gramas
FROM material
WHERE tipo_polimero = 'PLA';

SELECT p.id_pedido,
       u.nome_completo,
       p.arquivo_3d,
       p.data_solicitacao,
       p.status
FROM pedido p
INNER JOIN usuario u ON u.id_usuario = p.id_usuario
WHERE u.categoria = 'Aluno'
ORDER BY p.id_pedido;

SELECT u.nome_completo AS usuario,
       p.arquivo_3d    AS arquivo,
       m.marca         AS marca_impressora,
       mat.cor         AS cor_material
FROM pedido p
INNER JOIN usuario  u   ON u.id_usuario   = p.id_usuario
INNER JOIN maquina  m   ON m.patrimonio   = p.patrimonio
INNER JOIN material mat ON mat.id_material = p.id_material;

SELECT m.patrimonio,
       m.marca,
       m.modelo,
       SUM(p.tempo_estimado_min)                AS tempo_total_minutos,
       ROUND(SUM(p.tempo_estimado_min) / 60, 2) AS tempo_total_horas
FROM pedido p
INNER JOIN maquina m ON m.patrimonio = p.patrimonio
WHERE p.status = 'Imprimindo'
GROUP BY m.patrimonio, m.marca, m.modelo;