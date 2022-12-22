-- Questao 1
select municipio,area_ha from florestas where area_ha > 200000


-- Questao 2
select municipio,estado_sigla,area_ha from florestas where area_ha > 150000


-- Questao 3

-- Questao 4
select municipio,estado_sigla,especie,area_ha from florestas 
	where area_ha > 30000 and estado_sigla = 'BA'

-- Questao 5
create view vw_florestas as (
	select *
	from florestas
);

create materialized view vwm_florestas as (
	select *
	from florestas 
);

select * from vw_florestas

select * from vwm_florestas

