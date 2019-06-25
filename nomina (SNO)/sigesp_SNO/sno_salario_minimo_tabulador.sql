--SUELDO MINIMO TABULADOR
select 
	sno_grado.codemp,
	sno_grado.codnom,
	sno_grado.codtab,
	sno_grado.codpas,
	sno_grado.codgra,
	sno_grado.monsalgra*30
from
	sno_tabulador,
	sno_grado
where
	sno_tabulador.codtab=sno_grado.codtab and
	sno_tabulador.codnom=sno_grado.codnom and
	sno_tabulador.destab like '%JUL 2017-2%' and
	sno_grado.codnom between '0006' and '0010'
order by
	sno_grado.monsalgra asc

--SUELDO MINIMO TABULADOR
select 
	sueper*30 
from 
	sno_personalnomina 
where 
	(staper='1' or staper='2') and 
	codnom between '0000' and '0010' 
order by sueper asc