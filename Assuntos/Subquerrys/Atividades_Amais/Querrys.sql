-- 1. Market Share Interno de Produtos
-- Contexto: Para entender a força do nosso portfólio, como listar todos os produtos e o percentual de receita que
-- cada um representa em relação ao faturamento total da empresa?

SELECT 
    p.nome AS produto,
    SUM(v.valor_total) AS receita_produto,
    SUM(v.valor_total) / (SELECT SUM(valor_total) FROM vendas_detalhes) * 100 AS percentual_do_faturamento_total

FROM vendas_detalhes v
JOIN produtos p ON v.produto_id = p.id
GROUP BY p.nome;




-- 2. Discrepância Salarial Interna
-- Contexto: O time de remuneração precisa identificar colaboradores que ganham acima da média do seu respectivo 
-- departamento para reavaliação de teto salarial.

SELECT 
    f.nome,
    d.nome AS departamento,
    f.salario,
    (SELECT AVG(salario) FROM funcionarios WHERE departamento_id = f.departamento_id)AS media_departamento

FROM funcionarios f
JOIN departamentos d ON f.departamento_id = d.id
WHERE f.salario > (
    SELECT AVG(salario) 
    FROM funcionarios 
    WHERE departamento_id = f.departamento_id
);





-- 3. Ranking de Eficiência de Vendas por Departamento
-- Contexto: Como criar uma tabela de classificação que mostre a posição dos funcionários em volume de vendas
--  dentro de seus departamentos, sem criar tabelas temporárias?

SELECT 
    d.nome AS departamento,
    f.nome AS colaborador,
    SUM(v.valor_total) AS total_vendido
FROM vendas_detalhes v
JOIN funcionarios f ON v.funcionario_id = f.id
JOIN departamentos d ON f.departamento_id = d.id
GROUP BY d.nome, f.nome
ORDER BY total_vendido DESC;




-- 4. Auditoria de Segurança: Transações Concorrentes (Suspeitas)
-- Contexto: Como capturar vendas realizadas pelo mesmo funcionário em um intervalo menor que 
-- 2 minutos, visando identificar possíveis erros de sistema ou fraudes?

SELECT 
    v1.funcionario_id,
    v1.id AS venda_1_id,
    v1.data_venda AS horario_venda_1,
    v2.id AS venda_2_id,
    v2.data_venda AS horario_venda_2,
    (v2.data_venda - v1.data_venda) AS intervalo_tempo
FROM vendas_detalhes v1
JOIN vendas_detalhes v2 ON v1.funcionario_id = v2.funcionario_id AND v1.id < v2.id
WHERE v2.data_venda <= v1.data_venda + INTERVAL '2 minutes';

-- 5. Identificação do Top 1 Produto por Categoria
-- Contexto: Para o relatório executivo de encerramento, como trazer diretamente o produto mais vendido 
-- (em receita) de cada categoria de produtos?


-- 6. Velocidade de Rampa de Novos Talentos
-- Contexto: Queremos entender se funcionários novos vendem rápido. Como listar as vendas de funcionários 
-- que possuem menos de 3 anos de casa (admitidos de 2023 em diante)?


-- 7. Clientes Internos Sem Tração (Zero Vendas)
-- Contexto: Quais departamentos ou colaboradores cadastrados no sistema ainda não geraram nenhuma receita para a companhia?

-- 8. Impacto do Ticket Médio por Venda
-- Contexto: Como exibir o valor de cada venda ao lado do ticket médio geral da empresa para avaliar o impacto individual de cada transação?


-- 9. Análise de Penetrabilidade de Categoria
-- Contexto: Como listar os funcionários que conseguiram vender produtos de todas as categorias disponíveis no banco de dados?

-- 10. Mapeamento de Meses de Alta Performance (Sazonalidade)
-- Contexto: Como listar os meses em que o faturamento superou a marca dos R$ 10.000,00 para identificar picos sazonais de demanda?
