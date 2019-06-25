SELECT
	sno_personal.cedper,
	sno_personal.apeper,
	sno_personal.nomper,
	sno_personal.sexper,
	sno_personal.talcamper,
	sno_personal.talzapper,
	sno_personal.talpanper,
	sno_personal01.fecnacper,
	srh_gerencia.denger,
	srh_departamento.dendep,
	sno_asignacioncargo.denasicar,
	sno_personal02.fecingper,
	sno_nomina.desnom,
	sno_ubicacionfisica.desubifis,
	CASE sno_personalnomina.staper
		WHEN '1' THEN 'Activo'
		WHEN '2' THEN 'Vacaciones'
		WHEN '4' THEN 'Suspendido'
	END,
	sno_profesion.despro,sno_personalnomina.codnom
FROM
	sno_personal 
	INNER JOIN sno_personalnomina ON
		sno_personal.codper=sno_personalnomina.codper AND
		sno_personalnomina.staper IN('1','2','4') AND
		sno_personalnomina.codnom BETWEEN '0000' AND '0012'
	INNER JOIN sno_nomina ON 
		sno_personalnomina.codnom=sno_nomina.codnom 
	LEFT JOIN srh_gerencia ON 
		sno_personal.codger=srh_gerencia.codger
	LEFT JOIN sno_asignacioncargo ON 
		sno_personalnomina.codasicar=sno_asignacioncargo.codasicar  AND
		sno_personalnomina.codnom=sno_asignacioncargo.codnom 
	LEFT JOIN srh_departamento ON 
		sno_personalnomina.coddep=srh_departamento.coddep
	LEFT JOIN sno_ubicacionfisica ON 
		sno_personalnomina.codubifis=sno_ubicacionfisica.codubifis 
	INNER JOIN sno_profesion ON
		sno_personal.codpro=sno_profesion.codpro
	INNER JOIN (SELECT to_char(sno_personal.fecnacper, 'DD/MM/YYYY' ) AS fecnacper, sno_personal.codper FROM sno_personal) AS sno_personal01 ON
		sno_personal01.codper=sno_personal.codper
	INNER JOIN (SELECT to_char(sno_personal.fecingper, 'DD/MM/YYYY' ) AS fecingper, sno_personal.codper FROM sno_personal) AS sno_personal02 ON
		sno_personal02.codper=sno_personal.codper
ORDER BY
	sno_personalnomina.codnom,
	sno_personal.apeper;