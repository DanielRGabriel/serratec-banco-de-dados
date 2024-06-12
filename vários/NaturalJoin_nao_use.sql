-- Natural Join
-- é usado para criar uma join implícita, baseada em colunas que tem o mesmo nome
-- uma natural join pode ser especificada como inner, left ou right. O padrão é inner join.

-- exemplo
-- cria uma tabela produtos e uma tabela categorias

create table categorias (
	id_categoria serial primary key,
	nome_categoria varchar(255) not null
);
create table produtos (
	id_produto serial primary key,
	nome_produto varchar(255) not null,
	id_categoria int references categorias (id_categoria) -- chave estrangeira
);

-- insere dados
insert into categorias
	(nome_categoria)
values
	('Smartphone'), 
	('Laptop'), 
	('Tablet'),
	('VR')
returning *; -- esse returning apareceu no exemplo. é útil quando você deseja recuperar informações sobre as linhas afetadas pelas operações (insert, delete, update).

insert into produtos
	(nome_produto, id_categoria)
values
	('iPhone', 1), 
	('Samsung Galaxy', 1), 
	('HP Elite', 2), 
	('Lenovo Thinkpad', 2), 
	('iPad', 3), 
	('Kindle Fire', 3)
returning *;

-- 1) Natural join produtos com categoria: id_categoria, id_produto nome_produto, nome_categoria
select 
	* 
	from produtos 
		natural join categorias;


-- 2) Natural left join das categorias com produtos: id_categoria, nome_categoria, id_produto, nome_produto
-- perceba que essa inclui a categoria vr que não tem nenhum produto (null) 
select 
	* 
	from categorias 
		natural left join produtos;

-- 3) Na prática não devemos usar natural join porque se as duas colunas tiverem outra coluna
-- com o mesmo nome, isso gera confusão

