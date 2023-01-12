create database emp99;

select * from clientes;
select * from produtos;
select * from vendas;

--funções de agregação

select sum(valor) as total_produtos
	from produtos;

select sum(valor) as total_vendas
	from vendas as v
	left join produtos as p using (id_produto);

select sum(quantidade*valor) as total
	from vendas as v
	left join produtos as p using (id_produto);

select 'produtos' as nome,count(*) as qtd
	from produtos
union
select 'clientes' as nome,count(*) as qtd
	from clientes
union
select 'vendas'as nome,count(*) as qtd
	from vendas;

select max(quantidade) as qtd_vendas from vendas;

select max(quantidade*valor) as valor_total_vendas 
from vendas as v
left join produtos as p on p.id_produto = v.id_produto;

select min(valor) as min_val from produtos;

select produto as min_val 
from produtos
where valor = (select min(valor) as min_val from produtos);

select avg(valor) as media_produtos
from produtos;

select avg(quantidade * valor) as media_valor_total
from produtos as p
left join vendas as v using (id_produto);

-- group by

select nome, sum(valor * quantidade) as valor_total
from produtos as p
left join vendas as v using (id_produto) 
left join clientes as c using (id_cliente)
group by nome
order by valor_total desc;

select produto, avg(valor * quantidade) as valor_total
from produtos as p
left join vendas as v using (id_produto) 
group by produto
order by valor_total desc;

select nome,produto, sum(valor * quantidade) as valor_total
from produtos as p
left join vendas as v using (id_produto) 
left join clientes as c using (id_cliente)
group by nome,produto
order by nome asc;

-- having

select nome, sum(valor * quantidade) as valor_total
from produtos as p
left join vendas as v using (id_produto) 
left join clientes as c using (id_cliente)
group by nome
having sum(valor * quantidade)>3000
order by valor_total desc;

select nome, count(*)
from vendas as v 
left join clientes as c using (id_cliente)
group by nome
having count(*)>1
order by count(*) desc;

-- casting

select id_produto, cast(id_produto as varchar) as id_produto_text
from vendas as v;

select num, 
	cast(num as int),
	cast(num as float),
	cast(num as numeric)
from (
		select '1' as num
		union
		select '2' as num
		union
		select '5' as num
		union
		select '10' as num
	 )as tb
	 
select *, to_char(valor,'L9G999G999D99')
from produtos as p

--with

with tab_temp as(
	select
		id_venda,
		data_venda,
		'test'
	from vendas as v
)
select * from tab_temp
inner join vendas using (id_venda)

with tab_min as (
	select min(valor) as min_val from produtos
	)
select * 
from produtos as p
where valor = (select * from tab_min);

with tab_min as (
	select min(valor) as min_val from produtos
	)
select p.* 
from produtos as p
inner join tab_min as m on m.min_val = p.valor

-- function with dates

select  
	current_date,
	date_part('year',current_date) as ano_atual,
	date_part('quarter',current_date) as quarter_atual,
	date_part('month',current_date) as month_atual,
	date_part('week',current_date) as week_atual,
	date_part('day',current_date) as day_atual,
	date_trunc('year',current_date) as date_atual_t,
	date_trunc('quarter',current_date) as quarter_atual_t,
	date_trunc('month',current_date) as month_atual_t,
	date_trunc('week',current_date) as week_atual_t,
	date_trunc('day',current_date) as day_atual_t
	
select
	date_part('year',v.data_venda) as ano,
	sum(quantidade*valor) as valor_total
from vendas as v
left join produtos as p using (id_produto)
group by ano
order by valor_total desc;

select
	nome,
	date_part('month',v.data_venda) as mes,
	sum(quantidade*valor) as valor_total
from vendas as v
left join produtos as p using (id_produto)
left join clientes as c using (id_cliente)
group by nome,mes
order by mes desc;

select
	date_part('year',v.data_venda) as ano,
	sum(quantidade*valor) as valor_total
from vendas as v
left join produtos as p using (id_produto)
where date_part('year',v.data_venda) <= date_part('year',current_date)
group by ano
order by valor_total desc;

--windows functions
select 
	produto,
	avg(quantidade) as media_qtd
from vendas as v 
left join produtos as p using (id_produto)
group by produto;

select 
	id_venda,
	produto,
	quantidade,
	avg(quantidade) over (partition by produto) as media_qtd
from vendas as v 
left join produtos as p using (id_produto);

select count(*) from (
select 
	id_venda,
	produto,
	quantidade,
	avg(quantidade) over (partition by produto) as media_qtd
from vendas as v 
left join produtos as p using (id_produto)) as v;

select count(*) from (
select 
	id_venda,
	produto,
	quantidade
from vendas as v 
left join produtos as p using (id_produto)) as v;

with tab_rank as (
select 
	nome,
	sum(quantidade*valor) as valor_total,
	rank() over (order by sum(quantidade*valor) desc)
from vendas as v 
left join produtos as p using (id_produto)
left join clientes as c using (id_cliente)
group by nome)
select * from tab_rank where rank<=10




