SELECT
	sno_personal.codper,
	sno_personal.nomper,
	sno_personal.apeper,
	sno_nomina.desnom,
	sno_ubicacionfisica.desubifis,
	sno_asignacioncargo.denasicar,
	sno_unidadadmin.desuniadm,
	srh_gerencia.denger
FROM
	sno_personal,
	sno_personalnomina,
	sno_nomina,
	sno_ubicacionfisica,
	sno_unidadadmin,
	sno_asignacioncargo,
	srh_gerencia
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	sno_personalnomina.codubifis=sno_ubicacionfisica.codubifis AND
	sno_personalnomina.codasicar=sno_asignacioncargo.codasicar AND
	sno_personalnomina.codnom=sno_asignacioncargo.codnom AND
	sno_personalnomina.minorguniadm=sno_unidadadmin.minorguniadm AND
	sno_personalnomina.ofiuniadm=sno_unidadadmin.ofiuniadm AND
	sno_personalnomina.uniuniadm=sno_unidadadmin.uniuniadm AND
	sno_personalnomina.depuniadm=sno_unidadadmin.depuniadm AND
	sno_personalnomina.prouniadm=sno_unidadadmin.prouniadm AND
	sno_personalnomina.codnom BETWEEN '0001' AND '0009' AND
	sno_personalnomina.codper='0017883159' AND
	sno_personalnomina.staper IN('1','2') AND
	sno_personal.estper='1'  AND
	sno_personal.codger=srh_gerencia.codger
ORDER BY
	sno_personal.nomper
