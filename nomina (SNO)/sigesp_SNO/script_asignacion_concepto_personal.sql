SELECT
	sno_constantepersonal.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper) AS nombres,
	sno_constantepersonal.codcons,
	sno_concepto.nomcon,
	sno_constantepersonal.moncon,
	sno_conceptopersonal.aplcon,
	sno_constantepersonal.codnom
FROM 
	sno_constantepersonal,
	sno_conceptopersonal,
	sno_concepto,
	sno_personal
WHERE 
	sno_constantepersonal.codper=sno_conceptopersonal.codper AND
	sno_constantepersonal.codnom=sno_conceptopersonal.codnom AND
	sno_constantepersonal.codcons=sno_conceptopersonal.codconc AND
	sno_constantepersonal.codnom=sno_concepto.codnom AND
	sno_constantepersonal.codcons=sno_concepto.codconc AND
	sno_constantepersonal.codper=sno_personal.codper AND
	sno_conceptopersonal.aplcon=1 AND
	sno_personal.estper='1' AND
	sno_constantepersonal.codcons BETWEEN '0000000006' AND '0000000008' AND
	sno_constantepersonal.codnom BETWEEN '0000' AND '0010'
ORDER BY
	sno_constantepersonal.codper,
	sno_constantepersonal.codcons