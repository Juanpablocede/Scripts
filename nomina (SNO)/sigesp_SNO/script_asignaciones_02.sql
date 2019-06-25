SELECT
	sno_hsalida.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS Nombres,
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.codnom,
	sno_hsalida.codperi,
	sno_hsalida.tipsal,
	sno_hsalida.valsal
FROM
	sno_personal,
	sno_hconcepto,
	sno_hsalida
WHERE
	sno_hsalida.codper=sno_personal.codper AND
	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND
	sno_hsalida.valsal>0 AND
	sno_hsalida.codnom BETWEEN '0000' AND '0005' AND
	sno_hsalida.codperi BETWEEN '001' AND '002' AND
	sno_hsalida.tipsal='A'
ORDER BY
	sno_hsalida.codper,
	sno_hsalida.codperi