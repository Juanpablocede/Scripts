/*LISTADO DE INCIDENCIAS MENSUALES*/
SELECT  
	sno_personal.cedper,
	sno_personal.nomper||' '||sno_personal.apeper as trabajador,
	sno_hsalida.codnom,
	TO_CHAR(sno_periodo.fecdesper,'MM') as mes,
	SUM(sno_hsalida.valsal)as asignaciontotal

into 	sno_tmp_incidencias
	

FROM
	sno_hsalida,
	sno_periodo,
	sno_personal
	
WHERE	
	sno_personal.codper=sno_hsalida.codper AND

	sno_hsalida.codnom between '0000' and '0010' AND
	sno_hsalida.codnom=sno_periodo.codnom AND
	sno_hsalida.codperi=sno_periodo.codperi AND
	((sno_hsalida.codconc BETWEEN '0000000070' AND '0000000123') OR 
	(sno_hsalida.codconc BETWEEN '0000000030' AND '0000000067') OR 
	sno_hsalida.codconc='0000000015' OR sno_hsalida.codconc='0000000016' OR 
	sno_hsalida.codconc='0000000018' ) 
	
GROUP BY
	sno_personal.cedper,
	trabajador,

	sno_hsalida.codnom,
	TO_CHAR(sno_periodo.fecdesper,'MM')
ORDER BY
	sno_personal.cedper DESC,
	TO_CHAR(sno_periodo.fecdesper,'MM');

/*-----------------------------------*/


/*LISTADO DE INCIDENCIA MAYOR*/

select 
	cedper,
	trabajador,
	codnom,

	MAX(asignaciontotal) as asignacion 
from 	
	sno_tmp_incidencias
group by
	cedper,
	trabajador,
	codnom
ORDER BY asignacion

/*----------------------------*/

/* BORRAR TABLA */
--drop table sno_tmp_incidencias

