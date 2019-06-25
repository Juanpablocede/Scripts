SELECT 
	sno_hsalida.codper,
	SUM(sno_hsalida.valsal)
FROM 
	sno_hsalida
WHERE 
	sno_hsalida.codnom BETWEEN '0003' AND '0003' AND 
	(sno_hsalida.codconc='0000000004' OR 
	 sno_hsalida.codconc='0000000006' OR
	 sno_hsalida.codconc='0000000007' OR
	 sno_hsalida.codconc='0000000008' OR
	 sno_hsalida.codconc='0000000046' OR
	 sno_hsalida.codconc='0000000049' OR
	 sno_hsalida.codconc='0000000050' OR
	 sno_hsalida.codconc='0000000051' OR
	 sno_hsalida.codconc='0000000076' OR
	 sno_hsalida.codconc='0000000077' OR
	 sno_hsalida.codconc='0000310001' OR
	 sno_hsalida.codconc='0000310005' OR
	 sno_hsalida.codconc='0000310009' OR
	 sno_hsalida.codconc='0000310045' OR
	 sno_hsalida.codconc='0000310083' OR
	 sno_hsalida.codconc='0000310084' OR
	 sno_hsalida.codconc='0000310085' OR
	 sno_hsalida.codconc='0000310086') AND
	 sno_hsalida.codperi='005' AND
	sno_hsalida.valsal>0
GROUP BY
	sno_hsalida.codper
ORDER BY
	sno_hsalida.codper

	