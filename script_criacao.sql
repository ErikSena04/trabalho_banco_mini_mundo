DROP DATABASE IF EXISTS lab_impressao_3d;

CREATE DATABASE lab_impressao_3d
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE lab_impressao_3d;

CREATE TABLE usuario (
    id_usuario    INT          NOT NULL AUTO_INCREMENT,
    nome_completo VARCHAR(100) NOT NULL,
    email         VARCHAR(100) NOT NULL,
    telefone      VARCHAR(20)  NOT NULL,
    categoria     ENUM('Aluno', 'Professor', 'Cliente Externo') NOT NULL,

    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uq_usuario_email UNIQUE (email)
);

CREATE TABLE maquina (
    patrimonio  VARCHAR(20) NOT NULL,
    marca       VARCHAR(50) NOT NULL,
    modelo      VARCHAR(50) NOT NULL,
    tecnologia  ENUM('FDM', 'SLA/Resina') NOT NULL,
    status      ENUM('Disponível', 'Em Manutenção', 'Operando', 'Inativa')
                NOT NULL DEFAULT 'Disponível',

    CONSTRAINT pk_maquina PRIMARY KEY (patrimonio)
);

CREATE TABLE material (
    id_material        INT           NOT NULL AUTO_INCREMENT,
    tipo_polimero      ENUM('PLA', 'ABS', 'PETG', 'Resina Padrão') NOT NULL,
    cor                VARCHAR(30)   NOT NULL,
    quantidade_estoque DECIMAL(10,2) NOT NULL,
    unidade            ENUM('g', 'ml') NOT NULL,

    CONSTRAINT pk_material PRIMARY KEY (id_material),
    CONSTRAINT ck_material_estoque CHECK (quantidade_estoque >= 0)
);

CREATE TABLE pedido (
    id_pedido          INT           NOT NULL AUTO_INCREMENT,
    id_usuario         INT           NOT NULL,
    patrimonio         VARCHAR(20)   NULL,
    id_material        INT           NULL,
    data_solicitacao   DATE          NOT NULL,
    arquivo_3d         VARCHAR(100)  NOT NULL,
    tempo_estimado_min INT           NOT NULL,   
    peso_estimado      DECIMAL(10,2) NOT NULL,   
    status             ENUM('Na Fila', 'Imprimindo', 'Concluído', 'Falhou', 'Cancelado')
                       NOT NULL DEFAULT 'Na Fila',

    CONSTRAINT pk_pedido PRIMARY KEY (id_pedido),

    CONSTRAINT fk_pedido_usuario  FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario),
    CONSTRAINT fk_pedido_maquina  FOREIGN KEY (patrimonio)
        REFERENCES maquina (patrimonio),
    CONSTRAINT fk_pedido_material FOREIGN KEY (id_material)
        REFERENCES material (id_material),

    CONSTRAINT ck_pedido_tempo CHECK (tempo_estimado_min > 0),
    CONSTRAINT ck_pedido_peso  CHECK (peso_estimado > 0),
    CONSTRAINT ck_pedido_execucao CHECK (
        status NOT IN ('Imprimindo', 'Concluído', 'Falhou')
        OR (patrimonio IS NOT NULL AND id_material IS NOT NULL)
    )
);

CREATE TABLE manutencao (
    id_manutencao   INT           NOT NULL AUTO_INCREMENT,
    patrimonio      VARCHAR(20)   NOT NULL,
    data_manutencao DATE          NOT NULL,
    descricao       VARCHAR(255)  NOT NULL,
    custo           DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_manutencao PRIMARY KEY (id_manutencao),
    CONSTRAINT fk_manutencao_maquina FOREIGN KEY (patrimonio)
        REFERENCES maquina (patrimonio),
    CONSTRAINT ck_manutencao_custo CHECK (custo >= 0)
);