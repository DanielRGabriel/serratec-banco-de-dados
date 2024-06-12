-- Inner Join
-- usado pra selecionar dados de multiplas tabelas
-- exemplo:
-- 1) Selecionando info de 2 tabelas
-- Cria uma tabela de pessoas
create table pessoa (
	id int primary key,
	nome varchar(120),
	sobrenome varchar(120)
)
-- Insere duas pessoas
insert into pessoa
	(id, nome, sobrenome)
values
	(1, 'Zé', 'Smith'),
	(2, 'Jão', 'Jones'),
	(3, 'Marco', 'Polo');

-- Cria uma tabela de cargos

create table cargo(
	id int primary key,
	descricao varchar(120),
	id_pessoa int references pessoa(id)
)

-- Insere tres cargos
	
insert into cargo
	(id, descricao, id_pessoa)
values
	(3, 'Programador Sênior', 1),
	(2, 'Programador Júnior', 2),
	(1, 'Estagiário', 3)

-- Agora junta a tabela pessoa e a tabela cargos, usando o inner join
select
	pes.nome,
	pes.sobrenome,
	car.descricao
	from pessoa pes
		inner join cargo car
			on pes.id = car.id_pessoa
order by pes.nome -- ordena alfabeticamente (ascendente, zé vem por ultimo)

-- 2) Selecionando de tres tabelas

-- Cria a terceira tabela, de celulares, vamos usar as outras duas
create table celular (
	id int primary key,
	numero varchar(11),
	id_pessoa int references pessoa(id)
);

-- Insere 3 celulares
insert into celular
	(id, numero, id_pessoa)
values
	(1, 21978812345, 1),
	(2, 21976452147, 2),
	(3, 22876430012, 3)

select
	pes.nome,
	pes.sobrenome,
	car.descricao,
	cel.numero
	from
		pessoa pes
		inner join cargo car on pes.id = car.id_pessoa
		inner join celular cel on pes.id = cel.id_pessoa
order by pes.nome -- ordena alfabeticamente (ascendente, zé vem por ultimo)


-- 3) Usando a palavra USING
-- quando as colunas das tabelas que vc está juntando tiverem o mesmo nome,
-- vc pode usar a palavra using, sem precisar usar on e uma condição
-- a consulta abaixo é a mesma que a de cima, mas juntamos a tabela celular
-- com a tabela cargo, já que elas "compartilham" a coluna id_pessoa (quero dizer,
-- as colunas tem o mesmo nome nas duas tabelas)
select
	pes.nome,
	pes.sobrenome,
	car.descricao,
	cel.numero
	from
		pessoa pes
		inner join cargo car on pes.id = car.id_pessoa
		inner join celular cel using(id_pessoa) -- não precisa usar on, id_pessoa é o mesmo em cargo e cel
order by pes.nome -- ordena alfabeticamente (ascendente, zé vem por ultimo)






