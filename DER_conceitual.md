# Modelo Entidade-Relacionamento (conceitual)

O diagrama abaixo é renderizado automaticamente pelo GitHub (Mermaid).

```mermaid
erDiagram
    USUARIO ||--o{ PEDIDO : "solicita (1:N)"
    MAQUINA |o--o{ PEDIDO : "executa (1:N)"
    MATERIAL |o--o{ PEDIDO : "é usado em (1:N)"
    MAQUINA ||--o{ MANUTENCAO : "recebe (1:N)"

    USUARIO {
        int id_usuario PK
        string nome_completo
        string email "único"
        string telefone
        string categoria "Aluno, Professor, Cliente Externo"
    }

    MAQUINA {
        string patrimonio PK
        string marca
        string modelo
        string tecnologia "FDM, SLA/Resina"
        string status "Disponível, Em Manutenção, Operando, Inativa"
    }

    MATERIAL {
        int id_material PK
        string tipo_polimero "PLA, ABS, PETG, Resina Padrão"
        string cor
        decimal quantidade_estoque "g ou ml"
    }

    PEDIDO {
        int id_pedido PK
        date data_solicitacao
        string arquivo_3d
        int tempo_estimado_min
        decimal peso_estimado
        string status "Na Fila, Imprimindo, Concluído, Falhou, Cancelado"
    }

    MANUTENCAO {
        int id_manutencao PK
        date data_manutencao
        string descricao
        decimal custo
    }
```

## Cardinalidades

| Relacionamento | Cardinalidade | Explicação |
|---|---|---|
| Usuário – Pedido | 1:N | Um usuário faz vários pedidos; cada pedido é de um único usuário. |
| Máquina – Pedido | 1:N | Uma máquina executa vários pedidos ao longo do tempo; cada pedido usa uma máquina (opcional enquanto está na fila). |
| Material – Pedido | 1:N | Um material pode ser usado em vários pedidos; cada pedido usa um material (opcional enquanto está na fila). |
| Máquina – Manutenção | 1:N | Uma máquina tem várias manutenções; cada manutenção é de uma máquina. |

Não existe nenhum relacionamento N:M neste mini mundo, então não precisamos de tabela associativa.
