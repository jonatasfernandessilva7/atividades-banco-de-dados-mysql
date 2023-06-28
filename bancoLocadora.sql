#só testando hein...
CREATE DATABASE testedesoftuarei;

USE testedesoftuarei;

CREATE TABLE testando(
id INT, 
nome VARCHAR(50)
);

INSERT INTO testando(id,nome) VALUES (1, 'jonatas');

SELECT * FROM testando WHERE id=1;

# ------------------------------------------------------------------------------------------------------

#esse é pra valer..

CREATE DATABASE locadora;

USE locadora;

CREATE TABLE clientes(
cli_codigo INT NOT NULL, 
cli_nome VARCHAR(110) NOT NULL, 
cli_cpf CHAR(12), 
cli_data_nasc DATE, #atributo do tipo data
cli_sexo CHAR(1), 
cli_email VARCHAR(110)
);

CREATE TABLE filmes(
film_codigo INT NOT NULL, 
film_titulo VARCHAR(110) NOT NULL,
film_genero VARCHAR(50), 
film_duracao TIME, #atributo de tempo
film_status VARCHAR(12), 
film_preco NUMERIC(3,2) #indica que pode ter até 3 caracterres sendo 2 deles depois da vírgula pode ter até 2 caracteres
);

drop table filmes;

# ------------------------------------------------------------------------------------------------------

#descrevendo as tabelas existentes
DESC clientes; 
DESC filmes;

INSERT INTO clientes
VALUES(112, 'antonio robreto amadeu', '112112112-12', '1250-02-12', 'f', 'antoniocavaloamadeuroberto@gmail.oprkut.gb');

SELECT * FROM clientes WHERE cli_codigo=112;

INSERT INTO filmes
VALUES(3,'gta sa', 'reallife', '16:58:59', 'on', 8.5);

UPDATE clientes SET cli_nome = 'jose gabriela bezerra' WHERE cli_nome = 'antonio robreto amadeu';

DELETE FROM clientes WHERE cli_codigo=112;

SELECT * FROM clientes;

SELECT cli_nome, cli_cpf FROM clientes;

SELECT * FROM filmes;

INSERT INTO clientes
VALUES(112, 'antonio bgxdvasghdch amadeu', '656575656-12', '1250-02-12', 'm', 'bg\hdfchg\sd@gmail.oprkut.gb');

SELECT cli_nome, cli_email FROM clientes WHERE cli_sexo = 'm';

SELECT film_codigo , film_titulo FROM filmes;

INSERT INTO filmes
VALUES(5,'e o vento levou', 'eita que filme', '16:58:59', 'on', 8.5);

SELECT film_duracao FROM filmes WHERE film_titulo='e o vento levou';

SELECT film_titulo FROM filmes WHERE film_preco < 3;

SELECT film_titulo FROM filmes WHERE film_status <> 'alugado';

SELECT cli_nome
FROM clientes WHERE cli_data_nasc >= '1990-1-1';

SELECT film_titulo
FROM filmes
WHERE film_preco < 3 AND film_status <> 'alugado';

SELECT film_titulo
FROM filmes WHERE film_genero= 'romance' OR film_genero
= 'animação';

SELECT film_titulo
FROM filmes WHERE film_codigo BETWEEN 2 AND 20;

SELECT cli_email
FROM clientes WHERE cli_nome BETWEEN 'A' AND 'G';

SELECT cli_nome
FROM clientes WHERE cli_email LIKE '%gmail.com';

SELECT * FROM clientes WHERE cli_nome LIKE 'Luiz%';

SELECT film_titulo
FROM filmes WHERE film_genero IN ('comedia', 'romance',
'acao');

SELECT cli_nome
FROM clientes WHERE cli_email IS NULL;

# ------------------------------------------------------------------------------------------------------

#reescrevendo querys

SELECT film_titulo FROM filmes WHERE film_preco > 2.5;

SELECT cli_nome FROM clientes WHERE cli_sexo = 'm';

SELECT film_titulo FROM filmes WHERE film_genero IN ('comedia', 'policial');

SELECT cli_nome FROM clientes WHERE cli_nome LIKE 'A%' AND cli_nome LIKE 'B%';

# consultas e ordenação de dados

SELECT cli_nome, cli_email FROM clientes ORDER BY cli_nome;

SELECT cli_nome, cli_email FROM clientes ORDER BY cli_nome DESC;

SELECT cli_nome, cli_email FROM clientes WHERE cli_nome LIKE 'a%' ORDER BY cli_nome;


# exercícios

-- 1) exibir nome e CPF de todos os clientes em ordem alfabética
SELECT cli_nome FROM clientes ORDER BY cli_nome;

-- 2) exibir todas as informações sobre os filmes da locadora em ordem decrescente do código do filme
SELECT * FROM filmes ORDER BY film_codigo DESC;

-- 3) exibir o nome e email dos clientes do sexo masculino em ordem alfabética inversa
SELECT cli_nome, cli_email FROM clientes WHERE cli_sexo = 'm' ORDER BY cli_nome DESC;

-- 4) exibir o nome e a data de nascimento dos clientes que usam email do hotmail (@hotmail.com) em ordem alfabética
SELECT cli_nome, cli_data_nasc FROM clientes WHERE cli_email LIKE '%hotmail.com' ORDER BY cli_nome; 

# ------------------------------------------------------------------------------------------------------

# consultas usando arupamento de dados

SELECT film_preco FROM filmes GROUP BY film_preco;

SELECT COUNT(film_titulo) FROM filmes;

SELECT COUNT(DISTINCT film_titulo) FROM filmes;

SELECT MIN(film_preco), AVG(film_preco), MAX(film_preco) FROM filmes;

# exercícios

-- 1) quantos clientes do sexo feminino têm na locadora
SELECT cli_sexo, COUNT(cli_sexo) FROM clientes GROUP BY cli_sexo;

-- 2) quantos exemplares de um mesmo filme estão cadastrados na locadora
SELECT film_titulo, COUNT(film_titulo) AS Unidades FROM filmes GROUP BY film_titulo;

SELECT film_titulo AS titulo, COUNT(film_titulo) AS quantidade FROM filmes GROUP BY film_titulo HAVING COUNT(film_titulo)>1;

# exercicios parte 02

-- * -- * -- * -- * -- * -- * -- * -- * --

SELECT film_status, COUNT(film_status) FROM filmes GROUP BY film_status;

SELECT film_genero AS genero, COUNT(film_genero) AS quantidade FROM filmes GROUP BY film_genero;

SELECT film_preco AS preco_unitario, SUM(film_preco) AS total FROM filmes GROUP BY film_preco;



-- * -- * -- * -- * -- * -- * -- * -- * --

-- comando alter

ALTER TABLE clientes ADD cli_endereco VARCHAR(100);

ALTER TABLE filmes
ADD fil_direcao VARCHAR(50)
FIRST;

ALTER TABLE filmes
ADD fil_atores VARCHAR(200)
AFTER fil_direcao;

ALTER TABLE filmes DROP COLUMN fil_direcao;
ALTER TABLE filmes DROP COLUMN fil_atores;

ALTER TABLE clientes CHANGE COLUMN cli_email
cli_endereco_eletronico varchar(80);

# ------------------------------------------------------------------------------------------------------