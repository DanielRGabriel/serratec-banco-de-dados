--inserts


insert into projeto_final.cliente (nome_completo, nome_usuario, email, cpf, data_nascimento)
values
  ('João Silva', 'joaosilva', 'joao@example.com', '123.456.789-00', '1990-05-15'),
  ('Maria Santos', 'mariasantos', 'maria@example.com', '987.654.321-00', '1985-10-20'),
  ('Pedro Oliveira', 'pedroliveira', 'pedro@example.com', '456.789.123-00', '1998-03-25'),
  ('Ana Souza', 'anasouza', 'ana@example.com', '321.654.987-00', '1976-07-12'),
  ('Lucas Costa', 'lucascosta', 'lucas@example.com', '654.321.987-00', '2000-09-30');

insert into projeto_final.endereco (cliente_codigo, rua, cidade, estado, cep)
values
  (1, 'Rua das Flores', 'São Paulo', 'SP', '01234-567'),
  (2, 'Avenida Principal', 'Rio de Janeiro', 'RJ', '12345-678'),
  (3, 'Rua dos Girassóis', 'Belo Horizonte', 'MG', '23456-789'),
  (4, 'Rua Central', 'Brasília', 'DF', '34567-890'),
  (5, 'Rua das Acácias', 'Curitiba', 'PR', '45678-901');
  
insert into projeto_final.funcionario (nome, cpf)
values
  ('Carlos Silva', '111.222.333-00'),
  ('Fernanda Oliveira', '444.555.666-00'),
  ('Rafael Santos', '777.888.999-00'),
  ('Juliana Costa', '000.999.888-77'),
  ('Mariana Almeida', '222.333.444-00');
  
insert into projeto_final.pedido (cliente_codigo, data_pedido, funcionario_codigo)
values
  (1, '2024-03-22', 1),
  (2, '2024-03-23', 2),
  (3, '2024-03-24', 3),
  (4, '2024-03-25', 4),
  (5, '2024-03-26', 5);

insert into projeto_final.categoria (nome, descricao)
values
  ('Eletrônicos', 'Produtos eletrônicos diversos'),
  ('Roupas', 'Artigos de vestuário'),
  ('Alimentos', 'Produtos alimentícios'),
  ('Livros', 'Livros de diversas categorias'),
  ('Cosméticos', 'Produtos de beleza e cuidados pessoais');

insert into projeto_final.produto (nome, descricao, quantidade_estoque, data_fabricacao, valor_unitario, categoria_codigo)
values
  ('Smartphone', 'Telefone inteligente', 100, '2023-01-10', 1500.00, 1),
  ('Camiseta', 'Camiseta de algodão', 200, '2023-02-15', 30.00, 2),
  ('Arroz', 'Arroz tipo 1', 500, '2023-03-20', 5.50, 3),
  ('Harry Potter', 'Livro do Harry Potter', 150, '2023-04-25', 45.00, 4),
  ('Protetor Solar', 'Protetor solar FPS 50', 80, '2023-05-30', 25.00, 5);
  
insert into projeto_final.pedidoitem (pedido_numero, produto_codigo, quantidade, valor_unitario)
values
  (1, 1, 2, 1500.00),
  (1, 2, 3, 30.00),
  (2, 3, 1, 5.50),
  (2, 4, 2, 45.00),
  (3, 5, 1, 25.00);
  




