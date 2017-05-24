CREATE DATABASE LISTA_TRIGGER;

USE LISTA_TRIGGER;

--1 – Crie uma trigger para deixar o campo IDTime auto incremento.
CREATE TRIGGER TRG_AUTO_IDTime
ON Times
INSTEAD OF INSERT
AS
BEGIN
INSERT INTO Times (IDTime, nomeTime) 
VALUES 
((SELECT 
	CASE WHEN MAX(idTime) IS NULL THEN 1 ELSE MAX(idTime)+1 END 
  FROM Times), (SELECT nomeTime FROM INSERTED)) ;
END

insert into times (nomeTime) values ('São Paulo');
insert into times (nomeTime) values ('Santos');

SELECT * FROM TIMES;


--2 – Crie uma trigger para deixar o campo IDJogador auto incremento.
CREATE TRIGGER TRG_AUTO_IDJogadores
ON Jogadores
INSTEAD OF INSERT
AS
BEGIN 
INSERT INTO Jogadores(idJogadores, nomeJogador,idade,idTime,CPF)
VALUES  ((SELECT CASE WHEN MAX(idJogadores) IS NULL THEN 1 ELSE MAX(idJogadores)+1 END id FROM Jogadores),
 (SELECT I.nomeJogador FROM inserted I),
 (SELECT I.idade FROM inserted I),
 (SELECT I.idTime FROM inserted I),
 (SELECT I.CPF FROM inserted I)
 ) ;
END

INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('João Paulo', 17, 1, '11111111111');
INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Thiago dos Satons', 18, 1, '22222222222');

SELECT * FROM JOGADORES;

--3 – Crie uma trigger para incluir o ano de nascimento no momento da inclusão da idade.
CREATE TRIGGER TRG_ANONASC 
ON Jogadores
AFTER INSERT
AS
BEGIN
    UPDATE Jogadores 
	SET anoNascimento = (YEAR(SYSDATETIME()) - idade)  
	WHERE IDJogadores = (SELECT IDJogadores FROM INSERTED)
END


INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Paulo Antonio', 15, 2, '33333333333');
INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Carlos Silva', 20, 2, '44444444444');

SELECT * FROM JOGADORES;

--4 – Crie uma trigger para verificar se o jogador é maior de idade (18 anos) colocando S
--para maior de idade e N para menor, na inclusão ou alteração do registro.
CREATE TRIGGER TRG_MaiorIdade 
ON Jogadores
AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE Jogadores 
	SET maiorIdade = CASE WHEN idade>=18 THEN 'S' ELSE 'N' END 
	WHERE IDJogadores = (SELECT IDJogadores FROM INSERTED)
END

INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Fernando Sousa', 18, 1, '55555555555');
INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('João Guilherme', 21, 2, '66666666666');
UPDATE JOGADORES SET IDADE = 6 WHERE IDJogadores = 1;

SELECT * FROM JOGADORES;

--5 – Crie uma trigger para verificar se o CPF do jogador já está cadastrado.

DROP TRIGGER TRG_AUTO_IDJogadores

CREATE TRIGGER TRG_VALID_CPF 
ON Jogadores
INSTEAD OF INSERT
AS
BEGIN
IF EXISTS (SELECT A.CPF 
			FROM inserted AS a 
			INNER JOIN JOGADORES AS b ON a.CPF = b.CPF)
	BEGIN
		PRINT  'CPF JÁ CADASTRADO!'
		ROLLBACK
	END
	ELSE
	BEGIN
		INSERT INTO Jogadores(idJogadores, nomeJogador,idade,idTime,CPF)
		VALUES		((SELECT CASE WHEN MAX(idJogadores) IS NULL THEN 1 ELSE MAX(idJogadores)+1 END id FROM Jogadores),
					(SELECT I.nomeJogador FROM inserted I),
					(SELECT I.idade FROM inserted I),
					 (SELECT I.idTime FROM inserted I),
					(SELECT I.CPF FROM inserted I)
			) ;
	END
END

INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('AAAAAAAAA', 21, 2, '66666666666');
INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Marcio Silveira', 21, 2, '77777777777');

SELECT * FROM Jogadores;

--6 – Desative a trigger do item 3.
ALTER TABLE JOGADORES DISABLE TRIGGER TRG_ANONASC;

INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Edinaldo Carvalho', 15, 1, '88888888888');
INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Marcos Regil', 22, 1, '99999999999');

SELECT * FROM JOGADORES;

--7 – Altere a trigger do item 4 para executar também a função da trigger do item 3.
ALTER TRIGGER TRG_MaiorIdade 
ON Jogadores
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Jogadores SET maiorIdade = CASE WHEN idade>=18 THEN 'S' ELSE 'N' END, 
	       anoNascimento = (YEAR(SYSDATETIME()) - idade)
	WHERE IDJogadores = (SELECT IDJogadores FROM INSERTED)
END

INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Edinaldo Carvalho', 15, 1, '00000000001');
INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Marcos Regil', 22, 1, '00000000002');

SELECT * FROM JOGADORES;

--8 – Crie uma trigger para atualizar o total de jogadores na tabela times toda vez que for
--incluído um novo jogador.
CREATE TRIGGER TRG_ATUALTOTALJOG
ON Jogadores
AFTER INSERT AS
DECLARE @id INT
SELECT @id=i.idTime FROM inserted i 
BEGIN 
	UPDATE Times SET totalJogadores =
	(SELECT count (J.idJogadores) 
		FROM Jogadores J inner join Times T ON J.idTime = T.idTime 
	 WHERE T.idTime = @id )
	 WHERE idTime = @id
END

select * FROM Times
INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Juliano da Costa', 14, 1, '00000000003');
INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Reginaldo Oliveira', 31, 2, '00000000004');
select * FROM Times
INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Fabiano Dantas', 15, 1, '00000000005');
select * FROM Times


--9 – Apague a trigger do item 3.
DROP TRIGGER AnoNasc 

--10 – Crie uma tabela e quantas triggers forem necessárias para auditar todas 
--transações ocorridas nas tabelas Times e Jogadores, com data e hora do ocorrido.
CREATE TABLE AUDITORIA (
id INT not null IDENTITY ,
nomeJogador VARCHAR (50),
nomeTime VARCHAR (50),
dt_modificacao DATETIME,
acao VARCHAR (50),
PRIMARY KEY (id));

CREATE TRIGGER trg_inclui_Jogador
ON Jogadores
FOR INSERT AS
INSERT INTO AUDITORIA
(acao,nomeJogador,nomeTime,dt_modificacao)
VALUES('insert',(SELECT nomeJogador FROM inserted),
NULL,
GETDATE());

create trigger trg_atualiza_Jogador
on Jogadores
FOR update as
insert into AUDITORIA
(acao,nomeJogador,nomeTime,dt_modificacao)
values('update',(select nomeJogador from deleted),
NULL,
GETDATE());

create trigger trg_deleta_Jogador
on Jogadores
for delete as
insert into AUDITORIA
(acao,nomeJogador,nomeTime,dt_modificacao)
values('delete',(select nomeJogador from deleted),
NULL,
GETDATE());

create trigger trg_inclui_Time
on Times
for insert as
insert into AUDITORIA
(acao,nomeJogador,nomeTime,dt_modificacao)
values('insert',NULL,
(select nomeTime from inserted),
GETDATE());

create trigger trg_atualiza_Time
on Times
for update as
insert into AUDITORIA
(acao,nomeJogador,nomeTime,dt_modificacao)
values('update',NULL,
(select nomeTime from deleted),
GETDATE());

create trigger trg_deleta_Time
on Times
for delete as
insert into AUDITORIA
(acao,nomeJogador,nomeTime,dt_modificacao)
values('delete',NULL,
(select nomeTime from deleted),
GETDATE());

select * from AUDITORIA;
INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Carlos Vinte Junior', 17, 1, '00000000010');
INSERT INTO JOGADORES (nomeJogador,idade,idTime,CPF) VALUES ('Wilson Santos', 25, 2, '00000000011');
select * from AUDITORIA;
UPDATE JOGADORES SET IDADE = 6 WHERE CPF = '00000000010';
UPDATE JOGADORES SET idTime = 1 WHERE CPF = '00000000011';
select * from AUDITORIA;
DELETE FROM JOGADORES WHERE CPF = '00000000010';
DELETE FROM JOGADORES WHERE CPF = '00000000011';
select * from AUDITORIA;

