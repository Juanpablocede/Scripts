SELECT
	sno_concepto.codconc,
	sno_concepto.nomcon,
	sno_salida.valsal
FROM
	sno_concepto,
	sno_conceptopersonal,
	sno_salida
WHERE
	sno_concepto.codconc=sno_conceptopersonal.codconc AND
	sno_concepto.codnom=sno_conceptopersonal.codnom AND
	sno_concepto.sueintcon=1 AND
	sno_conceptopersonal.codper=sno_salida.codper AND
	sno_conceptopersonal.codnom=sno_salida.codnom AND
	sno_conceptopersonal.codconc=sno_salida.codconc AND
	sno_salida.valsal>0 AND
	sno_concepto.codnom='0001' AND
	sno_conceptopersonal.codper='0006880620'

	
ORDER BY
	sno_concepto.codconc
