create database escola;

use escola;

create table aluno(
	id bigint not null primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    cpf char(11) not null,
    telefone char(14),
    data_nascimento date not null
) engine=InnoDB;

create table curso(
	id bigint not null primary key auto_increment,
    nome varchar(100) not null,
    requisito varchar(255),
    carga_horaria int not null,
    preco decimal(10,2)
) engine=InnoDB;

create table professor(
	id bigint not null primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    valor_hora decimal(10,2) not null,
    certificados varchar(255)
) engine=InnoDB;