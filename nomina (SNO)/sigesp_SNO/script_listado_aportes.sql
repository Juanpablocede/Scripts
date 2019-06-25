SELECT
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.tipsal,
	SUM(sno_hsalida.valsal)
FROM 
	sno_hsalida,
	sno_hconcepto
WHERE 
	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.anocur=sno_hconcepto.anocur AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND
	sno_hsalida.codconc BETWEEN '0000002000' AND '0000002003' AND 
	sno_hsalida.tipsal<>'R'
GROUP BY 
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.tipsal