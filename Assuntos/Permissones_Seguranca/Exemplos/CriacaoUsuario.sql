
--Criar usuario : 
CREATE USER 'Yago'@'localhost' IDENTIFIED BY 'senha123';

--Ver usuario : 
SELECT * FROM mysql.user;
--OU 
SELECT host,user
FROM mysql.user;


--Excluir usuario : 
DROP USER'usuario'@'endereco';



---------------------------- EXEMPLOS : ----------------------------
CREATE USER 'teste2'@'localhost' IDENTIFIED BY '';
DROP USER 'teste2'@'localhost';

SELECT host, user FROM mysql.user;



--Concede todos os privilégios disponíveis para o usuário "teste" : 
GRANT ALL PRIVILEGES ON topico_12.* TO 'teste'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'teste3'@'localhost' IDENTIFIED BY '';
GRANT CREATE, SELECT, INSERT, UPDATE ON . TO 'teste3'@'localhost';
FLUSH PRIVILEGES;

SELECT * FROM mysql.user;



-- Ver as permissoens : 
SHOW GRANTS;

SHOW GRANTS FOR 'teste3'@'localhost';



-- DESAFIO (GRANT) : 

GRANT ALL PRIVILEGES ON . TO 'kaue'@'localhost';

CREATE TABLE Funcionario(
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(200),
    data_admissao DATE
);

CREATE TABLE Maquina(
    id_maquina INT PRIMARY KEY AUTO_INCREMENT,
    nome_maquina VARCHAR(200),
    setor_maquina VARCHAR(200)
);

CREATE USER 'programador'@'localhost' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE ON topico_12.Maquina TO 'programador'@'localhost';





-- DESAFIO (revoke) : 

REVOKE ALL PRIVILEGES 
ON . 
FROM 'teste'@'localhost';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'teste'@'localhost';

REVOKE CREATE, SELECT, INSERT, UPDATE ON . FROM 'teste3'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'teste3'@'localhost';






--DESAFIO (roles) : 

CREATE ROLE 'app_desenvolvedor',
'app_leitura',
'app_escrita';

GRANT ALL PRIVILEGES ON vamosla.* TO 'app_desenvolvedor';
GRANT SELECT ON vamosla.* TO 'app_leitura';
GRANT INSERT, UPDATE, DELETE ON vamosla.* TO 'app_escrita';

CREATE USER 'usuario_desenvolvedor'@'localhost';
CREATE USER 'usuario_leitura'@'localhost';
CREATE USER 'usuario_escrita'@'localhost';

GRANT 'app_desenvolvedor' TO 'usuario_desenvolvedor'@'localhost';
GRANT 'app_leitura' TO 'usuario_leitura'@'localhost';
GRANT 'app_leitura', 'app_escrita' TO 'usuario_escrita'@'localhost';

SET DEFAULT ROLE 'app_escrita' TO 'usuario_escrita'@'localhost';
FLUSH PRIVILEGES;

DROP ROLE 'app_leitura', 'app_escrita';

SHOW GRANTS FOR 'usuario_desenvovedor'@'localhost' USING 'app_desenvolvedor';

CREATE ROLE 'app_desativado';

REVOKE ALL PRIVILEGES ON . FROM 'app_desativado';
FLUSH PRIVILEGES;





---------------------------------------- CIRPTOGRAFIA : ----------------------------------------


-- MD5 : 

CREATE DATABASE criptografia_exemplos;

USE criptografia_exemplos;

CREATE TABLE cadastro_usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(30),
    senha TEXT
);

INSERT INTO cadastro_usuarios (usuario, senha)
VALUES ('Usuario Normal', 'CTWEGSENAITI2026');

INSERT INTO cadastro_usuarios (usuario, senha)
VALUES ('Usuario MD5', MD5('CTWEGSENAITI2026'));

SELECT * FROM cadastro_usuarios;




--SHA-1 : 

INSERT INTO cadastro_usuarios (usuario, senha)
VALUES ('Usuario SHA-1', SHA1('CTWEGSENAITI2026'));

INSERT INTO cadastro_usuarios (usuario, senha)
VALUES ('Usuario SHA', SHA('CTWEGSENAITI2026'));

SELECT * FROM cadastro_usuarios;




-- SHA-2 :

INSERT INTO cadastro_usuarios (usuario, senha)
VALUES ('Usuario SHA-2', SHA2('CTWEGSENAITI2026',224));

SELECT * FROM cadastro_usuarios;





-- AES : 

INSERT INTO cadastro_usuarios (usuario, senha)
VALUES ('Usuario AES', AES_ENCRYPT('CTWEGSENAITI2026','Minha senha secreta'));
-- A coluna senha deve estar configurada com o tipo de dado VARBINARY ou BLOB


SELECT * FROM cadastro_usuarios;

ALTER TABLE cadastro_usuarios
ADD COLUMN senha_aes VARBINARY(100);

INSERT INTO cadastro_usuarios (usuario, senha_aes)
VALUES ('Usuario AES', AES_ENCRYPT('CTWEGSENAITI2026','Minha senha secreta'));

SELECT AES_DECRYPT(
    senha_aes,
    'Minha senha secreta'
)
FROM cadastro_usuarios
WHERE senha_aes IS NOT NULL;

SELECT CAST(
AES_DECRYPT(
    senha_aes,
    'Minha senha secreta'
)
AS CHAR(255))
FROM cadastro_usuarios
WHERE senha_aes IS NOT NULL;






-- SQL injection : 

SELECT * FROM usuarios
WHERE usuario='teste' AND senha='teste123';

SELECT * FROM usuarios
WHERE usuario = 'root' AND senha = '';

SELECT * FROM usuarios
WHERE usuario = '' OR 1=1 AND senha='';

SELECT * FROM usuarios
WHERE usuario = '';

DROP TABLE usuarios;

