select
	sno_personalnomina.codper,
	rtrim(sno_personal.apeper)||'  '||rtrim(sno_personal.nomper) AS Nombres,
	sno_personalnomina.codnom AS Nomina,
	sno_nomina.desnom AS Descripcion,
	sno_personalnomina.codubifis AS Ubicacion,
	sno_ubicacionfisica.desubifis AS Descripcion,
	sno_ubicacionfisica.tietras "Factor TV",
	sno_personal.codpro AS Profesion,
	sno_profesion.despro AS Descripcion,
	CASE sno_personal.nivacaper
		WHEN '0' THEN 'Ninguno 		0%'
		WHEN '1' THEN 'Primaria 	0%'
		WHEN '2' THEN 'Bachiller	0%'
		WHEN '3' THEN 'Tecnico Superior 8%'
		WHEN '4' THEN 'Universitario	10%'
		WHEN '5' THEN 'Maestria		12%'
		WHEN '6' THEN 'Postgrado	12%'
		WHEN '7' THEN 'Doctorado	12%'
	END AS nivel_academico,
	CASE sno_personalnomina.staper 
		WHEN '1' THEN 'Activo'
		WHEN '2' THEN 'Vacacion'
		WHEN '4' THEN 'Suspendido'
	END AS Estatus
from
	sno_personalnomina,
	sno_personal,
	sno_ubicacionfisica,
	sno_nomina,
	sno_profesion
where
	sno_personalnomina.codper=sno_personal.codper and
	sno_personalnomina.codnom between '0000' and '0010' and
	(sno_personalnomina.staper ='1' or sno_personalnomina.staper='2' OR sno_personalnomina.staper='4') and
	sno_personalnomina.codubifis=sno_ubicacionfisica.codubifis and
	sno_personalnomina.codnom=sno_nomina.codnom AND 
	sno_personal.codpro=sno_profesion.codpro 
order by 
	sno_personal.nivacaper
