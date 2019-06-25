SELECT
	saf_activo.spg_cuenta_dep,
	saf_activo.sc_cuenta,
	SUM(saf_activo.costo) AS Ingreso_Mensual
FROM 
	saf_activo
WHERE 
	SUBSTR(CAST(saf_activo.feccmpact AS CHAR(10)),1,4) = '2012' AND
	SUBSTR(CAST(saf_activo.feccmpact AS CHAR(10)),6,2) = '06'
GROUP BY
	saf_activo.spg_cuenta_dep,
	saf_activo.sc_cuenta


