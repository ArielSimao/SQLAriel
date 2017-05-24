/* 1
	DDL: Data Definition Language - Cria Os Objetos -  CREATE, ALTER, DROP.
	DML: Data Manipulation Language - Manipula os Objetos - INSERT, UPDATE, DELETE, SELECT.*/
create database Lista_DDL_DML
use Lista_DDL_DML
/* 3 */
create table TIME (
IDTime integer primary key,
nomeTime varchar(30))
create table Jogadores (
IDJogadores integer primary key,
nomeJogador varchar(30),
Idade integer,
IDTime integer)
alter table Jogadores
add constraint fk_ISTime foreign key (IDTime)
references Time (IDTime);
/* 4 */
alter table Jogadores
add apelidoJogador VARCHAR(20) NULL;
select * from Jogadores
select * from Time
/* 5 */
insert into Time (IDTime,nomeTime) VALUES(1,'Guacuano');
insert into Time (IDTime,nomeTime) VALUES(2,'Brazil');
insert into Time (IDTime,nomeTime) VALUES(3,'EUA');
insert into Time (IDTime,nomeTime) VALUES(4,'Corinthians');
insert into Time (IDTime,nomeTime) VALUES(5,'Mogi Mirim')
select * from Time
select * from Jogadores

insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(001,'José',23,1);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(002,'João',21,1);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(003,'Josias',25,1);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(004,'Jaime',26,1);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(005,'Josmar',19,1);

insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(006,'Vagner',25,2);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(007,'Valdir',23,2);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(008,'Vanderlei',29,2);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(009,'Valdemar',36,2);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(010,'Valmir',21,2);

insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(011,'Silvio',25,3);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(012,'Sergio',23,3);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(013,'Solano',29,3);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(014,'Saulo',36,3);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(015,'Soares',21,3);

insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(016,'Carlos',21,4);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(017,'Camargo',28,4);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(018,'Claudio',20,4);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(019,'Cesar',32,4);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(020,'Claudemir',31,4);

insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(021,'Daniel',25,5);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(022,'Diogo',23,5);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(023,'Decio',29,5);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(024,'Dilmar',36,5);
insert into Jogadores (IDJogadores,nomeJogador,Idade,IDTime) VALUES(025,'Deoclecio',21,5);

/* 6 */
UPDATE Time set IDTime=2,nomeTime='Mogi Mirim Futebol Clube' where IDTime=2
select * from time
select * from Jogadores
/* 7 */
DELETE FROM Jogadores where IDTime=2
/* 8 */
select IDJogadores "Codigo",
nomeJogador Jogador,
Idade as Idade
From Jogadores
/* 9 */
alter table Jogadores drop column apelidoJogador;
/* 10 */
Drop table Jogadores
Drop table Time