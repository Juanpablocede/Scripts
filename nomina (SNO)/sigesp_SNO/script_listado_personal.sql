SELECT
	sno_personal.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS Nombres,
	sno_hpersonalnomina.sueper,
	sno_hpersonalnomina.codperi,
	CASE sno_hpersonalnomina.codperi
		WHEN '006' THEN 'Junio'
		WHEN '007' THEN 'Julio'
		WHEN '008' THEN 'Agosto'
		WHEN '009' THEN 'Septiembre'
		WHEN '010' THEN 'Octubre'
		WHEN '011' THEN 'Noviembre'
		WHEN '012' THEN 'Diciembre'
	END,
	sno_hpersonalnomina.codnom,
	sno_nomina.desnom
FROM
	sno_personal,
	sno_hpersonalnomina,
	sno_nomina
WHERE
	sno_personal.codper=sno_hpersonalnomina.codper AND
	sno_hpersonalnomina.codnom=sno_nomina.codnom AND
	sno_hpersonalnomina.depuniadm='26' AND
	(sno_hpersonalnomina.prouniadm='00' OR sno_hpersonalnomina.prouniadm='02') AND
	sno_hpersonalnomina.codnom BETWEEN '0000' AND '0004' AND
	sno_personal.estper IN('1') AND
	sno_hpersonalnomina.staper='1' AND
	sno_hpersonalnomina.codperi BETWEEN '006' AND '012' 
ORDER BY
	sno_personal.codper,
	sno_hpersonalnomina.codperi