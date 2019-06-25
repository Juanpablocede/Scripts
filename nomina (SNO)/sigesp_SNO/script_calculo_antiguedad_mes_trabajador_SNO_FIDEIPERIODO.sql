SELECT 
	'0001'AS codemp,
	sno_hnomina.codnom,
	sno_hpersonalnomina01.codper, 
	sno_personal.fecingper,
	CASE sno_hnomina.tippernom 
		WHEN '1' THEN MAX(sno_hpersonalnomina01.sueper) 
		WHEN '0' THEN MAX(sno_hpersonalnomina01.sueper)*30 
	END AS sueper,
	
	'2014' AS anocurper,  -- SELECCION AÑO DEL FORMULARIO
	10 AS mescurper,      -- SELECCION MES DEL FORMLARIO
	(SELECT 
		MAX(sno_hpersonalnomina04.sueintper) 
	FROM 
		sno_hpersonalnomina AS sno_hpersonalnomina04, 
		sno_hperiodo 
	WHERE 
		sno_hpersonalnomina04.codper=sno_hpersonalnomina01.codper AND 
		sno_hpersonalnomina04.codnom='5000' AND 
		sno_hpersonalnomina04.codemp =sno_hperiodo.codemp AND 
		sno_hpersonalnomina04.codnom =sno_hperiodo.codnom AND 
		sno_hpersonalnomina04.anocur =sno_hperiodo.anocur AND 
		sno_hpersonalnomina04.codperi=sno_hperiodo.codperi AND 
		substr(cast(sno_hperiodo.fecdesper as char(10)),6,2) = '10' AND 
		substr(cast(sno_hperiodo.fecdesper as char(10)),1,4)= '2014') AS vacaciones,
	0 AS bonfinper,
	(SELECT 
		SUM(sno_hsalida.valsal) AS valsal 
	FROM 
		sno_hsalida INNER JOIN sno_hconcepto ON sno_hsalida.codemp = sno_hconcepto.codemp AND 
		sno_hsalida.codnom = sno_hconcepto.codnom AND 
		sno_hsalida.anocur = sno_hconcepto.anocur AND 
		sno_hsalida.codperi = sno_hconcepto.codperi AND 
		sno_hsalida.codconc = sno_hconcepto.codconc INNER JOIN sno_hperiodo ON sno_hsalida.codemp = sno_hperiodo.codemp AND 
		sno_hsalida.codnom = sno_hperiodo.codnom AND 
		sno_hsalida.anocur = sno_hperiodo.anocur AND 
		sno_hsalida.codperi = sno_hperiodo.codperi INNER JOIN sno_hnomina ON sno_hsalida.codemp = sno_hnomina.codemp AND 
		sno_hsalida.codnom = sno_hnomina.codnom AND 
		sno_hsalida.anocur = sno_hnomina.anocurnom AND 
		sno_hsalida.codperi = sno_hnomina.peractnom 
	WHERE 
		sno_hsalida.codemp='0001' AND 
		sno_hpersonalnomina01.codper=sno_hsalida.codper AND 
		sno_hsalida.anocur = '2014' AND 
		substr(cast(sno_hperiodo.fecdesper as char(10)),6,2) = '10' AND 
		substr(cast(sno_hperiodo.fecdesper as char(10)),1,4) = '2014' AND 
		sno_hnomina.espnom = '0' AND 
		sno_hconcepto.sueintcon = 1) AS sueintper,
	0 AS apoper,
	0 AS bonextper,
	5 AS dias_antiguedad_mes,
	-- DETERMINADO LOS DIAS ADICIONALES CONIDERANDO EL CORTE AL 30/06/1997
	CASE sno_personal.fecingper
		WHEN 
			(SELECT 
				sno_personal01.fecingper 
			FROM 
				sno_personal AS sno_personal01
			WHERE 
				sno_personal01.codper=sno_hpersonalnomina01.codper AND
				sno_personal01.fecingper<='30-06-1997')
		THEN 
			CASE (((2014-1997)-1)*2)
				WHEN
					(SELECT
						(((2014-1997)-1)*2) 
					FROM 
						sno_personal AS sno_personal01
					WHERE 
						sno_personal01.codper=sno_hpersonalnomina01.codper AND
						(((2014-1997)-1)*2)>=30  AND 6=6) --COMPARAR EL MES DE PROCESO CON EL MES 6 QUE ES 
										--ALLI DONDE SE COMPUTAN LOS DIAS ADICONALES
				THEN 30
				WHEN
					(SELECT
						(((2014-1997)-1)*2) 
					FROM 
						sno_personal AS sno_personal01
					WHERE 
						sno_personal01.codper=sno_hpersonalnomina01.codper AND
						(((2014-1997)-1)*2) BETWEEN 1 AND 29 AND 6=6)
				THEN (((2014-1997)-1)*2)
				WHEN
					(SELECT
						(((2014-1997)-1)*2) 
					FROM 
						sno_personal AS sno_personal01
					WHERE 
						sno_personal01.codper=sno_hpersonalnomina01.codper AND
						(((2014-1997)-1)*2) <=0 AND 6=6)
				THEN 0
			END
		WHEN 
			(SELECT 
				sno_personal01.fecingper 
			FROM 
				sno_personal AS sno_personal01
			WHERE 
				sno_personal01.codper=sno_hpersonalnomina01.codper AND
				sno_personal01.fecingper>='01-07-1997')
		THEN
			CASE EXTRACT(MONTH FROM sno_personal.fecingper)
				WHEN 
					(SELECT 
						EXTRACT(MONTH FROM sno_personal01.fecingper) 
					FROM 
						sno_personal AS sno_personal01
					WHERE 
						sno_personal01.codper=sno_hpersonalnomina01.codper AND
						(EXTRACT(MONTH FROM sno_personal01.fecingper)=10))
				THEN 
					CASE (((2014-extract(YEAR FROM sno_personal.fecingper))-1)*2)
						WHEN 
							(SELECT 
								(((2014-extract(YEAR FROM sno_personal01.fecingper))-1)*2) 
							FROM 
								sno_personal AS sno_personal01
							WHERE 
								sno_personal01.codper=sno_hpersonalnomina01.codper AND
								(((2014-extract(YEAR FROM sno_personal01.fecingper))-1)*2)>=30)
						THEN 30
						WHEN 
							(SELECT 
								(((2014-extract(YEAR FROM sno_personal01.fecingper))-1)*2) 
							FROM 
								sno_personal AS sno_personal01
							WHERE 
								sno_personal01.codper=sno_hpersonalnomina01.codper AND
								(((2014-extract(YEAR FROM sno_personal01.fecingper))-1)*2) BETWEEN 0 AND 29)
						THEN (((2014-extract(YEAR FROM sno_personal.fecingper))-1)*2)
						WHEN 
							(SELECT 
								(((2014-extract(YEAR FROM sno_personal01.fecingper))-1)*2) 
							FROM 
								sno_personal AS sno_personal01
							WHERE 
								sno_personal01.codper=sno_hpersonalnomina01.codper AND
								(((2014-extract(YEAR FROM sno_personal01.fecingper))-1)*2)<=0)
						THEN 0
					END
				WHEN 
					(SELECT 
						EXTRACT(MONTH FROM sno_personal01.fecingper) 
					FROM 
						sno_personal AS sno_personal01
					WHERE 
						sno_personal01.codper=sno_hpersonalnomina01.codper AND
						(EXTRACT(MONTH FROM sno_personal01.fecingper)<>10))
				THEN 0	
			END



			
	 END AS dias_adicionales
FROM 
	sno_hpersonalnomina AS sno_hpersonalnomina01, 
	sno_hperiodo, 
	sno_personal, 
	sno_hnomina 
WHERE 
	sno_hpersonalnomina01.codnom BETWEEN '0000' AND '0010' AND 
	sno_hpersonalnomina01.anocur = '2014' AND 
	(sno_hpersonalnomina01.staper='1' OR sno_hpersonalnomina01.staper='2') AND 
	sno_hpersonalnomina01.codemp =sno_hperiodo.codemp AND 
	sno_hpersonalnomina01.codnom =sno_hperiodo.codnom AND 
	sno_hpersonalnomina01.anocur =sno_hperiodo.anocur AND 
	sno_hpersonalnomina01.codperi=sno_hperiodo.codperi AND 
	substr(cast(sno_hperiodo.fecdesper as char(10)),6,2) = '10' AND 
	substr(cast(sno_hperiodo.fecdesper as char(10)),1,4)= '2014' AND 
	sno_hpersonalnomina01.codper=sno_personal.codper AND 
	sno_personal.estper='1' AND 
	(sno_hnomina.espnom = '0' OR sno_hnomina.espnom = '1') AND 
	sno_hpersonalnomina01.codemp = sno_hnomina.codemp AND 
	sno_hpersonalnomina01.codnom = sno_hnomina.codnom AND 
	sno_hpersonalnomina01.anocur = sno_hnomina.anocurnom AND 
	sno_hpersonalnomina01.codperi = sno_hnomina.peractnom AND
	sno_hpersonalnomina01.codper='0006880620'
GROUP BY 
	sno_hnomina.codnom,
	sno_hpersonalnomina01.codper,
	sno_personal.fecingper,
	sno_hnomina.tippernom
ORDER BY 
	sno_hpersonalnomina01.codper 