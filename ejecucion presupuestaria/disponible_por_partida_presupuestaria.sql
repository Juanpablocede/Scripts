SELECT
	codestpro2 as Centro_Costo,
	substring(spg_cuenta,1,3) as Partida,
	SUM(asignado) AS ASIGNADO,
	--SUM(aumento) AS AUMENTO,
	--SUM(disminucion) AS DISMINUCION,
	SUM(asignado+aumento-disminucion) as actualizado,
	SUM(comprometido) AS COMPROMETIDO,
	SUM((comprometido)*100)/SUM(asignado+aumento-disminucion) as "%",
	SUM(causado) AS CAUSADO,
	SUM((causado)*100)/SUM(asignado+aumento-disminucion) as "%",
	SUM(pagado) AS PAGADO,
	SUM((pagado)*100)/SUM(asignado+aumento-disminucion) as "%",
	SUM(asignado+aumento-disminucion-PAGADO) AS DISPONIBLE,
	SUM((asignado+aumento-disminucion-PAGADO)*100)/SUM(asignado+aumento-disminucion) as "%"
FROM 
	spg_cuentas 
WHERE 
	codestpro2 BETWEEN '0000000000000000000002008' AND '0000000000000000000002009' AND nivel BETWEEN 3 AND 4
GROUP BY
	codestpro2,
	substring(spg_cuenta,1,3)
ORDER BY
	codestpro2,
	substring(spg_cuenta,1,3)
	