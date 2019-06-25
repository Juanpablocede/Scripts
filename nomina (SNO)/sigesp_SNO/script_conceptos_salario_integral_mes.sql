SELECT
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.valsal,
	sno_hsalida.tipsal
FROM
	sno_hsalida,
	sno_hconcepto
WHERE
	sno_hsalida.codper='0006880620' AND
	sno_hsalida.codperi BETWEEN '011' AND '012'AND
	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND
	sno_hsalida.valsal>0 AND
	sno_hconcepto.sueintcon=1
ORDER BY
	sno_hsalida.codconc
	