SELECT
	sno_personal.codper,
	RTRIM(sno_personal.apeper)||' '||TRIM(sno_personal.nomper) AS nombres,
	sno_personalnomina.fecingper,
	sno_personalnomina.sueper,
	sno_personalnomina.codtab,
	sno_personalnomina.codgra,
	sno_personalnomina.codpas	
FROM
	sno_personalnomina,
	sno_personal
WHERE
	sno_personalnomina.codper=sno_personal.codper AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND
	sno_personalnomina.staper IN('1','2','4') AND
	EXTRACT(MONTH FROM(sno_personalnomina.fecingper))=10 AND
	(EXTRACT(DAY FROM(sno_personalnomina.fecingper))>=1 AND
	EXTRACT(DAY FROM(sno_personalnomina.fecingper))<=15) 
	
ORDER BY
	sno_personal.codper


	
	

