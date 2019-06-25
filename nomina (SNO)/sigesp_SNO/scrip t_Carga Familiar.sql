SELECT 
	CASE sno_personal.nacper
		WHEN 'V' THEN 'V'
		WHEN 'E' THEN 'E'
	END,
	CASE sno_personal.nacper
		WHEN 'V' THEN 'Venezolano'
		WHEN 'E' THEN 'Extranjero'
	END,	
	sno_personal.codper,
	sno_personal.nomper,
	sno_personal.apeper,
	'1',
	'Titular',
	to_char(sno_personal.fecnacper,'dd/mm/yyyy'),
	(current_date-sno_personal.fecnacper)/365 as años,
	sno_personal.edocivper,
	CASE sno_personal.edocivper
		WHEN 'S' THEN 'Soltero'
		WHEN 'C' THEN 'Casado'
		WHEN 'D' THEN 'Divorciaso'
		WHEN 'V' THEN 'Viudo'
		WHEN 'N' THEN ' No aplica'
		WHEN 'O' THEN 'Otros'
	END
FROM
	sno_personal
WHERE
	sno_personal.estper='1';

SELECT
	'V',
	'Venezolano',
	sno_familiar.codper,
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
	sno_familiar;


