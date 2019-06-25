SELECT
	sno_personal.codper,
	rtrim(sno_personal.nomper)||'  '||rtrim(sno_personal.apeper) AS nombres,
	sno_personal.fecingper,
	sno_personalnomina.sueper,
	sno_personal.coreleper,
	sno_personalnomina.codnom,
	sno_nomina.desnom,
	sno_personalnomina.depuniadm||sno_personalnomina.prouniadm As unidad,
	sno_unidadadmin.desuniadm,
	sno_personalnomina.codasicar,
	sno_asignacioncargo.denasicar,
	sno_personalnomina.codtab,
	sno_tabulador.destab,
	sno_personalnomina.codgra,
	sno_personalnomina.codpas
FROM
	sno_personal,
	sno_personalnomina,
	sno_unidadadmin,
	sno_nomina,
	sno_asignacioncargo,
	sno_tabulador
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.staper IN('1','2') AND
	sno_personalnomina.depuniadm=sno_unidadadmin.depuniadm AND
	sno_personalnomina.prouniadm=sno_unidadadmin.prouniadm AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	sno_personalnomina.codnom=sno_asignacioncargo.codnom AND
	sno_personalnomina.codasicar=sno_asignacioncargo.codasicar AND
	sno_personalnomina.codnom=sno_tabulador.codnom AND
	sno_personalnomina.codtab=sno_tabulador.codtab AND
	sno_personal.codper='0006880620' AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010'
ORDER BY
	sno_personal.codper
	