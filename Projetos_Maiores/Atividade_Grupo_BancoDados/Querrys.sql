------------------------------------------ Gustavo ------------------------------------------------

  -- 1 - Selecione todos os produtos que são da categoria Alimentos, que custam mais de 15,99
  -- Justificativa: Pois, em uma conferência, foi visto que os produtos alimentícios mais caros que 16 reais são os que menos vendem.

  SELECT p.idProduto, p.nomeProduto, p.precoProduto, p.quantidadeEstoque 
  FROM Produto p
  INNER JOIN Categoria c ON p.idCategoria = c.idCategoria
  WHERE c.nomeCategoria = 'Alimentos' 
    AND p.precoProduto > 15.99;



  -- 2 - Selecione todos os funcionários que têm cargo de gerente e recebem mais de 6000.
  -- Justificativa: pois a empresa quer saber quais gerentes estão ganhando mais do que deveriam.

  SELECT idFuncionario, nomeFuncionario, cargoFuncionario, salarioFuncionario 
  FROM Funcionario 
  WHERE cargoFuncionario = 'Gerente' 
    AND salarioFuncionario > 6000.00;




  ------------------------------------------ Pedro ------------------------------------------------


  -- 3 - Selecione as compras feitas após a data de 2025-05-06.
  -- Justificativa: Pois, apartir desta data , a contagem de dinheiro que 
  -- circulou na empresa não bateu, e precisa achar onde esta o erro.

  SELECT idCompra, dataCompra, valorTotalCompra, idFornecedor, idFilial 
  FROM Compra 
  WHERE dataCompra > '2025-05-06 23:59:59';



  -- 4 - Selecione todos os itens cuja quantidade é maior ou igual a 50 e o valor é maior que R$ 49,99.
  -- Justificativa: Foi visto que tinha muito dinheiro parado em estoque e precisaria diminuir isso,
  --  então precisamos saber os produtos que estão com estoque desnecessário e custam caro.

  SELECT idItemCompra, idCompra, idProduto, quantidade, precoUnitario 
  FROM ItemCompra 
  WHERE quantidade >= 50 
    AND precoUnitario > 49.99;



  ------------------------------------------ Kauê ------------------------------------------------


  -- 5 - Selecione o nome do cliente, e-mail e os pontos de fidelidade acumulados de todos 
  -- os clientes que possuem mais de 900 pontos.
  -- Justificativa: A equipe de marketing vai lançar uma campanha de fidelidade exclusiva (VIP) 
  -- e precisa identificar os clientes elegíveis para enviar os convites por e-mail.

  SELECT nomeCliente, emailCliente, pontosFidelidade 
  FROM Cliente 
  WHERE pontosFidelidade > 900;



-- 6 - Selecione todos os produtos cujo estoque está abaixo de 40 unidades junto de seu fornecedor.
-- Justificativa: O setor de compras precisa dessa listagem urgente para fazer novos pedidos aos fornecedores antes que acabem.

SELECT Produto.idProduto, Produto.nomeProduto, Produto.quantidadeEstoque, Produto.precoProduto, Fornecedor.telefoneFornecedor
FROM Produto
JOIN Fornecedor ON Produto.idFornecedor = Fornecedor.idFornecedor
WHERE quantidadeEstoque < 40;


  -- 7 - Selecione os produtos com estoque baixo e valor alto, junto com o contato do fornecedor.
  -- Justificativa: O setor de compras precisa monitorar de perto os produtos mais caros que estão acabando 
  -- para ligar direto para o fornecedor e agilizar a entrega, evitando perder vendas de alto valor.

  SELECT 
      Produto.idProduto, 
      Produto.nomeProduto, 
      Produto.quantidadeEstoque, 
      Fornecedor.nomeFornecedor, 
      Fornecedor.telefoneFornecedor
  FROM Produto
  JOIN Fornecedor ON Produto.idFornecedor = Fornecedor.idFornecedor
  WHERE Produto.quantidadeEstoque < 50 
    AND Produto.precoProduto > 50.00;

  ------------------------------------------ Yago ------------------------------------------------

  -- 8 - Selecione todas as vendas realizadas pelo funcionário Fernanda Lima Oliveira no mês atual.
  -- Justificativa: O departamento de RH precisa cotar todas as vendas registradas por ele para validar a comissão.

  SELECT v.idVenda, v.dataVenda, v.valorTotalVenda, v.idFilial 
  FROM Venda v, Funcionario f
  WHERE v.idFuncionario = f.idFuncionario
    AND f.nomeFuncionario = 'Fernanda Lima Oliveira'
    AND v.dataVenda BETWEEN '2025-05-01 00:00:00' AND '2025-05-31 23:59:59';



  -- 9 - Total gasto em compras por cada fornecedor
  -- Justificativa: O setor financeiro quer saber quais são os fornecedores onde o supermercado 
  -- mais investe dinheiro, facilitando a negociação de prazos e descontos.

  SELECT f.nomeFornecedor, SUM(c.valorTotalCompra) AS totalGasto
  FROM Compra c
  JOIN Fornecedor f ON c.idFornecedor = f.idFornecedor
  GROUP BY f.idFornecedor, f.nomeFornecedor
  ORDER BY totalGasto DESC;


  ------------------------------------------ Wilian ------------------------------------------------


  -- 10 - Selecione o valor total e a data de todas as vendas cujo valor total foi superior a R$ 100,00.
  -- Justificativa: A empresa está vendo todas as vendas com valor muito alto para ver se todos os dados do sistema batem.

  SELECT valorTotalVenda, dataVenda 
  FROM Venda 
  WHERE valorTotalVenda > 100.00;



  -- 11 - Selecione todos os funcionários da Filial norte contratados antes do ano de 2023.
  -- Justificativa: A diretoria vai conceder uma bonificação por tempo de casa e dedicação 
  -- exclusiva especificamente para os colaboradores veteranos desta filial.

  SELECT f.idFuncionario, f.nomeFuncionario, f.cargoFuncionario, f.dataContratacao 
  FROM Funcionario f
  JOIN Filial fi ON f.idFilial = fi.idFilial
  WHERE fi.nomeFilial = 'Filial Norte' 
    AND f.dataContratacao < '2023-01-01';