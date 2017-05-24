CREATE DATABASE localidade;

USE localidade;

CREATE TABLE Cidade (
IDCidade integer primary key,
nomeCidade varchar(50),
numeroHabitantes integer,
contadorEstado integer,
IDEstado integer
foreign key (IDestado) 
references Estado(IDEstado)
)

select * from Pais;

CREATE TABLE Estado (
UF varchar(2),
IDEstado integer primary key,
nomeEstado varchar(50),
IDPais integer,
foreign key (IDPais) 
references Pais(IDPais)
);

CREATE TABLE Pais (
IDPais integer primary key,
nomepais varchar(50)
);

INSERT INTO Cidade VALUES(1, 'Mogi-Mirim',100,null,1);
INSERT INTO Cidade VALUES(2, 'Santa Luz',200,null,2);
INSERT INTO Cidade VALUES(3, 'Belo Horizonte',110,null,3);

INSERT INTO Estado VALUES('SP',1, 'São Paulo',1);
INSERT INTO Estado VALUES('BA',2, 'Bahia',1);
INSERT INTO Estado VALUES('MG',3, 'Minas Gerais',1);
INSERT INTO Estado VALUES('RJ',4, 'Rio de Janeiro',1);

INSERT INTO Pais VALUES(1, 'Brasil');

-- maior numero de habitantes
CREATE VIEW vw_EstadoHabitantes as 
SELECT Cidade.numeroHabitantes, Estado.nomeEstado FROM Cidade, Estado
WHERE Cidade.IDEstado = Estado.IDEstado
AND Cidade.numeroHabitantes = (SELECT MAX(numeroHabitantes) FROM Cidade)

SELECT * FROM vw_EstadoHabitantes;

-- todas cidades e estados
CREATE VIEW vw_CidadesEstado as-
SELECT Cidade.nomeCidade and Estado.nomeEstado FROM Cidade and Estado

SELECT * FROM vw_CidadesEstado;

-- exclusao em cascata

--Auto Incremento
CREATE TRIGGER trg_autoIncremento
ON Cidade
INSTEAD OF INSERT
AS
BEGIN
INSERT INTO Cidade(contadorEstado, IDEstado)
VALUES((
	SELECT 
		CASE WHEN MAX(contadorEstado) IS NULL THEN 1 ELSE MAX (contadorEstado) +1 END 
		FROM Cidade), (SELECT Cidade.IDEstado FROM INSERTED));
END

-- Estados sem Cidades
