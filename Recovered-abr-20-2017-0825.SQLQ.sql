create database prova;

use prova;


create table Pais (
IDPais integer primary key ,
nomePais varchar(30)
)

INSERT INTO pais (Idpais, Nomepais) VALUES (1, 'Chile'),(2, 'Brasil'),(3, 'Eua'),(4,'italia'), (5, 'peru');

create table Estado(
Uf varchar (2),
Nomeestado varchar(30),
Idestado integer primary key,
Idpais integer,
Foreign Key(Idpais) references pais (Idpais),
)

INSERT INTO Estado (Uf, Nomeestado, Idestado, Idpais) VALUES ('Pr', 'Parana',6,2)
('Sp', 'São Paulo', 1, 2),('Ce', 'Ceara',2,1),('RJ', 'Rio de janeiro',3,3),('BH','Bahia',4,4), ('MG', 'Minas gerais',5,5), ;

create table Cidade(
Idcidade integer primary key,
Nomecidade varchar(30),
Numhabitantes integer,
ContadorEstado integer,
Idestado integer,
Foreign Key(Idestado) references estado (Idestado),
)


INSERT INTO Cidade(Idcidade, Nomecidade, Numhabitantes, Idestado) VALUES
(1, 'Mogi Mirim',3000,1),(2, 'Itapira',2000,2),(3, 'Ouro Preto', 1000,3),(4,'Goias',500,4), (5, 'Mogi Guacu',50,5);

---Exercicio 01
Create view exercicio1 as
SELECT Estado.Idestado, Cidade.Numhabitantes from Estado, Cidade
Where Cidade.Idestado = Estado.Idestado
and Cidade.Numhabitantes = (select max(Numhabitantes) from Cidade)

Select * from exercicio1

---Exercicio 02
create view exercicio2 as
SELECT Estado.Idestado, Estado.Nomeestado, Cidade.Idcidade, Cidade.Nomecidade FROM Estado, Cidade
WHERE estado.Idestado = Cidade.Idcidade

select * from exercicio2


---Exercicio 03


---Exercicio 04
CREATE TRIGGER [dbo].[TRG_INDENTITY_Contadorestado]
ON [dbo].[Cidade]
INSTEAD OF INSERT
AS
BEGIN
INSERT INTO Cidade(Idestado, Nomecidade) 
VALUES((
SELECT 
CASE WHEN MAX(IDestado) IS NULL THEN 1 ELSE MAX (IDestado) +1 END 
FROM cidade), (SELECT ContadorEstado FROM INSERTED));
END


---Exercicio 05
create view exercicio5 as
SELECT Cidade.Nomecidade, Estado.Nomeestado FROM Cidade, Estado
WHERE Nomecidade IS NULL;

