-- SELF JOIN - joins na mesma tabela
-- USO:
-- quando vc precisa referenciar informações na mesma tabela e / ou
-- quando vc precisa referenciar informações numa hierarquia (ex. um funcionário é gerente de outro)
-- 1) HIERARQUIA:
create table funcionario (
	id int primary key, -- ESTOU USANDO ID (UMA PALAVRA RESERVADA DO POSTGRES)
	nome varchar(255) not null,
	sobrenome varchar(255) not null,
	idgerente int references funcionario(id) -- CHAVE ESTRANGEIRA USADA DENTRO DA MESMA TABELA PRA MANTER INTEGRIDADE
	
);

-- insere funcionários em uma ordem hierárquica, o funcionário que não tem gerente é o top chef
insert into funcionario
	(id, nome, sobrenome, idgerente)
values
	(1, 'Top', 'Chefe', NULL), --- esse cara manda em todo mundo, por isso o gerente dele é nulo
	(2, 'Ava', 'Christensen', 1), 
	(3, 'Hassan', 'Conner', 1), 
	(4, 'Anna', 'Reeves', 2), 
	(5, 'Sau', 'Norman', 2), 
	(6, 'Kelsie', 'Hays', 3), 
	(7, 'Tory', 'Goff', 3), 
	(8, 'Salley', 'Lester', 3)
;

-- conferir os dados
select * from funcionario;

-- consultar quem manda em quem

select
	fun.nome || ' ' || fun.sobrenome funcionario,
	ger.nome || ' ' || ger.sobrenome gerente
	from 
		funcionario fun -- referenciamos a mesma tabela duas vezes, 1 pro funcionario
		inner join funcionario ger -- 2 pro gerente
				on ger.id = fun.idgerente
order by 
	gerente
;

-- Perceba que o Top Chef não aparece nessa tabela, pq o valor do idgerente dele é NULL
-- como fazer pra aparecer o null? 
-- LEFT JOIN: o left join junta uma tabela à esquerda com a tabela à direita 
-- e retorna linhas que podem ou não existir na tabela da direita!
-- então se modificarmos a consulta acima:

select
	fun.nome || ' ' || fun.sobrenome funcionario,
	ger.nome || ' ' || ger.sobrenome gerente
	from 
		funcionario fun 
		-- adicionamos a palavra left para fazer o left join e removemos inner
		left join funcionario ger on ger.id = fun.idgerente
order by 
	gerente DESC -- ordenamos de modo descendente para o NULL ficar no inicio
;


--2) Comparando informação na mesma tabela

-- Cria uma tabela musica
create table musica (
	id int primary key,
	titulo varchar(120),
	duracao interval not null
); 

-- insere quatro musicas
insert into musica
	(id, titulo, duracao)
values
	(1, 'Lua vai', '04:02'),
	(2, 'Charles Jr.', '06:07'),
	(3, 'O Telefone Tocou Novamente', '03:51'),
	(4, 'Cheia de manias', '04:02')
;

-- Seleciona os titulos que tem a mesma duração
select
	m1.titulo,
	m2.titulo,
	m1.duracao
	from musica m1
		inner join musica m2 
				on m1.id > m2.id and m1.duracao = m2.duracao;

-- RESULTADO ESPERADO: "Cheia de manias"	"Lua vai"	"04:02:00"

		




