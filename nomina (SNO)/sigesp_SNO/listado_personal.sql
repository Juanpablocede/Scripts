SELECT DISTINCT
	sno_personal.codper,
	sno_personal.apeper,
	sno_personal.nomper,
	sno_personal.fecingper,
	sno_personalnomina.fecegrper
FROM
	sno_personalnomina
	INNER JOIN
	sno_personal ON sno_personalnomina.codper=sno_personal.codper
WHERE 
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND 
	sno_personalnomina.fecegrper BETWEEN '01-01-2019' AND '30-06-2019' AND
	sno_personalnomina.staper='3'
ORDER BY 
	sno_personalnomina.fecegrper;



SELECT
	EXTRACT(MONTH FROM sno_personalnomina.fecegrper) AS "Mes",
	COUNT(sno_personalnomina.codper) AS "Cantidad"
FROM
	sno_personalnomina
	INNER JOIN
	sno_personal ON sno_personalnomina.codper=sno_personal.codper
WHERE 
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND 
	sno_personalnomina.fecegrper BETWEEN '01-01-2019' AND '30-06-2019' AND
	sno_personalnomina.staper='3'
GROUP BY
	EXTRACT(MONTH FROM sno_personalnomina.fecegrper)
ORDER BY
	EXTRACT(MONTH FROM sno_personalnomina.fecegrper);


SELECT
	sno_personalnomina.fecegrper,
	COUNT(*) AS "Cantidad"
FROM
	sno_personalnomina
	INNER JOIN
	sno_personal ON sno_personalnomina.codper=sno_personal.codper
WHERE 
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND 
	sno_personalnomina.fecegrper BETWEEN '01-01-2019' AND '30-06-2019' AND
	sno_personalnomina.staper='3'
GROUP BY
	sno_personalnomina.fecegrper
ORDER BY
	sno_personalnomina.fecegrper;
