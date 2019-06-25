SELECT
	sno_hsalida.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS Nombres,
	sno_hpersonalnomina.sueper,
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.codnom,
	sno_hsalida.codperi,
	sno_hsalida.tipsal,
	sno_hsalida.valsal
FROM
	sno_personal,
	sno_hconcepto,
	sno_hsalida,
	sno_hpersonalnomina
WHERE
	sno_hsalida.codper=sno_personal.codper AND
	sno_hsalida.codper=sno_hpersonalnomina.codper AND
	sno_hsalida.codnom=sno_hpersonalnomina.codnom AND
	sno_hsalida.codperi=sno_hpersonalnomina.codperi AND
	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND
	sno_hsalida.valsal>0 AND
	sno_hsalida.codnom BETWEEN '0006' AND '0010' AND
	sno_hsalida.codperi BETWEEN '028' AND '031' AND
	sno_hsalida.tipsal='A'
ORDER BY
	sno_hsalida.codper,
	sno_hsalida.codperi