SELECT
	sno_hsalida.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS Nombres,
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.codnom,
	sno_hsalida.tipsal,
	SUM(sno_hconstantepersonal.moncon),
	SUM(sno_hsalida.valsal)
FROM
	sno_personal,
	sno_hconcepto,
	sno_hsalida,
	sno_hconstantepersonal
WHERE
	sno_hsalida.codper=sno_personal.codper AND

	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND

	sno_hsalida.codper=sno_hconstantepersonal.codper AND
	sno_hsalida.codnom=sno_hconstantepersonal.codnom AND
	sno_hsalida.codconc=sno_hconstantepersonal.codcons AND
	sno_hsalida.codperi=sno_hconstantepersonal.codperi AND

	
	sno_hsalida.valsal <>0 AND
	sno_hsalida.codnom IN('0005','0006','0007','0008','0010') AND
	sno_hsalida.codperi BETWEEN '066' AND '068' AND
	sno_hsalida.tipsal <>'R' 
GROUP BY
	sno_hsalida.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper),
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.codnom,
	sno_hsalida.tipsal
ORDER BY
	sno_hsalida.codper,
	sno_hsalida.codconc