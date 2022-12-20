/*
Aula 4 - Criação de bases de dados e tabelas
Prof Tiago Dias
*/

/****************** MANIPULANDO BASE DE DADOS ******************/

-- Criar de uma nova base de dados, e criar uma nova conexão com essa base.
create database turma889;

-- Realizar uma alteração no nome da base de dados criada anteriormente.
alter database turma889 rename to clientes;

-- Deletar uma base de dados.
drop database clientes;

-- Deletar uma base de dados com o comando if exists.
drop database if exists clientes;

/****************** MANIPULANDO TABELAS ******************/
create database clientes;

-- Criar uma tabela.
create table clientes(
	id_cliente integer,
	nm_cliente varchar,
	email varchar,
	id_uf varchar
);

-- Criar uma tabela e definir chave primária e extrangeira.
create table ufs(
	id_uf varchar,
	estado varchar
);

alter table clientes 
	add constraint pk_clientes 
	primary key (id_cliente);

alter table ufs 
	add constraint pk_ufs 
	primary key (id_uf);

alter table clientes
	add constraint fk_clientes
	foreign key (id_uf)
	references ufs (id_uf);

-- Alterar o nome da tabela criada anteriormente.
alter table ufs rename to estados;

-- Alterar o nome de uma coluna da tabela.
alter table clientes rename column email to email_cliente;

-- Alterar o tipo de dados de uma coluna da tabela.
alter table clientes alter column nm_cliente type varchar(200);

-- Adicionar uma coluna na tabela.
alter table clientes add column telefone type varchar(20);

-- Deletar uma coluna na tabela.
alter table clientes drop column telefone;

-- Deletar a tabela.
drop table clientes;

