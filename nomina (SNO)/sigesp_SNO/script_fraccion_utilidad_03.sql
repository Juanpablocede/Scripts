SELECT 
	sno_hsalida.codper,
	sno_hsalida.valsal
FROM 
	sno_hsalida
WHERE 
	sno_hsalida.codnom BETWEEN '0003' AND '0003' AND 
	(sno_hsalida.codconc='0000000074' OR 
	sno_hsalida.codconc='0000000077') AND
	sno_hsalida.codperi='001' AND
	sno_hsalida.valsal>0
ORDER BY
	sno_hsalida.codper
	