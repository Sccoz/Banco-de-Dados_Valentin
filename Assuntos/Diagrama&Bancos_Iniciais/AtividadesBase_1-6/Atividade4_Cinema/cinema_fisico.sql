CREATE DATABASE cinema;
USE cinema;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome_cliente VARCHAR(100),
    rg_cliente VARCHAR(11) UNIQUE NOT NULL,
    idade_cliente TINYINT UNSIGNED NOT NULL
);

CREATE TABLE ingresso (
    id_ingresso INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    valor_ingresso INT UNSIGNED,
    meio_ingresso VARCHAR(30),
    categoria_ingresso VARCHAR(30)
);

CREATE TABLE sala (
    id_sala INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    capacidade_sala SMALLINT UNSIGNED,
    categoria_sala VARCHAR(30)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    fk_ingresso INT UNIQUE,
    fk_cliente INT UNIQUE,
    data_pedido DATETIME,
    forma_de_pagamento VARCHAR(100),
    
    FOREIGN KEY (fk_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (fk_ingresso) REFERENCES ingresso(id_ingresso)
);

CREATE TABLE sessao (
    id_sessao INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    fk_ingresso_sessao INT UNIQUE,
    fk_sala INT UNIQUE,
    horario_sessao DATETIME,
    
    FOREIGN KEY (fk_ingresso_sessao) REFERENCES ingresso(id_ingresso),
    FOREIGN KEY (fk_sala) REFERENCES sala(id_sala)
);

CREATE TABLE filme (
    id_filme INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    fk_sessao INT UNIQUE,
    titulo_filme VARCHAR(200),
    categoria_filme VARCHAR(50),
    faixa_etaria_filme TINYINT UNSIGNED,
    
    FOREIGN KEY (fk_sessao) REFERENCES sessao(id_sessao)
);