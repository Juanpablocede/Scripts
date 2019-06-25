SELECT
	sno_personal.cedper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS nombres,
	sno_salida.codperi,
	SUM(sno_salida.valsal)
FROM
	sno_salida,
	sno_personal
WHERE
	sno_salida.codper=sno_personal.codper AND
	sno_salida.codnom BETWEEN '0000' AND '0005' AND
	sno_salida.codconc BETWEEN '0000000030' AND '0000000067'  
GROUP BY
	sno_personal.cedper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper),
	sno_salida.codperi
