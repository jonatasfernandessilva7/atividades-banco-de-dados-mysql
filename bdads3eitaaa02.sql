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

INSERT INTO compras (comp_cod,comp_valor, comp_nome, comp_fil) VALUES(1, 20, 'vish que bom', 1);

INSERT INTO clientes (cli_codigo,cli_nome, cli_email, cli_compras) VALUES(1, 'joao barros', 'joaobarros@hotmail.com',1);

-- buscando os dados 

SELECT * FROM cinema;
SELECT * FROM filmes;
SELECT * FROM sessao;
SELECT * FROM compras;
SELECT * FROM clientes;