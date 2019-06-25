SELECT
	sno_personal.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS nombres,
	sno_personalnomina.fecingper,
	sno_personalnomina.sueper,
	sno_nomina.desnom,
	sno_asignacioncargo.denasicar,
	srh_gerencia.denger,
	scb_banco.nomban,
	CASE sno_personalnomina.tipcuebanper
	    WHEN 'A' THEN 'Cuenta Ahorro'
	    WHEN 'C' THEN 'Cuenta Corriente'
	    WHEN 'L' THEN 'Cuenta de Activos Liquidos'
	END tipocuenta,
	sno_personalnomina.codcueban,
	(SELECT
	    MAX(sno_fideiperiodointereses_01.moncap)
	FROM
	    sno_fideiperiodointereses AS sno_fideiperiodointereses_01
	WHERE
	    sno_fideiperiodointereses_01.codper=sno_personal.codper AND
	    sno_fideiperiodointereses_01.mescurper=12 AND
	    sno_fideiperiodointereses_01.anocurper::INTEGER=2013-1) AS antiguedaanterior
FROM
	sno_personal,
	sno_personalnomina,
	sno_nomina,
	sno_asignacioncargo,
	srh_gerencia,
	scb_banco
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	sno_personalnomina.codnom=sno_asignacioncargo.codnom AND
	sno_personalnomina.codasicar=sno_asignacioncargo.codasicar AND
	sno_personalnomina.codban=scb_banco.codban AND
	sno_personal.codger=srh_gerencia.codger AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND
	sno_personal.codper BETWEEN '0006880620' AND '0006880620'
ORDER BY
	sno_personal.codper;