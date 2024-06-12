--consultas

--consulta com junção entre as tabelas pedido e cliente para obter o nome completo do cliente de cada pedido:
select p.numero as numero_pedido, c.nome_completo as nome_cliente
from projeto_final.pedido p
join projeto_final.cliente c on p.cliente_codigo = c.codigo

/*consulta com junção entre as tabelas pedidoitem, produto e pedido para obter os detalhes dos itens de pedido,
incluindo o nome do produto*/
select pi.id, pr.nome as nome_produto, pi.quantidade, pi.valor_unitario
from projeto_final.pedidoitem pi
join projeto_final.produto pr on pi.produto_codigo = pr.codigo
join projeto_final.pedido pe on pi.pedido_numero = pe.numero;

--consulta usando COUNT() e GROUP BY

--consulta para contar o número de pedidos por cliente
select cliente_codigo, count(*) as total_pedidos
from projeto_final.pedido
group by cliente_codigo;

--consulta para obter todos os clientes que fizeram pedidos
select distinct c.*
from projeto_final.cliente c
join projeto_final.pedido p on c.codigo = p.cliente_codigo;

--consulta para listar todos os produtos com quantidade em estoque menor que 100
select *
from projeto_final.produto
where quantidade_estoque < 100;



