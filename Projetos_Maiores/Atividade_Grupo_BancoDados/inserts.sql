-- ============================================================
-- Sistema de Gerenciamento de Supermercado (SGS)
-- Script de inserção de dados de exemplo
-- ============================================================

USE SuperMercado;

-- ============================================================
-- Filial
-- ============================================================
INSERT INTO Filial (nomeFilial, enderecoFilial, telefoneFilial) VALUES
('Filial Centro', 'Rua das Flores, 100 - Centro', '(48) 3222-1010'),
('Filial Norte', 'Av. Beira Mar Norte, 500 - Norte', '(48) 3222-2020'),
('Filial Sul', 'Rua dos Imigrantes, 350 - Sul', '(48) 3222-3030'),
('Filial Trindade', 'Rua Lauro Linhares, 800 - Trindade', '(48) 3222-4040'),
('Filial Continente', 'Av. Madre Benvenuta, 1200 - Continente', '(48) 3222-5050');

-- ============================================================
-- Categoria
-- ============================================================
INSERT INTO Categoria (nomeCategoria, descricaoCategoria) VALUES
('Alimentos', 'Itens de mercearia em geral, como arroz, feijão e massas'),
('Bebidas', 'Refrigerantes, sucos, águas e bebidas alcoólicas'),
('Limpeza', 'Produtos de limpeza doméstica'),
('Higiene Pessoal', 'Itens de cuidados pessoais e higiene'),
('Hortifruti', 'Frutas, verduras e legumes frescos'),
('Padaria', 'Pães, bolos e produtos de panificação'),
('Congelados', 'Alimentos congelados e resfriados'),
('Laticínios', 'Leite, queijos, iogurtes e derivados'),
('Carnes', 'Carnes bovinas, suínas, aves e peixes'),
('Pet Shop', 'Produtos para animais de estimação');

-- ============================================================
-- Fornecedor
-- ============================================================
INSERT INTO Fornecedor (nomeFornecedor, cnpjFornecedor, telefoneFornecedor, emailFornecedor) VALUES
('Distribuidora Sul Alimentos Ltda', '12.345.678/0001-01', '(47) 3300-1111', 'contato@sulalimentos.com.br'),
('Laticínios Santa Catarina S.A.', '23.456.789/0001-02', '(45) 3300-2222', 'vendas@laticiniossc.com.br'),
('Bebidas Floripa Distribuição', '34.567.890/0001-03', '(41) 3300-3333', 'comercial@bebidasfloripa.com.br'),
('Hortifruti Central LTDA', '45.678.901/0001-04', '(48) 3300-4444', 'contato@hortifruticentral.com.br'),
('Limpeza Total Distribuidora', '56.789.012/0001-05', '(48) 3300-5555', 'vendas@limpezatotal.com.br'),
('Padaria Industrial do Sul', '67.890.123/0001-06', '(48) 3300-6666', 'contato@padariaindustrialsul.com.br'),
('Frigorífico Catarinense', '78.901.234/0001-07', '(58) 3300-7777', 'vendas@frigorificocatarinense.com.br'),
('Higiene & Cia Distribuidora', '89.012.345/0001-08', '(48) 3300-8888', 'comercial@higieneecia.com.br'),
('Congelados Brasil Ltda', '90.123.456/0001-09', '(25) 3300-9999', 'contato@congeladosbrasil.com.br'),
('Pet Distribuição Nacional', '01.234.567/0001-10', '(31) 3300-0000', 'vendas@petdistribuicao.com.br');

-- ============================================================
-- Funcionario
-- ============================================================
INSERT INTO Funcionario (nomeFuncionario, cpfFuncionario, cargoFuncionario, salarioFuncionario, dataContratacao, idFilial) VALUES
('Carlos Eduardo Silva', '123.456.789-01', 'Gerente', 6500.00, '2020-03-15', 1),
('Ana Paula Souza', '234.567.890-02', 'Caixa', 1800.00, '2021-06-10', 1),
('Bruno Henrique Costa', '345.678.901-03', 'Estoquista', 1900.00, '2021-08-22', 2),
('Fernanda Lima Oliveira', '456.789.012-04', 'Caixa', 1800.00, '2022-01-05', 2),
('Ricardo Alves Pereira', '567.890.123-05', 'Gerente', 6200.00, '2019-11-12', 3),
('Juliana Martins Rocha', '678.901.234-06', 'Repositor', 1700.00, '2022-04-18', 3),
('Marcos Vinícius Teixeira', '789.012.345-07', 'Caixa', 1850.00, '2023-02-01', 4),
('Patrícia Gomes Ferreira', '890.123.456-08', 'Estoquista', 1950.00, '2022-09-30', 4),
('Thiago Barbosa Nunes', '901.234.567-09', 'Repositor', 1700.00, '2023-05-14', 5),
('Camila Andrade Ramos', '012.345.678-10', 'Gerente', 6300.00, '2020-07-20', 5);

-- ============================================================
-- Cliente
-- ============================================================
INSERT INTO Cliente (nomeCliente, cpfCliente, telefoneCliente, emailCliente, pontosFidelidade) VALUES
('Maria José Santos', '111.222.333-44', '(48) 99911-1111', 'maria.santos@gmail.com', 450),
('João Pedro Almeida', '222.333.444-55', '(48) 99922-2222', 'joao.almeida@gmail.com', 1200),
('Beatriz Cardoso Lima', '333.444.555-66', '(48) 99933-3333', 'bia.cardoso@gmail.com', 80),
('Eduardo Fernandes', '444.555.666-77', '(48) 99944-4444', 'edu.fernandes@hotmail.com', 320),
('Larissa Mendes Costa', '555.666.777-88', '(48) 99955-5555', 'larissa.mendes@gmail.com', 950),
('Felipe Augusto Rocha', '666.777.888-99', '(48) 99966-6666', 'felipe.rocha@yahoo.com.br', 60),
('Gabriela Souza Pinto', '777.888.999-00', '(48) 99977-7777', 'gabi.pinto@gmail.com', 1500),
('Rafael Henrique Dias', '888.999.000-11', '(48) 99988-8888', 'rafael.dias@outlook.com', 210),
('Camille Vitória Borges', '999.000.111-22', '(48) 99999-9999', 'camille.borges@gmail.com', 30),
('Lucas Gabriel Moreira', '000.111.222-33', '(48) 99900-0000', 'lucas.moreira@gmail.com', 700);

-- ============================================================
-- Produto
-- ============================================================
INSERT INTO Produto (nomeProduto, descricaoProduto, precoProduto, quantidadeEstoque, idCategoria, idFornecedor, idFilial) VALUES
('Arroz Branco Tipo 1 5kg', 'Pacote de arroz branco tipo 1, 5kg', 24.90, 150, 1, 1, 1),
('Feijão Carioca 1kg', 'Pacote de feijão carioca, 1kg', 8.50, 200, 1, 1, 1),
('Refrigerante Cola 2L', 'Garrafa de refrigerante sabor cola, 2 litros', 9.99, 180, 2, 3, 2),
('Suco de Laranja 1L', 'Suco de laranja integral, 1 litro', 7.50, 90, 2, 3, 2),
('Detergente Neutro 500ml', 'Detergente líquido neutro, 500ml', 2.49, 300, 3, 5, 3),
('Sabão em Pó 1kg', 'Sabão em pó para roupas, 1kg', 14.90, 120, 3, 5, 3),
('Shampoo Hidratante 350ml', 'Shampoo hidratante para todos os tipos de cabelo', 18.90, 75, 4, 8, 4),
('Banana Prata (kg)', 'Banana prata fresca, vendida por quilo', 5.99, 60, 5, 4, 4),
('Tomate (kg)', 'Tomate fresco, vendido por quilo', 7.49, 50, 5, 4, 1),
('Pão Francês (kg)', 'Pão francês fresco, vendido por quilo', 12.90, 40, 6, 6, 2),
('Pizza Congelada Mussarela', 'Pizza congelada sabor mussarela, 460g', 19.90, 65, 7, 9, 5),
('Leite Integral 1L', 'Leite integral UHT, caixa de 1 litro', 5.49, 250, 8, 2, 1),
('Queijo Mussarela (kg)', 'Queijo mussarela fatiado, vendido por quilo', 39.90, 35, 8, 2, 3),
('Picanha Bovina (kg)', 'Carne bovina picanha, vendida por quilo', 69.90, 25, 9, 7, 5),
('Ração para Cães 10kg', 'Ração seca para cães adultos, pacote 10kg', 89.90, 40, 10, 10, 4);

-- ============================================================
-- Venda
-- ============================================================
INSERT INTO Venda (dataVenda, valorTotalVenda, idCliente, idFuncionario, idFilial) VALUES
('2025-05-02 09:15:00', 58.39, 1, 2, 1),
('2025-05-03 14:30:00', 27.49, 2, 4, 2),
('2025-05-04 10:05:00', 142.70, 3, 7, 4),
('2025-05-05 16:45:00', 19.90, 4, 6, 3),
('2025-05-06 11:20:00', 89.90, 5, 9, 5),
('2025-05-07 18:00:00', 75.38, 6, 2, 1),
('2025-05-08 13:10:00', 39.90, 7, 4, 2),
('2025-05-09 17:25:00', 209.69, 8, 7, 4),
('2025-05-10 08:50:00', 12.90, 9, 6, 3),
('2025-05-11 19:40:00', 95.39, 10, 9, 5);

-- ============================================================
-- ItemVenda
-- ============================================================
INSERT INTO ItemVenda (idVenda, idProduto, quantidade, precoUnitario) VALUES
(1, 1, 1, 24.90),
(1, 2, 4, 8.50),
(2, 4, 1, 7.50),
(2, 9, 2, 7.49),
(3, 14, 2, 69.90),
(3, 3, 0, 9.99),
(4, 11, 1, 19.90),
(5, 15, 1, 89.90),
(6, 13, 1, 39.90),
(6, 12, 6, 5.49),
(7, 13, 1, 39.90),
(8, 14, 3, 69.90),
(9, 10, 1, 12.90),
(10, 7, 2, 18.90),
(10, 6, 1, 14.90),
(10, 5, 4, 2.49);

-- ============================================================
-- Compra
-- ============================================================
INSERT INTO Compra (dataCompra, valorTotalCompra, idFornecedor, idFilial) VALUES
('2025-04-20 08:00:00', 2490.00, 1, 1),
('2025-06-21 09:30:00', 1700.00, 2, 1),
('2025-06-22 10:15:00', 999.00, 3, 2),
('2025-06-23 11:00:00', 599.20, 4, 4),
('2025-04-24 13:45:00', 1490.00, 5, 3),
('2025-04-25 14:20:00', 1290.00, 6, 2),
('2025-06-26 15:10:00', 3495.00, 7, 5),
('2025-08-27 16:00:00', 1890.00, 8, 4),
('2025-08-28 09:50:00', 1990.00, 9, 5),
('2025-04-29 10:40:00', 4495.00, 10, 4);

-- ============================================================
-- ItemCompra
-- ============================================================
INSERT INTO ItemCompra (idCompra, idProduto, quantidade, precoUnitario) VALUES
(1, 1, 100, 24.90),
(2, 12, 200, 5.49) ,
(2, 13, 20, 39.90),
(3, 3, 100, 9.99),
(4, 8, 100, 5.99),
(5, 5, 600, 2.49),
(6, 10, 100, 12.90),
(7, 14, 50, 69.90),
(8, 7, 100, 18.90),
(9, 11, 100, 19.90),
(10, 15, 50, 89.90);