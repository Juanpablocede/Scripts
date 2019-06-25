SELECT 
	sno_hconstantepersonal.codper,
	sno_personal.nomper||' '||sno_personal.apeper as nombres,
	SUM(sno_hconstantepersonal.moncon) AS horas
FROM
	sno_hconstantepersonal,
	sno_personal,
	sno_personalnomina
WHERE
	sno_hconstantepersonal.codper=sno_personal.codper AND
	sno_hconstantepersonal.codper=sno_personalnomina.codper AND
	sno_hconstantepersonal.codnom=sno_personalnomina.codnom AND
	(sno_personalnomina.staper='1' OR sno_personalnomina.staper='2') AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND
	sno_personalnomina.coddep like '%02009' AND
	(sno_hconstantepersonal.codcons='0000000204' OR sno_hconstantepersonal.codcons='0000000404') 
GROUP BY
	sno_hconstantepersonal.codper,
	sno_personal.nomper||' '||sno_personal.apeper
