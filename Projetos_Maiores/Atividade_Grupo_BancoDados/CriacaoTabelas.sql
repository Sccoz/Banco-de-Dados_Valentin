CREATE DATABASE SuperMercado;
USE SuperMercado;


CREATE TABLE Filial (
    idFilial INT AUTO_INCREMENT PRIMARY KEY,
    nomeFilial VARCHAR(100) NOT NULL,
    enderecoFilial VARCHAR(200),
    telefoneFilial VARCHAR(20)
);

CREATE TABLE Categoria (
    idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nomeCategoria VARCHAR(100) NOT NULL,
    descricaoCategoria VARCHAR(255)
);


CREATE TABLE Fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nomeFornecedor VARCHAR(150) NOT NULL,
    cnpjFornecedor VARCHAR(20) UNIQUE,
    telefoneFornecedor VARCHAR(20),
    emailFornecedor VARCHAR(150)
);


CREATE TABLE Funcionario (
    idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    nomeFuncionario VARCHAR(150) NOT NULL,
    cpfFuncionario VARCHAR(14) UNIQUE NOT NULL,
    cargoFuncionario VARCHAR(50),
    salarioFuncionario DECIMAL(10,2),
    dataContratacao DATE,
    idFilial INT,
    FOREIGN KEY (idFilial) REFERENCES Filial(idFilial)
);


CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nomeCliente VARCHAR(150) NOT NULL,
    cpfCliente VARCHAR(14) UNIQUE,
    telefoneCliente VARCHAR(20),
    emailCliente VARCHAR(150),
    pontosFidelidade INT DEFAULT 0
);


CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nomeProduto VARCHAR(150) NOT NULL,
    descricaoProduto VARCHAR(255),
    precoProduto DECIMAL(10,2) NOT NULL,
    quantidadeEstoque INT DEFAULT 0,
    idCategoria INT,
    idFornecedor INT,
    idFilial INT,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (idFilial) REFERENCES Filial(idFilial)
);


CREATE TABLE Venda (
    idVenda INT AUTO_INCREMENT PRIMARY KEY,
    dataVenda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valorTotalVenda DECIMAL(10,2) NOT NULL DEFAULT 0,
    idCliente INT,
    idFuncionario INT,
    idFilial INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario),
    FOREIGN KEY (idFilial) REFERENCES Filial(idFilial)
);


CREATE TABLE ItemVenda (
    idItemVenda INT AUTO_INCREMENT PRIMARY KEY,
    idVenda INT NOT NULL,
    idProduto INT NOT NULL,
    quantidade INT NOT NULL,
    precoUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);


CREATE TABLE Compra (
    idCompra INT AUTO_INCREMENT PRIMARY KEY,
    dataCompra DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valorTotalCompra DECIMAL(10,2) NOT NULL DEFAULT 0,
    idFornecedor INT,
    idFilial INT,
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (idFilial) REFERENCES Filial(idFilial)
);


CREATE TABLE ItemCompra (
    idItemCompra INT AUTO_INCREMENT PRIMARY KEY,
    idCompra INT NOT NULL,
    idProduto INT NOT NULL,
    quantidade INT NOT NULL,
    precoUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idCompra) REFERENCES Compra(idCompra),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);
