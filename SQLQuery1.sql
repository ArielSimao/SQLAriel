/* Laboratorio de Banco de Dados Aula 09/02/2017*/

create database aula1


use aula1

select * from aula1

create table Estado(
uf varchar(2),
nomeEstado varchar(30),
IDEstado integer primary key,
IDPais integer
) 



create table Pais(
IDPais integer primary key,
nomePais varchar(30)
)


create table Cidade(
IDCidade integer primary key,
numHabitantes integer,
contadorEstado integer,
nomeCidade varchar(30),
IDEstado integer,
 FOREIGN key (IDEstado)
 references Estado (IDEstado)
)

Alter table Estado add foreing key (IDPais)
references Pais (IDPais) 

/* Laboratorio de Banco de Dados Aula 16/02/2017*/