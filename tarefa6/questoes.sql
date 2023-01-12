-- questão 1
select 
	count(distinct municipio_estado) 
from florestas f;  

-- questão 2
select 
	sum(area_ha) 
from florestas f;  

-- questão 3
select 
	especie,
	sum(area_ha) 
from florestas f
group by especie;

-- questão 4
select 
	date_part('year',ano_data) as ano,
	sum(area_ha) 
from florestas f
group by ano;

-- questão 5
select 
	date_part('year',ano_data) as ano,
	count(municipio_estado) 
from florestas f
group by ano;

-- questão 6
select 
	estado_sigla as uf,
	area_ha,
	sum(area_ha) over (partition by estado_sigla) as sum_area_uf
from florestas f;

-- questão 7
select 
	regiao,
	sum(area_ha) as area_total,
	rank() over (order by sum(area_ha) desc)
from florestas f
group by regiao;

