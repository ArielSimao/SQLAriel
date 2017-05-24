create database trabsonRevisao;

use trabsonRevisao;

create table Cidade(
idCidade integer primary key,
nomeCidade varchar(30),
numHab integer,
contadorEstado integer,
idEstado integer FOREIGN KEY REFERENCES Estado(idEstado)
);

create table Estado(
idEstado integer primary key,
nomeEstado varchar(30),
uf varchar(2),
idPais integer FOREIGN KEY REFERENCES Pais(idPais)
);

create table Pais(
idPais integer primary key,
nomePais varchar(30)
);

insert into Pais values (1,'brasil');
insert into Pais values (2,'alemanha');
insert into Pais values (3,'eua');
insert into Pais values (4,'paraguai');
insert into Pais values (5,'china');

insert into Estado values (1,'parana', 'pr', 1);
insert into Estado values (2,'sao paulo', 'sp', 1);
insert into Estado values (3,'ohayo', 'oh', 3);
insert into Estado values (4,'hong kong', 'hk', 5);
insert into Estado values (5,'nao Sei', 'ns', 4);
insert into Estado values (6,'xablau', 'xb', null);

insert into Cidade values (1,'cidade1', 1200, 0, 1);
insert into Cidade values (2,'cidade2', 2100, 0, 2);
insert into Cidade values (3,'cidade3', 1233, 0, 3);
insert into Cidade values (4,'cidade4', 1512, 0, 4);
insert into Cidade values (5,'cidade5', 3262, 0, 4);
insert into Cidade values (6,'cidade6', 12, 0, null);
insert into Cidade values (7,'cidade7', 12321, 0, null);

-- 1 -- 
create view vw_maxHab as 
select top 1 Estado.nomeEstado, SUM(numHab) 'Max Habt.'
from Cidade 
join Estado 
on Estado.idEstado = Cidade.idEstado
group by Estado.nomeEstado
order by 'Max Habt.' desc;

select * from vw_maxHab;


-- 2 --

CREATE view vw_cidadeEstado as 
select Cidade.nomeCidade, Estado.nomeEstado 
from Cidade 
full outer join Estado 
on Estado.idEstado = Cidade.idCidade;

select * from vw_cidadeEstado;

-- 3 --
create trigger tg_deleteCascade on Pais instead of delete as 
begin
Declare @idPais int;
select @idPais = idPais from deleted;

delete from Cidade where idEstado in (select idEstado from Estado where idPais = @idPais)
delete from Estado where idPais in (select idPais from deleted)
delete from Pais where idPais in (select idPais from deleted)
end;

delete from Pais where idPais = 1;

-- 4 --
create trigger tg_autoInc on Cidade for insert as
begin
	update Cidade set contadorEstado = (select contadorEstado from Cidade where idEstado = )
end;
