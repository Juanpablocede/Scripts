SELECT 
	t1.codemp, 
	t1.codart, 
	t1.denart, 
	t1.denunimed, 
	t1.spg_cuenta,
	t1.desc_plancuenta, 
	t1.ultcosart, 
	COALESCE(t2.cantidad_enero,0) AS cantidad_enero, 
	COALESCE(t2.cantidad_febrero,0) AS cantidad_febrero,
	COALESCE(t2.cantidad_marzo,0) AS cantidad_marzo, 
	COALESCE(t2.cantidad_abril,0)AS cantidad_abril, 
	COALESCE(t2.cantidad_mayo,0)AS cantidad_mayo,
	COALESCE(t2.cantidad_junio,0)AS cantidad_junio, 
	COALESCE(t2.cantidad_julio,0)AS cantidad_julio, 
	COALESCE(t2.cantidad_agosto,0)AS cantidad_agosto,
	COALESCE(t2.cantidad_septiembre,0)AS cantidad_septiembre,
	COALESCE(t2.cantidad_octubre,0)AS cantidad_octubre,
	COALESCE(t2.cantidad_noviembre,0)AS cantidad_noviembre,
	COALESCE(t2.cantidad_diciembre,0)AS cantidad_diciembre 
FROM (SELECT
		siv_articulo.codemp, siv_articulo.codart, siv_articulo.denart,
		siv_unidadmedida.denunimed, siv_articulo.spg_cuenta,
		sfp_plan_cuentas.desc_plancuenta, siv_articulo.ultcosart FROM siv_articulo INNER
		JOIN siv_unidadmedida on siv_unidadmedida.codunimed= siv_articulo.codunimed
		INNER JOIN sfp_plan_cuentas on sfp_plan_cuentas.cod_plancuenta =
		siv_articulo.spg_cuenta WHERE siv_articulo.codemp='0001') t1 
	LEFT JOIN (SELECT
	cod_recurso, cantidad_enero, cantidad_febrero, cantidad_marzo, cantidad_abril,
	cantidad_mayo, cantidad_junio, cantidad_julio, cantidad_agosto,
	cantidad_septiembre, cantidad_octubre, cantidad_noviembre, cantidad_diciembre
	FROM sfp_asignacion_recursos WHERE sfp_asignacion_recursos.ano_presupuesto =
	'2018' AND sfp_asignacion_recursos.codestpro1 like '%0000000000000000000000001%'
	AND sfp_asignacion_recursos.codestpro2 like '%0000000000000000000001104%' AND
	sfp_asignacion_recursos.codestpro3 like '%0000000000000000000000001%' AND
	sfp_asignacion_recursos.codestpro4 like '%0000000000000000000000001%' AND
	sfp_asignacion_recursos.codestpro5 like '%0000000000000000000000001%' AND
	sfp_asignacion_recursos.estcla like '%A%' AND 
	sfp_asignacion_recursos.escenario=1)t2 ON t2.cod_recurso=t1.codart 

UNION

SELECT 
	t1.codemp, 
	t1.codser, 
	t1.denser, 
	t1.denunimed, 
	t1.spg_cuenta,
	t1.desc_plancuenta, 
	t1.preser, 
	COALESCE(t2.cantidad_enero,0) AS cantidad_enero, 
	COALESCE(t2.cantidad_febrero,0) AS cantidad_febrero,
	COALESCE(t2.cantidad_marzo,0) AS cantidad_marzo, 
	COALESCE(t2.cantidad_abril,0)AS cantidad_abril, 
	COALESCE(t2.cantidad_mayo,0)AS cantidad_mayo,
	COALESCE(t2.cantidad_junio,0)AS cantidad_junio, 
	COALESCE(t2.cantidad_julio,0)AS cantidad_julio, 
	COALESCE(t2.cantidad_agosto,0)AS cantidad_agosto,
	COALESCE(t2.cantidad_septiembre,0)AS cantidad_septiembre,
	COALESCE(t2.cantidad_octubre,0)AS cantidad_octubre,
	COALESCE(t2.cantidad_noviembre,0)AS cantidad_noviembre,
	COALESCE(t2.cantidad_diciembre,0)AS cantidad_diciembre 
FROM (SELECT
		soc_servicios.codemp, soc_servicios.codser, soc_servicios.denser,
		siv_unidadmedida.denunimed, soc_servicios.spg_cuenta,
		sfp_plan_cuentas.desc_plancuenta, soc_servicios.preser FROM soc_servicios INNER
		JOIN siv_unidadmedida on siv_unidadmedida.codunimed= soc_servicios.codunimed
		INNER JOIN sfp_plan_cuentas on sfp_plan_cuentas.cod_plancuenta =
		SUBSTRING(soc_servicios.spg_cuenta,1,9) WHERE soc_servicios.codemp='0001') t1 
	LEFT JOIN (
			SELECT
				cod_recurso, cantidad_enero, cantidad_febrero, cantidad_marzo, cantidad_abril,
				cantidad_mayo, cantidad_junio, cantidad_julio, cantidad_agosto,
				cantidad_septiembre, cantidad_octubre, cantidad_noviembre, cantidad_diciembre
				FROM 
					sfp_asignacion_recursos,
					--sfp_plan_cuentas,
					soc_servicios 
			WHERE 
				sfp_asignacion_recursos.ano_presupuesto = '2018' AND 
				--sfp_asignacion_recursos.cod_plancuenta=sfp_plan_cuentas.cod_plancuenta AND
				--sfp_asignacion_recursos.cod_plancuenta=SUBSTRING(soc_servicios.spg_cuenta,1,9) AND
				sfp_asignacion_recursos.cod_recurso=SUBSTRING(soc_servicios.codser,1,10) AND 
				sfp_asignacion_recursos.codestpro1 like '%0000000000000000000000001%' AND
				sfp_asignacion_recursos.codestpro2 like '%0000000000000000000001104%' AND
				sfp_asignacion_recursos.codestpro3 like '%0000000000000000000000001%' AND
				sfp_asignacion_recursos.codestpro4 like '%0000000000000000000000001%' AND
				sfp_asignacion_recursos.codestpro5 like '%0000000000000000000000001%' AND
				sfp_asignacion_recursos.estcla like '%A%' AND
				sfp_asignacion_recursos.escenario=1)t2 ON t2.cod_recurso=t1.codser


--select substring(spg_cuenta,1,9) from soc_servicios

