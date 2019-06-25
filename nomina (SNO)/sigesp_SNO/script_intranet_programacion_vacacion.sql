SELECT
	sno_vacacpersonal.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS Nombres,
	sno_vacacpersonal.fecvenvac,
	sno_vacacpersonal.fecdisvac,
	sno_vacacpersonal.fecreivac,
	CASE sno_vacacpersonal.stavac
		WHEN '1' THEN 'Vencidas'
		WHEN '2' THEN 'Programada'
		WHEN '3' THEN 'En Vacacion'
		WHEN '4' THEN 'Disfrutada'
	END	
FROM
	sno_personal,
	sno_vacacpersonal
WHERE
	sno_personal.codper=sno_vacacpersonal.codper AND
	sno_vacacpersonal.codper='0006880620'
