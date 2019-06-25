SELECT 
	codnom, 
	codper, 
	apoper, 
	(SELECT 
		montasint 
	FROM 
		sno_fideiintereses 
	WHERE 
		codemp = '0001' AND 
		anoint = '2013' AND 
		mesint = 06) AS montasint, 
	(SELECT
		moncap 
	FROM 
		sno_fideiperiodointereses 
	WHERE 
		sno_fideiperiodointereses.codemp = '0001' AND 
		sno_fideiperiodointereses.anocurper = '2013' AND 
		sno_fideiperiodointereses.mescurper = 5 AND 
		sno_fideiperiodointereses.codemp = sno_fideiperiodo.codemp AND 
		sno_fideiperiodointereses.codnom = sno_fideiperiodo.codnom AND 
		sno_fideiperiodointereses.codper = sno_fideiperiodo.codper ) AS moncap, 
	--Acumulado anterior
	(SELECT 
		SUM(apoper) 
	FROM 
		sno_fideiperiodo as sno_fideiperiodo01
	WHERE 
		sno_fideiperiodo.codemp = '0001' AND 
		sno_fideiperiodo.codemp = sno_fideiperiodo01.codemp AND 
		sno_fideiperiodo.codper = sno_fideiperiodo01.codper ) +
	(SELECT
		sno_fideiperiodointereses.moncap
	FROM
		sno_fideiperiodointereses
	WHERE
		sno_fideiperiodo.codper = sno_fideiperiodointereses.codper AND
		sno_fideiperiodointereses.anocurper='2012' AND
		sno_fideiperiodointereses.mescurper=12)	 AS deudaanterior, 
	(SELECT 
		sum(monant) 
	FROM 
		sno_anticipoprestaciones 
	WHERE 
		sno_anticipoprestaciones.codemp = '0001' AND 
		sno_anticipoprestaciones.codemp = sno_fideiperiodo.codemp AND 
		sno_anticipoprestaciones.codper = sno_fideiperiodo.codper AND 
		EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 06 AND 
		sno_anticipoprestaciones.estant='A') AS anticipos 
FROM 
	sno_fideiperiodo 
WHERE 
	codper='0006880620' AND
	codemp = '0001' AND 
	((codnom='0002')) AND 
	anocurper = '2013' AND 
	mescurper = 06 
ORDER BY codper 