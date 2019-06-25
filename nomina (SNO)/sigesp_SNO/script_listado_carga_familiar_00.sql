SELECT 
	sno_personal.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper),
	sno_personal.fecingper,
	sno_personalnomina.codasicar,
	sno_asignacioncargo.denasicar,
	sno_personalnomina.codnom,
	sno_nomina.desnom,
	sno_personalnomina.codubifis,
	sno_ubicacionfisica.desubifis,
	sno_familiar.cedfam,
	sno_familiar.nomfam,
	sno_familiar.apefam,
	sno_familiar.sexfam,
	to_char(sno_familiar.fecnacfam,'dd/mm/yyyy'),
	(current_date-sno_familiar.fecnacfam)/365 as años,
	CASE sno_familiar.nexfam
		WHEN 'C' THEN 'Conyuge'
		WHEN 'H' THEN 'Hijos'
		WHEN 'P' THEN 'Padres'
		WHEN 'E' THEN 'Hermano'
	END
FROM
	sno_personal,
	sno_personalnomina,
	sno_asignacioncargo,
	sno_nomina,
	sno_ubicacionfisica,
	sno_familiar
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom=sno_asignacioncargo.codnom AND
	sno_personalnomina.codasicar=sno_asignacioncargo.codasicar AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND
	(sno_personalnomina.staper='1' OR sno_personalnomina.staper='2') AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	sno_personalnomina.codubifis=sno_ubicacionfisica.codubifis AND
	sno_familiar.codper=sno_personal.codper
ORDER BY 
	sno_personal.codper