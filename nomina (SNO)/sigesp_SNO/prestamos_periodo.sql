SELECT 
	codemp,
	codnom,
	codper,
	numpre,
	codtippre,
	numcuo,
	percob,
	feciniper,
	fecfinper,
	moncuo,
	estcuo 
FROM 
	sno_prestamosperiodo
WHERE 
	codemp='0001' AND
	codnom='0001' AND
	codper='0006880620' AND
	numpre IN (	SELECT 
				numpre
			FROM 
				sno_prestamos
			WHERE 
				codemp='0001' AND
				codnom='0001' AND
				codper='0006880620' AND
				stapre='1')
				

