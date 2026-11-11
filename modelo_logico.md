# Modelo Lógico Relacional

Conversão do DER conceitual para tabelas. **PK** = chave primária, **FK** = chave estrangeira.

```
USUARIO (id_usuario PK, nome_completo, email UNIQUE, telefone, categoria)

MAQUINA (patrimonio PK, marca, modelo, tecnologia, status)

MATERIAL (id_material PK, tipo_polimero, cor, quantidade_estoque, unidade)

PEDIDO (id_pedido PK, id_usuario FK, patrimonio FK (nulo), id_material FK (nulo),
        data_solicitacao, arquivo_3d, tempo_estimado_min, peso_estimado, status)

MANUTENCAO (id_manutencao PK, patrimonio FK, data_manutencao, descricao, custo)
```

## Chaves estrangeiras

| Tabela | Coluna FK | Referencia |
|---|---|---|
| PEDIDO | id_usuario | USUARIO.id_usuario |
| PEDIDO | patrimonio | MAQUINA.patrimonio |
| PEDIDO | id_material | MATERIAL.id_material |
| MANUTENCAO | patrimonio | MAQUINA.patrimonio |

## Decisões de modelagem

- Como a cardinalidade é sempre 1:N, a FK fica na tabela do lado "N" (PEDIDO ou MANUTENCAO). Não houve N:M, então não há tabela associativa.
- `patrimonio` e `id_material` em PEDIDO aceitam NULL, porque um pedido "Na Fila" ainda não tem máquina nem material alocados. Um CHECK garante que pedidos "Imprimindo", "Concluído" ou "Falhou" tenham os dois preenchidos.
- Foi adicionada a coluna `unidade` (g ou ml) em MATERIAL, já que o estoque é medido em gramas (filamento) ou mililitros (resina).
- Restrições: e-mail UNIQUE; estoque >= 0; tempo e peso estimados > 0; custo >= 0.
