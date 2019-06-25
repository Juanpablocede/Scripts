SELECT
	datos_personales.n_ci,
	rtrim(datos_personales.nombres)||' '||rtrim(datos_personales.apellidos),
	historico_nomina_detalle.cod_asig_ded,
	asignacion_deducciones.descrip_asig_ded,
	historico_nomina_detalle.aod,
	CASE historico_nomina_detalle.aod
		WHEN 'A' THEN historico_nomina_detalle.mto_asig_ded
	END AS asignacion,
	CASE historico_nomina_detalle.aod
		WHEN 'D' THEN historico_nomina_detalle.mto_asig_ded
	END AS deduccion,
	historico_nomina_general.fechainicio,
	historico_nomina_general.fechafin,
	historico_nomina_general.fechapago
FROM
	datos_personales,
	historico_nomina_detalle,
	asignacion_deducciones,
	historico_nomina_general
WHERE
	datos_personales.n_ci=historico_nomina_detalle.n_ci AND
	historico_nomina_detalle.cod_asig_ded=asignacion_deducciones.cod_asig_ded AND
	historico_nomina_detalle.correaltivog=historico_nomina_general.correlativo AND
	datos_personales.n_ci='6880620'
