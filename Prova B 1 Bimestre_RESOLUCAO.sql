-- exercicio 01

SELECT nomeEstado, NumHabitantes 
FROM (SELECT SUM(C.NumHabitantes) NumHabitantes, E.nomeEstado, E.IDEstado 
      FROM Estado E, Cidade C 
      WHERE E.IDEstado = C.IDEstado 
      GROUP BY E.nomeEstado, E.IDEstado) MAX_ESTADO
      WHERE MAX_ESTADO.NumHabitantes = ( SELECT MAX(NumHabitantes)
					 FROM (SELECT SUM(C.NumHabitantes) NumHabitantes, 
						E.nomeEstado, E.IDEstado 
					 FROM Estado E, Cidade C 
					 WHERE E.IDEstado = C.IDEstado 
					 GROUP BY E.nomeEstado, E.IDEstado) SUM_ESTADO)