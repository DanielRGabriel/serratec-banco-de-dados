-- FULL OUTER JOIN
-- combina os dados de duas tabelas e retorna todas as linhas das duas tabelas,
-- incluindo tudo o que está e não está associado

-- exemplo:

-- 1 Crie duas tabelas, departamentos e empregados

create table departamentos (
	id serial primary key,
	nome varchar(255)
);

create table empregados (
	id serial primary key,
	nome varchar(255),
	id_departamento INT
);

-- Cada departamento pode conter 0 ou muitos empregados
-- Cada empregado pode pertencer a 0 ou muitos departamentos

-- 2 Insira alguns dados

insert into departamentos
	(nome)
values
	('Vendas'),
	('Marketing'),
	('RH'),
	('TI'),
	('Produção')

insert into empregados
	(nome, id_departamento)
values
	('Bette Nicholson', 1), 
	('Christian Gable', 1), 
	('Joe Swank', null), 
	('Fred Costner', 3), 
	('Sandra Kilmer', 4), 
	('Julia Mcqueen', null);

-- 3 confira se está tudo certinho

select * from departamentos

select * from empregados 

-- 1) FULL OUTER JOIN básico

select
	empreg.nome empregado,
	depart.nome departamento
	from empregados empreg
		full outer join departamentos depart on depart.id = empreg.id_departamento
-- output esperado:
-- Na coluna empregado: todos os nomes dos empregados (ou null), seguidos do departamento, ou null
-- Na coluna departamento: todos os departamentos (ou null), precedidos pelo departamento, ou null

-- 2) FULL OUTER JOIN com WHERE para filtrar
--a)
-- Essa consulta encontra os departamentos que não tem nenhum empregado, ou seja
-- departamentos não utilizados pelo insert into (Marketing e Produção)
select
	e.nome,
	d.nome
	from empregados e
		full outer join departamentos d on d.id = e.id_departamento
where
	e.nome is null;

--b) 
-- Essa consulta encontra os empregados que não tem nenhum departamento, ou seja
-- empregados no qual o insert into continha null (Joe e Sandra)

select
	e.nome,
	d.nome
	from empregados e
		full outer join departamentos d on d.id = e.id_departamento
where
	d.nome is null;


