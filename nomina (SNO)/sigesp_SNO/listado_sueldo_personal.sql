SELECT 
	sno_personal.codper,
	sno_personal.nomper,
	sno_personal.apeper,
	sno_asignacioncargo.denasicar,
	sno_personalnomina.sueper 
FROM 
	sno_personal
	JOIN sno_personalnomina ON sno_personal.codper=sno_personalnomina.codper
	JOIN sno_asignacioncargo ON sno_personalnomina.codnom=sno_asignacioncargo.codnom AND
	sno_personalnomina.codasicar=sno_asignacioncargo.codasicar
WHERE 
	sno_personalnomina.codnom BETWEEN '0000' AND '0005' AND 
	sno_personalnomina.staper='1' AND
	--sno_personalnomina.coddep like '%002009'
ORDER BY
	sno_personalnomina.sueper DESC