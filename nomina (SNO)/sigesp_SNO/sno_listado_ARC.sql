SELECT
	sno_hsalida.codper,
	sno_hconcepto.nomcon,
	sum(sno_hsalida.valsal)
FROM
	sno_hconcepto,
	sno_hsalida
WHERE
	sno_hconcepto.aplarccon=1 and
	sno_hconcepto.codnom=sno_hsalida.codnom  AND	
	sno_hconcepto.codperi=sno_hsalida.codperi  AND
	sno_hconcepto.codconc=sno_hsalida.codconc  AND
	sno_hsalida.codnom BETWEEN '0006' AND '0010' AND
	sno_hsalida.codperi='006' AND
	sno_hsalida.valsal>0
GROUP BY
	sno_hsalida.codper,
	sno_hconcepto.nomcon
ORDER BY 
	sno_hsalida.codper