SELECT
	sno_personal.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS Nombres,
	sno_concepto.codconc,
	sno_concepto.nomcon,
	sno_concepto.forcon
FROM
	sno_personal,
	sno_concepto,
	sno_conceptopersonal
WHERE
	sno_conceptopersonal.codper=sno_personal.codper AND
	sno_conceptopersonal.codnom=sno_concepto.codnom AND
	sno_conceptopersonal.codconc=sno_concepto.codconc AND
	sno_concepto.codnom IN('9000') AND
	sno_conceptopersonal.codper='0006880620'
ORDER BY
	sno_conceptopersonal.codper