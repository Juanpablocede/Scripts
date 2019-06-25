SELECT
	sno_hsalida.codper,
	sno_hsalida.codperi,
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	SUM(sno_hsalida.valsal)
FROM
	sno_hsalida,
	sno_hconcepto
WHERE
	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND
	sno_hconcepto.sueintcon=1 AND
	sno_hsalida.valsal>0 AND
	sno_hsalida.codperi BETWEEN '001' AND '002' AND
	sno_hsalida.codper='0006880620' 
GROUP BY
	sno_hsalida.codper,
	sno_hsalida.codperi,
	sno_hsalida.codconc,
	sno_hconcepto.nomcon
ORDER BY
	sno_hsalida.codperi,
	sno_hsalida.codconc
