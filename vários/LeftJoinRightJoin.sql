-- JOINS
-- LEFT JOIN: o left join junta uma tabela à esquerda com a tabela à direita 
-- e retorna linhas que podem ou não existir na tabela da direita!

-- exemplo:
-- Cria a tabela cesta_a
create table cesta_frutas (
	id int primary key,
	fruta varchar(60)
);

-- insere 3 frutas

insert into cesta_frutas 
	(id, fruta)
values
	(1, 'Banana'),
	(2, 'Goiaba'),
	(3, 'Marmelo')

-- insere 2 doces
create table cesta_doces (
	id int primary key,
	doce varchar(60),
	ingrediente varchar(60)
);

insert into cesta_doces 
	(id, doce, ingrediente)
values
	(1, 'Bananada', 'Banana'),
	(2, 'Goiabada', 'Goiaba'),
	(3, 'Chocolate', 'Cacau') -- não tem marmelada, pq a gente precisa visualizar o left join

-- Vc vai selecionar a tabela da esquerda, e criar uma linha,
-- mesmo que não exista um correspondente na tabela da direita,
-- aqui selecionamos a fruta e o doce, se o ingrediente do doce for correspondente a fruta
select
	f.fruta,
	d.doce,
	d.ingrediente
	from cesta_frutas f
		 left join cesta_doces d on f.fruta = d.ingrediente
	
-- resultado esperado: vai aparecer marmelo e null e null = marmelo nao tem correspondente na cesta_doces

-- comparação com inner ou só join: não vai aparecer marmelo e null, pq não formam uma
-- linha válida, apenas os correspondentes totais são selecionados
select
	f.fruta,
	d.doce,
	d.ingrediente
	from cesta_frutas f
		inner join cesta_doces d on f.fruta = d.ingrediente;

-- comparação com right join: vai aparecer tudo que tem na cesta de doces (chocolate)
-- mas nas frutas vai aparecer null, pq cacau não está na cesta de frutas.
select
	f.fruta,
	d.doce,
	d.ingrediente
	from cesta_frutas f
		right join cesta_doces d on f.fruta = d.ingrediente;
