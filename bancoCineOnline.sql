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


INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(1, 'rei artur', '02', 8, 'cabaca fria');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(2, 'eitcahu', '03', 15, 'oitentaedoistres');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(3, 'demenos', '03', 15, 'gtatchau');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(4, 'ponei', '03', 15, 'bbdvgshgu');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(5, 'pikachu', '03', 15, 'pokemon');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(6, 'gata123', '03', 15, 'oilinda');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(7, 'djavu', '03', 15, 'hoje é show');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(8, 'rbd', '03', 15, 'fica com deus chegou a sua vez');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(9, 'burro', '03', 15, 'e de vez enquando jumento');
INSERT INTO cinema (cinema_codigo,cinema_nome, cinema_sala, cinema_capacidade, cinema_cidade) VALUES(10, 'fuga das chikens dinners', '03', 15, 'um boa noite cinderela');

INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(1, 'vish que mais ou menos será', 'jovem neuro', 78);
INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(2, 'vish que eitaaa', 'idoso', 99);
INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(3, 'não gusiatei', 'criança', 9);
INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(4, 'vish que não quero mais', 'madrugueiro', 65);
INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(5, 'vish que minha mãe é linda dms', 'adolescentes', 80);
INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(6, 'vish que tentei fazer melhor', 'jovem', 77);
INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(7, 'vish que não sei contar mas derrepente aprendi', 'jovem', 50);
INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(8, 'vish que sei lá não sei mais', 'jovem criança', 5);
INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(9, 'mudando de assunto eu não quero mudar', 'jovem', 88);
INSERT INTO filmes (fil_codigo,fil_titulo, fil_genero, fil_censura) VALUES(10, 'você ta tao bonita moça', 'jovem', 90);

INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(1, 2, 1, '1888-09-10', 19.75);
INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(2, 2, 1, '1898-10-09', 19.25);
INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(3, 1, 1, '1898-10-09', 19.80);
INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(4, 1, 2, '1898-10-09', 19.85);
INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(10, 3, 1, '1898-10-09', 19.78);
INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(9, 4, 1, '1898-10-09', 19.78);
INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(8, 5, 1, '1898-10-09', 19.79);
INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(7, 1, 1, '1898-10-09', 19.78);
INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(6, 6, 1, '1898-10-09', 19.52);
INSERT INTO sessao (ses_codigo,ses_codfilme, ses_codcinema, ses_datahora,ses_preco) VALUES(5, 7, 1, '1898-10-09', 19.97);

INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(1, 20, 'vish que eitaa', 2);
INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(2, 22, 'vish que eitaa', 2);
INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(3, 22, 'vish que eitaa', 2);
INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(4, 22, 'mudando de assunto eu não quero muda', 9);
INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(5, 22, 'mudando de assunto eu não quero mudar', 9);
INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(6, 22, 'você ta tao bonita moça', 10);
INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(7, 22, 'não gusitei', 3);
INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(8, 22, 'não gusitei', 3);
INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(9, 22, 'não gusitei', 3);
INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(10, 22, 'não gusitei', 3);

INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(1, 'joao barros khjkj', 'joaobarrokkls@hotmail.com',1);
INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(2, 'joao silv jonuijhhifa', 'joaosilva@hotmail.com',2);
INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(3, 'joao adalberto koiui', 'joacccos88ilva@hotmail.com',2);
INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(4, 'joao ferreira kailou', 'joaosiaa09898alva@hotmail.com',2);
INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(5, 'joao pinto sousa', 'joaosilbbbva78454@hotmail.com',2);
INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(6, 'joao alves kurinrin', 'joaosdddiljkjd445va@hotmail.com',2);
INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(7, 'joao nome goku', 'joaosil3478787va@hotmail.com',2);
INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(8, 'joao firmonio vegeta', 'joaasasosilva47s87e@hotmail.com',2);
INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(9, 'joao texeira picukoulu', 'joaossrsilvd78d7a@hotmail.com',2);
INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(10, 'joao melado', 'joaoshahahildhhhd55855va@hotmail.com',2);

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

SELECT cinema_nome, cinema_sala, fil_titulo FROM cinema, filmes WHERE fil_titulo = 'vish que bom';

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