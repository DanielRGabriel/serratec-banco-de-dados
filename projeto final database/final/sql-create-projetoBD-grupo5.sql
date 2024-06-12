create schema projeto_final;

-- criação das tabelas

create table projeto_final.endereco (
    id_endereco serial primary key,
    rua varchar(100),
    cidade varchar(100),
    estado varchar(50),
    cep varchar(10)
);

create table projeto_final.cliente (
    id_cliente serial primary key,
    nome_completo varchar(100),
    nome_usuario varchar(50) unique,
    email varchar(100) unique,
    cpf varchar(11) unique,
    data_nascimento date,
	id_endereco integer references projeto_final.endereco (id_endereco)
);
-- drop table projeto_final.cliente;

create table projeto_final.funcionario (
    id_funcionario serial primary key,
    nome_funcionario varchar(100),
    cpf varchar(11) unique
);

-- drop table projeto_final.funcionario;

create table projeto_final.categoria (
    id_categoria serial primary key,
    nome_categoria varchar(100),
    descricao_categoria text
);

create table projeto_final.produto (
    id_produto serial primary key,
    nome_produto varchar(100),
    descricao_produto text,
    quantidade_estoque int,
    data_fabricacao date,
    valor_unitario numeric(10,2),
    id_categoria int references projeto_final.categoria(id_categoria)
);

create table projeto_final.pedido (
    id_pedido serial primary key,
    id_cliente int references projeto_final.cliente(id_cliente),
    data_pedido date,
    id_funcionario int references projeto_final.funcionario(id_funcionario)
);

create table projeto_final.pedidoitem (
    id_pedidoitem serial primary key,
    id_pedido int references projeto_final.pedido(id_pedido),
    id_produto int references projeto_final.produto(id_produto),
    quantidade int,
    valor numeric(10,2)
);