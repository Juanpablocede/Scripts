SELECT
	sno_fideiperiodointereses.codper,
	CASE sno_fideiperiodointereses.mescurper
	    WHEN 1 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 1 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	    WHEN 2 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 2 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	    WHEN 3 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 3 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	    WHEN 4 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 4 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	    WHEN 5 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 5 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	    WHEN 6 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 6 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	    WHEN 7 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 7 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	    WHEN 8 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 8 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	    WHEN 9 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 9 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	    WHEN 10 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 10 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	    WHEN 11 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 11 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	    WHEN 12 THEN (	SELECT
				    sno_anticipoprestaciones.monant
			    FROM
				    sno_anticipoprestaciones
			    WHERE
				    sno_anticipoprestaciones.codper=sno_fideiperiodointereses.codper AND
				    EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant))= 12 AND 
				    EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))= 2013)
	END AS anticipos,
	sno_fideiperiodointereses.anocurper,
	CASE sno_fideiperiodointereses.mescurper
	    WHEN 1 THEN 'Enero'
	    WHEN 2 THEN 'Febrero'
	    WHEN 3 THEN 'Marzo'
	    WHEN 4 THEN 'Abril'
	    WHEN 5 THEN 'Mayo'
	    WHEN 6 THEN 'Junio'
	    WHEN 7 THEN 'Julio'
	    WHEN 8 THEN 'Agosto'
	    WHEN 9 THEN 'Septiembre'
	    WHEN 10 THEN 'Octubre'
	    WHEN 11 THEN 'Noviembre'
	    WHEN 12 THEN 'Diciembre'
	END AS mescurper,
	(sno_fideiperiodo.sueintper+
	sno_fideiperiodo.bonextper+
	sno_fideiperiodo.bonfinper+
	sno_fideiperiodo.bonvacper) 				AS sueldo_integral,	
	(sno_fideiperiodo.diafid + sno_fideiperiodo.diaadi) 	AS Dias,
	sno_fideiperiodo.apoper 				AS aportes_mes,
	sno_fideiperiodointereses.monantacu 			AS acumulada_mes,
	sno_fideiperiodointereses.porint*100 			AS tasa_interes,
	sno_fideiperiodointereses.monint 			AS monto_interes
FROM
	sno_fideiperiodointereses,
	sno_fideiperiodo
WHERE
	sno_fideiperiodointereses.codper=sno_fideiperiodo.codper AND
	sno_fideiperiodointereses.anocurper=sno_fideiperiodo.anocurper AND
	sno_fideiperiodointereses.mescurper=sno_fideiperiodo.mescurper AND
	sno_fideiperiodointereses.anocurper='2013' AND
	sno_fideiperiodointereses.mescurper BETWEEN 1 AND 12 AND
	sno_fideiperiodointereses.codnom BETWEEN '0000' AND '0010' AND
	sno_fideiperiodointereses.codper BETWEEN '0006880620' AND '0006880620'
ORDER BY
	sno_fideiperiodointereses.codper,
	sno_fideiperiodointereses.anocurper,
	sno_fideiperiodointereses.mescurper;