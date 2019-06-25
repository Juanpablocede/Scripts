SELECT
	sno_personal.codper,
	TRIM(sno_personal.nomper)|| ' '||TRIM(sno_personal.apeper) AS Nombres,
	sno_personalnomina.codnom,
	sno_nomina.desnom,
	sno_personalnomina.codubifis,
	sno_ubicacionfisica.desubifis,
	sno_ubicacionfisica.tietras
FROM
	sno_personal,
	sno_personalnomina,
	sno_ubicacionfisica,
	sno_nomina
WHERE
	sno_personal.codemp=sno_personalnomina.codemp AND
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	sno_personal.estper='1' AND
	sno_personalnomina.staper IN('1','2') AND
	sno_personalnomina.codemp=sno_ubicacionfisica.codemp AND
	sno_personalnomina.codubifis=sno_ubicacionfisica.codubifis AND
	sno_personalnomina.codnom BETWEEN '0001'AND '0011'
ORDER BY
	sno_personalnomina.codnom

