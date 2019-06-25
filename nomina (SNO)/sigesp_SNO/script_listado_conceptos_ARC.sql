SELECT 
	sno_concepto.codnom,
	sno_nomina.desnom,
	sno_concepto.codconc,
	sno_concepto.titcon,
	sno_concepto.aplisrcon,
	sno_concepto.sueintcon,
	sno_concepto.aplarccon
FROM
	sno_concepto,
	sno_nomina
WHERE
	sno_concepto.codnom=sno_nomina.codnom AND
	sno_concepto.aplarccon=1
ORDER BY
	sno_concepto.codnom,
	sno_concepto.codconc