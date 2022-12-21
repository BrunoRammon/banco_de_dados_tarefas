-- Questao 1
create database cinema;

create table filmes(
    id integer,
    nome varchar,
    categoria varchar,
    duracao int,
    lancamento date
);


-- Questao 2
insert into filmes (id,nome,categoria,duracao,lancamento) 
    values (6,'inception','sci-fi',148,'2010-07-08');


-- Questao 3
insert into filmes(id,nome,categoria,duracao,lancamento) values
    (1,'Como eu era antes de você','drama',110,'2016-06-16'),
    (2,'Para sempre','romance',104,'2012-06-07'),
    (3,'Arremesando alto','drama',117,'2022-06-02'),
    (4,'King Richard: criando campeas','drama',144,'2021-12-02'),
    (5,'No ritmo do coracao','drama',111,'2021-09-23');


-- Questao 4
delete from filmes where id = 6;


-- Questao 5
alter table  add column verificar bool;
update filmes set verificar = true where categoria='drama';


-- Questao 6
select id,nome,categoria from filmes order by id limit 2;


-- Questao 7
select id,nome,categoria from filmes where id in (1,2,4,5) order by id;

-- Questao 8
select id,nome,categoria,duracao,lancamento from filmes where id = 2;

