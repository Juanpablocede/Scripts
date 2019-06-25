SELECT
	sno_personal.codper,
	sno_personal.apeper,
	sno_personal.nomper,
	CASE sno_personalnomina.staper
		WHEN '1' THEN 'Activo'
		WHEN '2' THEN 'Vacaciones'
		WHEN '4' THEN 'Suspendido'
	END,
	sno_personalnomina.codnom,
	sno_nomina.desnom,
	sno_personalnomina.minorguniadm,
	sno_personalnomina.ofiuniadm,
	sno_personalnomina.uniuniadm,
	sno_personalnomina.depuniadm,
	sno_personalnomina.prouniadm,
	sno_unidadadmin.codestpro1,
	sno_unidadadmin.codestpro2,
	sno_unidadadmin.codestpro3,
	sno_unidadadmin.codestpro4,
	sno_unidadadmin.codestpro5
	
FROM
	sno_personal,
	sno_personalnomina,
	sno_nomina,
	sno_unidadadmin
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	(sno_personalnomina.staper='1' OR sno_personalnomina.staper='2' OR sno_personalnomina.staper='4') AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	sno_personalnomina.minorguniadm=sno_unidadadmin.minorguniadm AND
	sno_personalnomina.ofiuniadm=sno_unidadadmin.ofiuniadm AND
	sno_personalnomina.uniuniadm=sno_unidadadmin.uniuniadm AND
	sno_personalnomina.depuniadm=sno_unidadadmin.depuniadm AND
	sno_personalnomina.prouniadm=sno_unidadadmin.prouniadm
ORDER BY
	sno_personalnomina.codnom,
	sno_personal.apeper,
	sno_personal.nomper


