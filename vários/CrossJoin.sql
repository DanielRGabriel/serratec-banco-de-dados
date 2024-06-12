-- CROSS JOIN
-- usado para produzir o produto cartesiano das linhas das tabelas conectadas,
-- isso significa que cross join combina cada linha de cada tabela, resultando em
-- uma combinação completa das duas tabelas
-- se uma tabela tiver n linhas, e outra tivar m linhas, o resultado vai conter (n x m) linhas
-- use com cuidado, pois pode gerar um dataset muito grande

-- exemplo

-- cria duas tabelas simples
create table letras (
	letra char(1) primary key
);

create table numeros (
	numero int primary key
);

-- insira dados
insert into letras
	(letra)
values
	('A'),
	('B');

insert into numeros
	(numero)
values
	(1),
	(2);

-- a consulta usa cross join para gerar uma tabela de 4 linhas (2 letras x 2 numeros)
select 
	*
	from letras
		cross join numeros;
	

