CREATE DATABASE PROVA

USE PROVA

CREATE TABLE Pais(
IDPais INT NOT NULL PRIMARY KEY,
nomePais VARCHAR(30)
);

CREATE TABLE Estado(
IDEstado INT NOT NULL PRIMARY KEY,
UF VARCHAR(2),
nomeEstado VARCHAR(30),
IDPais INT NOT NULL FOREIGN KEY REFERENCES Pais (IDPais)
)

CREATE TABLE Cidade(
IDCidade INT NOT NULL PRIMARY KEY,
nomeCidade VARCHAR(30),
IDEstado INT NOT NULL FOREIGN KEY REFERENCES Estado (IDEstado),
ContadorEstado INT,
NumeroHabitantes INT 
)

INSERT INTO Pais VALUES (1, 'Argentina'),(2, 'Brasil'),(3, 'Chile');

SELECT * FROM Pais;

INSERT INTO Estado VALUES (1, 'MG','Minas Gerais',2),(2, 'RJ', 'Rio de Janeiro',2),(3, 'SP', 'Sao Paulo',2),(4, 'CB','Cabron',1),(5, 'LM', 'La Madre',1),(6, 'BA', 'Buenos Aires',1), (7,'BL','Bariloche',3),(8, 'CC', 'Colo-Colo',3),(9, 'VA', 'Valdivia',3);

SELECT * FROM Estado;

INSERT INTO Cidade VALUES (1, 'Uberlandia',1, 1, 100000),(2, 'Rio de Janeiro',2, 1, 300000),(3, 'Sao Paulo',3, 1, 1500000),(4, 'Cabron',4, 1, 50000),(5, 'La Madre', 5, 1, 60000),(6, 'Buenos Aires', 6, 1, 900000), (7,'Bariloche',7, 1, 450000),(8, 'Colo-Colo',8, 1, 80000),(9, 'Valdivia',9, 1, 5000), (10, 'Mogi Mirim', 3, 2, 80000);

SELECT * FROM Cidade;

CREATE VIEW vw_MostraMais AS
SELECT nomeEstado AS Estado, ContadorEstado AS NumCidades
FROM Estado e
JOIN Cidade c
ON e.IDEstado = c.IDEstado AND ContadorEstado = (SELECT MAX (ContadorEstado) FROM Cidade);

SELECT * FROM vw_MostraMais;

DROP VIEW vw_MostraMais;

CREATE VIEW vw_MostrarTodas AS
SELECT nomeEstado AS Estado, nomeCidade AS Cidade
FROM Estado e
JOIN Cidade c
ON e.IDEstado = c.IDEstado;

SELECT * FROM vw_MostrarTodas;

DROP VIEW vw_MostrarTodas;

CREATE TRIGGER tgr_Delete ON Estado 
FOR DELETE
AS
IF EXISTS 
	(SELECT IDPais FROM DELETED       



SELECT * FROM Pais;
SELECT * FROM Estado;
SELECT * FROM Cidade;

DROP TRIGGER tgr_Delete;


CREATE TRIGGER tgr_incrementa ON Cidade
FOR UPDATE
AS 
BEGIN
UPDATE Cidade SET ContadorEstado = ++1
FROM Estado AS e
INNER JOIN inserted as i ON e.IDEstado = i.IDEstado;
END;

