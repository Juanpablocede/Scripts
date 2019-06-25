SELECT
	sno_personal.cedper,
	sno_personal.nacper||'-'||to_char(sno_personal.cedper::numeric,'99G999G999'),
	(SELECT regexp_split_to_table(sno_personal.nomper,E'\\s+') as x limit 1) AS nombre,
	(SELECT regexp_split_to_table(sno_personal.apeper,E'\\s+') as x limit 1) AS apellido,
	(SELECT regexp_split_to_table(sno_personal.nomper,E'\\s+') as x limit 1)||' '||(SELECT regexp_split_to_table(sno_personal.apeper,E'\\s+') as x limit 1),
	sno_personal.numexpper,
	sno_personal.fecingper,
	sno_asignacioncargo.denasicar,
	trim(srh_gerencia.denger),
	sno_nomina.desnom,
	sno_personal.tipsanper
FROM
	sno_personal INNER JOIN sno_personalnomina ON
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.staper IN('1','2','4') AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0012'
	INNER JOIN sno_nomina ON sno_personalnomina.codnom=sno_nomina.codnom 
	LEFT JOIN srh_gerencia ON sno_personal.codger=srh_gerencia.codger
	LEFT JOIN sno_asignacioncargo ON sno_personalnomina.codasicar=sno_asignacioncargo.codasicar  AND
	sno_personalnomina.codnom=sno_asignacioncargo.codnom 
	LEFT JOIN srh_departamento ON sno_personalnomina.coddep=srh_departamento.coddep
	LEFT JOIN sno_ubicacionfisica ON sno_personalnomina.codubifis=sno_ubicacionfisica.codubifis
WHERE
	sno_personalnomina.staper='1'
ORDER BY
	sno_personal.fecingper;