create database listaView 
use listaView
create table Jogadores(
  idJogador int,
  nomeJogador varchar(20),
  idadeJogadpr int,
  idTime int
  );
create table Time(
  idTime int,
  nomeTime varchar(20),
  primary key (idTime)
  );
alter table Jogadores add foreign key (idTime) references Time(idTime);

insert into Time
values 
(1, 'Ituano'),
(2, 'Paraiba'),
(3, 'Vasco'),
(4, 'Brazil'),
(5, 'Mogi Mirim Futebol'),
(6, 'Guacuano')

insert into Jogadores (idJogador, nomeJogador, idadeJogadpr, idTime)
values 
(1, 'José', 19, 1),
(2, 'Joao', 18,1),
(3, 'Jonatan', 17, 1),
(4,'Jarbas',17,1),
(5,'Julio',18, 1),
(6,'Joeliton', 17, 1),

(7, 'Marzurco', 27, 2),
(8, 'Marcos', 25, 2),
(9, 'Matheus', 25, 2),
(10, 'Marcelo', 21, 2),
(11, 'Macedo', 23, 2),
(12, 'Maques', 29, 2),

(13,'Guilherme', 33, 3),
(14,'Gustavo', 37, 3),
(15,'Guga', 32, 3),
(16,'Gonsalves', 38, 3),
(17,'Gabriel', 33, 3),
(18,'Gaspar', 36, 3),

(19,'Kaka', 42, 4),
(20,'KakaJunior', 49, 4),
(21,'KakaJuniorFilho', 44, 4),
(22,'KakaJuniorNeto', 42, 4),
(23,'KakaJuniorBisNeto', 35, 4),
(24,'KakaJuniorTataraneto', 46, 4),

(25,'Neymar', 55, 5),
(26,'Neto', 51, 5),
(27,'Natan', 58, 5),
(28,'Nascelio', 56, 5),
(29,'Nego', 55, 5),
(30,'Nilo', 53, 5),

(31,'Osmar', 63, 6),
(32,'Oscar', 67, 6),
(33,'Osvaldo', 61, 6),
(34,'Otavio', 63, 6),
(35,'Oseias', 60, 6),
(36,'Oziel', 65, 6)

select * from Jogadores
/*1 – Crie uma view que mostre o nome do time e os nomes dos jogadores e selecione
mostrando o resultado.*/
go
create view vwNomeTimeJogador as
    select T.nomeTime as "nomeTime", J.nomeJogador as "nomeJogador"
    from Time T
    inner join Jogadores J
    on T.idTime = J.idTime
go
select * from vwNomeTimeJogador
/*2 – Crie uma view que mostre o IDTime e IDJogadores e selecione mostrando o resultado.*/
go
create view vwIdTimeJogador as
    select T.idTime as "idTime", J.idJogador as "id_jogador"
    from Time T
    inner join Jogadores J
    on T.idTime = J.idTime
go
select * from vwIdTimeJogador

/*3 – Crie uma view usando a view do item 2 e mostre apenas o nome do time e selecione
mostrando o resultado.*/
go
    create view vwNomeTime as
    select nomeTime from Time T
    inner join vwIdTimeJogador
    on T.idTime = "idTime"
    group by T.nomeTime
go
select * from Time
select * from vw_nomeTime
/*4 – Crie uma view usando o item 1 para demostrar apenas nomes dos jogadores que
comece com a letra ‘J’ e selecione mostrando o resultado.*/
go
    create view vwNomeJogador as
    select "nomeJogador" from vwNomeTimeJogador
    where "nomeJogador" like 'J%'
go
select * from vwNomeJogador
/*5 – Crie uma view com o nome do jogador, idade e nome do time dos jogadores filtrando
somente a time “Mogi Mirim Futebol Clube” e selecione mostrando o resultado em ordem
decrescente de idade.*/
go
create view vwDadosJogador as
    select J.nomeJogador as "nomeJogador", 
           J.idadeJogadpr as "idadeJogador",
           T.nomeTime as "nome_time"
    from Jogadores J
    inner join Time T
    on J.idTime = T.idTime
    where T.nomeTime = 'Mogi Mirim Futebol'
go
select * from vwDadosJogador order by "idadeJogador"
/*6 – Crie uma view com a média, soma, contador dos times e selecione mostrando o
resultado.*/
go
create view vwDados as
    select AVG(T.idTime) as "valorMedioIdTime",
           SUM(T.idTime) as "somaDeIdTimes",
           COUNT(T.idTime) as "totalDeTimes"
    from Time T
go
select * from vwDados
/*7 – Crie uma view para mostra o nome do jogador e o time do jogador mais velho e
selecione mostrando o resultado.*/
go
create view vwJogadorMaisVelhoNoTime as
    select J.nomeJogador as "nome_jogador", T.nomeTime as "nome_time"
    from Jogadores J
    inner join Time T
    on J.idTime = T.idTime
    where J.idadeJogadpr = (select MAX(idadeJogadpr)
                         from Jogadores)
go
select * from vwJogadorMaisVelhoNoTime
/*8 – Crie uma view para mostra o nome do jogador e time do jogador mis novo e selecione
mostrando o resultado*/
go
create view vwJogadorMaisNovoNoTime as
    select J.nomeJogador as "nomeJogador", T.nomeTime as "nome_time"
    from Jogadores J
    inner join Time T
    on J.idTime = T.idTime
    where J.idadeJogadpr = (select MIN(idadeJogadpr)
                         from Jogadores)
go
select * from vwJogadorMaisNovoNoTime
/*9 – Usando os itens 8 e 9 crie uma view para mostra o jogador mais velho e mais novo e
selecione mostrando o resultado*/
go
create view vwJogadoresNovosVelhos as

    select MAX."nomeJogadpr" as "jogadoresVelhos",
           MIN."nomeJogador" as "jogadoresNovos"
           
    from vwJogadorMaisVelhoNoTime MAX,
         vwJogadorMaisNovoNoTime MIN
go
select * from vwJogadoresNovosVelhos
/*10 – Crie uma view para mostra em uma nova coluna para mostrar se os jogadores são
maiores e menores de idade e selecione mostrando o resultado ordenado por nome do
time e pelo nome do jogador.*/
go
create view vwJogadoresMenorIdade as
    select nomeJogador "menorIdade"
    from Jogadores
    where idadeJogadpr < 19
go
go
create view vwJogadoresMaiorIdade as
    select nomeJogador "maiorIdade"
    from Jogadores
    where idadeJogadpr > 18
go
go
create view vwMaiorMenorIdade as
    select "menorIdade",
           "maiorIdade",
            T.nomeTime
    from vwJogadoresMenorIdade,
         vwJogadoresMaiorIdade,
         Time T
go
select * from vwMaiorMenorIdade order by nomeJogador
/*11- Altere a view do item 1 para mostra a idade dos jogadores e selecione mostrando o
resultado.*/
go
alter view vwNomeTimeJogador as
    select T.nomeTime as "nomeTtime",
           J.nomeJogador as "nomeJogador",
           J.idadeJogadpr as "idadeJogador"
    from Time T
    inner join Jogadores J
    on T.idTime = J.idTime
go
select * from vwNomeTimeJogador
/*12 – Apague a view do item 2.*/
go
Drop view vwIdTimeJogador
