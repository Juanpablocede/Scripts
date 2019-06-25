SELECT 
	saf_activo.codact,
	saf_depreciacion.ideact, 
	saf_depreciacion.mondepmen, 
	saf_depreciacion.mondepacu, 
	saf_activo.denact, 
	saf_dta.fecincact, 
	saf_activo.costo, 
	saf_activo.vidautil, 
	saf_activo.cossal,
	saf_activo.feccmpact, 
	saf_activo.vidautil*12 "Por Depreciar",
	('31/01/2012'-saf_activo.feccmpact)/30 AS "Mese Depreciados",
	
	saf_depreciacion.fecdep
FROM
	saf_activo,
	saf_depreciacion,
	saf_dta
WHERE
	saf_activo.codact=saf_depreciacion.codact AND
	saf_activo.codact=saf_dta.codact AND
	saf_depreciacion.ideact=saf_dta.ideact AND
	saf_dta.estact <> 'D' AND
	saf_depreciacion.fecdep BETWEEN '01/01/2012' AND '31/01/2012'
ORDER BY
	saf_activo.codact
