-- Questão 1
create database letscode;
create database letscode_del;

-- Questão 2
alter database letscode rename to turma889;

-- Questão 3
drop database letscode_del;

-- Questão 4
create table alunos(
    id integer,
    matricula integer,
    nome varchar(200),
    estado varchar(2),
    formacao varchar(100)
);

-- Questão 5
alter table alunos rename column estado to uf;

-- Questão 6
alter table alunos ADD column email VARCHAR;
alter table alunos ADD column telefone VARCHAR(20);

-- Questão 7
alter table alunos alter column email type VARCHAR(100);

-- Questão 8
alter table alunos drop column id;

-- Questão 9
drop table alunos;

-- Questão 10
-- A melhor é a matricula já que é um valor inteiro e único para cada aluno. Criar outra coluna seria redundante.
alter table alunos 
	add constraint pk_alunos
	primary key (matricula);

-- Questão 11
-- Falso

-- Questão 12
-- Falso

-- Questão 13
-- Falso

-- Questão 14
-- e

-- Questão 15
-- d

-- Questão 16
-- Verdadeiro

