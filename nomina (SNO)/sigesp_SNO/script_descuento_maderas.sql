SELECT
	sno_prestamos.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper),
	sno_prestamos.numpre,
	sno_prestamos.codtippre,
	CASE sno_prestamos.stapre
		WHEN 1 THEN 'Activo'
		WHEN 2 THEN 'Inactivo'
	END,
	sno_prestamos.codconc,
	sno_concepto.nomcon,
	sno_prestamos.numcuopre,
	sno_prestamos.monpre,
	sno_prestamosperiodo.numcuo,
	sno_prestamosperiodo.percob,
	sno_prestamosperiodo.feciniper,
	sno_prestamosperiodo.fecfinper,
	sno_prestamosperiodo.moncuo,
	CASE sno_prestamosperiodo.estcuo
		WHEN 1 THEN 'Cancelada'
		WHEN 0 THEN 'Pendiente'
	END
FROM
	sno_prestamos,
	sno_concepto,
	sno_prestamosperiodo,
	sno_personal
WHERE
	sno_prestamos.codnom=sno_concepto.codnom AND
	sno_prestamos.codconc=sno_concepto.codconc AND
	sno_prestamos.codper=sno_prestamosperiodo.codper AND
	sno_prestamos.codnom=sno_prestamosperiodo.codnom AND
	sno_prestamos.numpre=sno_prestamosperiodo.numpre AND
	sno_prestamos.codtippre=sno_prestamosperiodo.codtippre AND
	sno_prestamos.codper=sno_personal.codper AND
	sno_prestamos.codconc='0000004100'
ORDER BY
	sno_prestamos.codper,
	sno_prestamosperiodo.feciniper
