SELECT
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hconcepto.cueprecon,
	sno_hconcepto.codestpro1,
	sno_hconcepto.codestpro2,
	sno_hconcepto.codestpro3,
	sno_hconcepto.codestpro4,
	sno_hconcepto.codestpro5,
	SUM(sno_hsalida.valsal)

FROM
	sno_hsalida,
	sno_hconcepto
WHERE
	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.anocur=sno_hconcepto.anocur AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND
	sno_hsalida.codnom BETWEEN '0000' AND '0010'
GROUP BY
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hconcepto.cueprecon,
	sno_hconcepto.codestpro1,
	sno_hconcepto.codestpro2,
	sno_hconcepto.codestpro3,
	sno_hconcepto.codestpro4,
	sno_hconcepto.codestpro5
