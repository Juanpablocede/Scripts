SELECT
	sno_personal.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper) AS Nombres,	
	sno_personalnomina.sueper,
	sno_personalnomina.codtab,
	sno_tabulador.destab,
	sno_personalnomina.codgra,
	sno_personalnomina.codpas,
	sno_personalnomina.codnom,
	sno_nomina.desnom,
	sno_personalnomina.staper,
	CASE sno_personalnomina.staper
		WHEN '1' THEN 'Activo'
		WHEN '2' THEN 'Vacaciones'
		WHEN '4' THEN 'Suspendido'
	END 
FROM
	sno_personal,
	sno_personalnomina,
	sno_tabulador,
	sno_nomina
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.codtab=sno_tabulador.codtab AND
	sno_personalnomina.codnom=sno_tabulador.codnom AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	sno_personalnomina.staper IN ('1','2','4') AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010'
ORDER BY
	sno_personalnomina.codnom,
	sno_personalnomina.codper