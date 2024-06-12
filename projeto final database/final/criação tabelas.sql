--create database grupo5;

--create schema projeto_final;

-- criação das tabelas
create table projeto_final.cliente (
    codigo serial primary key,
    nome_completo varchar(100),
    nome_usuario varchar(50) unique,
    email varchar(100) unique,
    cpf varchar(14) unique,
    data_nascimento date
);

create table projeto_final.endereco (
    id serial primary key,
    cliente_codigo int references projeto_final.cliente(codigo),
    rua varchar(100),
    cidade varchar(100),
    estado varchar(50),
    cep varchar(10)
);

create table projeto_final.funcionario (
    codigo serial primary key,
    nome varchar(100),
    cpf varchar(14) unique
);


create table projeto_final.pedido (
    numero serial primary key,
    cliente_codigo int references projeto_final.cliente(codigo),
    data_pedido date,
    funcionario_codigo int references projeto_final.funcionario(codigo)
);

create table projeto_final.categoria (
    codigo serial primary key,
    nome varchar(100),
    descricao text
);

create table projeto_final.produto (
    codigo serial primary key,
    nome varchar(100),
    descricao text,
    quantidade_estoque int,
    data_fabricacao date,
    valor_unitario numeric(10,2),
    categoria_codigo int references projeto_final.categoria(codigo)
);


create table projeto_final.pedidoitem (
    id serial primary key,
    pedido_numero int references projeto_final.pedido(numero),
    produto_codigo int references projeto_final.produto(codigo),
    quantidade int,
    valor_unitario numeric(10,2)
);




