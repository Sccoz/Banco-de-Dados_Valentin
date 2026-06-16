
CREATE DATABASE IndustriaViews;
USE IndustriaViews;

CREATE TABLE funcionarios (
    idFuncionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200),
    cargo VARCHAR(100),
    setor VARCHAR(100),
    data_admissao DATE,
    salario DECIMAL(10,2),
    telefone VARCHAR(20),
    email VARCHAR(200),
    turno VARCHAR(50),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    status_funcionario VARCHAR(20)
);


INSERT INTO funcionarios (
    nome, cargo, setor, data_admissao, salario,
    telefone, email, turno, cidade, estado, status_funcionario
)VALUES
(
'Carlos Silva','Operador de Produção','Usinagem',
'2020-03-15',3200.00,
'(51)99999-1111','carlos@industria.com',
'Manhã','Porto Alegre','RS','Ativo'
),
(
'Mariana Souza','Inspetora de Qualidade','Qualidade',
'2019-08-20',4100.00,
'(51)99999-2222','mariana@industria.com',
'Tarde','Canoas','RS','Ativo'
),
(
'João Pereira','Soldador','Soldagem',
'2021-01-10',3500.00,
'(51)99999-3333','joao@industria.com',
'Manhã','Gravataí','RS','Ativo'
),
(
'Fernanda Lima','Engenheira de Produção','Produção',
'2018-06-12',7800.00,
'(51)99999-4444','fernanda@industria.com',
'Integral','Porto Alegre','RS','Ativo'
),
(
'Rafael Martins','Técnico de Manutenção','Manutenção',
'2022-02-05',4200.00,
'(51)99999-5555','rafael@industria.com',
'Noite','São Leopoldo','RS','Ativo'
);

-- view :
CREATE VIEW nome_da_view AS
SELECT*FROM nome_tabela;

--Exemplo : 
CREATE VIEW Funcionarios AS
SELECT*FROM funcionarios;

--COnsultas especificas : 

CREATE VIEW view_funcionarios_resumo AS
SELECT nome, setor, cargo
FROM funcionarios;


SELECT*FROM view_funcionarios_resumo;

--Consultar resumo : 

SELECT nome
FROM view_funcionarios_resumo;


----------------------------- ATIVIDADE-----------------------------

-- 5. Crie uma view contendo apenas os campos:
--     - nome
--     - cargo
--     - setor

CREATE VIEW funcionario_Resumo AS
SELECT nome , cargo, setor
FROM funcionarios;


-- 6. Realize consultas na view utilizando a cláusula **WHERE**.

SELECT * FROM funcionario_Resumo
WHERE cargo LIKE '%Operador%';


-- 7. Liste todos os funcionários pertencentes a um setor específico informado pelo professor.
SELECT * FROM funcionario_Resumo
WHERE setor LIKE '%Producao%';


-- 8. Liste todos os funcionários cujo cargo contenha uma palavra-chave definida pelo professor.


SELECT * FROM funcionario_Resumo
WHERE cargo LIKE '%Operador%';


