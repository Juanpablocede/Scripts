SELECT
	sno_prestamosperiodo.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper),
	sno_prestamosperiodo.codnom,
	sno_nomina.desnom,
	sno_prestamosperiodo.numpre,
	sno_prestamosperiodo.codtippre,
	sno_tipoprestamo.destippre,
	sno_prestamosperiodo.numcuo,
	sno_prestamosperiodo.percob,
	sno_prestamosperiodo.feciniper,
	sno_prestamosperiodo.fecfinper,
	sno_prestamosperiodo.moncuo,
	sno_prestamosperiodo.estcuo 
FROM
	sno_prestamosperiodo,
	sno_personal,
	sno_tipoprestamo,
	sno_nomina
WHERE
	sno_prestamosperiodo.codper=sno_personal.codper AND
	sno_prestamosperiodo.codnom=sno_tipoprestamo.codnom AND
	sno_prestamosperiodo.codtippre=sno_tipoprestamo.codtippre AND
	(sno_tipoprestamo.destippre LIKE '%FAE%' OR
	sno_tipoprestamo.destippre LIKE '%FEPE%') AND
	sno_prestamosperiodo.codnom=sno_nomina.codnom
ORDER BY
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper),
	sno_prestamosperiodo.numpre,
	sno_prestamosperiodo.percob

