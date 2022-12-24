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





