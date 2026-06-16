--INICIO DAS ATIVIDADES :
USE EscolaDB;

 # Questões Básicas — Subquery como filtro

-- 1. Liste os alunos que possuem a maior idade cadastrada.
SELECT nome FROM `Alunos`
WHERE idade = (
    SELECT MAX(idade)
    FROM `Alunos`
);


-- 2. Exiba os alunos que possuem idade menor que a média das idades.

SELECT nome FROM `Alunos`
WHERE idade < (
    SELECT AVG(idade) 
    FROM `Alunos`
);


-- 3. Mostre os cursos que possuem a maior carga horária.
SELECT  nome_curso FROM `Cursos`
WHERE carga_horaria = (
    SELECT MAX(carga_horaria)
    FROM `Cursos`
);

-- 4. Liste os alunos que possuem nota igual à maior nota registrada nas matrículas.
SELECT Alunos.nome as Aluno,  Matriculas.nota as Notas
FROM `Alunos`
JOIN `Matriculas` ON Matriculas.id_aluno = Alunos.id_aluno
WHERE Matriculas.nota = (
    SELECT MAX(nota)
    FROM `Matriculas`
);

-- 5. Exiba os alunos que possuem nota menor que a média geral das notas.
SELECT Alunos.nome as Alunos , Matriculas.nota as Notas 
FROM `Alunos`
JOIN `Matriculas` ON Matriculas.id_aluno = Alunos.id_aluno
WHERE Matriculas.nota < (
    SELECT AVG(nota)
    FROM `Matriculas`
);

-- 6. Mostre os cursos cuja carga horária seja maior que a média das cargas horárias.
SELECT nome_curso as Cursos , Cursos.carga_horaria as Horas 
FROM `Cursos`
WHERE carga_horaria > (
    SELECT AVG(carga_horaria)
    FROM `Cursos`
);

-- 7. Liste os alunos que possuem exatamente a menor idade cadastrada.
SELECT nome FROM `Alunos`
WHERE idade = (
    SELECT MIN(idade)
    FROM `Alunos`
);

-- 8. Exiba as matrículas cuja quantidade de faltas seja maior que a média de faltas.
SELECT * FROM `Matriculas`
WHERE faltas > (
    SELECT AVG(faltas)
    FROM `Matriculas`
);

-- 9. Mostre os cursos que possuem carga horária diferente da maior carga horária.
SELECT nome_curso FROM `Cursos`
WHERE carga_horaria <> (
    SELECT MAX(carga_horaria)
    FROM `Cursos`
);

-- 10. Liste os alunos que possuem nota igual à menor nota registrada.
SELECT Alunos.nome AS Aluno, Matriculas.nota AS Nota
FROM `Alunos`
JOIN `Matriculas` ON Matriculas.id_aluno = Alunos.id_aluno
WHERE Matriculas.nota = (
    SELECT MIN(nota)
    FROM `Matriculas`
);





-- # Questões Intermediárias — Subquery com IN

-- 1. Liste os nomes dos alunos que possuem matrícula cadastrada.
SELECT Alunos.nome AS Nome
FROM `Alunos`
JOIN `Matriculas` ON Matriculas.id_aluno = Alunos.id_aluno
WHERE Matriculas.id_matricula IS NOT NULL;


-- 2. Exiba os cursos que possuem alunos matriculados.
SELECT Cursos.nome_curso
FROM `Cursos` 
WHERE id_curso IN (
    SELECT id_curso
    FROM `Matriculas`
);


-- 3. Mostre os alunos que estão matriculados no curso “Python”.
-- 4. Liste os alunos matriculados em cursos com carga horária maior que 60 horas.
-- 5. Exiba os cursos nos quais existem alunos com nota maior que 8.
-- 6. Mostre os alunos que possuem mais de uma matrícula.
-- 7. Liste os cursos que NÃO possuem matrículas cadastradas.
-- 8. Exiba os alunos que possuem faltas maiores que 5 em alguma matrícula.
-- 9. Mostre os cursos frequentados por alunos da cidade de Curitiba.
SELECT Cursos.nome_curso as Cursos
FROM `Cursos`
WHERE id_curso IN (
    SELECT Matriculas.id_curso
    FROM `Matriculas`
    JOIN `Alunos` ON Alunos.id_aluno = Matriculas.id_aluno
    WHERE Alunos.cidade = 'Curitiba'
)


-- 10. Liste os alunos matriculados no curso com maior carga horária.
SELECT Alunos.nome as Nome
FROM Alunos
JOIN Matriculas ON Matriculas.id_aluno = Alunos.id_aluno
JOIN Cursos ON Cursos.id_curso = Matriculas.id_curso
WHERE Cursos.carga_horaria = (
    SELECT MAX(carga_horaria) FROM Cursos
);


-- # Questões Avançadas — Subquery com operadores de comparação

-- 1. Exiba os alunos cuja idade seja maior que a média de idade dos alunos de São Paulo.
SELECT Alunos.nome as Alunos, Alunos.idade as Idade 
FROM `Alunos` 
WHERE idade > (
    SELECT AVG(idade)
    FROM `Alunos`
    WHERE cidade = 'São Paulo'
);

-- 2. Liste os cursos cuja média de notas seja maior que a média geral das notas.


-- 3. Mostre os alunos cuja soma de faltas seja maior que a média total de faltas.
-- 4. Exiba os cursos cuja maior nota registrada seja igual à maior nota do sistema.
-- 5. Liste os alunos cuja média de notas seja menor que a média geral dos alunos.
-- 6. Mostre os cursos cuja quantidade de matrículas seja maior que a média de matrículas dos cursos.
-- 7. Exiba os alunos que possuem nota maior que todas as notas do curso “Banco de Dados”.
-- 8. Liste os cursos cuja menor nota seja maior que a média geral das menores notas dos cursos.
-- 9. Mostre os alunos cuja idade seja igual à idade média dos alunos.



-- 10. Exiba os cursos cuja carga horária seja menor que a maior carga horária cadastrada.

-- ---

-- # Questões — Subquery como nova coluna

-- 1. Liste os alunos e exiba ao lado a quantidade total de matrículas de cada aluno.
-- 2. Exiba os cursos e mostre ao lado a média das notas de cada curso.
-- 3. Liste os alunos e mostre a soma total de faltas de cada um.
-- 4. Exiba os cursos e mostre quantos alunos estão matriculados em cada curso.
-- 5. Liste os alunos e apresente sua maior nota registrada.
-- 6. Exiba os cursos e mostre a menor nota registrada em cada curso.
-- 7. Liste os alunos e mostre a média de notas de cada um em uma nova coluna chamada Media_Aluno.
-- 8. Exiba os cursos e apresente o total de faltas registradas em cada curso.
-- 9. Liste os alunos e mostre a quantidade de cursos diferentes em que estão matriculados.
-- 10. Exiba os cursos e mostre a quantidade de alunos aprovados (nota maior ou igual a 7).

-- # Questões Desafio — Misturando GROUP BY + HAVING + SUBQUERY

-- 1. Liste as cidades cuja média de idade seja maior que a média geral de idade dos alunos.
-- 2. Exiba os cursos cuja média de notas seja maior que a média das médias dos cursos.
-- 3. Mostre os alunos cuja soma de faltas seja maior que a soma média de faltas dos alunos.
-- 4. Liste os cursos que possuem quantidade de matrículas acima da média de matrículas por curso.
-- 5. Exiba os alunos cuja média de notas seja maior que a média dos alunos da cidade de São Paulo.
-- 6. Mostre os cursos cuja carga horária seja maior que a média das cargas horárias dos cursos com matrícula.
-- 7. Liste os alunos que possuem mais matrículas que a média de matrículas dos alunos.
-- 8. Exiba os cursos cuja maior nota seja inferior à maior nota geral do sistema.
-- 9. Mostre os alunos cuja média de faltas seja menor que a média geral de faltas.
-- 10. Liste os cursos cuja quantidade de alunos aprovados seja maior que a média de aprovados dos cursos.