SELECT 
	sno_personal.codper,
	sno_personal.nomper,
	sno_personal.apeper,
	sno_personal.sexper,
	sno_personal.fecnacper,
	sno_personalnomina.depuniadm||sno_personalnomina.prouniadm,
	sno_unidadadmin.desuniadm,
	sno_ubicacionfisica.desubifis,
	sno_personalnomina.codnom,
	sno_nomina.desnom,
	sno_familiar.cedfam,
	sno_familiar.nomfam,
	sno_familiar.apefam,
	sno_familiar.sexfam,
	to_char(sno_familiar.fecnacfam,'dd/mm/yyyy'),
	(current_date-sno_familiar.fecnacfam)/365 as años,
	sno_familiar.estat_fam,
	CASE sno_familiar.nexfam
		WHEN 'C' THEN 'Conyuge'
		WHEN 'H' THEN 'Hijos'
		WHEN 'P' THEN 'Padres'
		WHEN 'E' THEN 'Hermano'
	END
FROM
	sno_personal,
	sno_personalnomina,
	sno_unidadadmin,
	sno_familiar,
	sno_ubicacionfisica,
	sno_nomina
WHERE
	sno_personalnomina.codper=sno_personal.codper AND
	sno_personal.codper=sno_familiar.codper AND
	sno_personalnomina.codemp=sno_unidadadmin.codemp AND
	sno_personalnomina.codubifis=sno_ubicacionfisica.codubifis AND
	sno_personalnomina.minorguniadm=sno_unidadadmin.minorguniadm AND
	sno_personalnomina.ofiuniadm=sno_unidadadmin.ofiuniadm AND
	sno_personalnomina.uniuniadm=sno_unidadadmin.uniuniadm AND
	sno_personalnomina.depuniadm=sno_unidadadmin.depuniadm AND
	sno_personalnomina.prouniadm=sno_unidadadmin.prouniadm AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	sno_personalnomina.staper IN('1','2','4') AND
	sno_personal.estper='1' 
ORDER BY
	sno_personal.codper



	
	
