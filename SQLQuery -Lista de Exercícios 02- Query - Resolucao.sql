use Lista_DDL_DML
/* 1- Selecione todos os campos da tabela time.*/
select * from time
/* 2- Selecione os campos nome jogador e idade da tabela jogadores*/
select nomeJogador Jogador,
Idade as Idade
From Jogadores
/* 3- Selecione todos os campos da tabela de jogadores.*/
select * from Jogadores
/* 4- Selecione os campos nome jogador e idade da tabela de jogadores e o nome do time
da tabela de time permitindo filtro por qualquer parte do nome do time que contenha ‘A’. */
select nomeJogador Jogador,Idade as Idade,nomeTime Time
From Jogadores,  Time
where  nomeTime like '%A%'
/* 5- Selecione o nome do jogador, idade, e nome do time dos jogadores filtrando somente
a time “Mogi Mirim Futebol Clube” em ordem decrescente de Idade. */
select J.nome, J.idade, T.nome
from Jogadores J
inner join Time t
on J.idTime = T.id
where T.nome = 'Mogi Mirim Futebol';
/*6 - Selecione a média de idade dos jogadores por time.*/
select AVG(J.idade) as "Média", T.nome
from Jogadores J, Time T
where T.id = J.idTime
group by T.nome
/*7 - Selecione a quantidade de time cadastradas na tabela de time.*/
select COUNT(T.id) as "Quantidade de Times Cadastrados"
from Time T 
/*8 - Selecione a quantidade de jogadores cadastrados por time ordenado por time.*/
select COUNT(J.id) as "Quantidade de Jogadores por time", T.nome as "Nome do Time"
from Jogadores J, Time T
where T.id = J.idTime
group by T.nome
/*9 - Selecione o time e um contador por idade dos jogadores em ordem por time.*/
select T.nome, COUNT(J.idade) as "Número de Jogadores por Time"
from Time T, Jogadores J
where T.id = J.idTime
group by T.nome order by T.nome
/*10 - Selecione o time, nome do jogadores e idade em ordem por idade decrescente.*/
select T.nome, J.nome, J.idade
from Time T
inner join Jogadores J
on T.id = J.idTime
order by J.idade desc
/*11 - Selecione nome de jogador, idade e time filtrando nome jogador que pertença aos
times começados com Mogi.*/
select J.nome, J.idade, T.nome as 'Nome Time'
from Jogadores J
inner join Time T
on T.id = J.idTime
where T.nome like 'Mogi%'
/*12 – Selecione o time do jogador e a média de idade dividido por número de registros.
Ordene a consulta por IDTime.*/
select T.nome, AVG(J.idade)/(select count(J.id) 
                             from Jogadores J ) as "Cálculo"
from Time T
inner join Jogadores J
on T.id = J.idTime
group by T.nome
order by T.nome
/*13 – Selecione o time e a idade média dos jogadores, filtrar a média de idade maior de 30
anos. Ordene a consulta por nome do time.*/
select T.nome, AVG(J.idade) as "Média"
from Time T
inner join Jogadores J
on T.id = J.idTime
where(select AVG(Jogadores.idade)
        from Jogadores ) > 30
group by T.nome
/*14 – Selecione todos os times e jogadores mesmo que o time não tenho jogador
cadastrado.*/
select T.nome, J.nome
from Time T
Left join Jogadores J
on T.id = J.idTime
