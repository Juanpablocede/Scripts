SELECT
	sno_hpersonalnomina.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper) AS nombres,
	sno_hpersonalnomina.sueper,
	sno_hpersonalnomina.codperi,
	sno_hpersonalnomina.codnom,
	sno_hperiodo.fecdesper,
	sno_hperiodo.fechasper
FROM
	sno_hpersonalnomina,
	sno_personal,
	sno_hperiodo
WHERE
	sno_hpersonalnomina.codper=sno_personal.codper AND
	(sno_hpersonalnomina.staper='1' OR sno_hpersonalnomina.staper='2') AND
	sno_hpersonalnomina.codnom='0007' AND
	sno_hpersonalnomina.codnom=sno_hperiodo.codnom AND
	sno_hpersonalnomina.codperi=sno_hperiodo.codperi
ORDER BY
	sno_hpersonalnomina.codperi

