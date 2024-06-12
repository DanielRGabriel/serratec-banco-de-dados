-- select * from projeto_final.cliente;
-- select * from projeto_final.endereco;
-- select * from projeto_final.categoria;
-- select * from projeto_final.pedido;
-- select * from projeto_final.produto;
-- select * from projeto_final.pedidoitem;
-- select * from projeto_final.funcionario;


--consultas 

--consulta com junção entre as tabelas pedido e cliente para obter o nome completo do cliente de cada pedido:
select p.id_pedido as numero_pedido, c.nome_completo as nome_cliente
from projeto_final.pedido as p
join projeto_final.cliente as c on p.id_cliente = c.id_cliente

/*consulta com junção entre as tabelas pedidoitem, produto e pedido para obter os detalhes dos itens de pedido,
incluindo o nome do produto*/
select pi.id_pedidoitem, pr.nome_produto as nome_produto, pi.quantidade, pi.valor
from projeto_final.pedidoitem as pi
join projeto_final.produto pr on pi.id_produto = pr.id_produto
join projeto_final.pedido pe on pi.id_pedidoitem = pe.id_pedido;

--consulta usando COUNT() e GROUP BY

--consulta para contar o número de pedidos por cliente
select id_cliente, count(*) as total_pedidos
from projeto_final.pedido
group by id_cliente;

--consulta para obter todos os clientes que fizeram pedidos
select distinct c.*
from projeto_final.cliente c
join projeto_final.pedido p on c.id_cliente = p.id_cliente;

--consulta para listar todos os produtos com quantidade em estoque menor que 100
select *
from projeto_final.produto
where quantidade_estoque < 100;




