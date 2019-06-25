SELECT
rpad
	sno_personal.nacper,
	sno_personal.codper,
	--NOMBRES
	(CASE position(' ' in sno_personal.nomper) WHEN 0 THEN
		sno_personal.nomper
	ELSE
		substring(sno_personal.nomper from 0 for position(' ' in sno_personal.nomper)) -- substring('Thomas' from 2 for 3)
	END ) AS "primer nombre",

	(CASE position(' ' in sno_personal.nomper) WHEN 0 THEN
		''
	ELSE
		substring(sno_personal.nomper,position(' ' in sno_personal.nomper)+1)
	END ) AS "segundo nombre",
	--APELLIDOS
	(CASE position(' ' in sno_personal.apeper) WHEN 0 THEN
		sno_personal.apeper
	ELSE
		substring(sno_personal.apeper from 0 for position(' ' in sno_personal.apeper)) -- substring('Thomas' from 2 for 3)
	END ) AS "primer apellido",

	(CASE position(' ' in sno_personal.apeper) WHEN 0 THEN
		''
	ELSE
		trim(substring(sno_personal.apeper,position(' ' in sno_personal.apeper)+1) )
	END ) AS "segundo apellido",
	sno_personal.fecingper,
	sno_personal.fecegrper,

	sno_personal.nacper||
	sno_personal.codper||
	(CASE position(' ' in sno_personal.nomper) WHEN 0 THEN
		sno_personal.nomper
	ELSE
		substring(sno_personal.nomper from 0 for position(' ' in sno_personal.nomper)) -- substring('Thomas' from 2 for 3)
	END )||

	(CASE position(' ' in sno_personal.nomper) WHEN 0 THEN
		''
	ELSE
		substring(sno_personal.nomper,position(' ' in sno_personal.nomper)+1)
	END )||
	(CASE position(' ' in sno_personal.apeper) WHEN 0 THEN
		sno_personal.apeper
	ELSE
		substring(sno_personal.apeper from 0 for position(' ' in sno_personal.apeper)) -- substring('Thomas' from 2 for 3)
	END )||

	(CASE position(' ' in sno_personal.apeper) WHEN 0 THEN
		''
	ELSE
		trim(substring(sno_personal.apeper,position(' ' in sno_personal.apeper)+1) )
	END )||
	sno_personal.fecingper||
	sno_personal.fecegrper
	
FROM
	sno_personal,
	sno_personalnomina
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0005' AND
	(sno_personalnomina.staper ='1' OR sno_personalnomina.staper ='2')

ORDER BY
	sno_personal.codper