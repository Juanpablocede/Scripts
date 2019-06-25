SELECT 
	saf_activo.codact,
	saf_activo.denact,
	saf_activo.maract,
	saf_activo.modact,
	saf_activo.feccmpact,
	saf_activo.spg_cuenta_act,
	saf_activo.spg_cuenta_dep,
	saf_activo.sc_cuenta,
	saf_activo.costo,
	saf_activo.vidautil*12 AS vidautil,
	saf_activo.nompro,
	MAX(saf_activo.monordcom) AS Costo_Orden_compra,
	--saf_depreciacion01.fecdep,
	--(SELECT saf_depreciacion02.fecdep  FROM saf_depreciacion AS saf_depreciacion02 WHERE saf_activo.codact=saf_depreciacion02.codact AND EXTRACT(MONTH from saf_activo.feccmpact) = EXTRACT(MONTH from saf_depreciacion02.fecdep) AND EXTRACT(YEAR from saf_activo.feccmpact) = EXTRACT(YEAR from saf_depreciacion02.fecdep)) AS fechadepreciacion,

	(SELECT MAX(saf_depreciacion02.mondepmen)  FROM saf_depreciacion AS saf_depreciacion02 WHERE saf_activo.codact=saf_depreciacion02.codact) AS depreciacion_mes,

	(SELECT COUNT(*) FROM saf_depreciacion AS saf_depreciacion02 WHERE saf_activo.codact=saf_depreciacion02.codact AND saf_depreciacion02.fecdep<=(CURRENT_DATE)) AS meses_depreciados,

	(SELECT SUM(saf_depreciacion02.mondepmen) FROM saf_depreciacion AS saf_depreciacion02 WHERE saf_activo.codact=saf_depreciacion02.codact AND saf_depreciacion02.fecdep<=(CURRENT_DATE)) AS depreciacion_acumulada
FROM
	saf_activo,
	saf_depreciacion AS saf_depreciacion01
WHERE
	saf_activo.codact=saf_depreciacion01.codact AND
	saf_depreciacion01.fecdep<=(CURRENT_DATE) AND
	--saf_activo.codact='000000000013709'
	saf_activo.codact BETWEEN '000000000013700' AND '000000000013799'
GROUP BY
	saf_activo.codact,
	saf_activo.denact,
	saf_activo.maract,
	saf_activo.modact,
	saf_activo.feccmpact,
	saf_activo.spg_cuenta_act,
	saf_activo.spg_cuenta_dep,
	saf_activo.sc_cuenta,
	saf_activo.costo,
	saf_activo.vidautil,
	saf_activo.nompro
ORDER BY
	saf_activo.codact
