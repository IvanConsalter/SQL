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

insert into aluno
	(nome, email, cpf, telefone, data_nascimento)
values
	('Bernado Soares', 'bernado@bernado.com', '23622673001', '11812812274', '1998-02-23');
    
insert into aluno
	(nome, email, cpf, data_nascimento)
values
	('Laura Neves', 'laura@laura.com', '62715059884', '2000-05-21');
    
select * from aluno;
select nome, email, data_nascimento from aluno;

insert into curso
	(nome, carga_horaria, preco)
values
	('Java POO', 32, 29.90);

insert into curso
	(nome, carga_horaria, preco)
values
	('Angular', 12, 39.90);	
    
select * from curso;
select nome, preco from curso;

insert into professor
	(nome, email, valor_hora)
values
	('Nathan Viana', 'nathan@nathan.com', 14.00);
    
insert into professor
	(nome, email, valor_hora)
values
	('Julia Silva', 'julia@julia.com', 11.50);
    
select * from professor;
select nome, valor_hora from professor;

use escola;

alter table curso
	add column professor_id bigint,
    add constraint fk_professor_id
		foreign key (professor_id)
        references professor(id);
	
select * from curso;
select * from professor;

update curso set professor_id = 1 where id = 1;
update curso set professor_id = 2 where id = 2;

select * from curso;
