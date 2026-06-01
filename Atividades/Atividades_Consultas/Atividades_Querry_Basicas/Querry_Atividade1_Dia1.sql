CREATE DATABASE EscolaDB;

USE EscolaDB;

CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    idade INT
);

CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100),
    carga_horaria INT
);

CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_curso INT,
    nota DECIMAL(4,2),
    faltas INT,
FOREIGN KEY (id_aluno)REFERENCES Alunos(id_aluno),
FOREIGN KEY (id_curso)REFERENCES Cursos(id_curso)
);

-- Isertes : 

INSERT INTO Alunos (nome, cidade, idade)VALUES
('Carlos','São Paulo',18),
('Mariana','Curitiba',22),
('João','Florianópolis',19),
('Fernanda','São Paulo',25),
('Lucas','Rio de Janeiro',20),
('Patricia','Curitiba',21),
('Ana','Porto Alegre',23),
('Bruno','São Paulo',24);

INSERT INTO Cursos (nome_curso, carga_horaria)VALUES
('Python',40),
('Banco de Dados',60),
('Java',80),
('Data Science',100);

INSERT INTO Matriculas (id_aluno, id_curso, nota, faltas)VALUES
(1,1,8.5,2),
(1,2,7.0,5),
(2,1,9.5,1),
(2,4,8.0,4),
(3,2,6.5,6),
(3,3,7.5,3),
(4,4,9.0,0),
(5,1,5.5,10),
(5,2,6.0,7),
(6,3,8.5,2),
(7,4,7.0,5),
(8,2,9.5,1);


-- 1. Liste todos os alunos cadastrados.
SELECT * FROM `Alunos`;

-- 2. Liste apenas os nomes dos alunos.
SELECT nome
FROM `Alunos`;

-- 3. Exiba todos os cursos cadastrados.
SELECT nome_curso
FROM `Cursos`;

-- 4. Mostre os alunos que moram em São Paulo.
SELECT nome
FROM `Alunos`
WHERE cidade = 'São Paulo';

-- 5. Liste os alunos com idade maior que 20 anos.
SELECT nome
FROM `Alunos`
WHERE idade > 20;

-- 6. Exiba os cursos com carga horária maior que 50 horas.
SELECT nome_curso
FROM `Cursos`
WHERE carga_horaria > 50;

-- 7. Mostre os alunos com idade entre 18 e 22 anos.
SELECT nome
FROM `Alunos`
WHERE idade 
BETWEEN 18 AND 22;

-- 8. Liste os alunos da cidade de Curitiba.
SELECT nome 
FROM `Alunos`
WHERE cidade = 'Curitiba';

-- 9. Exiba os alunos cuja idade seja menor que 21 anos.
SELECT nome
FROM `Alunos`
WHERE idade > 21;

-- 10. Liste todas as matrículas cadastradas.
SELECT * FROM `Matriculas`;
-- ---




-- ## Intermediárias

-- 1. Mostre os alunos que possuem nota maior que 8.
SELECT Alunos.nome , Matriculas.nota
FROM Alunos
JOIN Matriculas ON Matriculas.id_aluno = Alunos.id_aluno
WHERE Matriculas.nota > 8;

-- 2. Liste os alunos que tiveram mais de 5 faltas.
SELECT Alunos.nome , Matriculas.faltas
FROM `Alunos`
JOIN `Matriculas` ON Matriculas.id_aluno = Alunos.id_aluno
WHERE Matriculas.faltas > 5;

-- 3. Exiba os cursos com carga horária igual a 80 horas.
SELECT nome_curso FROM `Cursos`
WHERE carga_horaria = 80;

-- 4. Mostre os alunos que NÃO moram em São Paulo.
SELECT nome
FROM `Alunos`
WHERE NOT cidade = 'São Paulo';

-- 5. Liste os alunos cujo nome começa com a letra “A”.
SELECT nome
FROM `Alunos`
WHERE nome LIKE 'a%';

-- 6. Exiba os alunos cujo nome termina com a letra “a”.
SELECT nome
FROM `Alunos`
WHERE nome LIKE '%a';

-- 7. Liste os cursos cujo nome contenha a palavra “Dados”.
SELECT nome_curso
FROM `Cursos`
WHERE nome_curso LIKE '%dados%'

-- 8. Mostre as matrículas com nota entre 7 e 9.
SELECT Matriculas.id_matricula , Matriculas.id_aluno , Matriculas.nota , Alunos.nome 
FROM `Matriculas`
JOIN Alunos ON Alunos.id_aluno = Matriculas.id_aluno
WHERE nota >= 7 and nota <= 9;

-- 9. Liste os alunos que possuem exatamente 20 anos.
SELECT nome
FROM `Alunos`
WHERE idade = 20;

-- 10. Exiba os cursos com carga horária menor ou igual a 60 horas.
SELECT nome_curso
FROM `Cursos`
WHERE carga_horaria >= 60;




# Questões com GROUP BY

-- 1. Mostre quantos alunos existem em cada cidade.
SELECT cidade, COUNT(nome)
FROM `Alunos`
GROUP BY cidade


-- 2. Exiba a média de idade dos alunos agrupada por cidade.
SELECT cidade , AVG(idade)
FROM `Alunos`
GROUP BY cidade;

-- 3. Mostre a quantidade de matrículas por curso.
SELECT Cursos.nome_curso , COUNT(Matriculas.id_curso)
FROM Matriculas
JOIN Cursos ON Cursos.id_curso = Matriculas.id_curso
GROUP BY Cursos.nome_curso;

-- 4. Exiba a média das notas por curso.
SELECT c.nome_curso, AVG(m.nota) AS media_nota
FROM Matriculas m
JOIN Cursos c ON c.id_curso = m.id_curso
GROUP BY c.nome_curso;


-- 5. Mostre o total de faltas agrupado por curso.
SELECT c.nome_curso, SUM(m.faltas) AS total_faltas
FROM Matriculas m
JOIN Cursos c ON c.id_curso = m.id_curso
GROUP BY c.nome_curso;


-- 6. Liste a maior nota obtida em cada curso.
SELECT c.nome_curso, MAX(m.nota) AS maior_nota
FROM Matriculas m
JOIN Cursos c ON c.id_curso = m.id_curso
GROUP BY c.nome_curso;


-- 7. Exiba a menor nota registrada em cada curso.
SELECT c.nome_curso, MIN(m.nota) AS menor_nota
FROM Matriculas m
JOIN Cursos c ON c.id_curso = m.id_curso
GROUP BY c.nome_curso;


-- 8. Mostre a soma total das faltas agrupadas por aluno.
SELECT a.nome, SUM(m.faltas) AS total_faltas
FROM Matriculas m
JOIN Alunos a ON a.id_aluno = m.id_aluno
GROUP BY a.nome;


-- 9. Exiba a média de notas agrupada por aluno.
SELECT a.nome, AVG(m.nota) AS media_nota
FROM Matriculas m
JOIN Alunos a ON a.id_aluno = m.id_aluno
GROUP BY a.nome;


-- 10. Mostre quantos alunos existem em cada faixa etária.
SELECT
  CASE
    WHEN idade BETWEEN 18 AND 20 THEN '18–20'
    WHEN idade BETWEEN 21 AND 23 THEN '21–23'
    ELSE '24+'
  END AS faixa_etaria,
  COUNT(*) AS quantidade
FROM Alunos
GROUP BY faixa_etaria;
HAVING e ORDER BY — questões 1 a 10



-- 1. Liste as cidades que possuem mais de 2 alunos.
SELECT cidade, COUNT(*) AS total
FROM Alunos
GROUP BY cidade
HAVING COUNT(*) > 2;


-- 2. Exiba os cursos cuja média de notas seja maior que 8.
SELECT c.nome_curso, AVG(m.nota) AS media_nota
FROM Matriculas m
JOIN Cursos c ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
HAVING AVG(m.nota) > 8;


-- 3. Mostre os cursos que possuem mais de 2 matrículas.
SELECT c.nome_curso, COUNT(*) AS total_matriculas
FROM Matriculas m
JOIN Cursos c ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
HAVING COUNT(*) > 2;


-- 4. Liste os alunos cuja soma de faltas seja maior que 5.
SELECT a.nome, SUM(m.faltas) AS total_faltas
FROM Matriculas m
JOIN Alunos a ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING SUM(m.faltas) > 5;


-- 5. Exiba os cursos cuja menor nota seja maior que 6.
SELECT c.nome_curso, MIN(m.nota) AS menor_nota
FROM Matriculas m
JOIN Cursos c ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
HAVING MIN(m.nota) > 6;


-- 6. Mostre os cursos ordenados pela carga horária em ordem decrescente.
SELECT nome_curso, carga_horaria
FROM Cursos
ORDER BY carga_horaria DESC;


-- 7. Liste os alunos ordenados por idade do maior para o menor.
SELECT nome, idade
FROM Alunos
ORDER BY idade DESC;


-- 8. Exiba a média de notas por curso ordenada da maior para a menor.
SELECT c.nome_curso, AVG(m.nota) AS media_nota
FROM Matriculas m
JOIN Cursos c ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
ORDER BY media_nota DESC;


-- 9. Mostre as cidades ordenadas pela quantidade de alunos.
SELECT cidade, COUNT(*) AS total_alunos
FROM Alunos
GROUP BY cidade
ORDER BY total_alunos DESC;


-- 10. Liste os alunos com média de notas maior que 7, ordenados pela média decrescente.
SELECT a.nome, AVG(m.nota) AS media_nota
FROM Matriculas m
JOIN Alunos a ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING AVG(m.nota) > 7
ORDER BY media_nota DESC;