SELECT
	sno_personal.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS Nombres,
	sno_personal.estper,
	CASE sno_personalnomina.staper
		WHEN '1' THEN 'Activo'
		WHEN '2' THEN 'Vacación'
	END,
	sno_constantepersonal.codnom,
	sno_nomina.desnom,
	sno_constantepersonal.codcons,
	sno_constantepersonal.moncon
FROM 
	sno_constantepersonal, 
	sno_personalnomina,
	sno_personal,
	sno_nomina,
	sno_conceptopersonal
WHERE 
	sno_constantepersonal.codper=sno_personalnomina.codper AND
	sno_constantepersonal.codper=sno_personal.codper AND
	sno_constantepersonal.codnom=sno_personalnomina.codnom AND
	sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
	sno_constantepersonal.codcons='0000000006' AND 
	sno_personal.estper='1' AND
	sno_personalnomina.staper BETWEEN '1' AND '2'  AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	
	sno_constantepersonal.codnom=sno_conceptopersonal.codnom AND
	sno_constantepersonal.codper=sno_conceptopersonal.codper AND
	sno_constantepersonal.codcons=sno_conceptopersonal.codconc AND
	sno_conceptopersonal.aplcon=1 AND
	
	sno_constantepersonal.moncon>0
ORDER BY
	sno_constantepersonal.codnom

	