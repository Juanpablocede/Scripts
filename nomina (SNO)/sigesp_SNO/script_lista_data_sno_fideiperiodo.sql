 SELECT 
	sno_fideiperiodo.codnom, 
	sno_fideiperiodo.codper, 
	sno_fideiperiodo.apoper AS "Aporte Mes", 
	(SELECT 
		sno_fideiintereses.montasint 
	FROM 
		sno_fideiintereses 
	WHERE 
		sno_fideiintereses.codemp = '0001' AND 
		sno_fideiintereses.anoint = '2014' AND 
		sno_fideiintereses.mesint = 07) AS "Tasa Interes", 
	CASE 
		COALESCE((SELECT 
			sno_fideiperiodointereses.moncap
		FROM 
			sno_fideiperiodointereses 
		WHERE 
			sno_fideiperiodointereses.codemp = '0001' AND 
			sno_fideiperiodointereses.anocurper = '2014' AND 
			sno_fideiperiodointereses.mescurper = 6 AND 
			sno_fideiperiodointereses.codemp = sno_fideiperiodo.codemp AND 
			sno_fideiperiodointereses.codper = sno_fideiperiodo.codper),0)
	--Busca antiguedad de un mes inmediatamente inferior al mes que se esta procesando los intereses.
	WHEN
		(SELECT 
			sno_fideiperiodointereses.moncap
		FROM 
			sno_fideiperiodointereses 
		WHERE 
			sno_fideiperiodointereses.codemp = '0001' AND 
			sno_fideiperiodointereses.anocurper = '2014' AND 
			sno_fideiperiodointereses.mescurper = 6 AND 
			sno_fideiperiodointereses.codemp = sno_fideiperiodo.codemp AND 
			sno_fideiperiodointereses.codper = sno_fideiperiodo.codper AND
			sno_fideiperiodointereses.moncap>0)
	THEN 
		COALESCE((SELECT 
			sno_fideiperiodointereses.moncap
		FROM 
			sno_fideiperiodointereses 
		WHERE 
			sno_fideiperiodointereses.codemp = '0001' AND 
			sno_fideiperiodointereses.anocurper = '2014' AND 
			sno_fideiperiodointereses.mescurper = 6 AND 
			sno_fideiperiodointereses.codemp = sno_fideiperiodo.codemp AND 
			sno_fideiperiodointereses.codper = sno_fideiperiodo.codper),0)
	--Busca antiguedad de dos meses inmediatamente inferior al mes que se esta procesando los intereses.
	WHEN
		(SELECT 
			sno_fideiperiodointereses.moncap
		FROM 
			sno_fideiperiodointereses 
		WHERE 
			sno_fideiperiodointereses.codemp = '0001' AND 
			sno_fideiperiodointereses.anocurper = '2014' AND 
			sno_fideiperiodointereses.mescurper = 5 AND 
			sno_fideiperiodointereses.codemp = sno_fideiperiodo.codemp AND 
			sno_fideiperiodointereses.codper = sno_fideiperiodo.codper AND
			sno_fideiperiodointereses.moncap>0)
	THEN 
		COALESCE((SELECT 
			sno_fideiperiodointereses.moncap
		FROM 
			sno_fideiperiodointereses 
		WHERE 
			sno_fideiperiodointereses.codemp = '0001' AND 
			sno_fideiperiodointereses.anocurper = '2014' AND 
			sno_fideiperiodointereses.mescurper = 5 AND 
			sno_fideiperiodointereses.codemp = sno_fideiperiodo.codemp AND 
			sno_fideiperiodointereses.codper = sno_fideiperiodo.codper),0)	
	END AS "Antig. Acum. Mes Anterior", 
	/*(SELECT 
		(monpreant+monint) 
	FROM 
		sno_deudaanterior 
	WHERE 
		sno_deudaanterior.codemp = '0001' AND 
		sno_deudaanterior.feccordeu <= '2014-06-01' AND 
		sno_deudaanterior.codemp = sno_fideiperiodo.codemp AND 
		sno_deudaanterior.codper = sno_fideiperiodo.codper ) AS deudaanterior, */
	sno_fideiperiodo.apoper + 
	(SELECT 
		sno_fideiperiodointereses.moncap
	FROM 
		sno_fideiperiodointereses 
	WHERE 
		sno_fideiperiodointereses.codemp = '0001' AND 
		sno_fideiperiodointereses.anocurper = '2014' AND 
		sno_fideiperiodointereses.mescurper = 6 AND 
		sno_fideiperiodointereses.codemp = sno_fideiperiodo.codemp AND 
		sno_fideiperiodointereses.codper = sno_fideiperiodo.codper ) AS "Antig. Acum. Mes",
	(SELECT 
		SUM(sno_anticipoprestaciones.monant) 
	FROM 
		sno_anticipoprestaciones 
	WHERE 
		sno_anticipoprestaciones.codemp = '0001' AND 
		sno_anticipoprestaciones.codemp = sno_fideiperiodo.codemp 
		AND sno_anticipoprestaciones.codper = sno_fideiperiodo.codper AND 
		EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 07 AND 
		EXTRACT(YEAR FROM(sno_anticipoprestaciones.fecant))= 2014 AND 
		sno_anticipoprestaciones.estant='A') AS "Anticipos" 
FROM 
	sno_fideiperiodo 
WHERE 
	sno_fideiperiodo.codemp = '0001' AND 
	sno_fideiperiodo.anocurper = '2014' AND 
	sno_fideiperiodo.mescurper = 07 and sno_fideiperiodo.codper='0012545441'
ORDER BY 
	sno_fideiperiodo.codper
