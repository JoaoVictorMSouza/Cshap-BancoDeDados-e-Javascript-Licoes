drop database loja_roupa;

create database loja_roupa;

use loja_roupa;

create table tb_vendedor (
	id_vendedor int primary key auto_increment,
    nm_vendedor varchar(45),
    ds_celular varchar(20),
    ds_cpf varchar(20),
    nr_codigo_vendedor varchar(15),
    ds_email varchar(100),
    ds_senha varchar(25),
    bt_gerente boolean,
    ds_usuario varchar(45)
);

create table tb_cliente (
	id_cliente int primary key auto_increment,
    nm_cliente varchar(45),
    ds_cpf varchar(20),
    ds_endereco varchar(150),
    ds_complemento varchar(100),
    ds_email varchar(100),
    ds_celular varchar(20)
);

create table tb_roupa (
	id_roupa int primary key auto_increment,
    ds_marca varchar(45),
    ds_modelo varchar(45),
    ds_genero varchar(45),
    ds_tamanho varchar(20),
    ds_codigo_barra varchar(150),
    ds_cor varchar(45),
    vl_preco decimal(20,2),
    tp_roupa varchar(45)
);

create table tb_estoque (
	id_estoque int primary key auto_increment,
    nr_quantidade int,
    bt_disponivel boolean,
    id_roupa int,
    foreign key (id_roupa) references tb_roupa (id_roupa)
);

create table tb_pedido (
	id_pedido int primary key auto_increment,
    vl_total decimal(20,2),
    ds_pagamento varchar(45),
    ds_nota_fiscal varchar(150),
    ds_codigo_desconto varchar(20),
    id_vendedor int,
    id_cliente int,
    foreign key (id_vendedor) references tb_vendedor (id_vendedor),
    foreign key (id_cliente) references tb_cliente (id_cliente)
);

create table tb_roupa_pedido (
	id_roupa_pedido int primary key auto_increment,
    nr_quantidade int,
    id_roupa int,
    id_pedido int,
    foreign key (id_roupa) references tb_roupa (id_roupa),
    foreign key (id_pedido) references tb_pedido (id_pedido)
);

create table tb_roupa_devolvida (
	id_roupa_devolvida int primary key auto_increment,
    ds_codigo_barra varchar(150),
    ds_defeito varchar(200),
    ds_tamanho varchar(20),
    id_roupa_pedido int,
    id_estoque int,
    id_cliente int,
    foreign key (id_roupa_pedido) references tb_roupa_pedido (id_roupa_pedido),
    foreign key (id_estoque) references tb_estoque (id_estoque),
    foreign key (id_cliente) references tb_cliente (id_cliente)
);


insert into tb_vendedor(nm_vendedor, ds_celular, ds_cpf, nr_codigo_vendedor, ds_email, ds_senha, bt_gerente, ds_usuario)
	 values ("Joao", "11 96516-1310", "45761725/54", "3CAM15A100", "joaovendedor@gmail.com", "123#@eu", true, "Caua Dos Santos");

insert into tb_vendedor(nm_vendedor, ds_celular, ds_cpf, nr_codigo_vendedor, ds_email, ds_senha, bt_gerente, ds_usuario)
	 values ("Matheus", "21 91564-5965", "546847684/78", "4TEN15400", "matheusvendedor@gmail.com", "djsa1@3", true, "Daniel Silva");

insert into tb_vendedor(nm_vendedor, ds_celular, ds_cpf, nr_codigo_vendedor, ds_email, ds_senha, bt_gerente, ds_usuario)
	 values ("Pedro", "11 94667-4647", "546748676/58", "1B0L5A50", "pedrovendedor@gmail.com", "hbedg*&¨", false, "Maria Eduarda");
     
insert into tb_vendedor(nm_vendedor, ds_celular, ds_cpf, nr_codigo_vendedor, ds_email, ds_senha, bt_gerente, ds_usuario)
	 values ("Samuel", "21 95264-9874", "456864713/89", "2CALCA100", "samuelvendedor@gmail.com", "jnotkk238*¨$", true, "Jonatas Ferrera");
     
insert into tb_vendedor(nm_vendedor, ds_celular, ds_cpf, nr_codigo_vendedor, ds_email, ds_senha, bt_gerente, ds_usuario)
	 values ("Kaua", "11 95146-0000", "54654864314/12", "4M0LET0M200", "kauavendedor@gmail.com", "grewo96540!@#", false, "Vanessa Pereira");
     
     
     
     
     
     
insert into tb_roupa(ds_marca, ds_modelo, ds_genero, ds_tamanho, ds_codigo_barra, ds_cor, vl_preco, tp_roupa) values ("Lacoste", "Polo", "Masculino", "G", "0 092120 120119", "Branca", 370.00, "Camiseta");

insert into tb_roupa(ds_marca, ds_modelo, ds_genero, ds_tamanho, ds_codigo_barra, ds_cor, vl_preco, tp_roupa) values ("Nike", "Air VaporMaxPLUS", "Feminino", "38", "1 546120 177019", "Preto", 900.00, "Tenis");

insert into tb_roupa(ds_marca, ds_modelo, ds_genero, ds_tamanho, ds_codigo_barra, ds_cor, vl_preco, tp_roupa) values ("Oakley", "Flack Jack", "Masculino", "40", "9 326126 527119", "Bege", 550.00, "Bota");

insert into tb_roupa(ds_marca, ds_modelo, ds_genero, ds_tamanho, ds_codigo_barra, ds_cor, vl_preco, tp_roupa) values ("Oakley", "Tincan", "Masculino", "XL", "5 020120 153139", "Vermelho", 220.00, "Bone");

insert into tb_roupa(ds_marca, ds_modelo, ds_genero, ds_tamanho, ds_codigo_barra, ds_cor, vl_preco, tp_roupa) values ("Nike", "Tekno MK2", "Feminino", "37", "4 278920 123579", "Branco e bege", 500.00, "Tenis");





insert into tb_estoque (nr_quantidade, bt_disponivel, id_roupa) values (89, true, 3);     
     
insert into tb_estoque (nr_quantidade, bt_disponivel, id_roupa)values (7, true, 1);
     
insert into tb_estoque (nr_quantidade, bt_disponivel, id_roupa)values (42, true, 5);  
     
insert into tb_estoque (nr_quantidade, bt_disponivel, id_roupa)values (0, false, 2);
     
insert into tb_estoque (nr_quantidade, bt_disponivel, id_roupa) values (92, true, 4);





insert into tb_cliente(nm_cliente, ds_cpf, ds_endereco, ds_complemento, ds_email, ds_celular) values ("João", "749.286.230-02", "Rua Augusta", "169", "joaozinho@gmail.com", "(11) 91232-4576");

insert into tb_cliente(nm_cliente, ds_cpf, ds_endereco, ds_complemento, ds_email, ds_celular) values ("Matheus", "866.231.550-07", "Rua Pelagia Starbulov", "1020", "matheusgatinho@hotmail.com", "(11) 99756-7622");

insert into tb_cliente(nm_cliente, ds_cpf, ds_endereco, ds_complemento, ds_email, ds_celular) values ("Kauã", "745.327.680-21", "Avenida Paulista", "157", "damata@gmail.com", "(11) 91533-5523");

insert into tb_cliente(nm_cliente, ds_cpf, ds_endereco, ds_complemento, ds_email, ds_celular) values ("Pedro", "638.689.910-50", "Rua Expediente João Goulart", "153", "pedroga@gmail.com", "(11) 99019-0573");

insert into tb_cliente(nm_cliente, ds_cpf, ds_endereco, ds_complemento, ds_email, ds_celular) values ("Samuel", "238.980.600-71", "Rua Condominio Doidera", "1057", "djsamuk@outlook.com", "(11) 92003-2303");






insert into tb_pedido(id_cliente,id_vendedor,vl_total,ds_pagamento,ds_nota_fiscal, ds_codigo_desconto) values (5,1,120.99,'Dinheiro','1560160 1289408940 8408909','10jjoao');

insert into tb_pedido(id_cliente,id_vendedor,vl_total,ds_pagamento,ds_nota_fiscal, ds_codigo_desconto) values (3,2,430.60,'Debito','546854890 8904894006 05095206', null);

insert into tb_pedido(id_cliente,id_vendedor,vl_total,ds_pagamento,ds_nota_fiscal, ds_codigo_desconto) values (1,5,1437.32,'Cartão','654598405 84098409804 8409840','15kaua');

insert into tb_pedido(id_cliente,id_vendedor,vl_total,ds_pagamento,ds_nota_fiscal, ds_codigo_desconto) values (2,3,520.60,'Debito','15615610 80940890 894894089','20p');

insert into tb_pedido(id_cliente,id_vendedor,vl_total,ds_pagamento,ds_nota_fiscal, ds_codigo_desconto) values (4,4,352.30,'Dinheiro','2564016189 8408940894 409409489','15samuel');




insert into tb_roupa_pedido(nr_quantidade,id_roupa,	id_pedido) values (2,5,1);
insert into tb_roupa_pedido(nr_quantidade,id_roupa,	id_pedido) values (3,2,2);
insert into tb_roupa_pedido(nr_quantidade,id_roupa,	id_pedido) values (4,1,3);
insert into tb_roupa_pedido(nr_quantidade,id_roupa,	id_pedido) values (1,4,4);
insert into tb_roupa_pedido(nr_quantidade,id_roupa,	id_pedido) values (5,3,5);





insert into tb_roupa_devolvida (ds_codigo_barra, ds_defeito, ds_tamanho, id_roupa_pedido, id_estoque, id_cliente)
     values ("000000000000-000000000000-000000000000-000000000000", "Descolou", "37", 5, 2, 1);

insert into tb_roupa_devolvida (ds_codigo_barra, ds_defeito, ds_tamanho, id_roupa_pedido, id_estoque, id_cliente)
     values ("000000000000-000000000000-000000000000-000000000000", "Venho resgada", "M", 3, 1, 4);

insert into tb_roupa_devolvida (ds_codigo_barra, ds_defeito, ds_tamanho, id_roupa_pedido, id_estoque, id_cliente)
     values ("000000000000-000000000000-000000000000-000000000000", "Descosturou", "44", 4, 3, 5);

insert into tb_roupa_devolvida (ds_codigo_barra, ds_defeito, ds_tamanho, id_roupa_pedido, id_estoque, id_cliente)
     values ("000000000000-000000000000-000000000000-000000000000", "Cor Errada", "GG", 2, 5, 3);

insert into tb_roupa_devolvida (ds_codigo_barra, ds_defeito, ds_tamanho, id_roupa_pedido, id_estoque, id_cliente)
     values ("000000000000-000000000000-000000000000-000000000000", "Manchada", "P", 1, 4, 2);



select * from tb_pedido inner join tb_vendedor on tb_pedido.id_vendedor = tb_vendedor.id_vendedor;

select * from tb_pedido inner join tb_cliente on tb_pedido.id_cliente = tb_cliente.id_cliente;

select * from tb_pedido inner join tb_vendedor on tb_pedido.id_vendedor = tb_vendedor.id_vendedor join tb_cliente on tb_pedido.id_cliente = tb_cliente.id_cliente;

select * from tb_estoque inner join tb_roupa on tb_estoque.id_roupa = tb_roupa.id_roupa;

select * from tb_roupa_pedido inner join tb_pedido on tb_roupa_pedido.id_pedido = tb_pedido.id_pedido;

select * from tb_roupa_pedido inner join tb_roupa on tb_roupa_pedido.id_roupa = tb_roupa.id_roupa;

select * from tb_roupa_pedido inner join tb_roupa on tb_roupa_pedido.id_roupa = tb_roupa.id_roupa join tb_pedido on tb_roupa_pedido.id_pedido = tb_pedido.id_pedido join tb_cliente on tb_pedido.id_cliente = tb_cliente.id_cliente;

	select *
	  from tb_roupa_devolvida
inner join tb_roupa_pedido
        on tb_roupa_pedido.id_roupa_pedido = tb_roupa_devolvida.id_roupa_pedido
inner join tb_estoque
        on tb_estoque.id_estoque = tb_roupa_devolvida.id_estoque
inner join tb_cliente
        on tb_cliente.id_cliente = tb_roupa_devolvida.id_cliente;