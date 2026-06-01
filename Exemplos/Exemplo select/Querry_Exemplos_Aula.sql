CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE categoria (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT,
    PRIMARY KEY (id) 
);

CREATE TABLE produto (
    id INT AUTO_INCREMENT,
    nome VARCHAR(150),
    descricao TEXT,
    preco DECIMAL(10, 2),
    estoque INT,
    categoria_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES categoria (id) ON DELETE CASCADE
);

SELECT * FROM produto;


UPDATE produto SET preco = 12.0 WHERE categoria_id = 4;

UPDATE categoria SET nome = 'Coca-Cola' WHERE id = 3;

-- Inserir de forma certa :

UPDATE produto SET categoria_id = 3 WHERE preco >= 500;

UPDATE produto SET categoria_id = 8 WHERE estoque > 0;
-- by arthur78

UPDATE produto SET estoque = estoque + 30 WHERE id = 1;

UPDATE produto
SET categoria_id=1
WHERE id % 2 = 0;

INSERT INTO produto VALUES
(DEFAULT , 'kaue' , 'Pretinho' , 0.99 , 1 , 6);

INSERT INTO categoria VALUES
(2, 'bom de cama' , 'serve p tudo');

DELETE FROM produto WHERE id = 25;

UPDATE categoria
SET
    nome = 'Infantil',
    descricao = ' Coorido e divertido '
WHERE id = 2;


UPDATE categoria


-- ========================================================
-- 4. INSERTS DA TABELA 'categoria' (Forçando as Chaves Primárias)
-- ========================================================
INSERT INTO categoria (id, nome, descricao) VALUES 
(1, 'Eletrônicos', 'Celulares e PCs.'),
(2, 'Vestuário', 'Roupas e calçados.'),
(3, 'Casa', 'Móveis e decoração.'),
(4, 'Livros', 'Livros e e-books.');

-- ========================================================
-- 5. INSERTS DA TABELA 'produto' (Forçando as Chaves Primárias)
-- ========================================================
INSERT INTO produto VALUES 
(1, 'Galaxy S24', 'Smartphone 128GB.', 4599.00, 50, 1),
(2, 'Notebook i7', '16GB RAM SSD 512GB.', 5200.00, 15, 1),
(3, 'Fone Bluetooth', 'Sem fio com ANC.', 299.90, 120, 1),
(4, 'Camiseta Preta', 'Algodão premium.', 79.90, 200, 2),
(5, 'Tênis Run', 'Para corrida.', 349.99, 45, 2),
(6, 'Luminária LED', 'Mesa e articulada.', 89.90, 60, 3),
(7, 'Sofá 3 Lugares', 'Tecido suede.', 1899.00, 8, 3),
(8, 'Livro SQL', 'Guia prático.', 65.00, 30, 4),
(9, 'Livro Ficção', 'Capa dura.', 49.90, 85, 4);

UPDATE produto
SET descricao = CASE 
    WHEN categoria_id = 1 THEN 'Tecnologia'  
    WHEN preco < 80 THEN 'Barato'  
END
WHERE categoria_id IN(1,2);

DELETE FROM produto
WHERE preco > 1000;

DELETE FROM produto

DELETE FROM categoria 
WHERE id = 1;

UPDATE categoria
SET id = 10;
WHERE id = 1;

USE ecommerce;

DELETE FROM categoria
WHERE id = 2;

ALTER TABLE produto
ADD COLUMN status CHAR(1)
DEFAULT 'A';

ALTER TABLE categoria
ADD COLUMN status CHAR(1)
DEFAULT 'A';

UPDATE categoria
SET status = 'I'
WHERE id = 3;

UPDATE produto
SET status = 'I'
WHERE categoria_id = 3;

SELECT nome AS nome_Produto, estoque as Quantidade
FROM produto
WHERE status = "I";