CREATE TABLE Itens_Estoque(
idItem INT NOT NULL AUTO_INCREMENT,
descricaoItem VARCHAR(200),
setorItem VARCHAR(200),
precoVendaItem DECIMAL(9,2),
estoqueItem INT,
PRIMARY KEY (idItem)
);

INSERT INTO Itens_Estoque
(descricaoItem,setorItem,precoVendaItem,estoqueItem)VALUES
('Suco de Laranja','Bebidas','7.50',250),
('Macarrão 1kg','Alimentos','5.20',180),
('Sabão em pó','Limpeza','12.90',90),
('Café Torrado','Alimentos','15.80',120),
('Iogurte Natural','Laticínios','4.30',350),
('Biscoito Integral',NULL,'3.90',210),
('Molho de Tomate','Alimentos','2.80',500);

DESCRIBE Itens_Estoque;

SELECT*FROM Itens_Estoque as ItemComercial
WHERE precoVendaItem=3.90
AND estoqueItem = 210;

SELECT*FROM Itens_Estoque
WHERE (setorItem='Limpeza'OR setorItem='Alimentos')
AND precoVendaItem < 5.80;

SELECT * FROM Itens_Estoque
WHERE (setorItem = 'Limpeza' OR `setorItem` = 'Alimentos')
OR NOT `idItem` IN (1,2,3,4,5)

SELECT descricaoItem as Itens
FROM `Itens_Estoque`
WHERE `estoqueItem`
BETWEEN 210 AND 300
AND `descricaoItem` LIKE '%Suco%';

SELECT * FROM `Itens_Estoque`
WHERE `setorItem` IS NULL;

SELECT descricaoItem , setorItem , precoVendaItem
FROM `Itens_Estoque`
WHERE `setorItem`  = 'Alimentos'
OR `setorItem` IS NULL;

SELECT `descricaoItem`
FROM `Itens_Estoque`
WHERE `descricaoItem`
BETWEEN 'A' and 'd'

SELECT * FROM `Itens_Estoque`
ORDER BY descricaoItem DESC;
SELECT*FROM `Itens_Estoque`
ORDER BY descricaoItem ASC;


SELECT descricaoItem , setorItem , precoVendaItem
FROM `Itens_Estoque`
WHERE `setorItem` != 'Alimentos'
AND `precoVendaItem` > 4.00 
ORDER BY `descricaoItem`;

USE estoqueComercial;


SELECT COUNT(`setorItem`)
FROM `Itens_Estoque`
WHERE `setorItem` = 'Alimentos';

SELECT AVG(precoVendaItem)
FROM `Itens_Estoque`
WHERE `setorItem` = 'Alimentos'

SELECT SUM(estoqueItem)
FROM `Itens_Estoque`
WHERE `estoqueItem` 
BETWEEN 100 AND 300;

SELECT MIN(estoqueItem)
FROM `Itens_Estoque`
WHERE setorItem = 'Alimentos';

SELECT MAX(precoVendaItem)
FROM `Itens_Estoque`;

