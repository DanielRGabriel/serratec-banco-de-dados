create table meu_schema.produtos(

codigo serial not null,
descricao varchar(100),
preco_venda double precision,
codigo_ean varchar(13),
valor_desconto double precision,
valor_custo double precision,
categoria varchar (20),
data_cadastro timestamp without time zone NOT NULL,
data_validade date
	
 


)

insert into meu_schema.produtos (descricao,preco_venda,codigo_ean,valor_desconto,valor_custo,categoria,data_cadastro,data_validade)
values

 ('Camisa gola v', 29.99, '1234567890123', 1.90, 15.00, 'Vestuário', '19-03-2024', '19-04-2024'),
 ('Camiseta', 19.99, '1234567890124', 0, 5.00, 'Vestuário', '19-03-2024', '19-04-2024'),
 ('Camisa social', 59.99, '1234567890125', 9.90, 19.90, 'Vestuário', '19-03-2024', '19-04-2024'),
 ('Short', 25.99, '1234567890126', 2.50, 9.90, 'Vestuário', '19-03-2024', '19-04-2024'),
 ('Bermuda', 39.99, '1234567890127', 5.90, 15.00, 'Vestuário', '19-03-2024', '19-04-2024')
 
 
 select * from  meu_schema.produtos

select descricao,preco_venda from meu_schema.produtos