SELECT
	sno_hsalida.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper),
	sno_hpersonalnomina.sueper,
	sno_hsalida.codperi,
	sno_hsalida.codnom,
	sno_hsalida.valsal
FROM
	sno_hsalida,
	sno_hpersonalnomina,
	sno_personal
WHERE
	sno_personal.codper=sno_hpersonalnomina.codper AND
	sno_hsalida.codper=sno_hpersonalnomina.codper AND
	sno_hsalida.codnom=sno_hpersonalnomina.codnom AND
	sno_hsalida.codperi=sno_hpersonalnomina.codperi AND
	sno_hsalida.codnom BETWEEN '0006' AND '0010' AND
	sno_hsalida.codperi BETWEEN '001' AND '052' AND
	sno_hsalida.codconc='0000000001' /*
	sno_hsalida.codconc='0000002004' AND
	sno_hsalida.tipsal='P2'*/
ORDER BY
	sno_hsalida.codperi

