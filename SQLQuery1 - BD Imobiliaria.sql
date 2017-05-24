/* /Vamos Criar um �Bando de Dados� para uma imobili�ria fazer o controle dos Im�veis para Aluguel. 
Ser� necess�rio:
�Guardar informa��es do Propriet�rio :
Nome, endere�o, telefone e e-mail.
�Guardar informa��es do Corretor respons�vel :
Nome, endere�o, telefone e e-mail.
�Guardar informa��es do inquilino:
Nome, endere�o, telefone e e-mail.
�Guardar informa��es do im�vel:

Descri��o do Im�vel, valor do aluguel, endere�o, bairro, condi��o se alugado ou dispon�vel.

No  Modelo Entidade-Relacionamento (MER) anterior temos as seguintes entidades e relacionamentos:
�Propriet�rio ,�contata�, Corretor (um propriet�rio pode contatar v�rios corretores e um corretor pode ser contatado por v�rios propriet�rios).
�Corretor, �atende�, Inquilino (um corretor pode atender v�rios inquilinos e um inquilino pode ser atendido por v�rios corretores).
�Inquilino, �aluga�, Im�vel (um inquilino aluga um im�vel e um im�vel pode ser alugado por v�rios inquilinos).

�Propriet�rio, �possui�, Im�vel (um propriet�rio possui v�rios im�veis e um im�vel pertence a apenas um propriet�rio).
*/



/* Criar Banco de Dados Imobili�ria Aluguel*/
create database DB_Aluguel

/* Altera o contexto de banco de dados, selcionar para ser utilizado  DB_Imobiliaria_Alugu�l*/
use DB_Aluguel

/* criar tabela propriet�rio(codprop, nome, ender,tel,email), onde codprop � chave prim�ria*/
create table proprietario(
codprop char(3) primary key,
nome varchar(50) not null,
ender varchar(130)not null,
tel char(14),
email varchar(100))

drop table proprietario

/* criar tabela corretor(codcor, nome, ender,tel,email), onde codcor � chave prim�ria*/
create table corretor(
codcor char(3) primary key,
nome varchar(50) not null,
ender varchar(130)not null,
tel char(14),
email varchar(100))

drop table corretor

/* criar tabela inquilino(codinq, nome, ender,tel,email), onde codinq � chave prim�ria*/
create table inquilino(
codinq char(3) primary key,
nome varchar(50) not null,
ender varchar(130)not null,
tel char(14),
email varchar(100))

drop table inquilino

/* criar tabela imovel(codimov,descricao,valor,ender,bairo,condicao), ond codimov � chave prim�ria*/
create table imovel(
codimov char(3) primary key,
descricao varchar(100),
valor money,
ender varchar(120),
bairo varchar(50),
condicao varchar(30))

drop table imovel

/* criar tabela aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim), ond codalug � chave primaria e
codinc � chave estrangeira da tabela inquilino, 
codimov � chave estrangeira da tabela imovel,
codprop � chave estrangeira da tabela proprietario,
codcor � chave estrangeira da tabela corretor. */
create table aluguel(
codalug varchar(4) primary key,
codinc char(3)FOREIGN KEY REFERENCES inquilino(codinq),
codimov char(3)FOREIGN KEY REFERENCES imovel(codimov),
codprop char(3)FOREIGN KEY REFERENCES proprietario(codprop),
codcor char(3)FOREIGN KEY REFERENCES corretor(codcor),
dataini date,
datafim date)

drop table aluguel

/* inserir dados na tabela propriet�rio(codprop, nome, ender,tel,email), onde codprop � chave prim�ria*/
insert into proprietario(codprop, nome, ender,tel,email)
values
('P01','Antonio Mauel','Rua Maria Alzira Leal 123','1999345245','antonio@gmail.com'),
('P02','Milena Rafaela Nunes','AV Paulista 100','1993543765','milnunes@uol.com.br'),
('P03','Neide Alpino','Rua das Amelias 32','194433345','neidealpino@ig.com.br'),
('P04','Patricia Rufino','Rua Jose Bonifacio 1050','1997899923','patruf@rh.com.br'),
('P05','Jose Pascoal','Rua Curitiba 503','1997845637','jp@all.com'),
('P06','Felipe Maia','Rua 10 23','1997895534','fmaia@ig.com.br'),
('P07','Joao Santo','Rua 9 de julho 34','1999345245','jsanto@gmail.com'),
('P08','Walter Lopes','Rua das Rosas','1993543765','wlopes@uol.com.br'),
('P09','Cristiano Sulato','Rua Primavera 121','194433345','crissulato@ig.com.br'),
('P10','Maria Silveira','Rua Maracana 64','1997899923','msilveira@rh.com.br'),
('P11','Plino Milano','Rua Constantino 234','1997845637','plinim@all.com'),
('P12','Rosangela Bagers','Av Brasil 1000','1997895534','robarges@ig.com.br')


/* inserir dados na tabela corretor(codcor, nome, ender,tel,email), onde codcor � chave prim�ria*/
insert into corretor(codcor, nome, ender,tel,email)
values
('100', 'Almir Lopez', 'Rua das Rosas 123','199399242','amlopez@hotmail.com'),
('200', 'Sebastiao Goncalo', 'Rua Pernambuco 344','1996453399','gonsalo@imobiliaria.com'),
('300', 'Beatriz Maria', 'AV Sao Joao 1232','9833823342','biam@imobiliaria.com')


/* inserir dados na tabela inquilino(codinq, nome, ender,tel,email), onde codinq � chave prim�ria*/
insert into inquilino(codinq, nome, ender,tel,email)
values
('I01', 'Julio Simao', 'Rua Pitanga 34','199938456','julioS@fds.com'),
('I02', 'Milton Soares', 'Av Laguna 543','198790534','milsoares@ere.com'),
('I03', 'Marcia Rosatto', 'Rua Jose de Alencar 45','198876433','marciarosato@gmail.com'),
('I04', 'Paulo Gomes', 'Rua Joao Lima 894','195453332','paulog@all.com.br'),
('I05', 'Josefa Fernandes', 'Rua Araguari 76','198890432','josefaf@outlook.com'),
('I06', 'Gilmar Mendes', 'Rua Monte Videl 89','1988845321','gilmendes@gmailcom'),
('I07', 'Cristina Faustino', 'Rua Cantinga 122','1978363221','cris@gmail.com'),
('I08', 'Sivio Castilho', 'Rua Guanabara 110','198893421','silvioc@sp.com.br'),
('I09', 'Carlos Justino', 'Rua Marinara','19889789','carlosjus@ig.com.br'),
('I10', 'Samuel Souza', 'Rua Araguari 114','1978363221','samuels@gmail.com'),
('I11', 'Otavio Brandino', 'Rua Sao Pedro 20','198893421','otbr@sp.com.br'),
('I12', 'Naiara Lima', 'Av 15 de Novembro 10','19889789','nailima@ig.com.br')

/* inserir dados na tabela imovel(codimov,descricao,valor,ender,bairo,condicao, codprop), ond codimov � chave prim�ria */
insert into imovel(codimov,descricao,valor,ender,bairo,condicao)
values
('C01','Apartamento 2 quartos','780','Rua Jurunas 455','Vl Maria','Disponivel'),
('C02','Casa 2 quartos 1 suite','1250','Rua Silveira Bueno 53','Jd Das Rosas','Disponivel'),
('C03','Casa 1 quartos 1 suite','950','AV Brasil 44','Centro','Disponivel'),
('C04','Edicula 1 quarto sem garagem','500','Rua Bahia 21','Jd Das Rosas','Disponivel'),
('C05','Apartamento 1 suite','780','Rua Constantino 231','Vila Sao Judas','Disponivel'),
('C06','Casa 3 quartos','890','Rua Santa Cruz 331','Condomino Azul','Disponivel'),
('C07','Casa 2 quartos','690','Av Guimaraes','Jd Brasilia','Disponivel'),
('C08','Casa 3 quartos 1 suite','1300','Rua Lindor Silveira 544','Vila Cascata','Disponivel'),
('C09','Casa 1 quartos 1 suite','780','Rua 22 15','Jd Paulista','Disponivel'),
('C10','Edicula 2 quarto ','750','Rua Laranjeiras 98','Pq Sao Luis','Disponivel'),
('C11','Apartamento 2 quartos 1 suite','1100','Rua Constantino 231','Vila Sao Judas','Disponivel'),
('C12','Casa 2 quartos','700','Rua Palmital 44','Vila Boa Esperanca','Disponivel')

/* inserir dados na tabela aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim), ond codalug � chave primaria e
codinc � chave estrangeira da tabela inquilino, 
codimov � chave estrangeira da tabela imovel,
codprop � chave estrangeira da tabela proprietario,
codcor � chave estrangeira da tabela corretor. */
insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA01','I01','C01', 'P01','100','20150812','20170810'),
('AA02','I02','C02', 'P02','200','20161025','20171025'),
('AA03','I03','C03', 'P03','300','20161204','20171204'),
('AA04','I04','C04', 'P04','100','20160722','20170722'),
('AA05','I05','C05', 'P05','200','20160915','20170915')


/* Criar uma View onde contenha Descri��o do imovel, bairro do imovel, valor do alugu�l dos im�veis
Disponivel para Alugar */
create view vw_Disponivel as
select  I.descricao, I.bairo, I.valor, I.condicao
from imovel I
where condicao = 'Disponivel'

select * from vw_Disponivel
drop view vw_Disponivel

/* Criar uma View com nomes e telefones de contatos do Corretor, do Inquilino
e do Propriet�rio, o bairro onde fica o Imoveis que est�o alugados */
create view vw_Alugado as
select C.nome as [Nome Corretor], C.tel as [Tel Corretor],
I.nome as [Nome Inquilino], I.tel as [Tel Inquilino], P.nome as [Nome Propietario], P.tel as [Tel Proprietario],
M.bairo, M.condicao
from aluguel A
inner join corretor C
on C.codcor = A.codcor
inner join proprietario P
on P.codprop = A.codprop
inner join  inquilino I
on I.codinq = A.codinc
inner join  imovel M
on M.codimov = A.codimov

select * from vw_Alugado
drop view vw_Alugado

/* Criar uma View que calcula quantidade e valor dos Imoveis Alugados
por nome do Corretor e calcular 10% da comissao */
create view vw_CorrAluga as
select C.nome as[Corretor],
count(I.valor) as [Quantidade de Aluguel] ,
sum(I.valor) as [Soma dos Alugueis R$],
str(sum(I.valor * 0.10),6,2) as [Comissao R$] 
from corretor C
inner join aluguel A
on C.codcor = A.codcor
inner join imovel I
on I.codimov = A.codimov
group by C.nome

select * from vw_CorrAluga
drop view vw_CorrAluga

/* Trigger de Insert que dispara a condi��o do Imovel "Dispon�vel" para "Alugado" */
create trigger trg_Aluga
on aluguel
for insert as
begin
 declare
    @condicao varchar(30),
    @codimov  char(3);
    select @codimov = codimov from inserted
 select @condicao = condicao from  imovel
 update imovel
    set condicao = 'Alugado'
 where  @codimov = codimov;
 
 print 'Imovel Alugado !!!'
 end;

 drop trigger trg_Aluga

/* inserir imovel na tabela aluguel */ 
insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA01','I01','C01', 'P01','100','20150812','20170810')

/* inserir imovel na tabela aluguel */ 
insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA02','I02','C02', 'P02','200','20161025','20171025')

select * from vw_Disponivel
select * from vw_Alugado
select * from vw_CorrAluga


/* inserir imovel na tabela aluguel */ 
insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA03','I03','C03', 'P03','300','20161204','20171204')

/* inserir imovel na tabela aluguel */ 
insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA04','I04','C04', 'P04','100','20160722','20170722')

/* inserir imovel na tabela aluguel */ 
insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA05','I05','C05', 'P05','200','20160915','20170915')

insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA06','I06','C06', 'P06','100','20150812','20170810')

select * from vw_Disponivel
select * from vw_Alugado
select * from vw_CorrAluga

insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA07','I07','C07', 'P07','200','20161025','20171025')

insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA08','I08','C08', 'P08','300','20161204','20171204')

insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA09','I09','C09', 'P09','100','20160722','20170722')

insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA10','I10','C10', 'P10','200','20160915','20170915')

insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA11','I11','C11', 'P11','100','20160722','20170722')

insert into aluguel(codalug, codinc, codimov, codprop, codcor, dataini, datafim)
values
('AA12','I12','C12', 'P12','200','20160915','20170915')

select * from vw_Disponivel
select * from vw_Alugado
select * from vw_CorrAluga



Construir o modelo entidade-relacionamento e descrever o mapeamento para o modelo relacional.

Ag�ncia de Turismo
 Deseja-se criar um BD para uma ag�ncia de turismo, contendo informa��es sobre recursos oferecidos pelas cidades que fazem parte da programa��o de turismo da ag�ncia. As informa��es a serem mantidas sobre cada cidade referem-se a hot�is, restaurantes e pontos tur�sticos. 
  Sobre os hot�is que a cidade possui deseja-se guardar o c�digo, o nome,  o endere�o,  a categoria, os tipos de quartos que os formam, o n�mero dos quartos e o valor da di�ria de acordo com o tipo do quarto. 
 Sobre cada cidade deve-se armazenar seu nome, seu estado e a popula��o. Al�m disso, quando uma nova cidade � cadastrada no banco de dados da ag�ncia, um c�digo � a ela oferecido. 
 Cada restaurante da cidade possui um c�digo que o identifica, um nome, um endere�o e o tipo de sua categoria. Al�m disso, um restaurante pode pertencer a um hotel e um hotel somente pode ser associado a um restaurante. 
  Diferentes pontos tur�sticos da cidade est�o cadastrados no sistema: igrejas, casas de show e museus. A ag�ncia de turismo somente trabalha com estes tr�s tipos de pontos tur�sticos.  Nenhum outro � poss�vel. Al�m da descri��o e do endere�o, igrejas devem possuir como caracter�stica a data e o estilo de constru��o. J� casas de show devem armazenar o hor�rio de abertura e o dia de fechamento, al�m da descri��o e do seu endere�o. Finalmente, os museus devem armazenar o seu endere�o, descri��o, data de funda��o e n�mero de salas. Um museu pode ter sido fundado por v�rios fundadores.  Para estes, deve-se armazenar o seu nome, a data de nascimento e a data da morte (se houver), a nacionalidade e a atividade profissional que desenvolvia.  Al�m disso, um mesmo fundador pode ter fundado v�rios museus. Quando qualquer ponto tur�stico � cadastrado no sistema, ele tamb�m recebe um c�digo que o identifica. O mesmo � v�lido para fundadores.  
 Finalmente, casas de show podem possuir restaurante. Quando o cliente da ag�ncia reserva um passeio para uma casa de show, ele j� sabe se essa possui restaurante e qual o pre�o m�dio da refei��o, al�m da especialidade.  Dentro de uma casa de show, apenas um �nico restaurante pode existir.     







create database DB_Agencia_Turismo

use DB_Agencia_Turismo

create table cidade(
nome_cidade varchar(50),
estado varchar (20),
populacao int,
cod_cidade int primary key)

create table hotel(
cod_hotel int primary key,
nome_hotel varchar(50),
endereco varchar(100),
categoria varchar(10))

create table tipo_quarto(
cod_hotel int foreign key references hotel(cod_hotel),
cod_tipo int,
primary key(cod_hotel,cod_tipo),
num_quarto int,
valor_diaria money,
decricao varchar(50))

create table restaurante(
cod_restaurante int primary key,
cod_cidade int foreign key references cidade(cod_cidade),
cod_hotel int foreign key references hotel(cod_hotel),
nome varchar(50),
endereco varchar(100),
categoria varchar(30))

create table ponto_turistico(
cod_ponto_turistico int,
cod_cidade int foreign key references cidade(cod_cidade),
primary key(cod_ponto_turistico),
descricao varchar(50),
endereco varchar (100))

create table igreja(
cod_igreja int foreign key references ponto_turistico(cod_ponto_turistico),
data_fundacao date,
estilo varchar(30)
primary key (cod_igreja))

create table museu(
cod_museu int foreign key references ponto_turistico(cod_ponto_turistico),
data_fund date,
numero_salas int,
primary key (cod_museu))

create table casa_show(
cod_casa_show int foreign key references ponto_turistico(cod_ponto_turistico),
horario time,
dias_fechado date,
cod_restaurante int foreign key references restaurante(cod_restaurante),
primary key (cod_casa_show))

create table fundador(
cod_fundador int,
nome varchar(50),
data_nasc date,
data_obto date,
nacionalidade varchar(30),
atividade varchar(30),
primary key (cod_fundador))

create table fundacao(
cod_museu int foreign key references museu(cod_museu),
cod_fundador int foreign key references fundador(cod_fundador),
primary key (cod_museu, cod_fundador))

insert into cidade(nome_cidade,estado,populacao,cod_cidade)
values
('Sao Paulo','SP','124000000','01'),
('Rio de Janeiro','RJ','6320000','02'),
('Belo Horizonte','MG','1433000','03')

select *from cidade

alter table hotel
add cod_cidade int

alter table hotel
add constraint fk_cod_cidade foreign key(cod_cidade)
references cidade(cod_cidade)

insert into hotel(cod_hotel, nome_hotel,endereco,categoria,cod_cidade)
values
('001','Nova Era','Rua Libero Badarol 22','3 estrelas','01'),
('002','Jasmine','Rua do Tijuco 430','2 estrelas','02'),
('003','Miraje','Rua Sertao 120','4 estrelas','03')

select *from hotel

insert into tipo_quarto(cod_hotel,cod_tipo,num_quarto,valor_diaria,decricao)
values
('001','2','10','89.50','Quarto solteiro'),
('001','3','10','100','Quarto Casal'),
('001','4','5','120.50','1 Casal 2 solteiro'),
('002','2','10','70','Quarto 2 solteiro'),
('002','3','4','85','Quarto Casal'),
('002','4','5','100','1 Casal 2 solteiro'),
('003','2','20','90.50','Quarto solteiro'),
('003','3','10','110.50','Quarto Casal'),
('003','4','15','120.50','1 Casal 2 solteiro')

select *from tipo_quarto

insert into restaurante(cod_restaurante,cod_cidade,cod_hotel,nome,endereco,categoria)
values
('10','1','1','Restaurnate Nova Era','Rua Libero Badarol 22','Restaurnate por Kilo'),
('20','2','2','Churrascaria','Rua do Tijuco 500','Churrascaria'),
('30','3','3','Pizzaria','Rua Sertao 150','Pizzaria'),
('40','1',null,'Restaurante X','Rua Xavantes 1330','Self Service')

select *from restaurante

insert into ponto_turistico(cod_ponto_turistico, cod_cidade, descricao,endereco)
values
('11','3','Igreja Menino Jesus','Rua Mojor Olimpo 1000'),
('15','1','Igreja NS da Luz','Rua Bom Fim 18'),
('20','1','Museu','Rua Braz Cubas 401'),
('30','1','Boate','Av Coimbra 100'),
('25','2','Igreja Sao Judas','Rua XV Novembro SN'),
('40','2','Museu','AV Copa Cabana 40'),
('50','2','Discotec','Rua da Ladeira 200'),
('5','3','Igreja NS da Luz','Rua Bom Fim 18'),
('2','3','Museu','Rua Braz Cubas 401'),
('3','3','Boate','Av Coimbra 100')

select *from ponto_turistico

insert into igreja(cod_igreja,data_fundacao,estilo)
values
('11','19000522','null'),
('15','18500204','barroco'),
('25','19100816','gotico'),
('5','17900601','bizantina')

select *from igreja

insert into museu(cod_museu,data_fund,numero_salas)
values
('20','19000705','7'),
('40','19881101','3'),
('2','20051010','5')

select *from museu

alter table casa_show
alter column dias_fechado varchar(50)

insert into casa_show(cod_casa_show, horario, dias_fechado,cod_restaurante)
values
('30','23:00','Segunda a Quinta',null),
('50','21:00','Seunda a Sexta',null),
('3','22:00','Domingo a Quinta',null)

select *from casa_show

insert into fundador(cod_fundador,nome,data_nasc,data_obto,nacionalidade,atividade)
values
('31','Jose Bonifacio','18450210','19020502','Portuguesa','Professor'),
('23','Plinio Alcnatara','19010307','19590511','Brasileira','Medico'),
('13','Antonio Villas Boas','19320101','19940507','Brasileira','Historiador')

select *from fundador

insert into fundacao(cod_museu,cod_fundador)
values
('20','31'),
('40','23'),
('2','13')

select *from fundacao

/* 1-Listar todos os pontos turisticos com codigo, descri��o e endere�o */

select  cod_ponto_turistico, descricao, endereco
from ponto_turistico

/* 2-Listar as igrejas com c�digo, data fund��o e estilo */

select cod_igreja, data_fundacao, estilo
from igreja

/* 3-Listar o conteudo completo de cada tabela do Banco de Dados da Agencia de Turismo */

select *from casa_show
select *from cidade
select *from fundacao
select *from fundador
select *from hotel
select *from igreja
select *from museu
select *from ponto_turistico
select *from restaurante
select *from tipo_quarto

/* 4-Recuperar as inform��es das cidades que tem popul��o superior a 1 milh�o
     de habitantes */

select *from cidade
where populacao > 10000000


/* 5-Quais os hoteis que tem categoria "3 estrelas"  */

select *from hotel
where categoria = '2 estrelas'

/* 6-Adicionar o campo Especialidades em Restaurante */

alter table restaurante
add especialidade varchar(20)

update restaurante
set especialidade = 'Comida Mineira'
where nome = 'Restaurnate Nova Era'

update restaurante
set especialidade = 'Churrascaria'
where nome = 'Churrascaria'

update restaurante
set especialidade = 'Comida Italiana'
where nome = 'Pizzaria'

update restaurante
set especialidade = 'Comida Mineira'
where nome = 'Restaurante X'

-- Alterando Categoria
update restaurante
set categoria = '3 estrelas'
where nome = 'Restaurnate Nova Era'

update restaurante
set categoria = '2 estrelas'
where nome = 'Churrascaria'

update restaurante
set categoria = '3 estrelas'
where nome = 'Pizzaria'

update restaurante
set categoria = '2 estrelas'
where nome = 'Restaurante X'

select *from restaurante

/* 7-Quais s�o os restaurantes "3 estrlas" especializado
   em comida italiana */

select *from restaurante
where (categoria = '3 estrelas')and(especialidade = 'Comida Italiana')

/* 8-Recupere os Restaurantes que n�o s�o especiaizados em comida italiana
   e nem comida mineira */

select *from restaurante
where (especialidade != 'Comida Italiana') and (especialidade != 'Comida Mineira')


/* 9-Recupere quartos que tem valor entre 50 e 100 */

select *from tipo_quarto
where (valor_diaria > 50) and (valor_diaria < 100)


/*10-Recupere todos hoteis cujos nomes n�o comecem com "H" */


select *from hotel
where nome_hotel not LIKE'M%'

/*11-Recupere todos hoteis com categoria " 1 estrela "," 2 estrela "e" 3 estrelas "*/

select *from hotel
where categoria in ( '1 estrelas','2 estrelas','3 estrelas')

/*12-Recupere as informa��es fundadores que tem data de falecimento n�o preenchidas */

select *from fundador
where data_obto = null

/*13-Recupere Igrejas que tem estilos Cadastrados */

select *from igreja
where estilo != 'null'

/*14-Recupere as Igrejas ordenadas por data de Fund��o */
--crescente
select *from igreja order by data_fundacao ASC
--decrecente
select *from igreja order by data_fundacao DESC

/*15-Ordenar por data de fund��o(da mais nova para a mais antiga) as igrejas recuperadas exercicio 13 */

select *from igreja
where estilo is null
order by data_fundacao desc

/*16-Ordene os Museus por numeros de salas de forma decrescente */

select *from museu order by numero_salas desc


/*
Considere o projeto de banco de dados da ag�ncia de turismo contendo as seguintes tabelas:

� CIDADE (COD_CIDADE, NOME_CIDADE, ESTADO, POPULACAO)
� PONTO_TURISTICO (COD_PT, DESCRICAO_PT, ENDERECO_PT, COD_CIDADE), onde COD_CIDADE � chave estrangeira referente a CIDADE.
� IGREJA (COD_IGREJA,DATA, ESTILO), onde COD_IGREJA � chave estrangeira referente a PONTO_TURISTICO.
� MUSEU (COD_MUSEU, DATA_FUNCACAO, N_SALAS), onde COD_MUSEU � chave estrangeira referente a PONTO_TURISTICO.
� CASA_SHOW (COD_CASA_SHOW, HORARIO_INICIO, DIA_FECHAMENTO, COD_REST),
onde COD_CASA_SHOW � chave estrangeira referente a PONTO_TURISTICO E COD_REST � chave estrangeira referente a RESTAURANTE.
� RESTAURANTE (COD_REST, NOME_REST, ENDERECO_REST, CATEGORIA, ESPECIALIDADE, PRECO, COD_HOTEL),
onde COD_CIDADE � chave estrangeira referente a CIDADE e
onde COD_CASA_SHOW � chave estrangeira referente a CASA_SHOW e
onde COD_HOTEL � chave estrangeira referente a HOTEL.
� HOTEL (COD_HOTEL, NOME_HOTEL, ENDERECO_HOTEL, CATEGORIA, COD_CIDADE, COD_REST),
onde COD_CIDADE � chave estrangeira referente a CIDADE e onde COD_REST � chave estrangeira referente a RESTAURANTE.
� QUARTO (COD_HOTEL, QUARTO, VALOR, TIPO)
� FUNDADOR (COD_FUND, NOME_FUNDADOR, NASC, OBITO, NACIONALIDADE, ATIVIDADE)
� FUNDACAO (COD_MUSEU, COD_FUND), onde COD_MUSEU � chave estrangeira referente a MUSEU e onde COD_FUND � chave estrangeira referente a FUNDADOR.

*/

/*  1. Recupere os quartos que t�m valor entre 50 e 100 contendo c�digo e nome do hotel, o n�mero do quarto e o tipo.*/
 
  select Q.decricao, Q.valor_diaria, Q.num_quarto, Q.cod_hotel,H.nome_hotel
  from tipo_quarto Q
  inner join hotel H
  on Q.cod_hotel = H.cod_hotel
  where (valor_diaria > 50) and (valor_diaria < 100)


/*  2. Apesente as seguintes informa��es dos museus: c�digo, descri��o, endere�o, data e n�mero de salas. */

select P.cod_ponto_turistico,P.descricao,P.endereco, M.data_fund, M.numero_salas
from ponto_turistico P
inner join museu M
on P.cod_ponto_turistico = M.cod_museu

select *from museu

update ponto_turistico
set endereco = 'Rua Chico Alencar 100'
where cod_ponto_turistico = 20

/*  3. Recupere as igrejas localizadas em S�o Paulo.  */

select  P.descricao, I.data_fundacao, I.estilo, P.endereco, C.nome_cidade, C.estado
from igreja I
inner join ponto_turistico P
on I.cod_igreja = P.cod_ponto_turistico
inner join cidade C
on C.cod_cidade = P.cod_cidade
where C.nome_cidade = 'Sao Paulo'


/*4. Recupere as igrejas de S�o Paulo que n�o t�m estilo preenchido. */

select  P.descricao, I.data_fundacao, P.endereco, C.nome_cidade, C.estado
from igreja I
inner join ponto_turistico P
on I.cod_igreja = P.cod_ponto_turistico
inner join cidade C
on C.cod_cidade = P.cod_cidade
where I.estilo = 'null'


/*5. Recupere museus com c�digo, descri��o, endere�o e n�mero de salas, localizados em S�o Paulo e que tenha sido fundados por Jose Bonifacio. */

select M.cod_museu, P.descricao,C.nome_cidade, P.endereco, M.numero_salas, X.nome
from ponto_turistico P
inner join museu M
on P.cod_ponto_turistico = M.cod_museu
inner join cidade C
on C.cod_cidade = P.cod_cidade
inner join fundacao F
on M.cod_museu = F.cod_museu
inner join fundador X
on F.cod_fundador = X.cod_fundador
where (C.nome_cidade = 'Sao Paulo') and (X.nome = 'Jose Bonifacio')

Postado por Clayton Klen �s 06:45 Nenhum coment�rio: 
Enviar por e-mail
BlogThis!
Compartilhar no Twitter
Compartilhar no Facebook
Compartilhar com o Pinterest

segunda-feira, 27 de fevereiro de 2017
DB_Trem_Estacoes
Trens e Estacoes
Modele um Banco de Dados pra atender as seguintes especificacoes:
-Trens podem ser dois tipos: Trem Local ou Trem Expresso. OBS: nunca ambos;
-Cada trem tem um numero unico e um Engenheiro responssavel;
-Estacoes s�o paradas Expressas ou paradas Local, OBS: nunca ambas;
-Estacao tem um nome Unico e um Endereco;
-Todos os trens Locais param em todas estacoes;
-Trens Expresso param apenas em estacoes Expressa;
-Para cada estacao cada trem tem hora de Ida e Retorno.




create database DB_Trem_Estacoes

use DB_Trem_Estacoes

create table trem(
numero_trem int primary key,
engenheiro varchar(30) not null)

create table estacao(
nome_estacao varchar(50) primary key,
endereco varchar(100))

create table trem_expresso(
numero_trem_expresso int foreign key references trem(numero_trem), primary key(numero_trem_expresso))

create table trem_local(
numero_trem_local int foreign key references trem(numero_trem), primary key(numero_trem_local))

create table estacao_expressa(
nome_estacao_expressa varchar(50) foreign key references estacao(nome_estacao), primary key(nome_estacao_expressa))

create table estacao_local(
nome_estacao_local varchar(50) foreign key references estacao(nome_estacao), primary key(nome_estacao_local))

create table parada_expressa(
nome_estacao_expressa varchar(50) foreign key references estacao_expressa(nome_estacao_expressa),
numero_trem_expresso int foreign key references trem_expresso(numero_trem_expresso), primary key(nome_estacao_expressa,numero_trem_expresso),
hora_ida time,
hora_retorno time)

create table parada_local(
nome_estacao_local varchar(50) foreign key references estacao_local(nome_estacao_local),
numero_trem_local int foreign key references trem_local(numero_trem_local), primary key(nome_estacao_local,numero_trem_local),
hora_ida time,
hora_retorno time)
Postado por Clayton Klen �s 05:00 Nenhum coment�rio: 
Enviar por e-mail
BlogThis!
Compartilhar no Twitter
Compartilhar no Facebook
Compartilhar com o Pinterest

quinta-feira, 8 de dezembro de 2016
DB_contabancaria2017 - Exercicio - Pratico
/* 1. Construir um banco de dados para tratar contas banc�rias */

CREATE DATABASE DB_contabancaria2017;

USE DB_contabancaria2017

/*2. Criar as tabelas ag�ncia, cliente, conta e empr�stimo com os atributos
mostrados a seguir: */


/*� agencia (cod_ag, nome, cidade), onde cod_ag � chave prim�ria */
CREATE TABLE agencia (
cod_ag CHAR(3) PRIMARY KEY,
nome VARCHAR(20) NOT NULL,
cidade VARCHAR(50))

/*� cliente (cod_cli, nome, endereco, cidade), onde cod_cli � chave prim�ria */
CREATE TABLE cliente (
cod_cli CHAR(4) PRIMARY KEY,
nome VARCHAR (80) NOT NULL,
endereco VARCHAR (120),
cidade VARCHAR(50))


/*� conta (cod_ag, cod_cli, nro_conta, saldo), onde cod_ag e cod_cli s�o chaves
estrangeiras e a chave prim�ria � composta por cod_ag, cod_cli e nro_conta. */
CREATE TABLE conta (
cod_ag CHAR(3) FOREIGN KEY REFERENCES AGENCIA(COD_AG),
cod_cli CHAR(4) FOREIGN KEY REFERENCES CLIENTE(COD_CLI),
nro_conta CHAR(4) NOT NULL,
saldo MONEY,
PRIMARY KEY(COD_AG, COD_CLI, NRO_CONTA))


/*� emprestimo (cod_ag, cod_cli, nro_empr, valor), onde cod_ag e cod_cli s�o chaves estrangeiras
e a chave prim�ria � composta por cod_ag, cod_cli e nro_empr. */
CREATE TABLE emprestimo (
cod_ag CHAR(3) FOREIGN KEY REFERENCES AGENCIA(COD_AG),
cod_cli CHAR(4) FOREIGN KEY REFERENCES CLIENTE(COD_CLI),
nro_empr INT NOT NULL,
valor MONEY
PRIMARY KEY(COD_AG, COD_CLI, NRO_EMPR))


/*3. Popular as tabelas conforme descrito a seguir*/

/*3.1. Incluir duas ag�ncias: 
� ('001', 'MGU', 'Mogi Gua�u')
� ('010', 'MMI', 'Mogi Mirim') */

INSERT INTO AGENCIA VALUES
('001', 'MGU', 'Mogi Gua�u'),
('010', 'MMI', 'Mogi Mirim')

SELECT * FROM AGENCIA


/*3.2 Incluir seis clientes e, para cada cliente, incluir uma conta e um empr�stimo na ag�ncia 010. */

INSERT INTO CLIENTE (COD_CLI, NOME, ENDERECO, CIDADE)
VALUES
('1001', 'JOAO PEREIRA', 'RUA XV DE NOVEMBRO, 15', 'MOGI MIRIM'),
('1002', 'ANTONIO CARLOS', 'RUA XV DE NOVEMBRO, 115', 'MOGI MIRIM'),
('1003', 'CARLOS SILVA', 'RUA XV DE NOVEMBRO, 215', 'MOGI MIRIM'),
('2001', 'ANDRE FERREIRA', 'RUA 7 DE SETEMBRO, 7', 'MOGI GUA�U'),
('2002', 'MANOEL SANTOS', 'RUA 7 DE SETEMBRO, 17', 'MOGI GUA�U'),
('2003', 'JOS� ANDRADE', 'RUA 7 DE SETEMBRO, 117', 'MOGI GUA�U')

SELECT * FROM CLIENTE

/*4. Incluir seis clientes e, para cada cliente,
incluir uma conta e um empr�stimo na ag�ncia 010.*/

 /* 3.3 Para cada cliente, incluir uma conta */

INSERT INTO CONTA (COD_AG, COD_CLI, NRO_CONTA, SALDO)
VALUES
('010', '1001', '9901', 1000),
('010', '1002', '9902', 1000),
('010', '1003', '9903', 1000),
('001', '2001', '9911', 1000),
('001', '2002', '9912', 1000),
('001', '2003', '9913', 1000)

SELECT * FROM CONTA

/* 3.4  um empr�stimo na ag�ncia 0010.*/

INSERT INTO EMPRESTIMO VALUES
('010', '1001', '8801', 1000),
('010', '1002', '8802', 1000),
('010', '1003', '8803', 1000),
('001', '2001', '8811', 1000),
('001', '2002', '8812', 1000),
('001', '2003', '8813', 1000)

SELECT * FROM EMPRESTIMO

/*5. Criar uma view com c�digo, nome e saldo dos clientes da ag�ncia
010 (para ser cliente de uma ag�ncia, � necess�rio ter uma conta). */


create view vwAg10 As

select N.cod_cli,N.nome, C.saldo
from cliente N
inner join conta C
on N.cod_cli = C.cod_cli
inner join agencia A
on C.cod_ag = A.cod_ag
where A.cod_ag = '010'



/* 6. Recuperar o nome e o endere�o dos clientes da ag�ncia 010 que tem
saldo menor que 1500, usando a view criada no exerc�cio anterior.*/

select C.nome, S.saldo,C.endereco
from vwAg10 S
inner join cliente C
on C.cod_cli = S.cod_cli
where saldo <= '1500'

/* 7. Incluir mais alguns empr�stimos para os cliente da ag�ncia 010 e
criar uma view que apresente o c�digo do cliente com empr�stimos
na ag�ncia 0010, a quantidade de empr�stimos e o valor total emprestado
(count e sum). */


INSERT INTO EMPRESTIMO VALUES
('010', '1001', '8841', 1800),
('010', '1002', '8842', 2300),
('010', '1003', '8843', 1500),
('001', '2001', '8841', 100),
('001', '2002', '8842', 800),
('001', '2003', '8843', 2500)


create view vwEmperstimoAg10 as
    select cod_cli ,
 count(nro_empr) as [quantidade de clientes],
 sum(valor) as [valor total]
 from emprestimo
 where cod_ag ='010'
 group by cod_cli

 select * from vwEmperstimoAg10

/* 8. Utilizando a view criada no exerc�cio anterior, apresente os nomes dos clientes que
tem mais que dois empr�stimos na ag�ncia 010 e o total emprestado.*/

select v.cod_cli,nome, [quantidade de clientes],[valor total]
from vwEmperstimoAg10 v, cliente c
where  [quantidade de clientes] > 2

/* 9. Crie uma vis�o com n�mero da conta, saldo, c�digo do cliente,
nome e endere�o para os clientes com saldo maior que 1000. 
Tente inserir um registro nessa view considerando uma conta e um cliente
existentes e saldo = 2000
(ex: cod_cliente = '1234', nome = 'JOAQUIM', 'rua xv de novembro, 400', conta = '444', saldo = 2000).
Foi poss�vel realizar a inclus�o?
Como ficam os dados nas tabelas conta e cliente? */

create view vwMaiorEmprestimo as
select c.nro_conta, saldo, cl.cod_cli, nome, endereco
from conta c, cliente cl
where saldo >= 1000 and c.cod_cli = cl.cod_cli

select * from vwMaiorEmprestimo

create view vwAlgunsClientes as
select cod_cli, nome, cidade
from cliente
where cidade in ('Mogi Mirim','Mogi Guacu')

insert into vwAlgunsClientes
values('4322','Silvio','Mogi Mirim');

insert into vwAlgunsClientes
values('4321','Pedro','Mogi Guacu');

create function calcula (@percentual int)
returns decimal(10,2)
begin
 declare @total dec(10,2),
   @valor_calc dec(10,2);
select @total = sum(saldo) from conta;
set @valor_calc = @total *@percentual /100;
return @valor_calc;
end

select dbo.calcula(50)

drop function calcula

create function clientes_empr_ag (@ag numeric(4) = 0010)
returns table
as
return (select C.cod_cli, nome
  from cliente C, emprestimo E
  where C.cod_cli = E.cod_cli and
  E.cod_ag = @ag)

select * from clientes_empr_ag (0001)

Postado por Clayton Klen �s 12:03 Nenhum coment�rio: 
Enviar por e-mail
BlogThis!
Compartilhar no Twitter
Compartilhar no Facebook
Compartilhar com o Pinterest

Locadora - Banco de Dados - Exercicio - Pratico
create database locadora

use locadora

--Cliente (codigo, nome, endereco)

create table cliente(
codigo int primary key,
nome varchar(50),
endereco varchar (50)
)


--Diretor (nome, nacionalidade)

create table diretor(
nome varchar (30) primary key,
nacionalidade varchar(50)
)

--Ator(nome, nacionalidade, dt_nasc, dt_falec)

create table ator(
nome varchar (50) primary key,
nacionalidade varchar (50),
dt_nasc date,
dt_falec date
)

--Genero (codigo, descricao)

create table genero(
codigo int primary key,
descricao varchar(50)
)

--Filme (codigo, titulo, ano, valor_diaria, diretor, genero), onde diretor e genero s�o chaves estrangeiras.

create table filme(
codigo int primary key,
ano int,
titulo varchar(50),
valor_diaria money,
nome_diretor varchar(30) foreign key references diretor(nome),
codigo_genero int foreign key references genero(codigo)
)

--Atua��o (ator, cod_filme, papel), onde ator e cod_filme s�o chaves estrangeiras.

create table ator_filme(
papel varchar(50),
nome_ator varchar(50) foreign key references ator(nome),
codigo_filme int foreign key references filme(codigo)
)

--Aluguel(cod_cliente, cod_filme, dt_emprestimo, dt_devolucao), onde cod_cliente e cod_filme s�o chaves estrangeiras.

create table cliente_filme(
dt_emprestimo date,
dt_devolucao date,
codigo_cliente int foreign key references cliente(codigo),
codigo_filme int foreign key references filme(codigo)
)


--1. Escreva o comando SQL necess�rio para recuperar os g�neros dos filmes que j� foram alugados por cada cliente. O retorno deve ser o nome do cliente e a descri��o do g�nero.

select g.descricao, c.nome from filme f inner join genero g

on
g.codigo = f.codigo
inner join cliente c

on
c.codigo = f.codigo_cliente
Postado por Clayton Klen �s 12:00 Nenhum coment�rio: 
Enviar por e-mail
BlogThis!
Compartilhar no Twitter
Compartilhar no Facebook
Compartilhar com o Pinterest

Empresa - Banco de Dados - Guia Pr�tico de Aprendizagem - Exerc�cio Completos
CREATE DATABASE Empresa
go

USE Empresa
go

CREATE TABLE Fornecedores(
 CodFor  INT IDENTITY NOT NULL,
 Empresa  VARCHAR(40),
 Contato  VARCHAR(30),
 Cargo  VARCHAR(30),
 Endereco VARCHAR(60),
 Cidade  VARCHAR(15),
 CEP  VARCHAR(10),
 Pais  VARCHAR(15),
 PRIMARY KEY (CodFor)
)

CREATE TABLE Categorias(
 CodCategoria INT IDENTITY NOT NULL,
 Descr   VARCHAR(15),
 PRIMARY KEY (CodCategoria)
)

CREATE TABLE Clientes(
 CodCli  CHAR(5) NOT NULL,
 Nome  VARCHAR(40) NOT NULL,
 Contato  VARCHAR(30) NOT NULL,
 Cargo  VARCHAR(30) NOT NULL,
 Endereco VARCHAR(60) NOT NULL,
 Cidade  VARCHAR(15) NOT NULL,
 Regiao  VARCHAR(15) NOT NULL,
 CEP  VARCHAR(10) NOT NULL,
 Pais  VARCHAR(15) NOT NULL,
 Telefone VARCHAR(24) NOT NULL,
 Fax  VARCHAR(24) NOT NULL,
 PRIMARY KEY(CodCli)
)

CREATE TABLE Funcionarios(
 CodFun  INT IDENTITY NOT NULL,
 Sobrenome VARCHAR(20),
 Nome  VARCHAR(10),
 Cargo  VARCHAR(30),
 DataNasc DATE,
 Endereco VARCHAR(60),
 Cidade  VARCHAR(15),
 CEP  VARCHAR(10),
 Pais  VARCHAR(15),
 Fone  VARCHAR(24),
 Salario  MONEY DEFAULT 0.0,
 PRIMARY KEY (CodFun)
)

CREATE TABLE Produtos(
 CodProd  INT IDENTITY NOT NULL,
 Descr  VARCHAR(40),
 CodFor  INT ,
 CodCategoria INT ,
 Preco  MONEY DEFAULT 0.0,
 Unidades SMALLINT DEFAULT 0 ,
 Descontinuado BIT ,
 PRIMARY KEY (CodProd),
 FOREIGN KEY (CodCategoria) REFERENCES Categorias(CodCategoria) ON DELETE CASCADE,
 FOREIGN KEY (CodFor) REFERENCES Fornecedores(CodFor) ON DELETE CASCADE
)

CREATE TABLE Pedidos(
 NumPed  INT NOT NULL,
 CodCli  CHAR(5),
 CodFun  INT DEFAULT 0 ,
 DataPed  DATE,
 DataEntrega DATE,
 Frete  MONEY DEFAULT 0.0,
 PRIMARY KEY (NumPed),
 FOREIGN KEY (CodCli) REFERENCES Clientes(CodCli) ON DELETE CASCADE,
 FOREIGN KEY (CodFun) REFERENCES Funcionarios(CodFun) ON DELETE CASCADE
)

CREATE TABLE DetalhesPed(
 NumPed  INT ,
 CodProd  INT  ,
 Preco  MONEY,
 Qtde  SMALLINT ,
 Desconto FLOAT
 PRIMARY KEY (NumPed, CodProd),
 FOREIGN KEY (NumPed) REFERENCES Pedidos(NumPed) ON DELETE CASCADE,
 FOREIGN KEY (CodProd) REFERENCES Produtos(CodProd) ON DELETE CASCADE
)

SET DATEFORMAT YMD

---------------------
-- Dados Fornecedores
---------------------
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Exotic Liquids','Charlotte Cooper','Gerente de Encomendas','49 Gilbert St.','London','EC1 4SD','Reino Unido');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('New Orleans Cajun Delights','Shelley Burke','Administrador de Pedidos','P.O. Box 78934','New Orleans','70117','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Grandma Kelly s Homestead','Regina Murphy','Representante de Vendas','707 Oxford Rd.','Ann Arbor','48104','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Tokyo Traders','Yoshi Nagase','Gerente de Marketing','9-8 SekimaiMusashino-shi','Tokyo','100','Jap�o');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Cooperativa de Quesos  Las Cabras ','Antonio del Valle Saavedra ','Administrador de Exporta��o','Calle del Rosal 4','Oviedo','33007','Espanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Mayumi s','Mayumi Ohno','Representante de Marketing','92 Setsuko Chuo-ku','Osaka','545','Jap�o');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Pavlova, Ltd.','Ian Devling','Gerente de Marketing','74 Rose St.Moonie Ponds','Melbourne','3058','Austr�lia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Specialty Biscuits, Ltd.','Peter Wilson','Representante de Vendas','29 King s Way','Manchester','M14 GSD','Reino Unido');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('PB Kn�ckebr�d AB','Lars Peterson','Agente de Vendas','Kaloadagatan 13','G�teborg','S-345 67','Su�cia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Refrescos Americanas LTDA','Carlos Diaz','Gerente de Marketing','Av. das Americanas 12.890','S�o Paulo','5442','Brasil');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Heli S��waren GmbH & Co. KG','Petra Winkler','Gerente de Vendas','Tiergartenstra�e 5','Berlin','10785','Alemanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Plutzer Lebensmittelgro�m�rkte AG','Martin Bein','Ger. Marketing Internacional','Bogenallee 51','Frankfurt','60439','Alemanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Coord. Mercados Estrangeiros','Frahmredder 112a','Cuxhaven','27478','Alemanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Formaggi Fortini s.r.l.','Elio Rossi','Representante de Vendas','Viale Dante, 75','Ravenna','48100','It�lia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Norske Meierier','Beate Vileid','Gerente de Marketing','Hatlevegen 5','Sandvika','1320','Noruega');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Bigfoot Breweries','Cheryl Saylor','Rep. Financeiro Local','3400 - 8th AvenueSuite 210','Bend','97101','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Svensk Sj�f�da AB','Michael Bj�rn','Representante de Vendas','Brovallav�gen 231','Stockholm','S-123 45','Su�cia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Aux joyeux eccl�siastiques','Guyl�ne Nodier','Gerente de Vendas','203, Rue des Francs-Bourgeois','Paris','75004','Fran�a');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('New England Seafood Cannery','Robb Merchant','Agente Financeiro de Atacado','Order Processing Dept.2100 Paul Revere Blvd.','Boston','02134','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Leka Trading','Chandra Leka','Propriet�rio','471 Serangoon Loop, Suite #402','Singapore','0512','Cingapura');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Lyngbysild','Niels Petersen','Gerente de Vendas','LyngbysildFiskebakken 10','Lyngby','2800','Dinamarca');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Zaanse Snoepfabriek','Dirk Luchte','Gerente Financeiro','VerkoopRijnweg 22','Zaandam','9999 ZZ','Paises Baixos');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Karkki Oy','Anne Heikkonen','Gerente do Produto','Valtakatu 12','Lappeenranta','53120','Finl�ndia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('G day, Mate','Wendy Mackenzie','Representante de Vendas','170 Prince Edward ParadeHunter s Hill','Sydney','2042','Austr�lia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Ma Maison','Jean-Guy Lauzon','Gerente de Marketing','2960 Rue St. Laurent','Montr�al','H1J 1C3','Canad�');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Pasta Buttini s.r.l.','Giovanni Giudici','Administrador de Pedidos','Via dei Gelsomini, 153','Salerno','84100','It�lia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Escargots Nouveaux','Marie Delamare','Gerente de Vendas','22, rue H. Voiron','Montceau','71300','Fran�a');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Gai p�turage','Eliane Noz','Representante de Vendas','Bat. B3, rue des Alpes','Annecy','74000','Fran�a');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('For�ts d �rables','Chantal Goulet','Gerente Financeiro','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canad�');

-------------------
-- Dados Categorias
-------------------
INSERT INTO Categorias(Descr) VALUES ('Bebidas');
INSERT INTO Categorias(Descr) VALUES ('Condimentos');
INSERT INTO Categorias(Descr) VALUES ('Confeitos');
INSERT INTO Categorias(Descr) VALUES ('Latic�nios');
INSERT INTO Categorias(Descr) VALUES ('Gr�os/Cereais');
INSERT INTO Categorias(Descr) VALUES ('Carnes/Aves');
INSERT INTO Categorias(Descr) VALUES ('Hortigranjeiros');
INSERT INTO Categorias(Descr) VALUES ('Frutos do Mar');

-----------------
-- Dados Clientes
-----------------
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ALFKI','Alfreds Futterkiste','Maria Anders','Representante de Vendas','Obere Str. 57','Berlin','','12209','Alemanha','030-0074321','030-0076545');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ANATR','Ana Trujillo Emparedados y helados','Ana Trujillo','Propriet�rio','Avda. de la Constituci�n 2222','M�xico D.F.','','05021','M�xico','(5) 555-4729','(5) 555-3745');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ANTON','Antonio Moreno Taquer�a','Antonio Moreno','Propriet�rio','Mataderos  2312','M�xico D.F.','','05023','M�xico','(5) 555-3932','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('AROUT','Around the Horn','Thomas Hardy','Representante de Vendas','120 Hanover Sq.','London','','WA1 1DP','Reino Unido','(171) 555-7788','(171) 555-6750');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BERGS','Berglunds snabbk�p','Christina Berglund','Administrador de Pedidos','Berguvsv�gen  8','Lule�','','S-958 22','Su�cia','0921-12 34 65','0921-12 34 67');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BLAUS','Blauer See Delikatessen','Hanna Moos','Representante de Vendas','Forsterstr. 57','Mannheim','','68306','Alemanha','0621-08460','0621-08924');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BLONP','Blondel p�re et fils','Fr�d�rique Citeaux','Gerente de Marketing','24, place Kl�ber','Strasbourg','','67000','Fran�a','88.60.15.31','88.60.15.32');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BOLID','B�lido Comidas preparadas','Mart�n Sommer','Propriet�rio','C/ Araquil, 67','Madrid','','28023','Espanha','(91) 555 22 82','(91) 555 91 99');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BONAP','Bon app ','Laurence Lebihan','Propriet�rio','12, rue des Bouchers','Marseille','','13008','Fran�a','91.24.45.40','91.24.45.41');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BOTTM','Bottom-Dollar Markets','Elizabeth Lincoln','Gerente Financeiro','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canad�','(604) 555-4729','(604) 555-3745');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BSBEV','B s Beverages','Victoria Ashworth','Representante de Vendas','Fauntleroy Circus','London','','EC2 5NT','Reino Unido','(171) 555-1212','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('CACTU','Cactus Comidas para llevar','Patricio Simpson','Agente de Vendas','Cerrito 333','Buenos Aires','','1010','Argentina','(1) 135-5555','(1) 135-4892');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('CENTC','Centro comercial Moctezuma','Francisco Chang','Gerente de Marketing','Sierras de Granada 9993','M�xico D.F.','','05022','M�xico','(5) 555-3392','(5) 555-7293');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('CHOPS','Chop-suey Chinese','Yang Wang','Propriet�rio','Hauptstr. 29','Bern','','3012','Su��a','0452-076545','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('COMMI','Com�rcio Mineiro','Pedro Afonso','Assessor de Vendas','Av. dos Lus�adas, 23','S�o Paulo','SP','05432-043','Brasil','(11) 555-7647','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('CONSH','Consolidated Holdings','Elizabeth Brown','Representante de Vendas','Berkeley Gardens 12  Brewery ','London','','WX1 6LT','Reino Unido','(171) 555-2282','(171) 555-9199');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('DRACD','Drachenblut Delikatessen','Sven Ottlieb','Administrador de Pedidos','Walserweg 21','Aachen','','52066','Alemanha','0241-039123','0241-059428');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('DUMON','Du monde entier','Janine Labrune','Propriet�rio','67, rue des Cinquante Otages','Nantes','','44000','Fran�a','40.67.88.88','40.67.89.89');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('EASTC','Eastern Connection','Ann Devon','Agente de Vendas','35 King George','London','','WX3 6FW','Reino Unido','(171) 555-0297','(171) 555-3373');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ERNSH','Ernst Handel','Roland Mendel','Gerente de Vendas','Kirchgasse 6','Graz','','8010','�ustria','7675-3425','7675-3426');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FAMIA','Familia Arquibaldo','Aria Cruz','Assistente de Marketing','Rua Or�s, 92','S�o Paulo','SP','05442-030','Brasil','(11) 555-9857','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FISSA','FISSA Fabrica Inter. Salchichas S.A.','Diego Roel','Gerente Financeiro','C/ Moralzarzal, 86','Madrid','','28034','Espanha','(91) 555 94 44','(91) 555 55 93');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FOLIG','Folies gourmandes','Martine Ranc�','Assistente do Agente de Vendas','184, chauss�e de Tournai','Lille','','59000','Fran�a','20.16.10.16','20.16.10.17');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FOLKO','Folk och f� HB','Maria Larsson','Propriet�rio','�kergatan 24','Br�cke','','S-844 67','Su�cia','0695-34 67 21','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FRANK','Frankenversand','Peter Franken','Gerente de Marketing','Berliner Platz 43','M�nchen','','80805','Alemanha','089-0877310','089-0877451');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FRANR','France restauration','Carine Schmitt','Gerente de Marketing','54, rue Royale','Nantes','','44000','Fran�a','40.32.21.21','40.32.21.20');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FRANS','Franchi S.p.A.','Paolo Accorti','Representante de Vendas','Via Monte Bianco 34','Torino','','10100','It�lia','011-4988260','011-4988261');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FURIB','Furia Bacalhau e Frutos do Mar','Lino Rodriguez ','Gerente de Vendas','Jardim das rosas n. 32','Lisboa','','1675','Portugal','(1) 354-2534','(1) 354-2535');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GALED','Galer�a del gastr�nomo','Eduardo Saavedra','Gerente de Marketing','Rambla de Catalu�a, 23','Barcelona','','08022','Espanha','(93) 203 4560','(93) 203 4561');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GODOS','Godos Cocina T�pica','Jos� Pedro Freyre','Gerente de Vendas','C/ Romero, 33','Sevilla','','41101','Espanha','(95) 555 82 82','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GOURL','Gourmet Lanchonetes','Andr� Fonseca','Assessor de Vendas','Av. Brasil, 442','Campinas','SP','04876-786','Brasil','(11) 555-9482','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GREAL','Great Lakes Food Market','Howard Snyder','Gerente de Marketing','2732 Baker Blvd.','Eugene','OR','97403','EUA','(503) 555-7555','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GROSR','GROSELLA-Restaurante','Manuel Pereira','Propriet�rio','5� Ave. Los Palos Grandes','Caracas','DF','1081','Venezuela','(2) 283-2951','(2) 283-3397');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HANAR','Hanari Carnes','Mario Pontes','Gerente Financeiro','Rua do Pa�o, 67','Rio de Janeiro','RJ','05454-876','Brasil','(21) 555-0091','(21) 555-8765');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HILAA','HILARI�N-Abastos','Carlos Hern�ndez','Representante de Vendas','Carrera 22 con Ave. Carlos Soublette #8-35','San Crist�bal','T�chira','5022','Venezuela','(5) 555-1340','(5) 555-1948');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HUNGC','Hungry Coyote Import Store','Yoshi Latimer','Representante de Vendas','City Center Plaza 516 Main St.','Elgin','OR','97827','EUA','(503) 555-6874','(503) 555-2376');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HUNGO','Hungry Owl All-Night Grocers','Patricia McKenna','Assessor de Vendas','8 Johnstown Road','Cork','Co. Cork','','Irlanda','2967 542','2967 3333');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ISLAT','Island Trading','Helen Bennett','Gerente de Marketing','Garden House Crowther Way','Cowes','Isle of Wigth','PO31 7PJ','Reino Unido','(198) 555-8888','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('KOENE','K�niglich Essen','Philip Cramer','Assessor de Vendas','Maubelstr. 90','Brandenburg','','14776','Alemanha','0555-09876','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LACOR','La corne d abondance','Daniel Tonini','Representante de Vendas','67, avenue de l Europe','Versailles','','78000','Fran�a','30.59.84.10','30.59.85.11');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LAMAI','La maison d Asie','Annette Roulet','Gerente de Vendas','1 rue Alsace-Lorraine','Toulouse','','31000','Fran�a','61.77.61.10','61.77.61.11');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LAUGB','Laughing Bacchus Wine Cellars','Yoshi Tannamuri','Assistente de Marketing','1900 Oak St.','Vancouver','BC','V3F 2K1','Canad�','(604) 555-3392','(604) 555-7293');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LAZYK','Lazy K Kountry Store','John Steel','Gerente de Marketing','12 Orchestra Terrace','Walla Walla','WA','99362','EUA','(509) 555-7969','(509) 555-6221');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LEHMS','Lehmanns Marktstand','Renate Messner','Representante de Vendas','Magazinweg 7','Frankfurt a.M. ','','60528','Alemanha','069-0245984','069-0245874');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LETSS','Let s Stop N Shop','Jaime Yorres','Propriet�rio','87 Polk St. Suite 5','San Francisco','CA','94117','EUA','(415) 555-5938','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LILAS','LILA-Supermercado','Carlos Gonz�lez','Gerente Financeiro','Carrera 52 con Ave. Bol�var #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela','(9) 331-6954','(9) 331-7256');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LINOD','LINO-Delicateses','Felipe Izquierdo','Propriet�rio','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela','(8) 34-56-12','(8) 34-93-93');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LONEP','Lonesome Pine Restaurant','Fran Wilson','Gerente de Vendas','89 Chiaroscuro Rd.','Portland','OR','97219','EUA','(503) 555-9573','(503) 555-9646');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MAGAA','Magazzini Alimentari Riuniti','Giovanni Rovelli','Gerente de Marketing','Via Ludovico il Moro 22','Bergamo','','24100','It�lia','035-640230','035-640231');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MAISD','Maison Dewey','Catherine Dewey','Agente de Vendas','Rue Joseph-Bens 532','Bruxelles','','B-1180','B�lgica','(02) 201 24 67','(02) 201 24 68');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MEREP','M�re Paillarde','Jean Fresni�re','Assistente de Marketing','43 rue St. Laurent','Montr�al','Qu�bec','H1J 1C3','Canad�','(514) 555-8054','(514) 555-8055');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MORGK','Morgenstern Gesundkost','Alexander Feuer','Assistente de Marketing','Heerstr. 22','Leipzig','','04179','Alemanha','0342-023176','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('NORTS','North/South','Simon Crowther','Assessor de Vendas','South House 300 Queensbridge','London','','SW7 1RZ','Reino Unido','(171) 555-7733','(171) 555-2530');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('OCEAN','Oc�ano Atl�ntico Ltda.','Yvonne Moncada','Agente de Vendas','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires','','1010','Argentina','(1) 135-5333','(1) 135-5535');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('OLDWO','Old World Delicatessen','Rene Phillips','Representante de Vendas','2743 Bering St.','Anchorage','AK','99508','EUA','(907) 555-7584','(907) 555-2880');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('OTTIK','Ottilies K�seladen','Henriette Pfalzheim','Propriet�rio','Mehrheimerstr. 369','K�ln','','50739','Alemanha','0221-0644327','0221-0765721');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PARIS','Paris sp�cialit�s','Marie Bertrand','Propriet�rio','265, boulevard Charonne','Paris','','75012','Fran�a','(1) 42.34.22.66','(1) 42.34.22.77');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PERIC','Pericles Comidas cl�sicas','Guillermo Fern�ndez','Representante de Vendas','Calle Dr. Jorge Cash 321','M�xico D.F.','','05033','M�xico','(5) 552-3745','(5) 545-3745');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PICCO','Piccolo und mehr','Georg Pipps','Gerente de Vendas','Geislweg 14','Salzburg','','5020','�ustria','6562-9722','6562-9723');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PRINI','Princesa Isabel Vinhos','Isabel de Castro','Representante de Vendas','Estrada da sa�de n. 58','Lisboa','','1756','Portugal','(1) 356-5634','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('QUEDE','Que Del�cia','Bernardo Batista','Gerente Financeiro','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brasil','(21) 555-4252','(21) 555-4545');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('QUEEN','Queen Cozinha','L�cia Carvalho','Assistente de Marketing','Alameda dos Can�rios, 891','S�o Paulo','SP','05487-020','Brasil','(11) 555-1189','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('QUICK','QUICK-Stop','Horst Kloss','Gerente Financeiro','Taucherstra�e 10','Cunewalde','','01307','Alemanha','0372-035188','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RANCH','Rancho grande','Sergio Guti�rrez','Representante de Vendas','Av. del Libertador 900','Buenos Aires','','1010','Argentina','(1) 123-5555','(1) 123-5556');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RATTC','Rattlesnake Canyon Grocery','Paula Wilson','Assistente do Repr. de Vendas','2817 Milton Dr.','Albuquerque','NM','87110','EUA','(505) 555-5939','(505) 555-3620');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('REGGC','Reggiani Caseifici','Maurizio Moroni','Assessor de Vendas','Strada Provinciale 124','Reggio Emilia','','42100','It�lia','0522-556721','0522-556722');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RICAR','Ricardo Adocicados','Janete Limeira','Assistente do Agente de Vendas','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brasil','(21) 555-3412','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RICSU','Richter Supermarkt','Michael Holz','Gerente de Vendas','Grenzacherweg 237','Gen�ve','','1203','Su��a','0897-034214','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ROMEY','Romero y tomillo','Alejandra Camino','Gerente Financeiro','Gran V�a, 1','Madrid','','28001','Espanha','(91) 745 6200','(91) 745 6210');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SANTG','Sant� Gourmet','Jonas Bergulfsen','Propriet�rio','Erling Skakkes gate 78','Stavern','','4110','Noruega','07-98 92 35','07-98 92 47');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SAVEA','Save-a-lot Markets','Jose Pavarotti','Representante de Vendas','187 Suffolk Ln.','Boise','ID','83720','EUA','(208) 555-8097','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SEVES','Seven Seas Imports','Hari Kumar','Gerente de Vendas','90 Wadhurst Rd.','London','','OX15 4NB','Reino Unido','(171) 555-1717','(171) 555-5646');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SIMOB','Simons bistro','Jytte Petersen','Propriet�rio','Vinb�ltet 34','K�benhavn','','1734','Dinamarca','31 12 34 56','31 13 35 57');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SPECD','Sp�cialit�s du monde','Dominique Perrier','Gerente de Marketing','25, rue Lauriston','Paris','','75016','Fran�a','(1) 47.55.60.10','(1) 47.55.60.20');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SPLIR','Split Rail Beer & Ale','Art Braunschweiger','Gerente de Vendas','P.O. Box 555','Lander','WY','82520','EUA','(307) 555-4680','(307) 555-6525');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SUPRD','Supr�mes d�lices','Pascale Cartrain','Gerente Financeiro','Boulevard Tirou, 255','Charleroi','','B-6000','B�lgica','(071) 23 67 22 20','(071) 23 67 22 21');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('THEBI','The Big Cheese','Liz Nixon','Gerente de Marketing','89 Jefferson Way Suite 2','Portland','OR','97201','EUA','(503) 555-3612','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('THECR','The Cracker Box','Liu Wong','Assistente de Marketing','55 Grizzly Peak Rd.','Butte','MT','59801','EUA','(406) 555-5834','(406) 555-8083');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TOMSP','Toms Spezialit�ten','Karin Josephs','Gerente de Marketing','Luisenstr. 48','M�nster','','44087','Alemanha','0251-031259','0251-035695');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TORTU','Tortuga Restaurante','Miguel Angel Paolino','Propriet�rio','Avda. Azteca 123','M�xico D.F.','','05033','M�xico','(5) 555-2933','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TRADH','Tradi��o Hipermercados','Anabela Domingues','Representante de Vendas','Av. In�s de Castro, 414','S�o Paulo','SP','05634-030','Brasil','(11) 555-2167','(11) 555-2168');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TRAIH','Trail s Head Gourmet Provisioners','Helvetius Nagy','Assessor de Vendas','722 DaVinci Blvd.','Kirkland','WA','98034','EUA','(206) 555-8257','(206) 555-2174');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('VAFFE','Vaffeljernet','Palle Ibsen','Gerente de Vendas','Smagsl�get 45','�rhus','','8200','Dinamarca','86 21 32 43','86 22 33 44');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('VICTE','Victuailles en stock','Mary Saveley','Agente de Vendas','2, rue du Commerce','Lyon','','69004','Fran�a','78.32.54.86','78.32.54.87');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('VINET','Vins et alcools Chevalier','Paul Henriot','Gerente Financeiro','59 rue de l Abbaye','Reims','','51100','Fran�a','26.47.15.10','26.47.15.11');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WANDK','Die Wandernde Kuh','Rita M�ller','Representante de Vendas','Adenauerallee 900','Stuttgart','','70563','Alemanha','0711-020361','0711-035428');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WARTH','Wartian Herkku','Pirkko Koskitalo','Gerente Financeiro','Torikatu 38','Oulu','','90110','Finl�ndia','981-443655','981-443655');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WELLI','Wellington Importadora','Paula Parente','Gerente de Vendas','Rua do Mercado, 12','Resende','SP','08737-363','Brasil','(14) 555-8122','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WHITC','White Clover Markets','Karl Jablonski','Propriet�rio','305 - 14th Ave. S. Suite 3B','Seattle','WA','98128','EUA','(206) 555-4112','(206) 555-4115');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WILMK','Wilman Kala','Matti Karttunen','Propriet�rio/Assist. Marketing','Keskuskatu 45','Helsinki','','21240','Finl�ndia','90-224 8858','90-224 8858');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WOLZA','Wolski  Zajazd','Zbyszek Piestrzeniewicz','Propriet�rio','ul. Filtrowa 68','Warszawa','','01-012','Pol�nia','(26) 642-7012','(26) 642-7012');

---------------------
-- Dados Funcionarios
---------------------
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Davolio','Nancy','Representante de Vendas','1968-12-08','507 - 20th Ave. E.Apt. 2A','Seattle','98122','EUA','(206) 555-9857',5000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Fuller','Andrew','Vice-Presidente de Vendas','1952-02-19','908 W. Capital Way','Tacoma','98401','EUA','(206) 555-9482',10000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Leverling','Janet','Representante de Vendas','1963-08-30','722 Moss Bay Blvd.','Kirkland','98033','EUA','(206) 555-3412',12000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Peacock','Margaret','Representante de Vendas','1958-09-19','4110 Old Redmond Rd.','Redmond','98052','EUA','(206) 555-8122',4500);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Buchanan','Steven','Gerente de Vendas','1955-03-04','14 Garrett Hill','London','SW1 8JR','Reino Unido','(71) 555-4848',11000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Suyama','Michael','Representante de Vendas','1963-07-02','Coventry House Miner Rd.','London','EC2 7JR','Reino Unido','(71) 555-7773',8000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('King','Robert','Representante de Vendas','1960-05-29','Edgeham Hollow Winchester Way','London','RG1 9SP','Reino Unido','(71) 555-5598',11500);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Callahan','Laura','Coordenador de Vendas Internas','1958-01-09','4726 - 11th Ave. N.E.','Seattle','98105','EUA','(206) 555-1189',9500);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Dodsworth','Anne','Representante de Vendas','1969-07-02','7 Houndstooth Rd.','London','WG2 7LT','Reino Unido','(71) 555-4444',4000);

-----------------
-- Dados Produtos
-----------------
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chai',1,1,18,39,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chang',1,1,19,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Aniseed Syrup',1,2,10,13,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chef Anton�s Cajun Seasoning',2,2,22,53,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chef Anton�s Gumbo Mix',2,2,21.35,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Grandma�s Boysenberry Spread',3,2,25,120,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Uncle Bob�s Organic Dried Pears',3,7,30,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Northwoods Cranberry Sauce',3,2,40,6,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Mishi Kobe Niku',4,6,97,29,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Ikura',4,8,31,31,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Queso Cabrales',5,4,21,22,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Queso Manchego La Pastora',5,4,38,86,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Konbu',6,8,6,24,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tofu',6,7,23.25,35,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Genen Shouyu',6,2,15.5,39,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Pavlova',7,3,17.45,29,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Alice Mutton',7,6,39,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Carnarvon Tigers',7,8,62.5,42,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Teatime Chocolate Biscuits',8,3,9.2,25,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sir Rodney�s Marmalade',8,3,81,40,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sir Rodney�s Scones',8,3,10,3,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gustaf�s Kn�ckebr�d',9,5,21,104,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tunnbr�d',9,5,9,61,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Guaran� Fant�stica',10,1,4.5,20,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('NuNuCa Nu�-Nougat-Creme',11,3,14,76,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gumb�r Gummib�rchen',11,3,31.23,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Schoggi Schokolade',11,3,43.9,49,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('R�ssle Sauerkraut',12,7,45.6,26,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Th�ringer Rostbratwurst',12,6,123.79,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Nord-Ost Matjeshering',13,8,25.89,10,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gorgonzola Telino',14,4,12.5,0,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Mascarpone Fabioli',14,4,32,9,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Geitost',15,4,2.5,112,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sasquatch Ale',16,1,14,111,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Steeleye Stout',16,1,18,20,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Inlagd Sill',17,8,19,112,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gravad lax',17,8,26,11,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('C�te de Blaye',18,1,263.5,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chartreuse verte',18,1,18,69,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Boston Crab Meat',19,8,18.4,123,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Jack�s New England Clam Chowder',19,8,9.65,85,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Singaporean Hokkien Fried Mee',20,5,14,26,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Ipoh Coffee',20,1,46,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gula Malacca',20,2,19.45,27,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('R�gede sild',21,8,9.5,5,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Spegesild',21,8,12,95,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Zaanse koeken',22,3,9.5,36,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chocolade',22,3,12.75,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Maxilaku',23,3,20,10,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Valkoinen suklaa',23,3,16.25,65,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Manjimup Dried Apples',24,7,53,20,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Filo Mix',24,5,7,38,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Perth Pasties',24,6,32.8,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tourti�re',25,6,7.45,21,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('P�t� chinois',25,6,24,115,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gnocchi di nonna Alice',26,5,38,21,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Ravioli Angelo',26,5,19.5,36,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Escargots de Bourgogne',27,8,13.25,62,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Raclette Courdavault',28,4,55,79,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Camembert Pierrot',28,4,34,19,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sirop d��rable',29,2,28.5,113,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tarte au sucre',29,3,49.3,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Vegie-spread',7,2,43.9,24,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Wimmers gute Semmelkn�del',12,5,33.25,22,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Louisiana Fiery Hot Pepper Sauce',2,2,21.05,76,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Louisiana Hot Spiced Okra',2,2,17,4,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Laughing Lumberjack Lager',16,1,14,52,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Scottish Longbreads',8,3,12.5,6,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gudbrandsdalsost',15,4,36,26,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Outback Lager',7,1,15,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Fl�temysost',15,4,21.5,26,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Mozzarella di Giovanni',14,4,34.8,14,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('R�d Kaviar',17,8,15,101,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Longlife Tofu',4,7,10,4,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Rh�nbr�u Klosterbier',12,1,7.75,125,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Lakkalik��ri',23,1,18,57,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Original Frankfurter gr�ne So�e',12,2,13,32,0);

----------------
-- Dados Pedidos
----------------
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10248,'VINET',5,'1996/07/04','1996/08/01', 32.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10249,'TOMSP',6,'1996/07/05','1996/08/16', 11.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10250,'HANAR',4,'1996/07/08','1996/08/05', 65.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10251,'VICTE',3,'1996/07/08','1996/08/05', 41.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10252,'SUPRD',4,'1996/07/09','1996/08/06', 51.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10253,'HANAR',3,'1996/07/10','1996/07/24', 58.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10254,'CHOPS',5,'1996/07/11','1996/08/08', 22.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10255,'RICSU',9,'1996/07/12','1996/08/09', 148.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10256,'WELLI',3,'1996/07/15','1996/08/12', 13.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10257,'HILAA',4,'1996/07/16','1996/08/13', 81.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10258,'ERNSH',1,'1996/07/17','1996/08/14', 140.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10259,'CENTC',4,'1996/07/18','1996/08/15', 3.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10260,'OTTIK',4,'1996/07/19','1996/08/16', 55.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10261,'QUEDE',4,'1996/07/19','1996/08/16', 3.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10262,'RATTC',8,'1996/07/22','1996/08/19', 48.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10263,'ERNSH',9,'1996/07/23','1996/08/20', 146.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10264,'FOLKO',6,'1996/07/24','1996/08/21', 3.67)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10265,'BLONP',2,'1996/07/25','1996/08/22', 55.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10266,'WARTH',3,'1996/07/26','1996/09/06', 25.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10267,'FRANK',4,'1996/07/29','1996/08/26', 208.58)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10268,'GROSR',8,'1996/07/30','1996/08/27', 66.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10269,'WHITC',5,'1996/07/31','1996/08/14', 4.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10270,'WARTH',1,'1996/08/01','1996/08/29', 136.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10271,'SPLIR',6,'1996/08/01','1996/08/29', 4.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10272,'RATTC',6,'1996/08/02','1996/08/30', 98.03)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10273,'QUICK',3,'1996/08/05','1996/09/02', 76.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10274,'VINET',6,'1996/08/06','1996/09/03', 6.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10275,'MAGAA',1,'1996/08/07','1996/09/04', 26.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10276,'TORTU',8,'1996/08/08','1996/08/22', 13.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10277,'MORGK',2,'1996/08/09','1996/09/06', 125.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10278,'BERGS',8,'1996/08/12','1996/09/09', 92.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10279,'LEHMS',8,'1996/08/13','1996/09/10', 25.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10280,'BERGS',2,'1996/08/14','1996/09/11', 8.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10281,'ROMEY',4,'1996/08/14','1996/08/28', 2.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10282,'ROMEY',4,'1996/08/15','1996/09/12', 12.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10283,'LILAS',3,'1996/08/16','1996/09/13', 84.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10284,'LEHMS',4,'1996/08/19','1996/09/16', 76.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10285,'QUICK',1,'1996/08/20','1996/09/17', 76.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10286,'QUICK',8,'1996/08/21','1996/09/18', 229.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10287,'RICAR',8,'1996/08/22','1996/09/19', 12.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10288,'REGGC',4,'1996/08/23','1996/09/20', 7.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10289,'BSBEV',7,'1996/08/26','1996/09/23', 22.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10290,'COMMI',8,'1996/08/27','1996/09/24', 79.70)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10291,'QUEDE',6,'1996/08/27','1996/09/24', 6.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10292,'TRADH',1,'1996/08/28','1996/09/25', 1.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10293,'TORTU',1,'1996/08/29','1996/09/26', 21.18)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10294,'RATTC',4,'1996/08/30','1996/09/27', 147.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10295,'VINET',2,'1996/09/02','1996/09/30', 1.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10296,'LILAS',6,'1996/09/03','1996/10/01', 0.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10297,'BLONP',5,'1996/09/04','1996/10/16', 5.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10298,'HUNGO',6,'1996/09/05','1996/10/03', 168.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10299,'RICAR',4,'1996/09/06','1996/10/04', 29.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10300,'MAGAA',2,'1996/09/09','1996/10/07', 17.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10301,'WANDK',8,'1996/09/09','1996/10/07', 45.08)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10302,'SUPRD',4,'1996/09/10','1996/10/08', 6.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10303,'GODOS',7,'1996/09/11','1996/10/09', 107.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10304,'TORTU',1,'1996/09/12','1996/10/10', 63.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10305,'OLDWO',8,'1996/09/13','1996/10/11', 257.62)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10306,'ROMEY',1,'1996/09/16','1996/10/14', 7.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10307,'LONEP',2,'1996/09/17','1996/10/15', 0.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10308,'ANATR',7,'1996/09/18','1996/10/16', 1.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10309,'HUNGO',3,'1996/09/19','1996/10/17', 47.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10310,'THEBI',8,'1996/09/20','1996/10/18', 17.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10311,'DUMON',1,'1996/09/20','1996/10/04', 24.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10312,'WANDK',2,'1996/09/23','1996/10/21', 40.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10313,'QUICK',2,'1996/09/24','1996/10/22', 1.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10314,'RATTC',1,'1996/09/25','1996/10/23', 74.16)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10315,'ISLAT',4,'1996/09/26','1996/10/24', 41.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10316,'RATTC',1,'1996/09/27','1996/10/25', 150.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10317,'LONEP',6,'1996/09/30','1996/10/28', 12.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10318,'ISLAT',8,'1996/10/01','1996/10/29', 4.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10319,'TORTU',7,'1996/10/02','1996/10/30', 64.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10320,'WARTH',5,'1996/10/03','1996/10/17', 34.57)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10321,'ISLAT',3,'1996/10/03','1996/10/31', 3.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10322,'PERIC',7,'1996/10/04','1996/11/01', 0.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10323,'KOENE',4,'1996/10/07','1996/11/04', 4.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10324,'SAVEA',9,'1996/10/08','1996/11/05', 214.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10325,'KOENE',1,'1996/10/09','1996/10/23', 64.86)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10326,'BOLID',4,'1996/10/10','1996/11/07', 77.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10327,'FOLKO',2,'1996/10/11','1996/11/08', 63.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10328,'FURIB',4,'1996/10/14','1996/11/11', 87.03)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10329,'SPLIR',4,'1996/10/15','1996/11/26', 191.67)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10330,'LILAS',3,'1996/10/16','1996/11/13', 12.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10331,'BONAP',9,'1996/10/16','1996/11/27', 10.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10332,'MEREP',3,'1996/10/17','1996/11/28', 52.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10333,'WARTH',5,'1996/10/18','1996/11/15', 0.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10334,'VICTE',8,'1996/10/21','1996/11/18', 8.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10335,'HUNGO',7,'1996/10/22','1996/11/19', 42.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10336,'PRINI',7,'1996/10/23','1996/11/20', 15.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10337,'FRANK',4,'1996/10/24','1996/11/21', 108.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10338,'OLDWO',4,'1996/10/25','1996/11/22', 84.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10339,'MEREP',2,'1996/10/28','1996/11/25', 15.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10340,'BONAP',1,'1996/10/29','1996/11/26', 166.31)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10341,'SIMOB',7,'1996/10/29','1996/11/26', 26.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10342,'FRANK',4,'1996/10/30','1996/11/13', 54.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10343,'LEHMS',4,'1996/10/31','1996/11/28', 110.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10344,'WHITC',4,'1996/11/01','1996/11/29', 23.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10345,'QUICK',2,'1996/11/04','1996/12/02', 249.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10346,'RATTC',3,'1996/11/05','1996/12/17', 142.08)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10347,'FAMIA',4,'1996/11/06','1996/12/04', 3.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10348,'WANDK',4,'1996/11/07','1996/12/05', 0.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10349,'SPLIR',7,'1996/11/08','1996/12/06', 8.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10350,'LAMAI',6,'1996/11/11','1996/12/09', 64.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10351,'ERNSH',1,'1996/11/11','1996/12/09', 162.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10352,'FURIB',3,'1996/11/12','1996/11/26', 1.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10353,'PICCO',7,'1996/11/13','1996/12/11', 360.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10354,'PERIC',8,'1996/11/14','1996/12/12', 53.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10355,'AROUT',6,'1996/11/15','1996/12/13', 41.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10356,'WANDK',6,'1996/11/18','1996/12/16', 36.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10357,'LILAS',1,'1996/11/19','1996/12/17', 34.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10358,'LAMAI',5,'1996/11/20','1996/12/18', 19.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10359,'SEVES',5,'1996/11/21','1996/12/19', 288.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10360,'BLONP',4,'1996/11/22','1996/12/20', 131.70)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10361,'QUICK',1,'1996/11/22','1996/12/20', 183.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10362,'BONAP',3,'1996/11/25','1996/12/23', 96.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10363,'DRACD',4,'1996/11/26','1996/12/24', 30.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10364,'EASTC',1,'1996/11/26','1997/01/07', 71.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10365,'ANTON',3,'1996/11/27','1996/12/25', 22.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10366,'GALED',8,'1996/11/28','1997/01/09', 10.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10367,'VAFFE',7,'1996/11/28','1996/12/26', 13.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10368,'ERNSH',2,'1996/11/29','1996/12/27', 101.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10369,'SPLIR',8,'1996/12/02','1996/12/30', 195.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10370,'CHOPS',6,'1996/12/03','1996/12/31', 1.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10371,'LAMAI',1,'1996/12/03','1996/12/31', 0.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10372,'QUEEN',5,'1996/12/04','1997/01/01', 890.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10373,'HUNGO',4,'1996/12/05','1997/01/02', 124.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10374,'WOLZA',1,'1996/12/05','1997/01/02', 3.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10375,'HUNGC',3,'1996/12/06','1997/01/03', 20.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10376,'MEREP',1,'1996/12/09','1997/01/06', 20.39)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10377,'SEVES',1,'1996/12/09','1997/01/06', 22.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10378,'FOLKO',5,'1996/12/10','1997/01/07', 5.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10379,'QUEDE',2,'1996/12/11','1997/01/08', 45.03)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10380,'HUNGO',8,'1996/12/12','1997/01/09', 35.03)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10381,'LILAS',3,'1996/12/12','1997/01/09', 7.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10382,'ERNSH',4,'1996/12/13','1997/01/10', 94.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10383,'AROUT',8,'1996/12/16','1997/01/13', 34.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10384,'BERGS',3,'1996/12/16','1997/01/13', 168.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10385,'SPLIR',1,'1996/12/17','1997/01/14', 30.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10386,'FAMIA',9,'1996/12/18','1997/01/01', 13.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10387,'SANTG',1,'1996/12/18','1997/01/15', 93.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10388,'SEVES',2,'1996/12/19','1997/01/16', 34.86)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10389,'BOTTM',4,'1996/12/20','1997/01/17', 47.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10390,'ERNSH',6,'1996/12/23','1997/01/20', 126.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10391,'DRACD',3,'1996/12/23','1997/01/20', 5.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10392,'PICCO',2,'1996/12/24','1997/01/21', 122.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10393,'SAVEA',1,'1996/12/25','1997/01/22', 126.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10394,'HUNGC',1,'1996/12/25','1997/01/22', 30.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10395,'HILAA',6,'1996/12/26','1997/01/23', 184.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10396,'FRANK',1,'1996/12/27','1997/01/10', 135.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10397,'PRINI',5,'1996/12/27','1997/01/24', 60.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10398,'SAVEA',2,'1996/12/30','1997/01/27', 89.16)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10399,'VAFFE',8,'1996/12/31','1997/01/14', 27.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10400,'EASTC',1,'1997/01/01','1997/01/29', 83.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10401,'RATTC',1,'1997/01/01','1997/01/29', 12.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10402,'ERNSH',8,'1997/01/02','1997/02/13', 67.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10403,'ERNSH',4,'1997/01/03','1997/01/31', 73.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10404,'MAGAA',2,'1997/01/03','1997/01/31', 155.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10405,'LINOD',1,'1997/01/06','1997/02/03', 34.82)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10406,'QUEEN',7,'1997/01/07','1997/02/18', 108.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10407,'OTTIK',2,'1997/01/07','1997/02/04', 91.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10408,'FOLIG',8,'1997/01/08','1997/02/05', 11.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10409,'OCEAN',3,'1997/01/09','1997/02/06', 29.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10410,'BOTTM',3,'1997/01/10','1997/02/07', 2.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10411,'BOTTM',9,'1997/01/10','1997/02/07', 23.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10412,'WARTH',8,'1997/01/13','1997/02/10', 3.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10413,'LAMAI',3,'1997/01/14','1997/02/11', 95.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10414,'FAMIA',2,'1997/01/14','1997/02/11', 21.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10415,'HUNGC',3,'1997/01/15','1997/02/12', 0.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10416,'WARTH',8,'1997/01/16','1997/02/13', 22.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10417,'SIMOB',4,'1997/01/16','1997/02/13', 70.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10418,'QUICK',4,'1997/01/17','1997/02/14', 17.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10419,'RICSU',4,'1997/01/20','1997/02/17', 137.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10420,'WELLI',3,'1997/01/21','1997/02/18', 44.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10421,'QUEDE',8,'1997/01/21','1997/03/04', 99.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10422,'FRANS',2,'1997/01/22','1997/02/19', 3.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10423,'GOURL',6,'1997/01/23','1997/02/06', 24.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10424,'MEREP',7,'1997/01/23','1997/02/20', 370.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10425,'LAMAI',6,'1997/01/24','1997/02/21', 7.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10426,'GALED',4,'1997/01/27','1997/02/24', 18.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10427,'PICCO',4,'1997/01/27','1997/02/24', 31.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10428,'REGGC',7,'1997/01/28','1997/02/25', 11.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10429,'HUNGO',3,'1997/01/29','1997/03/12', 56.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10430,'ERNSH',4,'1997/01/30','1997/02/13', 458.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10431,'BOTTM',4,'1997/01/30','1997/02/13', 44.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10432,'SPLIR',3,'1997/01/31','1997/02/14', 4.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10433,'PRINI',3,'1997/02/03','1997/03/03', 73.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10434,'FOLKO',3,'1997/02/03','1997/03/03', 17.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10435,'CONSH',8,'1997/02/04','1997/03/18', 9.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10436,'BLONP',3,'1997/02/05','1997/03/05', 156.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10437,'WARTH',8,'1997/02/05','1997/03/05', 19.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10438,'TOMSP',3,'1997/02/06','1997/03/06', 8.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10439,'MEREP',6,'1997/02/07','1997/03/07', 4.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10440,'SAVEA',4,'1997/02/10','1997/03/10', 86.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10441,'OLDWO',3,'1997/02/10','1997/03/24', 73.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10442,'ERNSH',3,'1997/02/11','1997/03/11', 47.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10443,'REGGC',8,'1997/02/12','1997/03/12', 13.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10444,'BERGS',3,'1997/02/12','1997/03/12', 3.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10445,'BERGS',3,'1997/02/13','1997/03/13', 9.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10446,'TOMSP',6,'1997/02/14','1997/03/14', 14.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10447,'RICAR',4,'1997/02/14','1997/03/14', 68.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10448,'RANCH',4,'1997/02/17','1997/03/17', 38.82)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10449,'BLONP',3,'1997/02/18','1997/03/18', 53.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10450,'VICTE',8,'1997/02/19','1997/03/19', 7.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10451,'QUICK',4,'1997/02/19','1997/03/05', 189.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10452,'SAVEA',8,'1997/02/20','1997/03/20', 140.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10453,'AROUT',1,'1997/02/21','1997/03/21', 25.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10454,'LAMAI',4,'1997/02/21','1997/03/21', 2.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10455,'WARTH',8,'1997/02/24','1997/04/07', 180.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10456,'KOENE',8,'1997/02/25','1997/04/08', 8.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10457,'KOENE',2,'1997/02/25','1997/03/25', 11.57)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10458,'SUPRD',7,'1997/02/26','1997/03/26', 147.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10459,'VICTE',4,'1997/02/27','1997/03/27', 25.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10460,'FOLKO',8,'1997/02/28','1997/03/28', 16.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10461,'LILAS',1,'1997/02/28','1997/03/28', 148.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10462,'CONSH',2,'1997/03/03','1997/03/31', 6.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10463,'SUPRD',5,'1997/03/04','1997/04/01', 14.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10464,'FURIB',4,'1997/03/04','1997/04/01', 89.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10465,'VAFFE',1,'1997/03/05','1997/04/02', 145.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10466,'COMMI',4,'1997/03/06','1997/04/03', 11.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10467,'MAGAA',8,'1997/03/06','1997/04/03', 4.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10468,'KOENE',3,'1997/03/07','1997/04/04', 44.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10469,'WHITC',1,'1997/03/10','1997/04/07', 60.18)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10470,'BONAP',4,'1997/03/11','1997/04/08', 64.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10471,'BSBEV',2,'1997/03/11','1997/04/08', 45.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10472,'SEVES',8,'1997/03/12','1997/04/09', 4.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10473,'ISLAT',1,'1997/03/13','1997/03/27', 16.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10474,'PERIC',5,'1997/03/13','1997/04/10', 83.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10475,'SUPRD',9,'1997/03/14','1997/04/11', 68.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10476,'HILAA',8,'1997/03/17','1997/04/14', 4.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10477,'PRINI',5,'1997/03/17','1997/04/14', 13.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10478,'VICTE',2,'1997/03/18','1997/04/01', 4.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10479,'RATTC',3,'1997/03/19','1997/04/16', 708.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10480,'FOLIG',6,'1997/03/20','1997/04/17', 1.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10481,'RICAR',8,'1997/03/20','1997/04/17', 64.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10482,'LAZYK',1,'1997/03/21','1997/04/18', 7.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10483,'WHITC',7,'1997/03/24','1997/04/21', 15.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10484,'BSBEV',3,'1997/03/24','1997/04/21', 6.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10485,'LINOD',4,'1997/03/25','1997/04/08', 64.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10486,'HILAA',1,'1997/03/26','1997/04/23', 30.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10487,'QUEEN',2,'1997/03/26','1997/04/23', 71.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10488,'FRANK',8,'1997/03/27','1997/04/24', 4.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10489,'PICCO',6,'1997/03/28','1997/04/25', 5.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10490,'HILAA',7,'1997/03/31','1997/04/28', 210.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10491,'FURIB',8,'1997/03/31','1997/04/28', 16.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10492,'BOTTM',3,'1997/04/01','1997/04/29', 62.89)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10493,'LAMAI',4,'1997/04/02','1997/04/30', 10.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10494,'COMMI',4,'1997/04/02','1997/04/30', 65.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10495,'LAUGB',3,'1997/04/03','1997/05/01', 4.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10496,'TRADH',7,'1997/04/04','1997/05/02', 46.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10497,'LEHMS',7,'1997/04/04','1997/05/02', 36.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10498,'HILAA',8,'1997/04/07','1997/05/05', 29.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10499,'LILAS',4,'1997/04/08','1997/05/06', 102.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10500,'LAMAI',6,'1997/04/09','1997/05/07', 42.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10501,'BLAUS',9,'1997/04/09','1997/05/07', 8.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10502,'PERIC',2,'1997/04/10','1997/05/08', 69.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10503,'HUNGO',6,'1997/04/11','1997/05/09', 16.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10504,'WHITC',4,'1997/04/11','1997/05/09', 59.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10505,'MEREP',3,'1997/04/14','1997/05/12', 7.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10506,'KOENE',9,'1997/04/15','1997/05/13', 21.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10507,'ANTON',7,'1997/04/15','1997/05/13', 47.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10508,'OTTIK',1,'1997/04/16','1997/05/14', 4.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10509,'BLAUS',4,'1997/04/17','1997/05/15', 0.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10510,'SAVEA',6,'1997/04/18','1997/05/16', 367.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10511,'BONAP',4,'1997/04/18','1997/05/16', 350.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10512,'FAMIA',7,'1997/04/21','1997/05/19', 3.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10513,'WANDK',7,'1997/04/22','1997/06/03', 105.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10514,'ERNSH',3,'1997/04/22','1997/05/20', 789.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10515,'QUICK',2,'1997/04/23','1997/05/07', 204.47)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10516,'HUNGO',2,'1997/04/24','1997/05/22', 62.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10517,'NORTS',3,'1997/04/24','1997/05/22', 32.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10518,'TORTU',4,'1997/04/25','1997/05/09', 218.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10519,'CHOPS',6,'1997/04/28','1997/05/26', 91.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10520,'SANTG',7,'1997/04/29','1997/05/27', 13.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10521,'CACTU',8,'1997/04/29','1997/05/27', 17.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10522,'LEHMS',4,'1997/04/30','1997/05/28', 45.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10523,'SEVES',7,'1997/05/01','1997/05/29', 77.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10524,'BERGS',1,'1997/05/01','1997/05/29', 244.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10525,'BONAP',1,'1997/05/02','1997/05/30', 11.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10526,'WARTH',4,'1997/05/05','1997/06/02', 58.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10527,'QUICK',7,'1997/05/05','1997/06/02', 41.90)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10528,'GREAL',6,'1997/05/06','1997/05/20', 3.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10529,'MAISD',5,'1997/05/07','1997/06/04', 66.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10530,'PICCO',3,'1997/05/08','1997/06/05', 339.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10531,'OCEAN',7,'1997/05/08','1997/06/05', 8.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10532,'EASTC',7,'1997/05/09','1997/06/06', 74.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10533,'FOLKO',8,'1997/05/12','1997/06/09', 188.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10534,'LEHMS',8,'1997/05/12','1997/06/09', 27.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10535,'ANTON',4,'1997/05/13','1997/06/10', 15.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10536,'LEHMS',3,'1997/05/14','1997/06/11', 58.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10537,'RICSU',1,'1997/05/14','1997/05/28', 78.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10538,'BSBEV',9,'1997/05/15','1997/06/12', 4.87)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10539,'BSBEV',6,'1997/05/16','1997/06/13', 12.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10540,'QUICK',3,'1997/05/19','1997/06/16', 1007.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10541,'HANAR',2,'1997/05/19','1997/06/16', 68.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10542,'KOENE',1,'1997/05/20','1997/06/17', 10.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10543,'LILAS',8,'1997/05/21','1997/06/18', 48.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10544,'LONEP',4,'1997/05/21','1997/06/18', 24.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10545,'LAZYK',8,'1997/05/22','1997/06/19', 11.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10546,'VICTE',1,'1997/05/23','1997/06/20', 194.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10547,'SEVES',3,'1997/05/23','1997/06/20', 178.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10548,'TOMSP',3,'1997/05/26','1997/06/23', 1.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10549,'QUICK',5,'1997/05/27','1997/06/10', 171.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10550,'GODOS',7,'1997/05/28','1997/06/25', 4.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10551,'FURIB',4,'1997/05/28','1997/07/09', 72.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10552,'HILAA',2,'1997/05/29','1997/06/26', 83.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10553,'WARTH',2,'1997/05/30','1997/06/27', 149.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10554,'OTTIK',4,'1997/05/30','1997/06/27', 120.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10555,'SAVEA',6,'1997/06/02','1997/06/30', 252.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10556,'SIMOB',2,'1997/06/03','1997/07/15', 9.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10557,'LEHMS',9,'1997/06/03','1997/06/17', 96.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10558,'AROUT',1,'1997/06/04','1997/07/02', 72.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10559,'BLONP',6,'1997/06/05','1997/07/03', 8.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10560,'FRANK',8,'1997/06/06','1997/07/04', 36.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10561,'FOLKO',2,'1997/06/06','1997/07/04', 242.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10562,'REGGC',1,'1997/06/09','1997/07/07', 22.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10563,'RICAR',2,'1997/06/10','1997/07/22', 60.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10564,'RATTC',4,'1997/06/10','1997/07/08', 13.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10565,'MEREP',8,'1997/06/11','1997/07/09', 7.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10566,'BLONP',9,'1997/06/12','1997/07/10', 88.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10567,'HUNGO',1,'1997/06/12','1997/07/10', 33.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10568,'GALED',3,'1997/06/13','1997/07/11', 6.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10569,'RATTC',5,'1997/06/16','1997/07/14', 58.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10570,'MEREP',3,'1997/06/17','1997/07/15', 188.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10571,'ERNSH',8,'1997/06/17','1997/07/29', 26.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10572,'BERGS',3,'1997/06/18','1997/07/16', 116.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10573,'ANTON',7,'1997/06/19','1997/07/17', 84.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10574,'TRAIH',4,'1997/06/19','1997/07/17', 37.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10575,'MORGK',5,'1997/06/20','1997/07/04', 127.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10576,'TORTU',3,'1997/06/23','1997/07/07', 18.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10577,'TRAIH',9,'1997/06/23','1997/08/04', 25.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10578,'BSBEV',4,'1997/06/24','1997/07/22', 29.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10579,'LETSS',1,'1997/06/25','1997/07/23', 13.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10580,'OTTIK',4,'1997/06/26','1997/07/24', 75.89)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10581,'FAMIA',3,'1997/06/26','1997/07/24', 3.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10582,'BLAUS',3,'1997/06/27','1997/07/25', 27.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10583,'WARTH',2,'1997/06/30','1997/07/28', 7.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10584,'BLONP',4,'1997/06/30','1997/07/28', 59.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10585,'WELLI',7,'1997/07/01','1997/07/29', 13.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10586,'REGGC',9,'1997/07/02','1997/07/30', 0.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10587,'QUEDE',1,'1997/07/02','1997/07/30', 62.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10588,'QUICK',2,'1997/07/03','1997/07/31', 194.67)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10589,'GREAL',8,'1997/07/04','1997/08/01', 4.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10590,'MEREP',4,'1997/07/07','1997/08/04', 44.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10591,'VAFFE',1,'1997/07/07','1997/07/21', 55.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10592,'LEHMS',3,'1997/07/08','1997/08/05', 32.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10593,'LEHMS',7,'1997/07/09','1997/08/06', 174.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10594,'OLDWO',3,'1997/07/09','1997/08/06', 5.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10595,'ERNSH',2,'1997/07/10','1997/08/07', 96.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10596,'WHITC',8,'1997/07/11','1997/08/08', 16.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10597,'PICCO',7,'1997/07/11','1997/08/08', 35.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10598,'RATTC',1,'1997/07/14','1997/08/11', 44.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10599,'BSBEV',6,'1997/07/15','1997/08/26', 29.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10600,'HUNGC',4,'1997/07/16','1997/08/13', 45.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10601,'HILAA',7,'1997/07/16','1997/08/27', 58.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10602,'VAFFE',8,'1997/07/17','1997/08/14', 2.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10603,'SAVEA',8,'1997/07/18','1997/08/15', 48.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10604,'FURIB',1,'1997/07/18','1997/08/15', 7.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10605,'MEREP',1,'1997/07/21','1997/08/18', 379.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10606,'TRADH',4,'1997/07/22','1997/08/19', 79.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10607,'SAVEA',5,'1997/07/22','1997/08/19', 200.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10608,'TOMSP',4,'1997/07/23','1997/08/20', 27.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10609,'DUMON',7,'1997/07/24','1997/08/21', 1.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10610,'LAMAI',8,'1997/07/25','1997/08/22', 26.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10611,'WOLZA',6,'1997/07/25','1997/08/22', 80.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10612,'SAVEA',1,'1997/07/28','1997/08/25', 544.08)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10613,'HILAA',4,'1997/07/29','1997/08/26', 8.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10614,'BLAUS',8,'1997/07/29','1997/08/26', 1.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10615,'WILMK',2,'1997/07/30','1997/08/27', 0.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10616,'GREAL',1,'1997/07/31','1997/08/28', 116.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10617,'GREAL',4,'1997/07/31','1997/08/28', 18.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10618,'MEREP',1,'1997/08/01','1997/09/12', 154.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10619,'MEREP',3,'1997/08/04','1997/09/01', 91.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10620,'LAUGB',2,'1997/08/05','1997/09/02', 0.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10621,'ISLAT',4,'1997/08/05','1997/09/02', 23.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10622,'RICAR',4,'1997/08/06','1997/09/03', 50.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10623,'FRANK',8,'1997/08/07','1997/09/04', 97.18)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10624,'THECR',4,'1997/08/07','1997/09/04', 94.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10625,'ANATR',3,'1997/08/08','1997/09/05', 43.90)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10626,'BERGS',1,'1997/08/11','1997/09/08', 138.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10627,'SAVEA',8,'1997/08/11','1997/09/22', 107.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10628,'BLONP',4,'1997/08/12','1997/09/09', 30.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10629,'GODOS',4,'1997/08/12','1997/09/09', 85.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10630,'KOENE',1,'1997/08/13','1997/09/10', 32.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10631,'LAMAI',8,'1997/08/14','1997/09/11', 0.87)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10632,'WANDK',8,'1997/08/14','1997/09/11', 41.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10633,'ERNSH',7,'1997/08/15','1997/09/12', 477.90)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10634,'FOLIG',4,'1997/08/15','1997/09/12', 487.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10635,'MAGAA',8,'1997/08/18','1997/09/15', 47.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10636,'WARTH',4,'1997/08/19','1997/09/16', 1.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10637,'QUEEN',6,'1997/08/19','1997/09/16', 201.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10638,'LINOD',3,'1997/08/20','1997/09/17', 158.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10639,'SANTG',7,'1997/08/20','1997/09/17', 38.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10640,'WANDK',4,'1997/08/21','1997/09/18', 23.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10641,'HILAA',4,'1997/08/22','1997/09/19', 179.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10642,'SIMOB',7,'1997/08/22','1997/09/19', 41.89)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10643,'ALFKI',6,'1997/08/25','1997/09/22', 29.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10644,'WELLI',3,'1997/08/25','1997/09/22', 0.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10645,'HANAR',4,'1997/08/26','1997/09/23', 12.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10646,'HUNGO',9,'1997/08/27','1997/10/08', 142.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10647,'QUEDE',4,'1997/08/27','1997/09/10', 45.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10648,'RICAR',5,'1997/08/28','1997/10/09', 14.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10649,'MAISD',5,'1997/08/28','1997/09/25', 6.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10650,'FAMIA',5,'1997/08/29','1997/09/26', 176.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10651,'WANDK',8,'1997/09/01','1997/09/29', 20.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10652,'GOURL',4,'1997/09/01','1997/09/29', 7.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10653,'FRANK',1,'1997/09/02','1997/09/30', 93.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10654,'BERGS',5,'1997/09/02','1997/09/30', 55.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10655,'REGGC',1,'1997/09/03','1997/10/01', 4.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10656,'GREAL',6,'1997/09/04','1997/10/02', 57.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10657,'SAVEA',2,'1997/09/04','1997/10/02', 352.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10658,'QUICK',4,'1997/09/05','1997/10/03', 364.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10659,'QUEEN',7,'1997/09/05','1997/10/03', 105.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10660,'HUNGC',8,'1997/09/08','1997/10/06', 111.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10661,'HUNGO',7,'1997/09/09','1997/10/07', 17.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10662,'LONEP',3,'1997/09/09','1997/10/07', 1.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10663,'BONAP',2,'1997/09/10','1997/09/24', 113.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10664,'FURIB',1,'1997/09/10','1997/10/08', 1.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10665,'LONEP',1,'1997/09/11','1997/10/09', 26.31)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10666,'RICSU',7,'1997/09/12','1997/10/10', 232.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10667,'ERNSH',7,'1997/09/12','1997/10/10', 78.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10668,'WANDK',1,'1997/09/15','1997/10/13', 47.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10669,'SIMOB',2,'1997/09/15','1997/10/13', 24.39)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10670,'FRANK',4,'1997/09/16','1997/10/14', 203.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10671,'FRANR',1,'1997/09/17','1997/10/15', 30.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10672,'BERGS',9,'1997/09/17','1997/10/01', 95.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10673,'WILMK',2,'1997/09/18','1997/10/16', 22.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10674,'ISLAT',4,'1997/09/18','1997/10/16', 0.90)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10675,'FRANK',5,'1997/09/19','1997/10/17', 31.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10676,'TORTU',2,'1997/09/22','1997/10/20', 2.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10677,'ANTON',1,'1997/09/22','1997/10/20', 4.03)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10678,'SAVEA',7,'1997/09/23','1997/10/21', 388.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10679,'BLONP',8,'1997/09/23','1997/10/21', 27.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10680,'OLDWO',1,'1997/09/24','1997/10/22', 26.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10681,'GREAL',3,'1997/09/25','1997/10/23', 76.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10682,'ANTON',3,'1997/09/25','1997/10/23', 36.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10683,'DUMON',2,'1997/09/26','1997/10/24', 4.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10684,'OTTIK',3,'1997/09/26','1997/10/24', 145.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10685,'GOURL',4,'1997/09/29','1997/10/13', 33.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10686,'PICCO',2,'1997/09/30','1997/10/28', 96.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10687,'HUNGO',9,'1997/09/30','1997/10/28', 296.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10688,'VAFFE',4,'1997/10/01','1997/10/15', 299.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10689,'BERGS',1,'1997/10/01','1997/10/29', 13.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10690,'HANAR',1,'1997/10/02','1997/10/30', 15.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10691,'QUICK',2,'1997/10/03','1997/11/14', 810.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10692,'ALFKI',4,'1997/10/03','1997/10/31', 61.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10693,'WHITC',3,'1997/10/06','1997/10/20', 139.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10694,'QUICK',8,'1997/10/06','1997/11/03', 398.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10695,'WILMK',7,'1997/10/07','1997/11/18', 16.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10696,'WHITC',8,'1997/10/08','1997/11/19', 102.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10697,'LINOD',3,'1997/10/08','1997/11/05', 45.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10698,'ERNSH',4,'1997/10/09','1997/11/06', 272.47)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10699,'MORGK',3,'1997/10/09','1997/11/06', 0.58)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10700,'SAVEA',3,'1997/10/10','1997/11/07', 65.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10701,'HUNGO',6,'1997/10/13','1997/10/27', 220.31)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10702,'ALFKI',4,'1997/10/13','1997/11/24', 23.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10703,'FOLKO',6,'1997/10/14','1997/11/11', 152.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10704,'QUEEN',6,'1997/10/14','1997/11/11', 4.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10705,'HILAA',9,'1997/10/15','1997/11/12', 3.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10706,'OLDWO',8,'1997/10/16','1997/11/13', 135.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10707,'AROUT',4,'1997/10/16','1997/10/30', 21.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10708,'THEBI',6,'1997/10/17','1997/11/28', 2.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10709,'GOURL',1,'1997/10/17','1997/11/14', 210.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10710,'FRANS',1,'1997/10/20','1997/11/17', 4.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10711,'SAVEA',5,'1997/10/21','1997/12/02', 52.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10712,'HUNGO',3,'1997/10/21','1997/11/18', 89.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10713,'SAVEA',1,'1997/10/22','1997/11/19', 167.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10714,'SAVEA',5,'1997/10/22','1997/11/19', 24.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10715,'BONAP',3,'1997/10/23','1997/11/06', 63.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10716,'RANCH',4,'1997/10/24','1997/11/21', 22.57)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10717,'FRANK',1,'1997/10/24','1997/11/21', 59.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10718,'KOENE',1,'1997/10/27','1997/11/24', 170.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10719,'LETSS',8,'1997/10/27','1997/11/24', 51.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10720,'QUEDE',8,'1997/10/28','1997/11/11', 9.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10721,'QUICK',5,'1997/10/29','1997/11/26', 48.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10722,'SAVEA',8,'1997/10/29','1997/12/10', 74.58)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10723,'WHITC',3,'1997/10/30','1997/11/27', 21.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10724,'MEREP',8,'1997/10/30','1997/12/11', 57.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10725,'FAMIA',4,'1997/10/31','1997/11/28', 10.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10726,'EASTC',4,'1997/11/03','1997/11/17', 16.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10727,'REGGC',2,'1997/11/03','1997/12/01', 89.90)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10728,'QUEEN',4,'1997/11/04','1997/12/02', 58.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10729,'LINOD',8,'1997/11/04','1997/12/16', 141.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10730,'BONAP',5,'1997/11/05','1997/12/03', 20.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10731,'CHOPS',7,'1997/11/06','1997/12/04', 96.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10732,'BONAP',3,'1997/11/06','1997/12/04', 16.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10733,'BERGS',1,'1997/11/07','1997/12/05', 110.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10734,'GOURL',2,'1997/11/07','1997/12/05', 1.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10735,'LETSS',6,'1997/11/10','1997/12/08', 45.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10736,'HUNGO',9,'1997/11/11','1997/12/09', 44.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10737,'VINET',2,'1997/11/11','1997/12/09', 7.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10738,'SPECD',2,'1997/11/12','1997/12/10', 2.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10739,'VINET',3,'1997/11/12','1997/12/10', 11.08)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10740,'WHITC',4,'1997/11/13','1997/12/11', 81.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10741,'AROUT',4,'1997/11/14','1997/11/28', 10.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10742,'BOTTM',3,'1997/11/14','1997/12/12', 243.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10743,'AROUT',1,'1997/11/17','1997/12/15', 23.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10744,'VAFFE',6,'1997/11/17','1997/12/15', 69.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10745,'QUICK',9,'1997/11/18','1997/12/16', 3.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10746,'CHOPS',1,'1997/11/19','1997/12/17', 31.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10747,'PICCO',6,'1997/11/19','1997/12/17', 117.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10748,'SAVEA',3,'1997/11/20','1997/12/18', 232.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10749,'ISLAT',4,'1997/11/20','1997/12/18', 61.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10750,'WARTH',9,'1997/11/21','1997/12/19', 79.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10751,'RICSU',3,'1997/11/24','1997/12/22', 130.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10752,'NORTS',2,'1997/11/24','1997/12/22', 1.39)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10753,'FRANS',3,'1997/11/25','1997/12/23', 7.70)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10754,'MAGAA',6,'1997/11/25','1997/12/23', 2.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10755,'BONAP',4,'1997/11/26','1997/12/24', 16.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10756,'SPLIR',8,'1997/11/27','1997/12/25', 73.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10757,'SAVEA',6,'1997/11/27','1997/12/25', 8.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10758,'RICSU',3,'1997/11/28','1997/12/26', 138.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10759,'ANATR',3,'1997/11/28','1997/12/26', 11.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10760,'MAISD',4,'1997/12/01','1997/12/29', 155.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10761,'RATTC',5,'1997/12/02','1997/12/30', 18.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10762,'FOLKO',3,'1997/12/02','1997/12/30', 328.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10763,'FOLIG',3,'1997/12/03','1997/12/31', 37.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10764,'ERNSH',6,'1997/12/03','1997/12/31', 145.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10765,'QUICK',3,'1997/12/04','1998/01/01', 42.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10766,'OTTIK',4,'1997/12/05','1998/01/02', 157.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10767,'SUPRD',4,'1997/12/05','1998/01/02', 1.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10768,'AROUT',3,'1997/12/08','1998/01/05', 146.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10769,'VAFFE',3,'1997/12/08','1998/01/05', 65.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10770,'HANAR',8,'1997/12/09','1998/01/06', 5.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10771,'ERNSH',9,'1997/12/10','1998/01/07', 11.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10772,'LEHMS',3,'1997/12/10','1998/01/07', 91.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10773,'ERNSH',1,'1997/12/11','1998/01/08', 96.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10774,'FOLKO',4,'1997/12/11','1997/12/25', 48.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10775,'THECR',7,'1997/12/12','1998/01/09', 20.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10776,'ERNSH',1,'1997/12/15','1998/01/12', 351.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10777,'GOURL',7,'1997/12/15','1997/12/29', 3.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10778,'BERGS',3,'1997/12/16','1998/01/13', 6.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10779,'MORGK',3,'1997/12/16','1998/01/13', 58.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10780,'LILAS',2,'1997/12/16','1997/12/30', 42.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10781,'WARTH',2,'1997/12/17','1998/01/14', 73.16)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10782,'CACTU',9,'1997/12/17','1998/01/14', 1.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10783,'HANAR',4,'1997/12/18','1998/01/15', 124.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10784,'MAGAA',4,'1997/12/18','1998/01/15', 70.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10785,'GROSR',1,'1997/12/18','1998/01/15', 1.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10786,'QUEEN',8,'1997/12/19','1998/01/16', 110.87)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10787,'LAMAI',2,'1997/12/19','1998/01/02', 249.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10788,'QUICK',1,'1997/12/22','1998/01/19', 42.70)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10789,'FOLIG',1,'1997/12/22','1998/01/19', 100.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10790,'GOURL',6,'1997/12/22','1998/01/19', 28.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10791,'FRANK',6,'1997/12/23','1998/01/20', 16.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10792,'WOLZA',1,'1997/12/23','1998/01/20', 23.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10793,'AROUT',3,'1997/12/24','1998/01/21', 4.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10794,'QUEDE',6,'1997/12/24','1998/01/21', 21.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10795,'ERNSH',8,'1997/12/24','1998/01/21', 126.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10796,'HILAA',3,'1997/12/25','1998/01/22', 26.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10797,'DRACD',7,'1997/12/25','1998/01/22', 33.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10798,'ISLAT',2,'1997/12/26','1998/01/23', 2.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10799,'KOENE',9,'1997/12/26','1998/02/06', 30.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10800,'SEVES',1,'1997/12/26','1998/01/23', 137.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10801,'BOLID',4,'1997/12/29','1998/01/26', 97.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10802,'SIMOB',4,'1997/12/29','1998/01/26', 257.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10803,'WELLI',4,'1997/12/30','1998/01/27', 55.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10804,'SEVES',6,'1997/12/30','1998/01/27', 27.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10805,'THEBI',2,'1997/12/30','1998/01/27', 237.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10806,'VICTE',3,'1997/12/31','1998/01/28', 22.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10807,'FRANS',4,'1997/12/31','1998/01/28', 1.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10808,'OLDWO',2,'1998/01/01','1998/01/29', 45.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10809,'WELLI',7,'1998/01/01','1998/01/29', 4.87)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10810,'LAUGB',2,'1998/01/01','1998/01/29', 4.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10811,'LINOD',8,'1998/01/02','1998/01/30', 31.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10812,'REGGC',5,'1998/01/02','1998/01/30', 59.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10813,'RICAR',1,'1998/01/05','1998/02/02', 47.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10814,'VICTE',3,'1998/01/05','1998/02/02', 130.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10815,'SAVEA',2,'1998/01/05','1998/02/02', 14.62)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10816,'GREAL',4,'1998/01/06','1998/02/03', 719.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10817,'KOENE',3,'1998/01/06','1998/01/20', 306.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10818,'MAGAA',7,'1998/01/07','1998/02/04', 65.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10819,'CACTU',2,'1998/01/07','1998/02/04', 19.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10820,'RATTC',3,'1998/01/07','1998/02/04', 37.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10821,'SPLIR',1,'1998/01/08','1998/02/05', 36.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10822,'TRAIH',6,'1998/01/08','1998/02/05', 7.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10823,'LILAS',5,'1998/01/09','1998/02/06', 163.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10824,'FOLKO',8,'1998/01/09','1998/02/06', 1.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10825,'DRACD',1,'1998/01/09','1998/02/06', 79.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10826,'BLONP',6,'1998/01/12','1998/02/09', 7.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10827,'BONAP',1,'1998/01/12','1998/01/26', 63.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10828,'RANCH',9,'1998/01/13','1998/01/27', 90.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10829,'ISLAT',9,'1998/01/13','1998/02/10', 154.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10830,'TRADH',4,'1998/01/13','1998/02/24', 81.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10831,'SANTG',3,'1998/01/14','1998/02/11', 72.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10832,'LAMAI',2,'1998/01/14','1998/02/11', 43.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10833,'OTTIK',6,'1998/01/15','1998/02/12', 71.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10834,'TRADH',1,'1998/01/15','1998/02/12', 29.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10835,'ALFKI',1,'1998/01/15','1998/02/12', 69.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10836,'ERNSH',7,'1998/01/16','1998/02/13', 411.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10837,'BERGS',9,'1998/01/16','1998/02/13', 13.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10838,'LINOD',3,'1998/01/19','1998/02/16', 59.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10839,'TRADH',3,'1998/01/19','1998/02/16', 35.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10840,'LINOD',4,'1998/01/19','1998/03/02', 2.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10841,'SUPRD',5,'1998/01/20','1998/02/17', 424.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10842,'TORTU',1,'1998/01/20','1998/02/17', 54.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10843,'VICTE',4,'1998/01/21','1998/02/18', 9.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10844,'PICCO',8,'1998/01/21','1998/02/18', 25.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10845,'QUICK',8,'1998/01/21','1998/02/04', 212.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10846,'SUPRD',2,'1998/01/22','1998/03/05', 56.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10847,'SAVEA',4,'1998/01/22','1998/02/05', 487.57)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10848,'CONSH',7,'1998/01/23','1998/02/20', 38.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10849,'KOENE',9,'1998/01/23','1998/02/20', 0.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10850,'VICTE',1,'1998/01/23','1998/03/06', 49.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10851,'RICAR',5,'1998/01/26','1998/02/23', 160.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10852,'RATTC',8,'1998/01/26','1998/02/09', 174.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10853,'BLAUS',9,'1998/01/27','1998/02/24', 53.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10854,'ERNSH',3,'1998/01/27','1998/02/24', 100.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10855,'OLDWO',3,'1998/01/27','1998/02/24', 170.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10856,'ANTON',3,'1998/01/28','1998/02/25', 58.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10857,'BERGS',8,'1998/01/28','1998/02/25', 188.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10858,'LACOR',2,'1998/01/29','1998/02/26', 52.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10859,'FRANK',1,'1998/01/29','1998/02/26', 76.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10860,'FRANR',3,'1998/01/29','1998/02/26', 19.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10861,'WHITC',4,'1998/01/30','1998/02/27', 14.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10862,'LEHMS',8,'1998/01/30','1998/03/13', 53.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10863,'HILAA',4,'1998/02/02','1998/03/02', 30.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10864,'AROUT',4,'1998/02/02','1998/03/02', 3.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10865,'QUICK',2,'1998/02/02','1998/02/16', 348.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10866,'BERGS',5,'1998/02/03','1998/03/03', 109.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10867,'LONEP',6,'1998/02/03','1998/03/17', 1.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10868,'QUEEN',7,'1998/02/04','1998/03/04', 191.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10869,'SEVES',5,'1998/02/04','1998/03/04', 143.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10870,'WOLZA',5,'1998/02/04','1998/03/04', 12.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10871,'BONAP',9,'1998/02/05','1998/03/05', 112.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10872,'GODOS',5,'1998/02/05','1998/03/05', 175.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10873,'WILMK',4,'1998/02/06','1998/03/06', 0.82)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10874,'GODOS',5,'1998/02/06','1998/03/06', 19.58)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10875,'BERGS',4,'1998/02/06','1998/03/06', 32.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10876,'BONAP',7,'1998/02/09','1998/03/09', 60.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10877,'RICAR',1,'1998/02/09','1998/03/09', 38.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10878,'QUICK',4,'1998/02/10','1998/03/10', 46.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10879,'WILMK',3,'1998/02/10','1998/03/10', 8.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10880,'FOLKO',7,'1998/02/10','1998/03/24', 88.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10881,'CACTU',4,'1998/02/11','1998/03/11', 2.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10882,'SAVEA',4,'1998/02/11','1998/03/11', 23.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10883,'LONEP',8,'1998/02/12','1998/03/12', 0.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10884,'LETSS',4,'1998/02/12','1998/03/12', 90.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10885,'SUPRD',6,'1998/02/12','1998/03/12', 5.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10886,'HANAR',1,'1998/02/13','1998/03/13', 4.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10887,'GALED',8,'1998/02/13','1998/03/13', 1.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10888,'GODOS',1,'1998/02/16','1998/03/16', 51.87)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10889,'RATTC',9,'1998/02/16','1998/03/16', 280.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10890,'DUMON',7,'1998/02/16','1998/03/16', 32.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10891,'LEHMS',7,'1998/02/17','1998/03/17', 20.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10892,'MAISD',4,'1998/02/17','1998/03/17', 120.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10893,'KOENE',9,'1998/02/18','1998/03/18', 77.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10894,'SAVEA',1,'1998/02/18','1998/03/18', 116.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10895,'ERNSH',3,'1998/02/18','1998/03/18', 162.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10896,'MAISD',7,'1998/02/19','1998/03/19', 32.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10897,'HUNGO',3,'1998/02/19','1998/03/19', 603.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10898,'OCEAN',4,'1998/02/20','1998/03/20', 1.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10899,'LILAS',5,'1998/02/20','1998/03/20', 1.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10900,'WELLI',1,'1998/02/20','1998/03/20', 1.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10901,'HILAA',4,'1998/02/23','1998/03/23', 62.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10902,'FOLKO',1,'1998/02/23','1998/03/23', 44.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10903,'HANAR',3,'1998/02/24','1998/03/24', 36.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10904,'WHITC',3,'1998/02/24','1998/03/24', 162.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10905,'WELLI',9,'1998/02/24','1998/03/24', 13.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10906,'WOLZA',4,'1998/02/25','1998/03/11', 26.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10907,'SPECD',6,'1998/02/25','1998/03/25', 9.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10908,'REGGC',4,'1998/02/26','1998/03/26', 32.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10909,'SANTG',1,'1998/02/26','1998/03/26', 53.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10910,'WILMK',1,'1998/02/26','1998/03/26', 38.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10911,'GODOS',3,'1998/02/26','1998/03/26', 38.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10912,'HUNGO',2,'1998/02/26','1998/03/26', 580.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10913,'QUEEN',4,'1998/02/26','1998/03/26', 33.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10914,'QUEEN',6,'1998/02/27','1998/03/27', 21.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10915,'TORTU',2,'1998/02/27','1998/03/27', 3.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10916,'RANCH',1,'1998/02/27','1998/03/27', 63.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10917,'ROMEY',4,'1998/03/02','1998/03/30', 8.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10918,'BOTTM',3,'1998/03/02','1998/03/30', 48.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10919,'LINOD',2,'1998/03/02','1998/03/30', 19.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10920,'AROUT',4,'1998/03/03','1998/03/31', 29.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10921,'VAFFE',1,'1998/03/03','1998/04/14', 176.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10922,'HANAR',5,'1998/03/03','1998/03/31', 62.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10923,'LAMAI',7,'1998/03/03','1998/04/14', 68.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10924,'BERGS',3,'1998/03/04','1998/04/01', 151.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10925,'HANAR',3,'1998/03/04','1998/04/01', 2.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10926,'ANATR',4,'1998/03/04','1998/04/01', 39.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10927,'LACOR',4,'1998/03/05','1998/04/02', 19.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10928,'GALED',1,'1998/03/05','1998/04/02', 1.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10929,'FRANK',6,'1998/03/05','1998/04/02', 33.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10930,'SUPRD',4,'1998/03/06','1998/04/17', 15.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10931,'RICSU',4,'1998/03/06','1998/03/20', 13.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10932,'BONAP',8,'1998/03/06','1998/04/03', 134.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10933,'ISLAT',6,'1998/03/06','1998/04/03', 54.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10934,'LEHMS',3,'1998/03/09','1998/04/06', 32.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10935,'WELLI',4,'1998/03/09','1998/04/06', 47.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10936,'GREAL',3,'1998/03/09','1998/04/06', 33.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10937,'CACTU',7,'1998/03/10','1998/03/24', 31.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10938,'QUICK',3,'1998/03/10','1998/04/07', 31.89)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10939,'MAGAA',2,'1998/03/10','1998/04/07', 76.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10940,'BONAP',8,'1998/03/11','1998/04/08', 19.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10941,'SAVEA',7,'1998/03/11','1998/04/08', 400.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10942,'REGGC',9,'1998/03/11','1998/04/08', 17.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10943,'BSBEV',4,'1998/03/11','1998/04/08', 2.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10944,'BOTTM',6,'1998/03/12','1998/03/26', 52.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10945,'MORGK',4,'1998/03/12','1998/04/09', 10.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10946,'VAFFE',1,'1998/03/12','1998/04/09', 27.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10947,'BSBEV',3,'1998/03/13','1998/04/10', 3.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10948,'GODOS',3,'1998/03/13','1998/04/10', 23.39)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10949,'BOTTM',2,'1998/03/13','1998/04/10', 74.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10950,'MAGAA',1,'1998/03/16','1998/04/13', 2.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10951,'RICSU',9,'1998/03/16','1998/04/27', 30.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10952,'ALFKI',1,'1998/03/16','1998/04/27', 40.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10953,'AROUT',9,'1998/03/16','1998/03/30', 23.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10954,'LINOD',5,'1998/03/17','1998/04/28', 27.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10955,'FOLKO',8,'1998/03/17','1998/04/14', 3.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10956,'BLAUS',6,'1998/03/17','1998/04/28', 44.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10957,'HILAA',8,'1998/03/18','1998/04/15', 105.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10958,'OCEAN',7,'1998/03/18','1998/04/15', 49.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10959,'GOURL',6,'1998/03/18','1998/04/29', 4.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10960,'HILAA',3,'1998/03/19','1998/04/02', 2.08)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10961,'QUEEN',8,'1998/03/19','1998/04/16', 104.47)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10962,'QUICK',8,'1998/03/19','1998/04/16', 275.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10963,'FURIB',9,'1998/03/19','1998/04/16', 2.70)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10964,'SPECD',3,'1998/03/20','1998/04/17', 87.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10965,'OLDWO',6,'1998/03/20','1998/04/17', 144.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10966,'CHOPS',4,'1998/03/20','1998/04/17', 27.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10967,'TOMSP',2,'1998/03/23','1998/04/20', 62.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10968,'ERNSH',1,'1998/03/23','1998/04/20', 74.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10969,'COMMI',1,'1998/03/23','1998/04/20', 0.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10970,'BOLID',9,'1998/03/24','1998/04/07', 16.16)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10971,'FRANR',2,'1998/03/24','1998/04/21', 121.82)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10972,'LACOR',4,'1998/03/24','1998/04/21', 0.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10973,'LACOR',6,'1998/03/24','1998/04/21', 15.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10974,'SPLIR',3,'1998/03/25','1998/04/08', 12.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10975,'BOTTM',1,'1998/03/25','1998/04/22', 32.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10976,'HILAA',1,'1998/03/25','1998/05/06', 37.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10977,'FOLKO',8,'1998/03/26','1998/04/23', 208.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10978,'MAISD',9,'1998/03/26','1998/04/23', 32.82)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10979,'ERNSH',8,'1998/03/26','1998/04/23', 353.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10980,'FOLKO',4,'1998/03/27','1998/05/08', 1.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10981,'HANAR',1,'1998/03/27','1998/04/24', 193.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10982,'BOTTM',2,'1998/03/27','1998/04/24', 14.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10983,'SAVEA',2,'1998/03/27','1998/04/24', 657.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10984,'SAVEA',1,'1998/03/30','1998/04/27', 211.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10985,'HUNGO',2,'1998/03/30','1998/04/27', 91.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10986,'OCEAN',8,'1998/03/30','1998/04/27', 217.86)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10987,'EASTC',8,'1998/03/31','1998/04/28', 185.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10988,'RATTC',3,'1998/03/31','1998/04/28', 61.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10989,'QUEDE',2,'1998/03/31','1998/04/28', 34.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10990,'ERNSH',2,'1998/04/01','1998/05/13', 117.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10991,'QUICK',1,'1998/04/01','1998/04/29', 38.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10992,'THEBI',1,'1998/04/01','1998/04/29', 4.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10993,'FOLKO',7,'1998/04/01','1998/04/29', 8.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10994,'VAFFE',2,'1998/04/02','1998/04/16', 65.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10995,'PERIC',1,'1998/04/02','1998/04/30', 46.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10996,'QUICK',4,'1998/04/02','1998/04/30', 1.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10997,'LILAS',8,'1998/04/03','1998/05/15', 73.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10998,'WOLZA',8,'1998/04/03','1998/04/17', 20.31)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10999,'OTTIK',6,'1998/04/03','1998/05/01', 96.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11000,'RATTC',2,'1998/04/06','1998/05/04', 55.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11001,'FOLKO',2,'1998/04/06','1998/05/04', 197.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11002,'SAVEA',4,'1998/04/06','1998/05/04', 141.16)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11003,'THECR',3,'1998/04/06','1998/05/04', 14.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11004,'MAISD',3,'1998/04/07','1998/05/05', 44.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11005,'WILMK',2,'1998/04/07','1998/05/05', 0.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11006,'GREAL',3,'1998/04/07','1998/05/05', 25.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11007,'PRINI',8,'1998/04/08','1998/05/06', 202.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11008,'ERNSH',7,'1998/04/08','1998/05/06', 79.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11009,'GODOS',2,'1998/04/08','1998/05/06', 59.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11010,'REGGC',2,'1998/04/09','1998/05/07', 28.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11011,'ALFKI',3,'1998/04/09','1998/05/07', 1.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11012,'FRANK',1,'1998/04/09','1998/04/23', 242.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11013,'ROMEY',2,'1998/04/09','1998/05/07', 32.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11014,'LINOD',2,'1998/04/10','1998/05/08', 23.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11015,'SANTG',2,'1998/04/10','1998/04/24', 4.62)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11016,'AROUT',9,'1998/04/10','1998/05/08', 33.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11017,'ERNSH',9,'1998/04/13','1998/05/11', 754.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11018,'LONEP',4,'1998/04/13','1998/05/11', 11.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11019,'RANCH',6,'1998/04/13','1998/05/11', 3.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11020,'OTTIK',2,'1998/04/14','1998/05/12', 43.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11021,'QUICK',3,'1998/04/14','1998/05/12', 297.18)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11022,'HANAR',9,'1998/04/14','1998/05/12', 6.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11023,'BSBEV',1,'1998/04/14','1998/04/28', 123.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11024,'EASTC',4,'1998/04/15','1998/05/13', 74.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11025,'WARTH',6,'1998/04/15','1998/05/13', 29.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11026,'FRANS',4,'1998/04/15','1998/05/13', 47.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11027,'BOTTM',1,'1998/04/16','1998/05/14', 52.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11028,'KOENE',2,'1998/04/16','1998/05/14', 29.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11029,'CHOPS',4,'1998/04/16','1998/05/14', 47.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11030,'SAVEA',7,'1998/04/17','1998/05/15', 830.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11031,'SAVEA',6,'1998/04/17','1998/05/15', 227.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11032,'WHITC',2,'1998/04/17','1998/05/15', 606.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11033,'RICSU',7,'1998/04/17','1998/05/15', 84.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11034,'OLDWO',8,'1998/04/20','1998/06/01', 40.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11035,'SUPRD',2,'1998/04/20','1998/05/18', 0.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11036,'DRACD',8,'1998/04/20','1998/05/18', 149.47)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11037,'GODOS',7,'1998/04/21','1998/05/19', 3.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11038,'SUPRD',1,'1998/04/21','1998/05/19', 29.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11039,'LINOD',1,'1998/04/21','1998/05/19', 65.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11040,'GREAL',4,'1998/04/22','1998/05/20', 18.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11041,'CHOPS',3,'1998/04/22','1998/05/20', 48.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11042,'COMMI',2,'1998/04/22','1998/05/06', 29.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11043,'SPECD',5,'1998/04/22','1998/05/20', 8.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11044,'WOLZA',4,'1998/04/23','1998/05/21', 8.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11045,'BOTTM',6,'1998/04/23','1998/05/21', 70.58)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11046,'WANDK',8,'1998/04/23','1998/05/21', 71.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11047,'EASTC',7,'1998/04/24','1998/05/22', 46.62)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11048,'BOTTM',7,'1998/04/24','1998/05/22', 24.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11049,'GOURL',3,'1998/04/24','1998/05/22', 8.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11050,'FOLKO',8,'1998/04/27','1998/05/25', 59.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11051,'LAMAI',7,'1998/04/27','1998/05/25', 2.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11052,'HANAR',3,'1998/04/27','1998/05/25', 67.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11053,'PICCO',2,'1998/04/27','1998/05/25', 53.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11054,'CACTU',8,'1998/04/28','1998/05/26', 0.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11055,'HILAA',7,'1998/04/28','1998/05/26', 120.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11056,'EASTC',8,'1998/04/28','1998/05/12', 278.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11057,'NORTS',3,'1998/04/29','1998/05/27', 4.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11058,'BLAUS',9,'1998/04/29','1998/05/27', 31.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11059,'RICAR',2,'1998/04/29','1998/06/10', 85.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11060,'FRANS',2,'1998/04/30','1998/05/28', 10.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11061,'GREAL',4,'1998/04/30','1998/06/11', 14.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11062,'REGGC',4,'1998/04/30','1998/05/28', 29.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11063,'HUNGO',3,'1998/04/30','1998/05/28', 81.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11064,'SAVEA',1,'1998/05/01','1998/05/29', 30.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11065,'LILAS',8,'1998/05/01','1998/05/29', 12.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11066,'WHITC',7,'1998/05/01','1998/05/29', 44.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11067,'DRACD',1,'1998/05/04','1998/05/18', 7.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11068,'QUEEN',8,'1998/05/04','1998/06/01', 81.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11069,'TORTU',1,'1998/05/04','1998/06/01', 15.67)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11070,'LEHMS',2,'1998/05/05','1998/06/02', 136.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11071,'LILAS',1,'1998/05/05','1998/06/02', 0.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11072,'ERNSH',4,'1998/05/05','1998/06/02', 258.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11073,'PERIC',2,'1998/05/05','1998/06/02', 24.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11074,'SIMOB',7,'1998/05/06','1998/06/03', 18.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11075,'RICSU',8,'1998/05/06','1998/06/03', 6.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11076,'BONAP',4,'1998/05/06','1998/06/03', 38.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11077,'RATTC',1,'1998/05/06','1998/06/03', 8.53)

--------------------
-- Dados DetalhesPed
--------------------
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10248,11,14,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10248,42,9.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10248,72,34.8,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10249,14,18.6,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10249,51,42.4,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10250,41,7.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10250,51,42.4,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10250,65,16.8,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10251,22,16.8,6,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10251,57,15.6,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10251,65,16.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10252,20,64.8,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10252,33,2,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10252,60,27.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10253,31,10,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10253,39,14.4,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10253,49,16,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10254,24,3.6,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10254,55,19.2,21,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10254,74,8,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10255,2,15.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10255,16,13.9,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10255,36,15.2,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10255,59,44,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10256,53,26.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10256,77,10.4,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10257,27,35.1,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10257,39,14.4,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10257,77,10.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10258,2,15.2,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10258,5,17,65,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10258,32,25.6,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10259,21,8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10259,37,20.8,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10260,41,7.7,16,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10260,57,15.6,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10260,62,39.4,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10260,70,12,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10261,21,8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10261,35,14.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10262,5,17,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10262,7,24,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10262,56,30.4,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10263,16,13.9,60,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10263,24,3.6,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10263,30,20.7,60,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10263,74,8,36,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10264,2,15.2,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10264,41,7.7,25,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10265,17,31.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10265,70,12,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10266,12,30.4,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10267,40,14.7,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10267,59,44,70,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10267,76,14.4,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10268,29,99,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10268,72,27.8,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10269,33,2,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10269,72,27.8,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10270,36,15.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10270,43,36.8,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10271,33,2,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10272,20,64.8,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10272,31,10,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10272,72,27.8,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10273,10,24.8,24,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10273,31,10,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10273,33,2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10273,40,14.7,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10273,76,14.4,33,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10274,71,17.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10274,72,27.8,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10275,24,3.6,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10275,59,44,6,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10276,10,24.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10276,13,4.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10277,28,36.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10277,62,39.4,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10278,44,15.5,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10278,59,44,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10278,63,35.1,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10278,73,12,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10279,17,31.2,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10280,24,3.6,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10280,55,19.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10280,75,6.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10281,19,7.3,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10281,24,3.6,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10281,35,14.4,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10282,30,20.7,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10282,57,15.6,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10283,15,12.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10283,19,7.3,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10283,60,27.2,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10283,72,27.8,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10284,27,35.1,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10284,44,15.5,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10284,60,27.2,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10284,67,11.2,5,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10285,1,14.4,45,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10285,40,14.7,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10285,53,26.2,36,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10286,35,14.4,100,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10286,62,39.4,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10287,16,13.9,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10287,34,11.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10287,46,9.6,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10288,54,5.9,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10288,68,10,3,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10289,3,8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10289,64,26.6,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10290,5,17,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10290,29,99,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10290,49,16,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10290,77,10.4,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10291,13,4.8,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10291,44,15.5,24,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10291,51,42.4,2,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10292,20,64.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10293,18,50,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10293,24,3.6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10293,63,35.1,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10293,75,6.2,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10294,1,14.4,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10294,17,31.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10294,43,36.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10294,60,27.2,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10294,75,6.2,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10295,56,30.4,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10296,11,16.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10296,16,13.9,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10296,69,28.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10297,39,14.4,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10297,72,27.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10298,2,15.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10298,36,15.2,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10298,59,44,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10298,62,39.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10299,19,7.3,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10299,70,12,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10300,66,13.6,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10300,68,10,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10301,40,14.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10301,56,30.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10302,17,31.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10302,28,36.4,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10302,43,36.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10303,40,14.7,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10303,65,16.8,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10303,68,10,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10304,49,16,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10304,59,44,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10304,71,17.2,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10305,18,50,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10305,29,99,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10305,39,14.4,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10306,30,20.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10306,53,26.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10306,54,5.9,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10307,62,39.4,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10307,68,10,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10308,69,28.8,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10308,70,12,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10309,4,17.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10309,6,20,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10309,42,11.2,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10309,43,36.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10309,71,17.2,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10310,16,13.9,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10310,62,39.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10311,42,11.2,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10311,69,28.8,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10312,28,36.4,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10312,43,36.8,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10312,53,26.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10312,75,6.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10313,36,15.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10314,32,25.6,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10314,58,10.6,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10314,62,39.4,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10315,34,11.2,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10315,70,12,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10316,41,7.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10316,62,39.4,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10317,1,14.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10318,41,7.7,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10318,76,14.4,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10319,17,31.2,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10319,28,36.4,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10319,76,14.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10320,71,17.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10321,35,14.4,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10322,52,5.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10323,15,12.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10323,25,11.2,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10323,39,14.4,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10324,16,13.9,21,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10324,35,14.4,70,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10324,46,9.6,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10324,59,44,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10324,63,35.1,80,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10325,6,20,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10325,13,4.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10325,14,18.6,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10325,31,10,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10325,72,27.8,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10326,4,17.6,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10326,57,15.6,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10326,75,6.2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10327,2,15.2,25,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10327,11,16.8,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10327,30,20.7,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10327,58,10.6,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10328,59,44,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10328,65,16.8,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10328,68,10,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10329,19,7.3,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10329,30,20.7,8,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10329,38,210.8,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10329,56,30.4,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10330,26,24.9,50,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10330,72,27.8,25,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10331,54,5.9,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10332,18,50,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10332,42,11.2,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10332,47,7.6,16,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10333,14,18.6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10333,21,8,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10333,71,17.2,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10334,52,5.6,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10334,68,10,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10335,2,15.2,7,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10335,31,10,25,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10335,32,25.6,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10335,51,42.4,48,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10336,4,17.6,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10337,23,7.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10337,26,24.9,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10337,36,15.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10337,37,20.8,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10337,72,27.8,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10338,17,31.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10338,30,20.7,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10339,4,17.6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10339,17,31.2,70,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10339,62,39.4,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10340,18,50,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10340,41,7.7,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10340,43,36.8,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10341,33,2,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10341,59,44,9,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10342,2,15.2,24,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10342,31,10,56,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10342,36,15.2,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10342,55,19.2,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10343,64,26.6,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10343,68,10,4,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10343,76,14.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10344,4,17.6,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10344,8,32,70,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10345,8,32,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10345,19,7.3,80,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10345,42,11.2,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10346,17,31.2,36,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10346,56,30.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10347,25,11.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10347,39,14.4,50,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10347,40,14.7,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10347,75,6.2,6,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10348,1,14.4,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10348,23,7.2,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10349,54,5.9,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10350,50,13,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10350,69,28.8,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10351,38,210.8,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10351,41,7.7,13,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10351,44,15.5,77,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10351,65,16.8,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10352,24,3.6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10352,54,5.9,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10353,11,16.8,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10353,38,210.8,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10354,1,14.4,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10354,29,99,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10355,24,3.6,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10355,57,15.6,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10356,31,10,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10356,55,19.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10356,69,28.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10357,10,24.8,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10357,26,24.9,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10357,60,27.2,8,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10358,24,3.6,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10358,34,11.2,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10358,36,15.2,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10359,16,13.9,56,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10359,31,10,70,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10359,60,27.2,80,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10360,28,36.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10360,29,99,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10360,38,210.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10360,49,16,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10360,54,5.9,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10361,39,14.4,54,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10361,60,27.2,55,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10362,25,11.2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10362,51,42.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10362,54,5.9,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10363,31,10,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10363,75,6.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10363,76,14.4,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10364,69,28.8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10364,71,17.2,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10365,11,16.8,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10366,65,16.8,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10366,77,10.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10367,34,11.2,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10367,54,5.9,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10367,65,16.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10367,77,10.4,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10368,21,8,5,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10368,28,36.4,13,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10368,57,15.6,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10368,64,26.6,35,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10369,29,99,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10369,56,30.4,18,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10370,1,14.4,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10370,64,26.6,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10370,74,8,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10371,36,15.2,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10372,20,64.8,12,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10372,38,210.8,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10372,60,27.2,70,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10372,72,27.8,42,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10373,58,10.6,80,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10373,71,17.2,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10374,31,10,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10374,58,10.6,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10375,14,18.6,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10375,54,5.9,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10376,31,10,42,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10377,28,36.4,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10377,39,14.4,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10378,71,17.2,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10379,41,7.7,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10379,63,35.1,16,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10379,65,16.8,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10380,30,20.7,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10380,53,26.2,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10380,60,27.2,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10380,70,12,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10381,74,8,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10382,5,17,32,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10382,18,50,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10382,29,99,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10382,33,2,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10382,74,8,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10383,13,4.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10383,50,13,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10383,56,30.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10384,20,64.8,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10384,60,27.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10385,7,24,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10385,60,27.2,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10385,68,10,8,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10386,24,3.6,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10386,34,11.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10387,24,3.6,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10387,28,36.4,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10387,59,44,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10387,71,17.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10388,45,7.6,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10388,52,5.6,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10388,53,26.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10389,10,24.8,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10389,55,19.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10389,62,39.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10389,70,12,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10390,31,10,60,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10390,35,14.4,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10390,46,9.6,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10390,72,27.8,24,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10391,13,4.8,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10392,69,28.8,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10393,2,15.2,25,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10393,14,18.6,42,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10393,25,11.2,7,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10393,26,24.9,70,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10393,31,10,32,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10394,13,4.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10394,62,39.4,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10395,46,9.6,28,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10395,53,26.2,70,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10395,69,28.8,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10396,23,7.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10396,71,17.2,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10396,72,27.8,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10397,21,8,10,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10397,51,42.4,18,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10398,35,14.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10398,55,19.2,120,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10399,68,10,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10399,71,17.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10399,76,14.4,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10399,77,10.4,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10400,29,99,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10400,35,14.4,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10400,49,16,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10401,30,20.7,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10401,56,30.4,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10401,65,16.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10401,71,17.2,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10402,23,7.2,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10402,63,35.1,65,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10403,16,13.9,21,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10403,48,10.2,70,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10404,26,24.9,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10404,42,11.2,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10404,49,16,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10405,3,8,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10406,1,14.4,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10406,21,8,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10406,28,36.4,42,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10406,36,15.2,5,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10406,40,14.7,2,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10407,11,16.8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10407,69,28.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10407,71,17.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10408,37,20.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10408,54,5.9,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10408,62,39.4,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10409,14,18.6,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10409,21,8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10410,33,2,49,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10410,59,44,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10411,41,7.7,25,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10411,44,15.5,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10411,59,44,9,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10412,14,18.6,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10413,1,14.4,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10413,62,39.4,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10413,76,14.4,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10414,19,7.3,18,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10414,33,2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10415,17,31.2,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10415,33,2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10416,19,7.3,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10416,53,26.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10416,57,15.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10417,38,210.8,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10417,46,9.6,2,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10417,68,10,36,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10417,77,10.4,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10418,2,15.2,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10418,47,7.6,55,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10418,61,22.8,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10418,74,8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10419,60,27.2,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10419,69,28.8,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10420,9,77.6,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10420,13,4.8,2,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10420,70,12,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10420,73,12,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10421,19,7.3,4,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10421,26,24.9,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10421,53,26.2,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10421,77,10.4,10,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10422,26,24.9,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10423,31,10,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10423,59,44,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10424,35,14.4,60,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10424,38,210.8,49,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10424,68,10,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10425,55,19.2,10,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10425,76,14.4,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10426,56,30.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10426,64,26.6,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10427,14,18.6,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10428,46,9.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10429,50,13,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10429,63,35.1,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10430,17,31.2,45,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10430,21,8,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10430,56,30.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10430,59,44,70,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10431,17,31.2,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10431,40,14.7,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10431,47,7.6,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10432,26,24.9,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10432,54,5.9,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10433,56,30.4,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10434,11,16.8,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10434,76,14.4,18,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10435,2,15.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10435,22,16.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10435,72,27.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10436,46,9.6,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10436,56,30.4,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10436,64,26.6,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10436,75,6.2,24,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10437,53,26.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10438,19,7.3,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10438,34,11.2,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10438,57,15.6,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10439,12,30.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10439,16,13.9,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10439,64,26.6,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10439,74,8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10440,2,15.2,45,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10440,16,13.9,49,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10440,29,99,24,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10440,61,22.8,90,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10441,27,35.1,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10442,11,16.8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10442,54,5.9,80,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10442,66,13.6,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10443,11,16.8,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10443,28,36.4,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10444,17,31.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10444,26,24.9,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10444,35,14.4,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10444,41,7.7,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10445,39,14.4,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10445,54,5.9,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10446,19,7.3,12,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10446,24,3.6,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10446,31,10,3,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10446,52,5.6,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10447,19,7.3,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10447,65,16.8,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10447,71,17.2,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10448,26,24.9,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10448,40,14.7,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10449,10,24.8,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10449,52,5.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10449,62,39.4,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10450,10,24.8,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10450,54,5.9,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10451,55,19.2,120,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10451,64,26.6,35,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10451,65,16.8,28,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10451,77,10.4,55,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10452,28,36.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10452,44,15.5,100,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10453,48,10.2,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10453,70,12,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10454,16,13.9,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10454,33,2,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10454,46,9.6,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10455,39,14.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10455,53,26.2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10455,61,22.8,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10455,71,17.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10456,21,8,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10456,49,16,21,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10457,59,44,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10458,26,24.9,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10458,28,36.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10458,43,36.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10458,56,30.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10458,71,17.2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10459,7,24,16,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10459,46,9.6,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10459,72,27.8,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10460,68,10,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10460,75,6.2,4,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10461,21,8,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10461,30,20.7,28,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10461,55,19.2,60,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10462,13,4.8,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10462,23,7.2,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10463,19,7.3,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10463,42,11.2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10464,4,17.6,16,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10464,43,36.8,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10464,56,30.4,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10464,60,27.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10465,24,3.6,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10465,29,99,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10465,40,14.7,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10465,45,7.6,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10465,50,13,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10466,11,16.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10466,46,9.6,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10467,24,3.6,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10467,25,11.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10468,30,20.7,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10468,43,36.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10469,2,15.2,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10469,16,13.9,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10469,44,15.5,2,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10470,18,50,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10470,23,7.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10470,64,26.6,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10471,7,24,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10471,56,30.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10472,24,3.6,80,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10472,51,42.4,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10473,33,2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10473,71,17.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10474,14,18.6,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10474,28,36.4,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10474,40,14.7,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10474,75,6.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10475,31,10,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10475,66,13.6,60,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10475,76,14.4,42,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10476,55,19.2,2,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10476,70,12,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10477,1,14.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10477,21,8,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10477,39,14.4,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10478,10,24.8,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10479,38,210.8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10479,53,26.2,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10479,59,44,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10479,64,26.6,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10480,47,7.6,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10480,59,44,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10481,49,16,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10481,60,27.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10482,40,14.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10483,34,11.2,35,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10483,77,10.4,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10484,21,8,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10484,40,14.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10484,51,42.4,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10485,2,15.2,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10485,3,8,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10485,55,19.2,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10485,70,12,60,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10486,11,16.8,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10486,51,42.4,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10486,74,8,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10487,19,7.3,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10487,26,24.9,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10487,54,5.9,24,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10488,59,44,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10488,73,12,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10489,11,16.8,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10489,16,13.9,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10490,59,44,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10490,68,10,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10490,75,6.2,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10491,44,15.5,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10491,77,10.4,7,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10492,25,11.2,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10492,42,11.2,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10493,65,16.8,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10493,66,13.6,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10493,69,28.8,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10494,56,30.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10495,23,7.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10495,41,7.7,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10495,77,10.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10496,31,10,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10497,56,30.4,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10497,72,27.8,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10497,77,10.4,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10498,24,4.5,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10498,40,18.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10498,42,14,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10499,28,45.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10499,49,20,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10500,15,15.5,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10500,28,45.6,8,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10501,54,7.45,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10502,45,9.5,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10502,53,32.8,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10502,67,14,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10503,14,23.25,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10503,65,21.05,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10504,2,19,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10504,21,10,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10504,53,32.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10504,61,28.5,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10505,62,49.3,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10506,25,14,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10506,70,15,14,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10507,43,46,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10507,48,12.75,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10508,13,6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10508,39,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10509,28,45.6,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10510,29,123.79,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10510,75,7.75,36,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10511,4,22,50,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10511,7,30,50,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10511,8,40,10,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10512,24,4.5,10,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10512,46,12,9,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10512,47,9.5,6,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10512,60,34,12,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10513,21,10,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10513,32,32,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10513,61,28.5,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10514,20,81,39,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10514,28,45.6,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10514,56,38,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10514,65,21.05,39,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10514,75,7.75,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10515,9,97,16,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10515,16,17.45,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10515,27,43.9,120,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10515,33,2.5,16,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10515,60,34,84,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10516,18,62.5,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10516,41,9.65,80,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10516,42,14,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10517,52,7,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10517,59,55,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10517,70,15,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10518,24,4.5,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10518,38,263.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10518,44,19.45,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10519,10,31,16,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10519,56,38,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10519,60,34,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10520,24,4.5,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10520,53,32.8,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10521,35,18,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10521,41,9.65,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10521,68,12.5,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10522,1,18,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10522,8,40,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10522,30,25.89,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10522,40,18.4,25,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10523,17,39,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10523,20,81,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10523,37,26,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10523,41,9.65,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10524,10,31,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10524,30,25.89,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10524,43,46,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10524,54,7.45,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10525,36,19,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10525,40,18.4,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10526,1,18,8,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10526,13,6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10526,56,38,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10527,4,22,50,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10527,36,19,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10528,11,21,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10528,33,2.5,8,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10528,72,34.8,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10529,55,24,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10529,68,12.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10529,69,36,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10530,17,39,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10530,43,46,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10530,61,28.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10530,76,18,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10531,59,55,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10532,30,25.89,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10532,66,17,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10533,4,22,50,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10533,72,34.8,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10533,73,15,24,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10534,30,25.89,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10534,40,18.4,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10534,54,7.45,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10535,11,21,50,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10535,40,18.4,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10535,57,19.5,5,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10535,59,55,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10536,12,38,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10536,31,12.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10536,33,2.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10536,60,34,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10537,31,12.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10537,51,53,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10537,58,13.25,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10537,72,34.8,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10537,73,15,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10538,70,15,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10538,72,34.8,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10539,13,6,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10539,21,10,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10539,33,2.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10539,49,20,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10540,3,10,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10540,26,31.23,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10540,38,263.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10540,68,12.5,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10541,24,4.5,35,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10541,38,263.5,4,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10541,65,21.05,36,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10541,71,21.5,9,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10542,11,21,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10542,54,7.45,24,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10543,12,38,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10543,23,9,70,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10544,28,45.6,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10544,67,14,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10545,11,21,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10546,7,30,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10546,35,18,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10546,62,49.3,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10547,32,32,24,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10547,36,19,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10548,34,14,10,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10548,41,9.65,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10549,31,12.5,55,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10549,45,9.5,100,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10549,51,53,48,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10550,17,39,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10550,19,9.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10550,21,10,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10550,61,28.5,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10551,16,17.45,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10551,35,18,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10551,44,19.45,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10552,69,36,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10552,75,7.75,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10553,11,21,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10553,16,17.45,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10553,22,21,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10553,31,12.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10553,35,18,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10554,16,17.45,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10554,23,9,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10554,62,49.3,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10554,77,13,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10555,14,23.25,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10555,19,9.2,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10555,24,4.5,18,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10555,51,53,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10555,56,38,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10556,72,34.8,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10557,64,33.25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10557,75,7.75,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10558,47,9.5,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10558,51,53,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10558,52,7,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10558,53,32.8,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10558,73,15,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10559,41,9.65,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10559,55,24,18,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10560,30,25.89,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10560,62,49.3,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10561,44,19.45,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10561,51,53,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10562,33,2.5,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10562,62,49.3,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10563,36,19,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10563,52,7,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10564,17,39,16,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10564,31,12.5,6,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10564,55,24,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10565,24,4.5,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10565,64,33.25,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10566,11,21,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10566,18,62.5,18,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10566,76,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10567,31,12.5,60,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10567,51,53,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10567,59,55,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10568,10,31,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10569,31,12.5,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10569,76,18,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10570,11,21,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10570,56,38,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10571,14,23.25,11,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10571,42,14,28,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10572,16,17.45,12,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10572,32,32,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10572,40,18.4,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10572,75,7.75,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10573,17,39,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10573,34,14,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10573,53,32.8,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10574,33,2.5,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10574,40,18.4,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10574,62,49.3,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10574,64,33.25,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10575,59,55,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10575,63,43.9,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10575,72,34.8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10575,76,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10576,1,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10576,31,12.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10576,44,19.45,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10577,39,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10577,75,7.75,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10577,77,13,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10578,35,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10578,57,19.5,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10579,15,15.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10579,75,7.75,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10580,14,23.25,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10580,41,9.65,9,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10580,65,21.05,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10581,75,7.75,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10582,57,19.5,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10582,76,18,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10583,29,123.79,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10583,60,34,24,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10583,69,36,10,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10584,31,12.5,50,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10585,47,9.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10586,52,7,4,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10587,26,31.23,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10587,35,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10587,77,13,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10588,18,62.5,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10588,42,14,100,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10589,35,18,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10590,1,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10590,77,13,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10591,3,10,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10591,7,30,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10591,54,7.45,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10592,15,15.5,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10592,26,31.23,5,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10593,20,81,21,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10593,69,36,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10593,76,18,4,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10594,52,7,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10594,58,13.25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10595,35,18,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10595,61,28.5,120,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10595,69,36,65,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10596,56,38,5,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10596,63,43.9,24,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10596,75,7.75,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10597,24,4.5,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10597,57,19.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10597,65,21.05,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10598,27,43.9,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10598,71,21.5,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10599,62,49.3,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10600,54,7.45,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10600,73,15,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10601,13,6,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10601,59,55,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10602,77,13,5,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10603,22,21,48,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10603,49,20,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10604,48,12.75,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10604,76,18,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10605,16,17.45,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10605,59,55,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10605,60,34,70,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10605,71,21.5,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10606,4,22,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10606,55,24,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10606,62,49.3,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10607,7,30,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10607,17,39,100,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10607,33,2.5,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10607,40,18.4,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10607,72,34.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10608,56,38,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10609,1,18,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10609,10,31,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10609,21,10,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10610,36,19,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10611,1,18,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10611,2,19,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10611,60,34,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10612,10,31,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10612,36,19,55,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10612,49,20,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10612,60,34,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10612,76,18,80,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10613,13,6,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10613,75,7.75,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10614,11,21,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10614,21,10,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10614,39,18,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10615,55,24,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10616,38,263.5,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10616,56,38,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10616,70,15,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10616,71,21.5,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10617,59,55,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10618,6,25,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10618,56,38,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10618,68,12.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10619,21,10,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10619,22,21,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10620,24,4.5,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10620,52,7,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10621,19,9.2,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10621,23,9,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10621,70,15,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10621,71,21.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10622,2,19,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10622,68,12.5,18,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10623,14,23.25,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10623,19,9.2,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10623,21,10,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10623,24,4.5,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10623,35,18,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10624,28,45.6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10624,29,123.79,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10624,44,19.45,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10625,14,23.25,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10625,42,14,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10625,60,34,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10626,53,32.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10626,60,34,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10626,71,21.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10627,62,49.3,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10627,73,15,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10628,1,18,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10629,29,123.79,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10629,64,33.25,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10630,55,24,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10630,76,18,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10631,75,7.75,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10632,2,19,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10632,33,2.5,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10633,12,38,36,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10633,13,6,13,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10633,26,31.23,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10633,62,49.3,80,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10634,7,30,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10634,18,62.5,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10634,51,53,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10634,75,7.75,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10635,4,22,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10635,5,21.35,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10635,22,21,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10636,4,22,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10636,58,13.25,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10637,11,21,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10637,50,16.25,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10637,56,38,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10638,45,9.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10638,65,21.05,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10638,72,34.8,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10639,18,62.5,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10640,69,36,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10640,70,15,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10641,2,19,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10641,40,18.4,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10642,21,10,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10642,61,28.5,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10643,28,45.6,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10643,39,18,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10643,46,12,2,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10644,18,62.5,4,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10644,43,46,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10644,46,12,21,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10645,18,62.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10645,36,19,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10646,1,18,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10646,10,31,18,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10646,71,21.5,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10646,77,13,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10647,19,9.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10647,39,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10648,22,21,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10648,24,4.5,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10649,28,45.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10649,72,34.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10650,30,25.89,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10650,53,32.8,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10650,54,7.45,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10651,19,9.2,12,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10651,22,21,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10652,30,25.89,2,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10652,42,14,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10653,16,17.45,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10653,60,34,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10654,4,22,12,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10654,39,18,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10654,54,7.45,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10655,41,9.65,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10656,14,23.25,3,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10656,44,19.45,28,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10656,47,9.5,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,15,15.5,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,41,9.65,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,46,12,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,47,9.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,56,38,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,60,34,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10658,21,10,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10658,40,18.4,70,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10658,60,34,55,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10658,77,13,70,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10659,31,12.5,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10659,40,18.4,24,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10659,70,15,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10660,20,81,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10661,39,18,3,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10661,58,13.25,49,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10662,68,12.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10663,40,18.4,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10663,42,14,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10663,51,53,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10664,10,31,24,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10664,56,38,12,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10664,65,21.05,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10665,51,53,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10665,59,55,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10665,76,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10666,29,123.79,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10666,65,21.05,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10667,69,36,45,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10667,71,21.5,14,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10668,31,12.5,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10668,55,24,4,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10668,64,33.25,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10669,36,19,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10670,23,9,32,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10670,46,12,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10670,67,14,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10670,73,15,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10670,75,7.75,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10671,16,17.45,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10671,62,49.3,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10671,65,21.05,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10672,38,263.5,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10672,71,21.5,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10673,16,17.45,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10673,42,14,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10673,43,46,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10674,23,9,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10675,14,23.25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10675,53,32.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10675,58,13.25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10676,10,31,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10676,19,9.2,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10676,44,19.45,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10677,26,31.23,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10677,33,2.5,8,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10678,12,38,100,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10678,33,2.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10678,41,9.65,120,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10678,54,7.45,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10679,59,55,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10680,16,17.45,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10680,31,12.5,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10680,42,14,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10681,19,9.2,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10681,21,10,12,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10681,64,33.25,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10682,33,2.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10682,66,17,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10682,75,7.75,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10683,52,7,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10684,40,18.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10684,47,9.5,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10684,60,34,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10685,10,31,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10685,41,9.65,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10685,47,9.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10686,17,39,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10686,26,31.23,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10687,9,97,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10687,29,123.79,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10687,36,19,6,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10688,10,31,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10688,28,45.6,60,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10688,34,14,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10689,1,18,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10690,56,38,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10690,77,13,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10691,1,18,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10691,29,123.79,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10691,43,46,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10691,44,19.45,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10691,62,49.3,48,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10692,63,43.9,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10693,9,97,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10693,54,7.45,60,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10693,69,36,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10693,73,15,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10694,7,30,90,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10694,59,55,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10694,70,15,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10695,8,40,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10695,12,38,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10695,24,4.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10696,17,39,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10696,46,12,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10697,19,9.2,7,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10697,35,18,9,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10697,58,13.25,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10697,70,15,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10698,11,21,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10698,17,39,8,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10698,29,123.79,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10698,65,21.05,65,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10698,70,15,8,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10699,47,9.5,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10700,1,18,5,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10700,34,14,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10700,68,12.5,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10700,71,21.5,60,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10701,59,55,42,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10701,71,21.5,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10701,76,18,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10702,3,10,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10702,76,18,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10703,2,19,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10703,59,55,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10703,73,15,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10704,4,22,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10704,24,4.5,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10704,48,12.75,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10705,31,12.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10705,32,32,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10706,16,17.45,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10706,43,46,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10706,59,55,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10707,55,24,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10707,57,19.5,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10707,70,15,28,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10708,5,21.35,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10708,36,19,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10709,8,40,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10709,51,53,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10709,60,34,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10710,19,9.2,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10710,47,9.5,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10711,19,9.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10711,41,9.65,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10711,53,32.8,120,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10712,53,32.8,3,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10712,56,38,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10713,10,31,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10713,26,31.23,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10713,45,9.5,110,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10713,46,12,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10714,2,19,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10714,17,39,27,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10714,47,9.5,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10714,56,38,18,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10714,58,13.25,12,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10715,10,31,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10715,71,21.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10716,21,10,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10716,51,53,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10716,61,28.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10717,21,10,32,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10717,54,7.45,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10717,69,36,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10718,12,38,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10718,16,17.45,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10718,36,19,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10718,62,49.3,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10719,18,62.5,12,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10719,30,25.89,3,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10719,54,7.45,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10720,35,18,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10720,71,21.5,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10721,44,19.45,50,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10722,2,19,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10722,31,12.5,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10722,68,12.5,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10722,75,7.75,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10723,26,31.23,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10724,10,31,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10724,61,28.5,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10725,41,9.65,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10725,52,7,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10725,55,24,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10726,4,22,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10726,11,21,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10727,17,39,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10727,56,38,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10727,59,55,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10728,30,25.89,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10728,40,18.4,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10728,55,24,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10728,60,34,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10729,1,18,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10729,21,10,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10729,50,16.25,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10730,16,17.45,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10730,31,12.5,3,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10730,65,21.05,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10731,21,10,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10731,51,53,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10732,76,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10733,14,23.25,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10733,28,45.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10733,52,7,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10734,6,25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10734,30,25.89,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10734,76,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10735,61,28.5,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10735,77,13,2,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10736,65,21.05,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10736,75,7.75,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10737,13,6,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10737,41,9.65,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10738,16,17.45,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10739,36,19,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10739,52,7,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10740,28,45.6,5,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10740,35,18,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10740,45,9.5,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10740,56,38,14,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10741,2,19,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10742,3,10,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10742,60,34,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10742,72,34.8,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10743,46,12,28,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10744,40,18.4,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10745,18,62.5,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10745,44,19.45,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10745,59,55,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10745,72,34.8,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10746,13,6,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10746,42,14,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10746,62,49.3,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10746,69,36,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10747,31,12.5,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10747,41,9.65,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10747,63,43.9,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10747,69,36,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10748,23,9,44,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10748,40,18.4,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10748,56,38,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10749,56,38,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10749,59,55,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10749,76,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10750,14,23.25,5,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10750,45,9.5,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10750,59,55,25,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10751,26,31.23,12,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10751,30,25.89,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10751,50,16.25,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10751,73,15,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10752,1,18,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10752,69,36,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10753,45,9.5,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10753,74,10,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10754,40,18.4,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10755,47,9.5,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10755,56,38,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10755,57,19.5,14,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10755,69,36,25,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10756,18,62.5,21,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10756,36,19,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10756,68,12.5,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10756,69,36,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10757,34,14,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10757,59,55,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10757,62,49.3,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10757,64,33.25,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10758,26,31.23,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10758,52,7,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10758,70,15,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10759,32,32,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10760,25,14,12,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10760,27,43.9,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10760,43,46,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10761,25,14,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10761,75,7.75,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10762,39,18,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10762,47,9.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10762,51,53,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10762,56,38,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10763,21,10,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10763,22,21,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10763,24,4.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10764,3,10,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10764,39,18,130,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10765,65,21.05,80,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10766,2,19,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10766,7,30,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10766,68,12.5,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10767,42,14,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10768,22,21,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10768,31,12.5,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10768,60,34,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10768,71,21.5,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10769,41,9.65,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10769,52,7,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10769,61,28.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10769,62,49.3,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10770,11,21,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10771,71,21.5,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10772,29,123.79,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10772,59,55,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10773,17,39,33,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10773,31,12.5,70,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10773,75,7.75,7,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10774,31,12.5,2,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10774,66,17,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10775,10,31,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10775,67,14,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10776,31,12.5,16,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10776,42,14,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10776,45,9.5,27,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10776,51,53,120,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10777,42,14,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10778,41,9.65,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10779,16,17.45,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10779,62,49.3,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10780,70,15,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10780,77,13,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10781,54,7.45,3,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10781,56,38,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10781,74,10,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10782,31,12.5,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10783,31,12.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10783,38,263.5,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10784,36,19,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10784,39,18,2,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10784,72,34.8,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10785,10,31,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10785,75,7.75,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10786,8,40,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10786,30,25.89,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10786,75,7.75,42,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10787,2,19,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10787,29,123.79,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10788,19,9.2,50,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10788,75,7.75,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10789,18,62.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10789,35,18,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10789,63,43.9,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10789,68,12.5,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10790,7,30,3,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10790,56,38,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10791,29,123.79,14,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10791,41,9.65,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10792,2,19,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10792,54,7.45,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10792,68,12.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10793,41,9.65,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10793,52,7,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10794,14,23.25,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10794,54,7.45,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10795,16,17.45,65,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10795,17,39,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10796,26,31.23,21,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10796,44,19.45,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10796,64,33.25,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10796,69,36,24,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10797,11,21,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10798,62,49.3,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10798,72,34.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10799,13,6,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10799,24,4.5,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10799,59,55,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10800,11,21,50,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10800,51,53,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10800,54,7.45,7,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10801,17,39,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10801,29,123.79,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10802,30,25.89,25,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10802,51,53,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10802,55,24,60,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10802,62,49.3,5,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10803,19,9.2,24,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10803,25,14,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10803,59,55,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10804,10,31,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10804,28,45.6,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10804,49,20,4,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10805,34,14,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10805,38,263.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10806,2,19,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10806,65,21.05,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10806,74,10,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10807,40,18.4,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10808,56,38,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10808,76,18,50,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10809,52,7,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10810,13,6,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10810,25,14,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10810,70,15,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10811,19,9.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10811,23,9,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10811,40,18.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10812,31,12.5,16,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10812,72,34.8,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10812,77,13,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10813,2,19,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10813,46,12,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10814,41,9.65,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10814,43,46,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10814,48,12.75,8,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10814,61,28.5,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10815,33,2.5,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10816,38,263.5,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10816,62,49.3,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10817,26,31.23,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10817,38,263.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10817,40,18.4,60,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10817,62,49.3,25,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10818,32,32,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10818,41,9.65,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10819,43,46,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10819,75,7.75,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10820,56,38,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10821,35,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10821,51,53,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10822,62,49.3,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10822,70,15,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10823,11,21,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10823,57,19.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10823,59,55,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10823,77,13,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10824,41,9.65,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10824,70,15,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10825,26,31.23,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10825,53,32.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10826,31,12.5,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10826,57,19.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10827,10,31,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10827,39,18,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10828,20,81,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10828,38,263.5,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10829,2,19,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10829,8,40,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10829,13,6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10829,60,34,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10830,6,25,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10830,39,18,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10830,60,34,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10830,68,12.5,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10831,19,9.2,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10831,35,18,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10831,38,263.5,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10831,43,46,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10832,13,6,3,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10832,25,14,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10832,44,19.45,16,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10832,64,33.25,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10833,7,30,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10833,31,12.5,9,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10833,53,32.8,9,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10834,29,123.79,8,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10834,30,25.89,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10835,59,55,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10835,77,13,2,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10836,22,21,52,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10836,35,18,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10836,57,19.5,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10836,60,34,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10836,64,33.25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10837,13,6,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10837,40,18.4,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10837,47,9.5,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10837,76,18,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10838,1,18,4,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10838,18,62.5,25,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10838,36,19,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10839,58,13.25,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10839,72,34.8,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10840,25,14,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10840,39,18,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10841,10,31,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10841,56,38,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10841,59,55,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10841,77,13,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10842,11,21,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10842,43,46,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10842,68,12.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10842,70,15,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10843,51,53,4,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10844,22,21,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10845,23,9,70,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10845,35,18,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10845,42,14,42,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10845,58,13.25,60,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10845,64,33.25,48,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10846,4,22,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10846,70,15,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10846,74,10,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,1,18,80,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,19,9.2,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,37,26,60,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,45,9.5,36,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,60,34,45,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,71,21.5,55,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10848,5,21.35,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10848,9,97,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10849,3,10,49,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10849,26,31.23,18,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10850,25,14,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10850,33,2.5,4,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10850,70,15,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10851,2,19,5,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10851,25,14,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10851,57,19.5,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10851,59,55,42,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10852,2,19,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10852,17,39,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10852,62,49.3,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10853,18,62.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10854,10,31,100,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10854,13,6,65,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10855,16,17.45,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10855,31,12.5,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10855,56,38,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10855,65,21.05,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10856,2,19,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10856,42,14,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10857,3,10,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10857,26,31.23,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10857,29,123.79,10,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10858,7,30,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10858,27,43.9,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10858,70,15,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10859,24,4.5,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10859,54,7.45,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10859,64,33.25,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10860,51,53,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10860,76,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10861,17,39,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10861,18,62.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10861,21,10,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10861,33,2.5,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10861,62,49.3,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10862,11,21,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10862,52,7,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10863,1,18,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10863,58,13.25,12,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10864,35,18,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10864,67,14,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10865,38,263.5,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10865,39,18,80,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10866,2,19,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10866,24,4.5,6,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10866,30,25.89,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10867,53,32.8,3,0);

select * From Fornecedores
select * From Categorias
select * From Clientes
select * From Funcionarios
select * From Produtos
select * From Pedidos
select * From DetalhesPed

--1. Selecionar 3 primeiros Produtos por ordem decrescente de Preco
SELECT TOP 3 Descr, Preco
FROM Produtos
ORDER BY Preco DESC

--2. Selecionar 5 Pedidos por ordem de Frete
SELECT TOP 5 NumPed, DataPed
FROM Pedidos
ORDER BY Frete

--3. Selecionar Nome e Cargo dos Clientes e Funcionaros que s�o do Reino Unido.
SELECT Nome, Cargo
FROM Clientes
UNION
SELECT Nome, Cargo
FROM Funcionarios
WHERE Pais = 'Reino Unido'

--4. Selecionar Nome, Sobrenome, Cargo e Salario dos 3 Funcionarios que tem o maior salario em ordem decrescente
SELECT TOP 3 Nome, Sobrenome, Cargo, Salario
FROM Funcionarios
ORDER BY Salario DESC

--5.
SELECT TOP 1 Nome, Sobrenome, DataNasc
FROM Funcionarios
ORDER BY DataNasc DESC

--6.
SELECT TOP 5 *
FROM Pedidos
ORDER BY DataPed

--7.
SELECT TOP 6 *
FROM Pedidos
WHERE YEAR(DataPed) = 1996

--8.
SELECT Nome, Cargo
FROM Funcionarios
WHERE Pais = 'EUA'
UNION
SELECT Contato, Cargo
FROM Fornecedores
WHERE Pais = 'EUA'

--9.
SELECT Nome, Contato, Pais
FROM Clientes
WHERE Pais = 'Brasil'
UNION
SELECT Nome, Contato, Pais
FROM Clientes
WHERE Pais = 'Alemanha'

--10.
SELECT Nome, Contato, Cidade
FROM Clientes
WHERE Cidade = 'Madrid'
UNION
SELECT Nome, Contato, Cidade
FROM Clientes
WHERE Cidade = 'Paris'

--11.
SELECT  Descr, Preco
FROM Produtos
WHERE CodCategoria = 2
UNION
SELECT Descr, Preco
FROM Produtos
WHERE CodCategoria = 4

--12.
SELECT Nome, Cargo, Pais
FROM Funcionarios
WHERE Pais = 'Reino Unido'
UNION
SELECT Contato, Cargo, Pais
FROM Fornecedores
WHERE Pais = 'Fran�a'


--13.
SELECT Pais, COUNT(*) AS QtdeClientes
FROM Clientes
GROUP BY Pais

--14.
SELECT SUM(Preco) AS Soma, AVG(Preco) AS Media, MAX(Preco) AS
MaiorPreco, MIN(Preco) AS MenorPreco
FROM Produtos

--15.
SELECT C.Pais, COUNT(P.NumPed) AS QtdePedidos
FROM Clientes C, Pedidos P
WHERE C.CodCli = P.CodCli
GROUP BY C.Pais
ORDER BY COUNT(P.NumPed) DESC

--16
SELECT Nome, Sobrenome, Cargo, Salario, (Salario*1.10) AS
Salario_Novo
FROM Funcionarios

--17
SELECT SUM(DP.Preco) AS SomadosPrecos
FROM DetalhesPed DP, Pedidos P
WHERE (DP.NumPed = P.NumPed) AND (YEAR(P.DataEntrega) = 1997) AND
(MONTH(P.DataEntrega) = 5)

--18
SELECT C.CodCli, C.Nome, C.Pais
FROM Clientes C, Pedidos P
WHERE (C.CodCli = P.CodCli) AND (YEAR(P.DataPed) = 1997) AND
(MONTH(P.DataPed) = 09)
ORDER BY (C.Pais)

--19 Selecionar todos Pedidos feitos por Nome de Funcionarios come�ados com a letra "A"
SELECT F.Nome, P.*
FROM Funcionarios F, Pedidos P
WHERE (F.CodFun = P.CodFun) AND (F.Nome LIKE 'A%')

--20
SELECT P.Descr, P.Unidades
FROM Produtos P, Fornecedores F
WHERE (P.CodFor = F.CodFor) AND (F.Empresa = 'Exotic Liquids')

--21
SELECT DISTINCT P.Descr
FROM Produtos P, DetalhesPed DP, Pedidos Pd
WHERE (P.CodProd = DP.CodProd) AND (DP.NumPed = Pd.NumPed)
AND (DP.Qtde >= 50) AND (YEAR(Pd.DataPed) = 1997)
ORDER BY P.Descr

--22
SELECT DISTINCT C.Descr, P.Descr
FROM Categorias C, Produtos P, DetalhesPed DP, Pedidos Pd
WHERE (C.CodCategoria = P.CodCategoria) AND (P.CodProd =
DP.CodProd) AND (DP.NumPed = Pd.NumPed) AND (DP.Qtde >= 50) AND
(YEAR(Pd.DataEntrega) = 1997)
ORDER BY C.Descr DESC


--23
SELECT C.*
FROM Clientes C INNER JOIN Pedidos P
ON C.Codcli = P.Codcli
AND YEAR(P.DataPed) = 1996

--24
SELECT F.Nome
from Funcionarios F INNER JOIN Pedidos P ON F.Codfun = P.Codfun
INNER JOIN Clientes C ON P.Codcli = C.Codcli
AND C.Nome = 'Around the horn'

--25
SELECT P.*
FROM Pedidos P INNER JOIN Clientes C ON P.Codcli = C.Codcli
AND C.Nome = 'Com�rcio Mineiro'

--26
SELECT F.*
FROM Funcionarios F INNER JOIN Pedidos P ON F.CodFun = P.CodFun
AND YEAR(P.DataPed) = 1996 AND MONTH(P.DataPed)= 9

--27
SELECT P.*, Pd.NumPed AS NumeroPedido
FROM Produtos P INNER JOIN DetalhesPed DP ON P.CodProd =
DP.CodProd
INNER JOIN Pedidos Pd ON DP.NumPed = Pd.NumPed
AND Pd.DataPed = '1996-07-08'

--28
SELECT F.Nome, P.NumPed AS NumeroPedido
FROM Funcionarios F INNER JOIN Pedidos P ON F.CodFun = P.CodFun
AND P.DataPed = '1997-05-01'

--29 Selecionar todos Pedidos por Nome de Funcionarios com Salarios maior que 10000
SELECT F.Nome, P.*
FROM Funcionarios F INNER JOIN Pedidos P ON F.CodFun = P.CodFun
AND F.Salario > 10000

--30
SELECT P.NumPed, C.Nome
FROM Pedidos P INNER JOIN Clientes C ON P.CodCli = C.CodCli
AND MONTH(P.DataPed) = 5 and YEAR(P.DataPed) = 1997

--31
SELECT DISTINCT C.Descr, P.Descr
FROM Categorias C INNER JOIN Produtos P ON C.CodCategoria =
P.CodCategoria
INNER JOIN DetalhesPed DP ON P.CodProd = DP.CodProd
AND DP.Qtde <= 10
INNER JOIN Pedidos Pd ON DP.NumPed = Pd.NumPed
AND YEAR(Pd.DataPed) = 1998
ORDER BY C.Descr DESC

--32
SELECT DP.*
FROM DetalhesPed DP INNER JOIN Pedidos P ON DP.NumPed = P.NumPed
AND YEAR(P.DataEntrega) = 1997

--33
SELECT DISTINCT C.Descr, P.Descr
FROM Categorias C CROSS JOIN Produtos P

--34
SELECT *
FROM Pedidos
WHERE CodCli IN (SELECT CodCli
FROM Clientes
WHERE Pais = 'Alemanha')

--35
SELECT *
FROM Produtos
WHERE CodCategoria IN (SELECT CodCategoria
FROM Categorias
WHERE Descr = 'Condimentos')

--36
SELECT Descr
FROM Produtos
WHERE CodFor NOT IN (SELECT CodFor
FROM Fornecedores
WHERE Pais = 'EUA')

--37
SELECT Descr
FROM Produtos
WHERE CodProd IN (SELECT CodProd
FROM DetalhesPed
WHERE NumPed IN (SELECT NumPed
FROM Pedidos
WHERE YEAR(Dataped) <> 1997
AND MONTH(Dataped) <> 3 ))

--38
SELECT CodProd, Descr, Preco
FROM Produtos
WHERE Preco = (SELECT MIN(Preco)
FROM Produtos)

--39
SELECT Nome, Salario
FROM Funcionarios
WHERE Salario = (SELECT MAX(Salario)
FROM Funcionarios)

--40
SELECT Nome, Salario
FROM Funcionarios
WHERE Salario = (SELECT MAX(Salario)
FROM Funcionarios)
OR Salario = (SELECT MIN(Salario)
FROM Funcionarios)
ORDER BY Salario

--41
SELECT CodProd, Descr, Preco
FROM Produtos
WHERE Preco > (SELECT AVG(Preco)
FROM Produtos)

--42
SELECT Nome, Sobrenome, Cargo, Salario
FROM Funcionarios
WHERE Cargo = 'Representante de Vendas'
AND Salario < ALL (SELECT Salario
FROM Funcionarios
WHERE Cargo LIKE 'gerente%'
OR Cargo LIKE 'coordenador%')

--43
SELECT Nome, Sobrenome, Cargo, Salario
FROM Funcionarios
WHERE Cargo LIKE 'Coordenador%'
AND Salario > ANY (SELECT Salario
FROM Funcionarios
WHERE Cargo = 'Representante de Vendas')

--44
SELECT F.Nome, P.*
FROM Funcionarios F, Pedidos P
WHERE F.CodFun = P.CodFun AND P.Frete > (SELECT AVG(Frete)
FROM Pedidos)

--45
SELECT *
FROM Produtos
WHERE Preco < ALL (SELECT Preco
FROM Produtos
WHERE CodCategoria IN (SELECT CodCategoria
FROM Categorias
WHERE Descr = 'Confeitos'))

--46 Fazer uma View com todos Produtos com Preco abaixo da M�dia.
CREATE VIEW Preco_Baixo AS
SELECT CodProd, Descr, Preco
FROM Produtos
WHERE Preco < (SELECT AVG(Preco)
FROM Produtos)

--47
SELECT *
FROM Preco_Baixo
WHERE Descr LIKE 'C%'

--48 Criar uma View Funcionarios_Cargo que calcule a soma das quantidades de Funcionario em ordem por Cargo.
CREATE VIEW Funcionarios_Cargo AS
SELECT Cargo, COUNT(*) AS FuncionariosPorCargo
FROM Funcionarios
GROUP BY Cargo

--49 Utilizando a View Funcionarios_Cargo
SELECT Cargo
FROM Funcionarios_Cargo
WHERE FuncionariosPorCargo = (SELECT MAX(FuncionariosPorCargo)
FROM Funcionarios_Cargo)

--50
CREATE VIEW Produtos_Categoria AS
SELECT P.Descr AS DescrProduto, C.Descr AS DescrCategoria
FROM Produtos P, Categorias C
WHERE P.CodCategoria = C.CodCategoria

--51
SELECT DescrCategoria, COUNT(*)AS
QuantidadeDeProdutosPorCategoria
FROM Produtos_Categoria
GROUP BY DescrCategoria

--52
CREATE VIEW Clientes_Resumo AS
SELECT CodCli, Nome, Contato, Cargo, Pais
FROM Clientes

--53
CREATE VIEW Pedidos_Resumo_abr97 AS
SELECT NumPed,CodCli,DataEntrega
FROM Pedidos
WHERE YEAR(DataEntrega) = 1997 AND MONTH(DataEntrega) = 4

--54
SELECT C.*
FROM Clientes_Resumo C INNER JOIN Pedidos_Resumo_abr97 P
ON C.CodCli = P.CodCli

--55
CREATE VIEW Clientes_Resumo_W AS
SELECT *
FROM Clientes_Resumo
WHERE Nome LIKE 'W%'

--56
DROP VIEW Preco_Baixo
DROP VIEW Funcionarios_Cargo
DROP VIEW Produtos_Categoria
DROP VIEW Clientes_Resumo
DROP VIEW Pedidos_Resumo_abr97
DROP VIEW Clientes_Resumo_W

--56
SELECT QTDE,
CASE
WHEN QTDE < 10 THEN 'DESCONTO = 0'
WHEN QTDE >= 10 AND QTDE < 30 THEN 'DESCONTO = 3'
WHEN QTDE >= 30 AND QTDE < 50 THEN 'DESCONTO = 5'
WHEN QTDE >=50 AND QTDE < 70 THEN 'DESCONTO = 7'
ELSE 'DESCONTO = 9'
END AS DescontoPedido
FROM DetalhesPed

--57
SELECT QTDE,
CASE
WHEN QTDE < 10 THEN 0
WHEN QTDE < 30 THEN 3
WHEN QTDE < 50 THEN 5
WHEN QTDE < 70 THEN 7
ELSE 9
END AS DescontoPedido
FROM DetalhesPed

--58
SELECT NOME,PAIS,
CASE(PAIS)
WHEN 'Brasil' THEN 'Exporta��o'
ELSE 'Importa��o'
END AS Situacao
FROM CLIENTES

--59
DECLARE @NOME VARCHAR(50)
SET @NOME = 'NATHAN CIRILLO E SILVA'
PRINT(@NOME)
PRINT(LEN(@NOME))

--60
CREATE PROCEDURE Busca_Func @CodFun INT
AS
SELECT Nome, Sobrenome, Cargo
FROM Funcionarios
WHERE CodFun = @CodFun
EXEC Busca_Func 2

--61
CREATE PROCEDURE Insere_Fornec
@Empresa VARCHAR(40),
@Contato VARCHAR(30),
@Cargo VARCHAR(30),
@Endereco VARCHAR(60),
@Cidade VARCHAR(15),
@Cep VARCHAR(10),
@Pais VARCHAR(15)
AS
INSERT INTO Fornecedores
VALUES
(@Empresa, @Contato, @Cargo, @Endereco, @Cidade, @Cep, @Pais)
EXEC Insere_Fornec 'CPS', 'Jos� Silva', 'Oper�rio', 'Rua 25 de
Mar�o', 'S�o Paulo', '12345', 'Brasil'

--62
CREATE PROCEDURE Insere_Detalhes
@NumPed INT,
@CodProd INT,
@Preco MONEY,
@Qtde SMALLINT,
@Desconto FLOAT
AS
DECLARE @ContagemNumPed INT
DECLARE @ContagemCodProd INT
DECLARE @Verifi caNumPedECodProd INT
SELECT @ContagemNumPed = COUNT(*)
FROM Pedidos
WHERE NumPed = @NumPed
SELECT @ContagemCodProd = COUNT(*)
FROM Produtos
WHERE CodProd = @CodProd
SELECT @Verifi caNumPedECodProd = COUNT(*)
FROM DetalhesPed
WHERE NumPed = @NumPed AND CodProd = @CodProd

--63
IF (@ContagemCodProd = 0)
PRINT 'Codigo do Produto n�o Cadastrado!';
ELSE IF (@ContagemNumPed = 0)
PRINT 'Numero do Pedido n�o Cadastrado!';
ELSE
BEGIN
IF (@Verifi caNumPedECodProd <> 0)
PRINT 'Produto j� cadastrado para esse pedido'
ELSE
BEGIN
INSERT INTO DetalhesPed
VALUES
(@NumPed, @CodProd, @Preco, @Qtde, @Desconto)
PRINT 'Dados Cadastrados com Sucesso!'
END;
END;
EXEC Insere_Detalhes 10868, 199, 1, 1, 1 --Codigo do Produto n�o Cadastrado!
EXEC Insere_Detalhes 100, 11, 1, 1, 1 --Numero do Pedido n�o Cadastrado!
EXEC Insere_Detalhes 10867, 53, 1, 1, 1 --Produto j� cadastrado para esse pedido
EXEC Insere_Detalhes 10867, 55, 1, 1, 1 --Dados Cadastrados com Sucesso!

--64
CREATE PROCEDURE Aumenta_Preco
@CodProd INT,
@PercAum DECIMAL(5,2)
AS
IF (@CodProd = 0)
UPDATE Produtos
SET Preco = Preco + (Preco * @PercAum);
ELSE
UPDATE Produtos
SET Preco = Preco + (Preco * @PercAum)
WHERE CodProd = @CodProd
EXEC Aumenta_Preco 43, 0.0 --um produtos
EXEC Aumenta_Preco 0, 0.0 --todos

--65
CREATE PROCEDURE Exclui_Produto
@CodProd INT
AS
IF (NOT EXISTS (SELECT CodProd
FROM Produtos
WHERE CodProd = @CodProd))
PRINT 'N�o h� produto cadastrado com esse c�digo para ser exclu�do!';
ELSE
BEGIN
DELETE FROM Produtos
WHERE CodProd = @CodProd
PRINT 'Dados Exclu�dos com Sucesso!'
END;
EXEC Exclui_Produto 444 --N�o h� produto cadastrado com esse c�digo para ser exclu�do!
EXEC Exclui_Produto 77 --Dados Exclu�dos com Sucesso!

--66
CREATE PROCEDURE Altera_Produto
@CodProd INT,
@DescrProd VARCHAR(40)
AS
IF (NOT EXISTS (SELECT CodProd
FROM Produtos
WHERE CodProd = @CodProd))
PRINT 'N�o h� produto cadastrado com esse c�digo para ser alterado!';
ELSE
BEGIN
UPDATE Produtos
SET Descr=@DescrProd
WHERE CodProd = @CodProd
PRINT 'Produto alterado com Sucesso!'
END;
EXEC Altera_Produto 444, 'chocolate' --N�o h� produto cadastrado com esse c�digo para ser alterado!
EXEC Altera_Produto 76, 'chocolate'

--67
CREATE PROC Exclui_Pedido
@numPed INT
AS
IF (NOT EXISTS (SELECT NumPed
FROM Pedidos
WHERE NumPed = @numPed))
PRINT 'N�o h� pedido cadastrado com esse n�mero!';
ELSE
BEGIN
DELETE FROM DetalhesPed
WHERE NumPed = @numPed
DELETE FROM Pedidos
WHERE NumPed = @numPed
PRINT 'Pedido Exclu�do com Sucesso!'
END;
EXEC Exclui_Pedido 22 --N�o h� pedido cadastrado com esse n�mero!
EXEC Exclui_Pedido 10867 --Pedido Exclu�do com Sucesso!

--68
CREATE PROC Funcionarios_Cargo
@cargo VARCHAR(30)
AS
IF (NOT EXISTS (SELECT Cargo
FROM Funcionarios
WHERE Cargo = @cargo))
PRINT 'N�o h� funcion�rios cadastrado com esse cargo!';
ELSE
BEGIN
SELECT *
FROM Funcionarios
WHERE Cargo=@cargo
END;
EXEC Funcionarios_Cargo 'secret�ria' --N�o h� funcion�rios cadastrado com esse cargo
EXEC Funcionarios_Cargo 'representante de vendas'
--69
CREATE PROCEDURE Aumenta_Salario
@CodFun INT,
@PercAum DECIMAL(5,2)
AS
IF (@CodFun = 0)
UPDATE Funcionarios
SET Salario = Salario + (Salario * @PercAum);
ELSE
UPDATE Funcionarios
SET Salario = Salario + (Salario * @PercAum)
WHERE CodFun = @CodFun
EXEC Aumenta_Salario 5, 0.0 --um funcion�rio
EXEC Aumenta_Salario 0, 0.0 --todos

--70
CREATE PROC Clientes_Cidade
@cidade VARCHAR(15)
AS
IF (NOT EXISTS (SELECT Cidade
FROM Clientes
WHERE Cidade = @cidade))
PRINT 'N�o h� clientes cadastrado para essa cidade!';
ELSE
BEGIN
SELECT *
FROM Clientes
WHERE Cidade=@cidade
END;
EXEC Clientes_Cidade 'Jundia�' --N�o h� clientes cadastrado para essa cidade
EXEC Clientes_Cidade 'Madrid'

--71
CREATE FUNCTION RetornaDiaDaSemana(@data DATE)
RETURNS VARCHAR(10)
AS
BEGIN
RETURN(DATENAME(WEEKDAY,@data));
END;
SELECT dbo.RetornaDiaDaSemana ('2009-05-01')

--72.
ALTER FUNCTION RetornaDiaDaSemanaPortugues(@data DATE)
RETURNS VARCHAR(15)
AS
BEGIN
DECLARE @diaSemana INT = DATEPART(WEEKDAY,@data);
DECLARE @diaSemanaPortugues VARCHAR(15);
SET @diaSemanaPortugues = CASE @diaSemana
WHEN 1 THEN 'Domingo'
WHEN 2 THEN 'Segunda-feira'
WHEN 3 THEN 'Ter�a-feira'
WHEN 4 THEN 'Quarta-feira'
WHEN 5 THEN 'Quinta-feira'
WHEN 6 THEN 'Sexta-feira'
WHEN 7 THEN 'S�bado'
END;
RETURN(@diaSemanaPortugues);
END;
SELECT dbo.RetornaDiaDaSemanaPortugues('2009-05-01')

--73
CREATE FUNCTION SomaIntervalo(@valorMinimo INT, @valorMaximo INT)
RETURNS INT
AS
BEGIN
DECLARE @soma INT = 0;
WHILE @valorMinimo <= @valorMaximo
BEGIN
SET @soma = @soma + @valorMinimo;
SET @valorMinimo = @valorMinimo + 1;
END;
RETURN @soma;
END
SELECT dbo.SomaIntervalo (1, 3)
SELECT dbo.SomaIntervalo (3, 1)

--74
CREATE FUNCTION DataFormatada(@Dia INT, @Mes INT, @Ano INT)
RETURNS CHAR(10)
AS
BEGIN
DECLARE @data CHAR(10);
SET @data = CONVERT(CHAR(2),@Dia) + '/' + CONVERT(CHAR(2),@Mes)
+ '/' + CONVERT(CHAR(4),@Ano);
RETURN @data;
END
SELECT dbo.DataFormatada (01, 03, 2011)

--75
CREATE FUNCTION PrimeiroDiaData(@Data DATE)
RETURNS CHAR(10)
AS
BEGIN
DECLARE @mes INT, @ano INT;
DECLARE @primeiroDia CHAR(10);
SET @mes = MONTH(@Data);
SET @ano = YEAR(@Data);
SET @primeiroDia = dbo.DataFormatada(1, @mes, @ano);
RETURN @primeiroDia;
END
SELECT dbo.PrimeiroDiaData ('2010-11-23')

--76
CREATE FUNCTION MediaNotas(@nota1 FLOAT, @nota2 FLOAT, @nota3
FLOAT, @nota4 FLOAT)
RETURNS FLOAT
AS
BEGIN
RETURN (@nota1 + @nota2 + @nota3 + @nota4) /4;
END
SELECT dbo.MediaNotas (1, 3, 4, 4)

--77
CREATE FUNCTION AreaQuadrado(@lado INT)
RETURNS INT
AS
BEGIN
RETURN @lado * @lado;
END
SELECT dbo.AreaQuadrado (2)

--78
CREATE FUNCTION SomaPares(@valorMinimo INT, @valorMaximo INT)
RETURNS INT
AS
BEGIN
DECLARE @soma INT = 0;
WHILE @valorMinimo <= @valorMaximo
BEGIN
IF (@valorMinimo%2) = 0
SET @soma = @soma + @valorMinimo;
SET @valorMinimo = @valorMinimo + 1;
END;
RETURN @soma;
END
SELECT dbo.SomaPares (1, 5)

--79
ALTER FUNCTION SomaImpares()
RETURNS INT
AS
BEGIN
DECLARE @i INT = 0, @soma INT = 0;
WHILE @i <= 50
BEGIN
IF (@i%2) = 1
SET @soma = @soma + @i;
SET @i = @i + 1;
END;
RETURN @soma;
END
SELECT dbo.SomaImpares()

--80
CREATE FUNCTION Equacao2Grau(@a INT, @b INT, @c INT)
RETURNS VARCHAR(30)
AS
BEGIN
DECLARE @resp VARCHAR(30);
DECLARE @delta FLOAT, @valor1 FLOAT, @valor2 FLOAT;
SET @delta = POWER(@b,2) - 4 * @a * @c;
IF @delta < 0
SET @resp = 'N�o h� resposta'
ELSE
IF @delta = 0
BEGIN
SET @valor1 = (- @b + SQRT(@delta)) / 2 * @a;
SET @resp = 'Resp1= ' + CONVERT(CHAR(5),@valor1)
END
ELSE
BEGIN
SET @valor1 = (- @b + SQRT(@delta)) / 2 * @a;
SET @valor2 = (- @b - SQRT(@delta)) / 2 * @a;
SET @resp = 'Resp1= ' + CONVERT(CHAR(5),@valor1) + ' e Resp2= ' + CONVERT(CHAR(5),@valor2);
END
RETURN @resp;
END
SELECT dbo.Equacao2Grau(3, 1, 2) --N�o h� resposta
SELECT dbo.Equacao2Grau(-1, 4, -4) --Resp1=2
SELECT dbo.Equacao2Grau(1, -5, 6) --Resp1=3 e Resp2=2

--81
SELECT *
FROM Clientes
WHERE Cidade = 'Buenos Aires'
ORDER BY Nome

--82
SELECT *
FROM Fornecedores
WHERE Pais = 'Jap�o'
ORDER BY Cargo DESC

--83
SELECT Cargo, COUNT(*) AS QtdeFornecedorPorCargo
FROM Fornecedores
GROUP BY Cargo

--84
SELECT Contato, Cargo, 'Clientes' AS tipo
FROM Clientes
WHERE Pais = 'Alemanha'
UNION
SELECT Contato, Cargo, 'Fornecedores' AS tipo
FROM Fornecedores
WHERE Pais = 'Brasil'
ORDER BY tipo

--85
SELECT Contato, Cargo
FROM Clientes
WHERE Cargo = 'Agente de vendas'
UNION
SELECT Contato, Cargo
FROM Fornecedores
WHERE Cargo = 'Gerente de Marketing'

--86
SELECT TOP 3 Descr, Preco
FROM Produtos
ORDER BY Preco DESC

--87
SELECT TOP 4 Descr, Preco
FROM Produtos
ORDER BY Preco

--88
SELECT SUM(Preco) AS Soma, AVG(Preco) AS Media, MAX(Preco) AS
MaiorPreco, MIN(Preco) AS MenorPreco
FROM Produtos
WHERE CodCategoria = (SELECT CodCategoria
FROM Categorias
WHERE Descr = 'Frutos do Mar')

--89
SELECT *, (Preco*1.10) AS PrecoAumentado
FROM Produtos
WHERE CodCategoria = (SELECT CodCategoria
FROM Categorias
WHERE Descr = 'Bebidas')

--90
SELECT *, (Preco - (Preco*0.2)) AS PrecoDiminuido
FROM Produtos
WHERE CodCategoria = (SELECT CodCategoria
FROM Categorias
WHERE Descr = 'Condimentos')

--91
SELECT p.*
FROM Pedidos p INNER JOIN Clientes c ON p.CodCli = c.CodCli
AND c.Cargo = 'Propriet�rio'

--92
SELECT *
FROM Pedidos
WHERE CodCli IN (SELECT CodCli
FROM Clientes
WHERE Cargo = 'Propriet�rio')

--93
SELECT DISTINCT c.*
FROM Clientes C INNER JOIN Pedidos Pd ON C.CodCli = Pd.CodCli
INNER JOIN DetalhesPed DP ON Pd.NumPed = DP.NumPed
INNER JOIN Produtos P ON DP.CodProd = P.CodProd
AND P.Descr = 'Guaran� Fant�stica'

--94
SELECT *
FROM Clientes
WHERE CodCli IN (SELECT CodCli
FROM Pedidos
WHERE NumPed IN (SELECT NumPed
FROM DetalhesPed
WHERE CodProd IN (SELECT CodProd
FROM Produtos
WHERE Descr = 'Guaran� Fant�stica')))

--95
SELECT *
FROM Clientes
WHERE CodCli IN (SELECT CodCli
FROM Pedidos
WHERE YEAR(DataPed)=1997 AND MONTH(DataPed)=09)

--96
SELECT *
FROM Produtos
WHERE CodProd IN (SELECT CodProd
FROM DetalhesPed
WHERE NumPed NOT IN (SELECT NumPed
FROM Pedidos
WHERE YEAR(DataPed) = 1996 AND MONTH(DataPed) = 04))

--97
SELECT Nome
FROM Clientes
WHERE CodCli IN (SELECT CodCli
FROM Pedidos
WHERE NumPed IN (SELECT NumPed
FROM DetalhesPed
WHERE CodProd NOT IN (SELECT CodProd
FROM Produtos
WHERE Descr = 'chocolade')) )

--98
SELECT Descr
FROM Produtos
WHERE CodProd IN (SELECT CodProd
FROM DetalhesPed
WHERE NumPed IN (SELECT NumPed
FROM Pedidos
WHERE CodCli IN (SELECT CodCli
FROM Clientes
WHERE Nome LIKE 'A%')))

--99
CREATE VIEW Produtos_carnes AS
SELECT P.*
FROM Produtos P JOIN Categorias C ON P.CodCategoria=C.
CodCategoria
AND C.Descr='carnes/aves'

--100
CREATE VIEW Pedidos_EUA AS
SELECT *
FROM Pedidos
WHERE CodCli IN (SELECT CodCli
FROM Clientes
WHERE Pais='EUA')

--101
CREATE VIEW Pedidos_entregues_berlin_1997 AS
SELECT P.*
FROM Pedidos P JOIN Clientes C ON P.CodCli=C.CodCli
AND C.Cidade='Berlin' AND YEAR(P.DataEntrega)=1997

--102
CREATE VIEW Pedidos_descontinuados AS
SELECT Pd.NumPed
FROM Pedidos Pd JOIN DetalhesPed DP ON Pd.NumPed=DP.NumPed
JOIN Produtos Pr ON DP.CodProd=Pr.CodProd
AND Pr.Descontinuado=1

--103
SELECT TOP 5 NumPed, DataEntrega
FROM Pedidos
ORDER BY Frete

--104
SELECT Nome, Sobrenome
FROM Funcionarios
WHERE DataNasc = (SELECT MAX(DataNasc)
FROM Funcionarios)

--105
CREATE VIEW Clientes_n96 AS
SELECT Nome, Contato, Cargo
FROM Clientes
WHERE CodCli NOT IN (SELECT CodCli
FROM Pedidos
WHERE YEAR(DataEntrega)=1996)

--106.
SELECT Cargo, COUNT(Cargo)
FROM Clientes_n96
GROUP BY Cargo

--107
CREATE VIEW Valores_Pais AS
SELECT Pais, SUM(Preco*Qtde) AS valor
FROM Clientes C JOIN Pedidos P ON C.CodCli=P.CodCli
JOIN DetalhesPed DP ON DP.NumPed=P.NumPed
GROUP BY Pais

--108
SELECT Pais
FROM Valores_Pais
WHERE valor > (SELECT AVG(valor)
FROM Valores_Pais)

--109
CREATE PROCEDURE Diminui_Preco
@CodProd INT,
@Perc DECIMAL(5,2)
AS
UPDATE Produtos
SET Preco = Preco - (Preco * @Perc)
WHERE CodProd = @CodProd
EXEC Diminui_Preco 43, 0.0 --um produtos
EXEC Diminui_Preco 90, 0.0 --n�o existe o produto

--110
CREATE PROCEDURE Fornecedores_Pais
@Pais VARCHAR(15)
AS
SELECT *
FROM Fornecedores
WHERE Pais=@Pais
EXEC Fornecedores_Pais 'Brasil'

--111
CREATE PROCEDURE Conta_Categoria
@Categoria VARCHAR(15)
AS
SELECT COUNT(CodProd)
FROM Produtos
WHERE CodCategoria IN (SELECT CodCategoria
FROM Categorias
WHERE Descr=@Categoria)
EXEC Conta_Categoria 'Confeitos'

--112
CREATE PROCEDURE Media_Frete
@DataInicial DATE,
@DataFinal DATE
AS
SELECT AVG(Frete) AS media, SUM(Frete) AS soma
FROM Pedidos
WHERE DataEntrega BETWEEN @DataInicial AND @DataFinal
EXEC Media_Frete '1996-01-01', '1996-12-31'

--113
CREATE FUNCTION SeuNomeParImpar(@SeuNome VARCHAR(10))
RETURNS VARCHAR(5)
AS
BEGIN
DECLARE @resp VARCHAR(5);
IF (LEN(@SeuNOme) % 2) = 0
SET @resp = 'Par'
ELSE
SET @resp = 'Impar';
RETURN @resp;
END
SELECT dbo.SeuNomeParImpar('Luciana') --Impar
SELECT dbo.SeuNomeParImpar('Caio') --Par

--114
CREATE TRIGGER AlertaInsercaoFornecedores
ON Fornecedores
FOR INSERT AS
PRINT ('Nova inser��o de fornecedor !!!')
INSERT INTO Fornecedores
VALUES ('Editora Erica', 'Jo�o', 'Editor', 'Rua de S�o Paulo','S�o Paulo', '', 'Brasil')

--115
CREATE TRIGGER Mensagem_Exclui_Pedidos
ON Pedidos
FOR DELETE AS
PRINT ('*** Pedido Exclu�do ***')
DELETE FROM Pedidos where NumPed=0

drop database empresa

/*
Otimiza��o de Banco de Dados.
 Como criar consultas SQL mais r�pidas :
Uma consulta mal projetada pode acarretar em lentid�o ao servidor ou at� mesmo fazer com que o
servidor permane�a fora do ar por um per�odo, impossibilitando o usu�rio de utilizar algum servi�o do
sistema ou site, gerando preju�zo a organiza��o.
Otimizar uma consulta SQL nem sempre � uma tarefa f�cil e simples, precisa um pouco de conhecimento
para desenvolver filtros que obtenham resultados que n�o custe ao servidor muitos recursos de hardware.
Muitos dos exemplos que irei demonstrar foram resultados de pesquisas e testes executados no pr�prio
Query Analyser do MS SQL Server 2000.
Uma forma de prejudicar bastante o desempenho ao acessar a base de dados, � a cria��o de TRIGGERS.
Esta instru��o � acionada sempre que uma determinada tabela sofre alguma altera��o (INSERT, UPDATE, DELETE).
Portanto, ao inv�s de criar uma �TRIGGER� prefira criar uma PROCEDURE que ser� acionada sempre que uma tarefa for feita.
Ao criar um simples filtro em uma tabela, pode-se encontrar alguns pontos que prejudicam a performance da consulta.
A consulta abaixo demonstra um dos exemplos:
*/

        SELECT
  * FROM
  Clientes


/*
Ao fazer algum filtro em uma tabela, evite informar todos os campos de uma tabela em uma consulta, a menos que isso for realmente necess�rio.
 Muitas das vezes n�o ser� utilizado todos os campos.
 A consulta acima pode ser executada rapidamente se a tabela da base de dados contiver poucos registros,
 mas para adquirir uma melhor performance da consulta � recomend�vel filtrar apenas os campos que ser�o utilizados,
 o exemplo abaixo demonstra um cen�rio parecido:
 */

        SELECT
  Nome,
  Telefone,
  CEP,
  Endereco
  Cidade
  FROM
  Clientes

/*
Outro ponto importante � a utiliza��o da instru��o COUNT, esta instru��o informa a quantidade de registros retornados em uma consulta.
*/
        SELECT
        COUNT(*)
  FROM
  Clientes
/*
Por�m n�o h� a necessidade de utiliza��o desta consulta, porque ao execut�-la, ser� contado um registro de cada vez.
Para isto existe as tabelas �sysobjects� e �sysindexes�.
Com estas duas tabelas � poss�vel obter muitas informa��es de diversos todos objetos existentes na base de dados.
*/

        SELECT
  sysobjects.name AS [Clientes],
  sysindexes.rowcnt AS [Qtde. de Registros]
  FROM
  sysobjects
  INNER JOIN
  sysindexes ON
  sysindexes.id = sysobjects.id
  WHERE
  sysobjects.name = 'Clientes'
  AND
  sysindexes.indid = 1

  /*
A consulta acima informa a quantidade de registros existentes na tabela �Cliente�.
Reparem que foi utilizado uma nova instru��o, o INNER JOIN.
Esta instru��o serve para fazer a jun��o de duas ou mais tabelas,
lembrando que isto significa que DEVE possuir algum registro na tabela secund�ria,
ou seja na tabela que est� recebendo o INNER JOIN, sendo assim,
� necess�rio fazer a compara��o de campos em comum que as duas possuem.
Certifique-se que o nome da tabela escrito na cl�usula WHERE est� correto,
caso contr�rio n�o ser� retornado nenhum registro.
Esta consulta � outro exemplo que poder� trazer problemas de performance, porque ao utiliz�-la,
a consulta toda pode acessar qualquer uma das informa��es (campos) existentes nas tabelas.
 Uma outra forma de consultar a quantidade de registros de uma tabela � a seguinte:
 */

        SELECT
  sysindexes.rowcnt AS [Qtde. de Registros]
  FROM
  sysindexes
  WHERE
  sysindexes.indid = 1
  AND
  EXISTS(
   SELECT
   sysobjects.id
   FROM
   sysobjects
   WHERE
   sysobjects.id= sysindexes.id
  AND
  sysobjects.name= 'Clientes'
  )

/*
Ao fazer um filtro como o acima, pode-se obter resultados muito eficazes em rela��o ao desempenho.
A instru��o EXISTS � uma instru��o extremamente r�pida porque utiliza pouco recurso de hardware.
� como se retornasse uma vari�vel booleana.
Outra instru��o que consome um maior processamento � a instru��o IN,
que � utilizada quando � necess�rio fazer o filtro de um vetor de dados.
O exemplo abaixo informa os todos clientes que possuir Nome.
*/

        SELECT
  * FROM
  Clientes

  SELECT
  Nome
  FROM
  Clientes
  WHERE
  CodCli IN(SELECT CodCli FROM clientes)

/*
Outra maneira de informar estes registro seria utilizar (novamente) a instru��o EXISTS ao inv�s da instru��o IN.
*/

        SELECT
  Clientes.Nome
  FROM
  Clientes
  WHERE
  EXISTS(
  SELECT
  Clientes.CodCli
  FROM
  Clientes
  WHERE
  Clientes.CodCli= Clientes.CodCli
  )

/*
S�o in�meras as tarefas que se pode fazer para melhorar a performance de uma consulta.
Estas s�o apenas algumas opera��es que devem ser feitas caso necessita de resultados mais r�pidos em consultas SQL.
*/