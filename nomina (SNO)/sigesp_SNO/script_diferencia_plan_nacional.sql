SELECT
	comprobante,
	sum(monto) AS Debe,
	(SELECT
		sum(monto)
	FROM 
		scg_dt_cmp AS scg_dt_cmp_01
	WHERE
		scg_dt_cmp_01.comprobante=scg_dt_cmp.comprobante AND
		scg_dt_cmp_01.debhab='H') as Haber
	
FROM
	scg_dt_cmp
WHERE
	(descripcion like 'PRUEB%' or descripcion like 'PLAN%') AND 
	debhab='D'
GROUP BY
	comprobante
ORDER BY
	comprobante