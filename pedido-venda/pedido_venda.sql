select current_user();

create database pedido_venda;

use pedido_venda;

create table cliente (
	id bigint not null primary key auto_increment,
    nome varchar(100) not null,
    email varchar(50) not null,
    data_nascimento date not null
) engine=InnoDB;

create table pedido(
	id bigint not null primary key auto_increment,
    data_criacao datetime not null,
    observacao text,
    data_entrega date not null,
    valor_frete decimal(6,2) not null,
    valor_total decimal(10,2) not null
) engine=InnoDB;

insert into cliente
	(nome, email, data_nascimento)
values
	('Maria da Silva', 'maria@maria.com', '1978-08-11');
    
insert into cliente
	(nome, email, data_nascimento)
values
	('José Bernades', 'jose@jose.com', '1982-02-18');
    
insert into cliente
	(nome, email, data_nascimento)
values
	('Roberta de Fátima', 'roberta@roberta.com', '1984-06-06');
    
select * from cliente;
select nome, email from cliente;    

insert into pedido
	(data_criacao, observacao, data_entrega, valor_frete, valor_total)
values
	('2022-12-22 12:00:00', 'Perto do Mercado da Alva', '2022-12-24', 15.00, 45.00);

insert into pedido
	(data_criacao, data_entrega, valor_frete, valor_total)
values
	('2022-12-15 12:00:00', '2023-01-02', 32.00, 145.00);
    
insert into pedido
	(data_criacao, data_entrega, valor_frete, valor_total)
values
	('2022-12-02 15:42:00', '2022-12-27', 12.00, 85.00);
    
select * from pedido;
select valor_frete, valor_total from pedido;

alter table pedido
	add column cliente_id bigint,
    add constraint fk_cliente_id
		foreign key (cliente_id)
        references cliente(id);
        
select * from cliente;
        
update pedido set cliente_id = 1 where id = 1;
update pedido set cliente_id = 1 where id = 2;
update pedido set cliente_id = 2 where id = 3;

select * from pedido;

use pedido_venda;

create table produto(
	id bigint not null primary key auto_increment,
    nome varchar(255) not null,
    valor_unitario decimal(10,2) not null,
    quantidade_estoque integer not null
) engine=InnoDB;

create table item_pedido(
	pedido_id bigint not null,
    produto_id bigint not null,
	quantidade integer not null,
    primary key(pedido_id, produto_id),
    foreign key(pedido_id)
		references pedido(id),
	foreign key(produto_id)
		references produto(id)
) engine=InnoDB;

insert into produto
	(nome, valor_unitario, quantidade_estoque)
values
	('Coca Cola', 7.5, 30);
    
insert into produto
	(nome, valor_unitario, quantidade_estoque)
values
	('Biz', 5.5, 50);
    
select * from produto;

insert into item_pedido
	(pedido_id, produto_id, quantidade)
values
	(2, 1, 2);

insert into item_pedido
	(pedido_id, produto_id, quantidade)
values
	(2, 2, 4);
    
insert into item_pedido
	(pedido_id, produto_id, quantidade)
values
	(3, 1, 6);
    
select * from item_pedido;

use pedido_venda;

insert into produto
	(nome, valor_unitario, quantidade_estoque)
values
	('Papel A4', 12.00, 100);
    
insert into pedido
	(data_criacao, data_entrega, valor_frete, valor_total, cliente_id)
values
	('2022-07-11 15:11:00', '2022-07-15', 33.00, 400.00, 2); 
    
insert into item_pedido
	(pedido_id, produto_id, quantidade)
values
	(4, 1, 4);

insert into item_pedido
	(pedido_id, produto_id, quantidade)
values
	(4, 2, 2);


select p.*
	from pedido p
    , cliente c
    where p.cliente_id = c.id
    and c.nome = 'Maria da Silva';
    
select pr.nome
	, it.quantidade
	from cliente cl
    , pedido pe
	, item_pedido it
    , produto pr
    where cl.id = pe.cliente_id
    and pe.id = it.pedido_id
    and it.produto_id = pr.id
    and cl.nome = 'Maria da Silva';
    
use pedido_venda;

alter table pedido
	add column forma_pagamento varchar(50) not null;
    
alter table pedido 
	add column status varchar(50) not null default 'ORCAMENTO';
    
insert into pedido 
	(data_criacao, data_entrega, valor_frete, valor_total, cliente_id, forma_pagamento)
values
	(now(), '2022-12-30', 10.00, 56.99, 1, 'CREDITO');
    
insert into pedido 
	(data_criacao, data_entrega, valor_frete, valor_total, cliente_id, forma_pagamento, status)
values
	(now(), '2022-05-01', 18.00, 156.99, 1, 'PIX', 'CANCELADO');
    
select * from pedido;

explain select * from cliente;
explain select * from cliente
	where nome = 'Maria da Silva';
    
alter table cliente
	add index index_nome(nome);

explain select * from cliente
	where nome = 'Maria da Silva';
    
select * from pedido
	where status = 'CANCELADO';

delete from pedido
	where id = 6;
    
select * from pedido;

update pedido
	set status = 'APROVADO'
    where id = 5;

update pedido
	set forma_pagamento = 'DEBITO'
    where id = 4;
		
select * from pedido;

select avg(valor_total) as 'Valor Total'
	from pedido;

select 
	avg(valor_total) as 'Valor Total',
    avg(valor_frete) as 'Valor Total Frete'
    from pedido;
    
update pedido
	set status = 'PAGO'
	where id = 1;
    
select status,
	avg(valor_total) as 'Valor Total'
	from pedido
    group by status;
    
update pedido
	set data_criacao = '2022-12-22 18:00:00'
 where id = 4;

select date(data_criacao) as 'Data Criação',
	avg(valor_total) as 'Valor Total'
	from pedido
    group by date(data_criacao);
    
use pedido_venda;
select * from pedido;

select * from pedido
	order by valor_total;
    
select * from pedido
	order by valor_total desc;
    
select * from pedido
	order by data_criacao;

insert into cliente
	(nome, email, data_nascimento)
values
	('José da Silva', 'josesilva@gmail.com', '1988-09-10');
    
insert into cliente
	(nome, email, data_nascimento)
values
	('João Cascavel', 'joao@gmail.com', '1985-10-20');

select * from cliente
	where nome like '%J%';
    
select * from cliente
	where nome like '%jos%';
    
select * from cliente
	where nome like '%joa%';