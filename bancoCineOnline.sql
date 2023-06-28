-- criando database

CREATE DATABASE cineOnline;

USE cineOnline;

-- criando tabelas

CREATE TABLE cinema
(
cinema_codigo int NOT NULL,
cinema_nome varchar(40) NOT NULL,
cinema_sala varchar(2) NOT NULL,
cinema_capacidade int NOT NULL,
cinema_cidade varchar(50) NOT NULL,
PRIMARY KEY(cinema_codigo)
);

CREATE TABLE filmes
(
fil_codigo int NOT NULL,
fil_titulo varchar(50) NOT NULL,
fil_genero varchar(30) NOT NULL,
fil_censura char(8) NOT NULL DEFAULT 'Livre',
PRIMARY KEY(fil_codigo)
);

CREATE TABLE sessao
(
ses_codigo int NOT NULL,
ses_codfilme int NOT NULL,
ses_codcinema int NOT NULL,
ses_datahora datetime NOT NULL,
ses_preco numeric(9,2) NOT NULL,
PRIMARY KEY (ses_codigo),
FOREIGN KEY (ses_codfilme) REFERENCES filmes (fil_codigo),
FOREIGN KEY (ses_codcinema) REFERENCES cinema (cinema_codigo)
) ;

CREATE TABLE clientes
(
cli_codigo int NOT NULL,
cli_nome varchar(50) NOT NULL,
cli_email varchar (60) NOT NULL,
cli_compras int NOT NULL,
PRIMARY KEY (cli_codigo),
FOREIGN KEY (cli_compras) REFERENCES compras (comp_cod)
) ;


CREATE TABLE compras
(
comp_cod int NOT NULL,
comp_valor int NOT NULL,
comp_nome varchar(50) NOT NULL,
comp_fil int NOT NULL,
PRIMARY KEY (comp_cod),
FOREIGN KEY (comp_fil) REFERENCES filmes (fil_codigo)
) ;

-- inserindo dados

INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(1, 'brasao', '02', 8, 'iataboanacacaca');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(2, 'iuy', '03', 15, 'iataboanacacaca');

INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(1, 'vish que bom', 'adolescente', 18);
INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(2, 'vish que ruim', 'jovem', 29);

INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(1, 2, 1, '1888-09-10', 19.85);
INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(2, 2, 1, '1898-10-09', 19.90);

INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(1, 20, 'vish que bom', 1);
INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(2, 22, 'vish que ruim', 2);

INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(1, 'joao barros', 'joaobarros@hotmail.com',1);
INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(2, 'joao silva', 'joaosilva@hotmail.com',2);

-- buscando os dados 

SELECT * FROM cinema;
SELECT * FROM filmes;
SELECT * FROM sessao;
SELECT * FROM compras;
SELECT * FROM clientes;

-- -----------------------------------

-- JUNTANDO TABELAS

SELECT cli_nome, fil_titulo
FROM clientes CROSS JOIN filmes;

SELECT cinema_nome, cinema_sala
FROM filmes, sessao, cinema
WHERE fil_titulo = 'Procurando Nemo'
AND ses_codfilme = fil_codigo
AND cinema_codigo = ses_codcinema;

SELECT fil_titulo, cinema_nome, cinema_sala
FROM filmes, sessao, cinema
WHERE fil_titulo <> 'Procurando Nemo'
AND ses_codfilme = fil_codigo
AND cinema_codigo = ses_codcinema;

SELECT * FROM clientes CROSS JOIN filmes;

SELECT cinema_nome, cinema_sala, fil_titulo FROM cinema, filmes WHERE fil_titulo = 'vish que bom' GROUP BY cinema_nome;

-- ----------------------- exercício -------------------

-- Qual a diferença entre o comando SELECT com conexão cartesiana e o comando SELECT simples que utilizamos nas aulas anteriores?
-- R: a diferença é que o comando select simples busca apenas informações de uma tabela, enquanto o select com conexão cartesiana busca em duas ou mais tabelas de uma só vez

-- Qual o resultado da seguinte consulta: SELECT * FROM clientes CROSS JOIN filmes?
-- R: https://github.com/jonatasfernandessilva7/atividades-banco-de-dados-mysql.git (arquivo com nome: resultado select cross join.csv)

-- Qual o resultado da seguinte consulta: SELECT cinema_nome, cinema_sala, fil_titulo FROM cinema, filmes WHERE fil_titulo = 'Procurando Nemo' GROUP BY cinema_nome?
-- R: https://github.com/jonatasfernandessilva7/atividades-banco-de-dados-mysql.git (arquivo com nome: resultado select group by.csv)

-- Compare o resultado obtido na consulta realizada na Questão 3 com a consulta do Exemplo 1.
-- R: no exemplo 1, temos como resultado obtido apenas o nome do cinema e a sala onde está sendo exibido o filme
-- R: Já na consulta da questão da questão 3, saõ obtidos somente o nome e as salas do cinema em que são exibidos o filme da condição where, além de exibir também o nome do filme

-- Você pode utilizar funções como SUM e AVG nas consultas com conexão? Cite exemplos.
-- R: sim.
-- exemplos
-- > SELECT comp_fil AS filme, MAX(comp_fil) AS maior_cod_filme FROM compras, filmes, sessao, cinema WHERE fil_titulo <> 'procurando nemo' AND ses_codfilme = fil_codigo AND cinema_codigo = ses_codcinema GROUP BY comp_fil;