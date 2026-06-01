-- Subquerry simples :

SELECT * FROM `Itens_Estoque`
WHERE `precoVendaItem` = (
    SELECT MAX(`precoVendaItem`)
    FROM `Itens_Estoque`
);

-- Subquerry Simples diferente : 
SELECT * FROM `Itens_Estoque`
WHERE `precoVendaItem` <> (
    SELECT MAX(`precoVendaItem`)
    FROM `Itens_Estoque`
);

-- Subquerry com IN e 2 tabelas

SELECT descricaoItem
FROM `Itens_Estoque`
WHERE `idItem` IN(
    SELECT `idItem` 
    FROM `Pedidos`
);


--Querry : 

SELECT I.descricaoItem, (

SELECT SUM(P.quantidadeComprada* P.valorTotal)
FROM Pedidos AS P
WHERE P.idItem = I.idItem)

AS Total_Comprado
FROM Itens_Estoque AS I;


-- Querry com where e 2 tabelas : 
SELECT Itens_Estoque.descricaoItem , Itens_Estoque.setorItem , Itens_Estoque.precoVendaItem , Pedidos.quantidadeComprada
FROM Pedidos , Itens_Estoque
WHERE Itens_Estoque.idItem = Pedidos.idItem;

-- 