/* 
Laboratório de Banco de Dados	Prof. André Luiz Romeiro Santos	- Correção Prova 1
Ariel Simao de Oliveira - RA: 1511043	ADS Manha - FATEC Arthur de Azevedo
*/
use listaview
drop database ProvaAriel
 
/*Cria Banco de Dados */
create database ProvaAriel;

/*Usando Banco de Dados */
use ProvaAriel;

/*Cria Tabela Pais*/
create table Pais(
idPais integer primary key,
nomePais varchar(30)
);

/*Cria Tabela Estado */
create table Estado(
idEstado integer primary key,
nomeEstado varchar(30),
ufEstado varchar(2),
idPais integer foreign key references Pais(idPais)
);

/*Cria Tabela Cidade */
create table Cidade(
idCidade integer primary key,
nomeCidade varchar (30),
numeroHabitantes integer,
contadorEstado integer,
idEstado integer foreign key references Estado(idEstado)
);

drop table Cidade
/*Insere Dados Na Tabela Pais - idPais , nomePais*/
insert into Pais values (1,'EUA');
insert into Pais values (2,'Argentina');
insert into Pais values (3,'Brasil');
insert into Pais values (4,'Canada');
insert into Pais values (5,'Japao');

/*Insere Dados Na Tabela Estado - idEstado , nomeEstado, ufEstado, idPais*/
insert into Estado values (1,'Sao Paulo', 'SP', 3);
insert into Estado values (2,'Rio De Janeiro', 'RJ', 3);
insert into Estado values (3,'Minas Gerais', 'MG', 3);
insert into Estado values (4,'Florida', 'FL', 1);
insert into Estado values (5,'Illinois', 'IL', 1);
insert into Estado values (6,'Cidade do Mexico', 'CM', null);
insert into Estado values (7,null, 'JP', 5);
insert into Estado values (8,'Amazonas', 'AM', 3);
insert into Estado values (9,'Mato Groso', 'MG', 3);
insert into Estado values (10,'Mato Groso do Sul', 'MS', 3);
insert into Estado values (11,'Tocantins', 'TO', 3);
insert into Estado values (12,'Distrito Federal', 'DF', 3);
insert into Estado values (13,'Bahia', 'BA', 3);
insert into Estado values (14,'Ceara', 'CE', 3);
insert into Estado values (15,'Santa Catarina', 'SC', 3);
insert into Estado values (16,'Parana', 'PR', 3);
insert into Estado values (17,'Rio Grande do Norte', 'RN', 3);
insert into Estado values (18,'Acre', 'AC', 3);

/*Insere Dados Na Tabela Cidade - idCidade , nomeCidade, numeroHabitantes, contador, idEstado*/
insert into Cidade values (1,'Mogi Mirim', 91480, 0, 1);
insert into Cidade values (2,'Mogi Guacu', 146000, 0, 1);
insert into Cidade values (3,'Miami', 430330, 0, 4);
insert into Cidade values (4,'Chicago', 2700000, 0, 5);
insert into Cidade values (5,'Cancun', 630300, 0, 6);
insert into Cidade values (6,'Toronto', 2800000, 0, null);
insert into Cidade values (7,'Itu', 999999990, 0,6);


/* 1 Crie uma view que mostre o estado com mais numero de habitante e selecione mostrando o resultado*/
go
create view vw_Ex1 as 
select top 1 Estado.nomeEstado, sum(numeroHabitantes) 'Maximo Habitantes'
from Cidade 
join Estado 
on Estado.idEstado = Cidade.idEstado
group by Estado.nomeEstado
order by 'Maximo Habitantes' desc;
go
select * from vw_Ex1;

/*2 Cire uma view que mostre todas as cidades e todos os estados independente do relacionamento entre estado e cidades, selecione mostrando o resultado*/
go
create view vw_Ex2 as ( 
select c.nomeCidade, e.nomeEstado
from Cidade c
full join Estado e
on c.idEstado=e.idEstado );
go
select * from vw_Ex2;

/*3 Respeitando a integridade referencial do banco de dados,cire uma trigger que exclua a cidade e os estados que estao relacionado com o pais para que o pais posso ser apagado diretamente sem que seja necessario apagar o estado e a cidade antes */
go
create trigger tg_Ex3
on Pais instead of delete as begin
Declare @idPais int;
select @idPais = idPais from deleted;
delete from Cidade where idEstado in (select idEstado from Estado where idPais = @idPais)
delete from Estado where idPais in (select idPais from deleted)
delete from Pais where idPais in (select idPais from deleted)
end;
delete from Pais where idPais = 1;
go

drop table Cidade
/*4 Crie uma trigger auto incremento na inclusao para o campo ContadorEstado na tabela Cidade de acordo com o estado*/
create trigger tg_Ex4 on Cidade after insert as
begin
declare @incremento int, @idEstado int
select @idEstado = idEstado from inserted;
select @incremento = max(contadorEstado) from Cidade  
where idEstado = @idEstado
if @incremento > 0
set @incremento = @incremento + 1
else
set @incremento = 1
update Cidade
set contadorEstado = @incremento
where idCidade = (select idCidade from inserted)
end

select * from Cidade

insert into Cidade values (17,'Estiva', 999999990, 0, 4);


drop trigger tg_Ex4 


/*5 Cire uma view que usa o ex2 para mostrar apenas os estados que nao possuem cidades cadastradas e selecionen apenas os 10 primeiros registros. obs: caso nao tenha feito o ex2 use uma view hipotetica camadade VW_EXERCICIO2. A view VW_EXERCICIO2 tem como resultado todas as cidades e todos os estados independente do relacionamento */
go
create view vw_Ex5 as ( 
select top 10 nomeEstado
from vw_Ex2
where nomeCidade is null );
go
select * from vw_Ex5;

/*6 Alternativa Correta: ( C )*/
