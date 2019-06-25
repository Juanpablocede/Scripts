SELECT
	sno_personal.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper) AS Nombres,
	sno_asignacioncargo.denasicar,
	sno_personalnomina.depuniadm||sno_personalnomina.prouniadm,
	sno_unidadadmin.desuniadm,
	sno_personalnomina.codnom,
	sno_nomina.desnom,
	sno_familiar.cedfam,
	RTRIM(sno_familiar.nomfam)||' '||sno_familiar.apefam AS Familiar,
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
	sno_asignacioncargo,
	sno_unidadadmin,
	sno_nomina,
	sno_familiar
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personal.estper='1' AND
	sno_personalnomina.staper IN('1','2') AND
	sno_personalnomina.codnom IN('0005','0006','0007','0008','0010','9000','9001','9002','9003','9004','9005') AND
	sno_personalnomina.codasicar=sno_asignacioncargo.codasicar AND
	sno_personalnomina.codnom=sno_asignacioncargo.codnom AND

	sno_personalnomina.codemp=sno_unidadadmin.codemp AND
	sno_personalnomina.depuniadm=sno_unidadadmin.depuniadm AND
	sno_personalnomina.prouniadm=sno_unidadadmin.prouniadm AND

	sno_personalnomina.codnom=sno_nomina.codnom AND

	sno_personal.codper=sno_familiar.codper
ORDER BY
	sno_personal.codper
	