SELECT
	sno_permiso.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper) AS nombres,
	sno_permiso.feciniper,
	sno_permiso.fecfinper,
	sno_permiso.numdiaper,
	CASE sno_permiso.tipper
		WHEN 1 THEN 'Estudio'
		WHEN 2 THEN 'Medico'
		WHEN 3 THEN 'Tramites'
		WHEN 4 THEN 'Otros'
		WHEN 5 THEN 'Reposo'
		WHEN 6 THEN 'Reposo Laboral'
		WHEN 7 THEN 'Ausencia'
		WHEN 8 THEN 'Permiso Sindical'
		WHEN 9 THEN 'Compensatorio'
	END,
	sno_permiso.obsper
FROM
	sno_permiso,
	sno_personal
WHERE
	sno_permiso.codper=sno_personal.codper AND
	sno_personal.estper='1'
ORDER BY
	sno_permiso.codper
