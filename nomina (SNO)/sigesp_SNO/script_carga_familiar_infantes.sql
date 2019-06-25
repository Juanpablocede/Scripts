SELECT
	sno_familiar.codper,
	RTRIM(sno_personal.nomper)||' '||TRIM(sno_personal.apeper) As Nombres,
	sno_familiar.cedfam,
	sno_familiar.nomfam,
	sno_familiar.apefam,
	sno_familiar.sexfam,
	to_char(sno_familiar.fecnacfam,'dd/mm/yyyy'),
	(current_date-sno_familiar.fecnacfam)/365 as años,
	CASE sno_familiar.nexfam
		WHEN 'C' THEN '2'
		WHEN 'H' THEN '3'
		WHEN 'P' THEN '4'
		WHEN 'E' THEN '6'
	END,
	CASE sno_familiar.nexfam
		WHEN 'C' THEN 'Conyuge'
		WHEN 'H' THEN 'Hijos'
		WHEN 'P' THEN 'Padres'
		WHEN 'E' THEN 'Hermano'
	END
FROM
	sno_familiar,
	sno_personal
WHERE
	sno_familiar.codper=sno_personal.codper AND
	sno_personal.estper='1' AND
	sno_familiar.nexfam='H'AND
	((current_date-sno_familiar.fecnacfam)/365)<=13;