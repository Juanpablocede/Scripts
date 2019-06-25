SELECT
	spg_cuenta_dep,
	sc_cuenta,
	SUM(costo)
FROM
	saf_activo
WHERE
	SUBSTR(CAST(feccmpact AS CHAR(10)),1,4) = '2012' AND
	SUBSTR(CAST(feccmpact AS CHAR(10)),6,2) = '11'
GROUP BY
	spg_cuenta_dep,
	sc_cuenta
