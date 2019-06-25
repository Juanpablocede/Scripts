SELECT
	sno_permiso.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper) AS nombres,
	sno_permiso.numper,
	sno_permiso.feciniper,
	sno_permiso.fecfinper,
	sno_permiso.numdiaper, 
	sno_permiso.obsper
FROM
	sno_permiso,
	sno_personal
WHERE
	sno_permiso.codper=sno_personal.codper
ORDER BY
	sno_permiso.codper,
	sno_permiso.numper