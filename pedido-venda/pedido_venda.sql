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


