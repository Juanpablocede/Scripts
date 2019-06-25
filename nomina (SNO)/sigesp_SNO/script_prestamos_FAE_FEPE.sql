SELECT
	sno_prestamos.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper),
	CASE sno_personalnomina.staper
		WHEN '1' THEN 'Activo'
		WHEN '2' THEN 'Vacaciones'
		WHEN '3' THEN 'Egresado'
		WHEN '4' THEN 'Suspendido'
	END,
	sno_prestamos.codnom,
	sno_nomina.desnom,
	sno_prestamos.codtippre,
	sno_tipoprestamo.destippre,
	sno_prestamos.codconc,
	sno_concepto.titcon,
	sno_prestamos.monpre,
	sno_prestamos.fecpre,
	sno_prestamos.numpre
FROM
	sno_prestamos,
	sno_personal,
	sno_personalnomina,
	sno_tipoprestamo,
	sno_concepto,
	sno_nomina
WHERE
	sno_prestamos.codper=sno_personal.codper AND
	sno_personal.codper=sno_personalnomina.codper AND
	sno_prestamos.codper=sno_personalnomina.codper AND
	sno_prestamos.codnom=sno_personalnomina.codnom AND
	sno_prestamos.codnom=sno_tipoprestamo.codnom AND
	sno_prestamos.codtippre=sno_tipoprestamo.codtippre AND
	(sno_tipoprestamo.destippre LIKE '%FAE%' OR
	sno_tipoprestamo.destippre LIKE '%FEPE%') AND
	sno_prestamos.codnom=sno_concepto.codnom AND
	sno_prestamos.codconc=sno_concepto.codconc AND
	sno_prestamos.codnom=sno_nomina.codnom
ORDER BY
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper)



