show databases;

use sql10347897;

select * from tb_acesso;
select * from tb_cliente;
select * from tb_estoque;
select * from tb_roupa;
select * from tb_venda;
select * from tb_venda_item;

/*1*/
select id_roupa,tp_roupa,ds_tamanho,ds_genero,vl_preco,ds_marca 
from tb_roupa 
where tp_roupa like '%Camiseta%';

/*2*/
select id_roupa,tp_roupa,ds_tamanho,ds_genero,vl_preco,ds_marca
from tb_roupa
where tp_roupa = '%Camiseta%' and ds_genero = 'M';

/*3*/
select tp_roupa,ds_tamanho,ds_genero,ds_marca,qt_disponivel
from tb_roupa r 
inner join tb_estoque e 
on r.id_roupa = e.id_roupa;

/*4*/
select tp_roupa,ds_tamanho,ds_genero,ds_marca,qt_disponivel
from tb_roupa r 
inner join tb_estoque e 
on r.id_roupa = e.id_roupa
where ds_cod_barra like '%3453%';

/*5*/
select tp_roupa,ds_tamanho,ds_genero,ds_marca,qt_disponivel
from tb_roupa r 
inner join tb_estoque e 
on r.id_roupa = e.id_roupa
where tp_roupa like '%Meia%' and dt_ult_atualizacao = '2020-06-10';

/*6*/
select id_venda,nm_cliente,dt_venda,ds_nota_fiscal,ds_forma_pag,nr_parcelas
from tb_venda v
inner join tb_cliente c on c.id_cliente = v.id_cliente
where dt_venda = '2020-06-01';

/*7*/
select id_venda,nm_cliente,dt_venda,ds_nota_fiscal,ds_forma_pag,nr_parcelas
from tb_venda v
inner join tb_cliente c on c.id_cliente = v.id_cliente
where dt_venda = '2020-06-01';

/*8*/
select id_venda,nm_cliente,dt_venda,ds_nota_fiscal,ds_forma_pag,nr_parcelas,nm_usuario
from tb_venda
inner join tb_cliente on tb_venda.id_cliente = tb_cliente.id_cliente
inner join tb_acesso on tb_venda.id_acesso = tb_acesso.id_acesso
where dt_venda = '2020-06-01' and nm_usuario like '%Wiliam%';

/*9*/
select id_venda,nm_cliente,dt_venda,ds_nota_fiscal,ds_forma_pag,nr_parcelas,nm_usuario
from tb_venda v
inner join tb_cliente c on v.id_cliente = c.id_cliente
inner join tb_acesso u on  v.id_acesso = u.id_acesso
where nm_usuario = 'Walter' and dt_venda = '2020-06-09';

/*10*/
select tp_roupa,ds_marca,ds_tamanho,ds_genero,vl_preco
from tb_roupa r
inner join tb_venda_item v on v.id_roupa = r.id_roupa
where id_venda = 1;

/*11*/
select nm_cliente,dt_venda,tp_roupa,ds_marca,ds_tamanho,ds_genero,vl_preco
from tb_venda v
inner join tb_cliente c on c.id_cliente = v.id_cliente
inner join tb_venda_item vi on v.id_venda = vi.id_venda_item
inner join tb_roupa r on r.id_roupa = vi.id_roupa
where nm_cliente like '%Ana%' and  ds_marca like '%Adidas%';

/*12*/
select nm_cliente,dt_venda,ds_nota_fiscal, sum(qt_items), sum(vl_preco)
from tb_venda_item vi
inner join tb_venda v on v.id_venda = vi.id_venda
inner join tb_cliente c on c.id_cliente = v.id_cliente
inner join tb_roupa r on r.id_roupa = vi.id_roupa
where dt_venda = '2020-06-01'
group by nm_cliente,dt_venda,ds_nota_fiscal;

/*13*/
select tp_roupa, sum(qt_items)
from tb_venda_item vi
inner join tb_roupa r on vi.id_roupa = r.id_roupa
inner join tb_venda v on v.id_venda = vi.id_venda
where dt_venda = '2020-06-01'
group by tp_roupa;