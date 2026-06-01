create database manutencao;
use manutencao;

CREATE TABLE maquina (
    id_maquina INT PRIMARY KEY AUTO_INCREMENT,
    codigo_maquina INT,
    nome_maquina VARCHAR(100),
    setor_maquina VARCHAR(100),
    data_da_aquisicao_maquina DATE
);

CREATE TABLE tecnico (
    id_tecnico INT PRIMARY KEY AUTO_INCREMENT,
    nome_tecnico VARCHAR(100),
    CPF_tecnico VARCHAR(11),
    especialidade_tecnico VARCHAR(100)
);

CREATE TABLE peca (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    nome_peca VARCHAR(100),
    quantidade_peca INT,
    custo_peca INT
);

CREATE TABLE ordem_de_servico (
    id_ordem INT PRIMARY KEY AUTO_INCREMENT,
    fk_tecnico INT,
    fk_maquina INT,
    data_abertura DATETIME,
    data_fechamento DATETIME,
    status_ordem VARCHAR(20),
    FOREIGN KEY (fk_maquina)
        REFERENCES maquina (id_maquina),
    FOREIGN KEY (fk_tecnico)
        REFERENCES tecnico (id_tecnico)
);

CREATE TABLE estoque_peca (
    id_estoque INT PRIMARY KEY AUTO_INCREMENT,
    fk_peca INT,
    quantidade_disponivel INT,
    estoque_min INT,
    estoque_max INT,
    FOREIGN KEY (fk_peca)
        REFERENCES peca (id_peca)
);

CREATE TABLE registro_manutencao (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    fk_ordem INT,
    descricao_registro TEXT,
    tempo_gasto DECIMAL(5 , 2 ),
    FOREIGN KEY (fk_ordem)
        REFERENCES ordem_de_servico (id_ordem)
);