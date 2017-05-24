
use Lista_DDL_DML


create table Cidade (
IDCidaade int primary key,
IDEstado int foreign key references Estado(IDEstado),
nomeCidade varchar(30)
)

create table Estado(
IDEstado int primary key,
IDPais int foreign key references Pais(IDPais),
nomeEstado varchar(30),
UF varchar(2)
)

create table Pais(
IDPAis int primary key,
nomePais varchar(30)
)

insert into Pais values 
(1, 'Brasil'),
(2, 'EUA'),
(3, 'Canada'),
(4, 'Peru'),
(5, 'Mexico')

select * from Pais

/* 1 Selecione os campos NomeCidade, NomeEstado, NomePais e NomeTime*/
select nomeCidade, nomeEstado, nomePais, nomeTime
from Cidade, Estado, Pais, TIME

/* 2 Selecione os jogadores do país Brasil e mostre o nome do jogador e a idade.*/
select nomeJogador Jogador,
Idade as Idade
From Jogadores, Pais
where nomePais = 'Brasil'

/* 3 Selecione todos os país com ou sem relacionamento e mostre o nome do estado e o
nome do País*/
select nomeEstado, nomePais from Estado E
inner join Pais P
on P.IDPAis =  E.IDPais


/* 4 Selecione todos os país e estados com ou sem relacionamento e mostre o nome da
cidade, nome do estado e o nome do país.*/
select nomeCidade, nomeEstado, nomePais
from Cidade, Estado, Pais

/* 5 Selecione todas as cidades sem times e mostre o nome código da cidade*/

select nomeCidade, IDCidaade
from Cidade, Time
where nomeTime is null 
