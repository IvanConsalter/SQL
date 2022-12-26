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

use escola;

create table matricula(
	aluno_id bigint not null,
    curso_id bigint not null,
    data_matricula date not null
) engine=InnoDB;

select * from aluno;
select * from curso;

insert into matricula
	(aluno_id, curso_id, data_matricula)
values
	(1, 1, '2022-12-22');
    
insert into matricula
	(aluno_id, curso_id, data_matricula)
values
	(1, 2, '2022-12-30');
    
insert into matricula
	(aluno_id, curso_id, data_matricula)
values
	(2, 2, '2022-12-17');
    
select * from matricula;

use escola;

select c.nome
	from curso c
    , aluno al
    , matricula ma
    where ma.aluno_id = al.id
    and ma.curso_id = c.id
    and al.nome = 'Bernado Soares';
    
select al.nome as 'Nome Aluno'
	, c.nome as 'Nome Curso'
    , ma.data_matricula as 'Data Matricula'
	from aluno al
    , curso c
    , matricula ma
    where ma.aluno_id = al.id
    and ma.curso_id = c.id
    and ma.data_matricula < '2022-12-30';
    
use escola;

insert into curso
	(nome, requisito, carga_horaria, preco)
values
	('PHP', 'Lógica de Progrmação', 22, 22.90);
    
insert into curso
	(nome, carga_horaria, preco)
values
	('HTML/CSS', 44, 24.90);

select * from curso;

select sum(preco) as 'Total de preços dos cursos' from curso;
select avg(preco) as 'Média de preços dos cursos' from curso;

use escola;

insert into aluno
	(nome, email, cpf, telefone, data_nascimento)
values
	('Calebe Vinicius Fábio Brito', 'cleber@gmail.com', '53917519267', '95991162614', '1993-07-10');

insert into aluno
	(nome, email, cpf, telefone, data_nascimento)
values
	('Evelyn Daniela Rita Almeida', 'evelyn@gmail.com', '51624906109', '61991786378', '1992-06-01');

select * from aluno;
select * from matricula;

select nome, email, cpf
	from aluno
    where id in (select aluno_id from matricula);
    
select nome, email, data_nascimento
	from aluno
	where id in (
		select aluno_id from matricula 
		where data_matricula > '2022-12-17'
    );

    
