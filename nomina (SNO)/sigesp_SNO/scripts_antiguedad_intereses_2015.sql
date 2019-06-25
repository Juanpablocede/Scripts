SELECT
	sno_personalnomina.coddep,
	sno_fideiperiodointereses.mescurper,
	SUM(sno_fideiperiodointereses.monant) AS Antiguedad,
	SUM(sno_fideiperiodointereses.monint) AS Intereses
FROM
	sno_fideiperiodointereses,
	sno_personalnomina
WHERE
	sno_fideiperiodointereses.codper=sno_personalnomina.codper AND
	sno_fideiperiodointereses.anocurper='2015' AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND
	sno_personalnomina.staper IN('1','2','4') 
GROUP BY
	sno_personalnomina.coddep,
	sno_fideiperiodointereses.mescurper
ORDER BY
	sno_fideiperiodointereses.mescurper,
	sno_personalnomina.coddep