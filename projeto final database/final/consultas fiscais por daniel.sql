create schema projeto_final2;

-- criação das tabelas

create table projeto_final2.endereco (
    id_endereco serial primary key,
    rua varchar(100),
    cidade varchar(100),
    estado varchar(50),
    cep varchar(10)
);

create table projeto_final2.cliente (
    id_cliente serial primary key,
    nome_completo varchar(100),
    nome_usuario varchar(50) unique,
    email varchar(100) unique,
    cpf varchar(11) unique,
    data_nascimento date,
	id_endereco integer references projeto_final2.endereco (id_endereco)
);


create table projeto_final2.funcionario (
    id_funcionario serial primary key,
    nome_funcionario varchar(100),
    cpf varchar(11) unique
);



create table projeto_final2.categoria (
    id_categoria serial primary key,
    nome_categoria varchar(100),
    descricao_categoria text
);

create table projeto_final2.produto (
    id_produto serial primary key,
    nome_produto varchar(100),
    descricao_produto text,
    quantidade_estoque int,
    data_fabricacao date,
    valor_unitario numeric(10,2),
    id_categoria int references projeto_final2.categoria(id_categoria)
);

create table projeto_final2.pedido (
    id_pedido serial primary key,
    id_cliente int references projeto_final2.cliente(id_cliente),
    data_pedido date,
    id_funcionario int references projeto_final2.funcionario(id_funcionario)
);

create table projeto_final2.pedidoitem (
    id_pedidoitem serial primary key,
    id_pedido int references projeto_final2.pedido(id_pedido),
    id_produto int references projeto_final2.produto(id_produto),
    quantidade int,
    valor numeric(10,2)
);

-- --inserts

insert into projeto_final2.endereco (rua, cidade, estado, cep)
values
  ('Rua das Flores', 'São Paulo', 'SP', '01234-567'),
  ('Avenida Principal', 'Rio de Janeiro', 'RJ', '12345-678'),
  ('Rua dos Girassóis', 'Belo Horizonte', 'MG', '23456-789'),
  ('Rua Central', 'Brasília', 'DF', '34567-890'),
  ('Rua das Acácias', 'Curitiba', 'PR', '45678-901');

insert into projeto_final2.cliente (nome_completo, nome_usuario, email, cpf, data_nascimento, id_endereco)
values
  ('João Silva', 'joaosilva', 'joao@example.com', '12345678900', '1990-05-15', 1),
  ('Maria Santos', 'mariasantos', 'maria@example.com', '98765432100', '1985-10-20', 2),
  ('Pedro Oliveira', 'pedroliveira', 'pedro@example.com', '45678912300', '1998-03-25', 3),
  ('Ana Souza', 'anasouza', 'ana@example.com', '32165498700', '1976-07-12', 4),
  ('Lucas Costa', 'lucascosta', 'lucas@example.com', '65432198700', '2000-09-30', 5);

  
insert into projeto_final2.funcionario (nome_funcionario, cpf)
values
  ('Carlos Silva', '11122233300'),
  ('Fernanda Oliveira', '44455566600'),
  ('Rafael Santos', '77788899900'),
  ('Juliana Costa', '00099988877'),
  ('Mariana Almeida', '22233344400');

insert into projeto_final2.categoria (nome_categoria, descricao_categoria)
values
  ('Eletrônicos', 'Produtos eletrônicos diversos'),
  ('Roupas', 'Artigos de vestuário'),
  ('Alimentos', 'Produtos alimentícios'),
  ('Livros', 'Livros de diversas categorias'),
  ('Cosméticos', 'Produtos de beleza e cuidados pessoais');

insert into projeto_final2.produto (nome_produto, descricao_produto, quantidade_estoque, data_fabricacao, valor_unitario, id_categoria)
values
  ('Smartphone', 'Telefone inteligente', 100, '2023-01-10', 1500.00, 1),
  ('Camiseta', 'Camiseta de algodão', 200, '2023-02-15', 30.00, 2),
  ('Arroz', 'Arroz tipo 1', 500, '2023-03-20', 5.50, 3),
  ('Harry Potter', 'Livro do Harry Potter', 150, '2023-04-25', 45.00, 4),
  ('Protetor Solar', 'Protetor solar FPS 50', 80, '2023-05-30', 25.00, 5);
  
insert into projeto_final2.pedido (id_cliente, data_pedido, id_funcionario)
values
  (1, '2024-03-22', 1),
  (2, '2024-03-23', 2),
  (3, '2024-03-24', 3),
  (4, '2024-03-25', 4),
  (5, '2024-03-26', 5);
  
insert into projeto_final2.pedidoitem (id_pedido, id_produto, quantidade, valor)
values
  (1, 1, 2, 1500.00),
  (1, 2, 3, 30.00),
  (2, 3, 1, 5.50),
  (2, 4, 2, 45.00),
  (3, 5, 1, 25.00);
  
--Gerar 1 pedido com 1 nota fiscal: 
 SELECT 
    p.id_pedido AS pedido_id,
    p.data_pedido,
    c.id_cliente,
    c.nome_completo AS nome_cliente,
    f.id_funcionario,
    f.nome_funcionario AS nome_vendedor,
    pi.id_pedidoitem,
    pr.id_produto,
    pr.nome_produto,
    pi.quantidade,
    pi.valor,
    (pi.quantidade * pi.valor) AS subtotal
FROM 
    projeto_final2.pedido p
JOIN projeto_final2.cliente c ON p.id_cliente = c.id_cliente
JOIN projeto_final2.pedidoitem pi ON p.id_pedido = pi.id_pedido
JOIN projeto_final2.produto pr ON pi.id_produto = pr.id_produto
JOIN projeto_final2.funcionario f ON p.id_funcionario = f.id_funcionario
WHERE 
    p.id_pedido = 1;


--Gerar 1 pedido com 2 notas fiscais

SELECT 
    p.id_pedido AS pedido_id,
    p.data_pedido,
    c.id_cliente,
    c.nome_completo AS nome_cliente,
    f.id_funcionario,
    f.nome_funcionario AS nome_vendedor,
    pi.id_pedidoitem,
    pr.id_produto,
    pr.nome_produto,
    pi.quantidade,
    pi.valor,
    (pi.quantidade * pi.valor) AS subtotal
FROM 
    projeto_final2.pedido p
JOIN projeto_final2.cliente c ON p.id_cliente = c.id_cliente
JOIN projeto_final2.pedidoitem pi ON p.id_pedido = pi.id_pedido
JOIN projeto_final2.produto pr ON pi.id_produto = pr.id_produto
JOIN projeto_final2.funcionario f ON p.id_funcionario = f.id_funcionario
WHERE 
    p.id_pedido = 1 OR p.id_pedido = 2;





--Gerar 1 nota fiscal com 2 pedidos

SELECT 
    p.id_pedido AS pedido_id,
    p.data_pedido,
    c.id_cliente,
    c.nome_completo AS nome_cliente,
    f.id_funcionario,
    f.nome_funcionario AS nome_vendedor,
    pi.id_pedidoitem,
    pr.id_produto,
    pr.nome_produto,
    pi.quantidade,
    pi.valor,
    (pi.quantidade * pi.valor) AS subtotal
FROM 
    projeto_final2.pedido p
JOIN projeto_final2.cliente c ON p.id_cliente = c.id_cliente
JOIN projeto_final2.pedidoitem pi ON p.id_pedido = pi.id_pedido
JOIN projeto_final2.produto pr ON pi.id_produto = pr.id_produto
JOIN projeto_final2.funcionario f ON p.id_funcionario = f.id_funcionario
WHERE 
    pi.id_pedidoitem = 1 OR pi.id_pedidoitem = 2;





