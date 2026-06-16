
use geminiQuestions;

CREATE TABLE departamentos (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    departamento_id INT,
    salario DECIMAL(10,2),
    data_admissao DATE,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    categoria VARCHAR(50),
    preco DECIMAL(10,2)
);

CREATE TABLE vendas_detalhes (
    id INT PRIMARY KEY,
    funcionario_id INT,
    produto_id INT,
    quantidade INT,
    valor_total DECIMAL(10,2),
    data_venda TIMESTAMP,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Inserção de Dados (Inserts)
INSERT INTO departamentos VALUES 
(1, 'Vendas'), (2, 'Tecnologia'), (3, 'Marketing');

INSERT INTO funcionarios VALUES 
(101, 'Alice Silva', 1, 5000.00, '2023-01-15'),
(102, 'Bruno Costa', 1, 6200.00, '2022-05-20'),
(103, 'Carla Souza', 1, 4800.00, '2024-02-10'),
(104, 'Diego Lima', 2, 8500.00, '2021-11-01'),
(105, 'Elena Ramos', 2, 9200.00, '2023-06-18'),
(106, 'Fabio Mello', 3, 5500.00, '2023-08-25');

INSERT INTO produtos VALUES 
(1, 'Notebook Pro', 'Eletrônicos', 4500.00),
(2, 'Monitor 4K', 'Eletrônicos', 1800.00),
(3, 'Teclado Mecânico', 'Acessórios', 350.00),
(4, 'Mouse Wireless', 'Acessórios', 150.00),
(5, 'Curso de SQL Avançado', 'Serviços', 1200.00);

INSERT INTO vendas_detalhes VALUES 
(1, 101, 1, 1, 4500.00, '2026-05-02 10:30:00'),
(2, 102, 2, 2, 3600.00, '2026-05-03 14:15:00'),
(3, 101, 3, 3, 1050.00, '2026-05-05 16:00:00'),
(4, 103, 1, 1, 4500.00, '2026-05-10 11:00:00'),
(5, 104, 5, 1, 1200.00, '2026-05-12 09:45:00'),
(6, 102, 4, 5, 750.00, '2026-05-12 09:46:30'), -- Transação suspeita (mesmo vendedor, < 2 min)
(7, 105, 5, 2, 2400.00, '2026-06-01 15:30:00'),
(8, 101, 2, 1, 1800.00, '2026-06-14 10:00:00');