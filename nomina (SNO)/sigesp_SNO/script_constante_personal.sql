SELECT
	sno_constantepersonal.codper,
	sno_constantepersonal.codcons,
	sno_concepto.nomcon,
	sno_conceptopersonal.aplcon,
	sno_constantepersonal.moncon
FROM
	sno_constantepersonal,
	sno_conceptopersonal,
	sno_concepto
WHERE
	sno_constantepersonal.codper='0006880620' AND
	sno_constantepersonal.moncon>0 AND
	sno_constantepersonal.codnom='0001' AND
	
	sno_constantepersonal.codper=sno_conceptopersonal.codper AND
	sno_constantepersonal.codnom=sno_conceptopersonal.codnom AND
	sno_constantepersonal.codcons=sno_conceptopersonal.codconc AND

	sno_constantepersonal.codnom=sno_concepto.codnom AND
	sno_constantepersonal.codcons=sno_concepto.codconc
	
	
