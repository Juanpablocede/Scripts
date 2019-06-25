SELECT 
	spg_cuentas.codestpro1,
	spg_ep1.denestpro1,
	spg_cuentas.codestpro2,
	spg_ep2.denestpro2,
	spg_cuentas.codestpro3,
	spg_ep3.denestpro3,
	spg_cuentas.codestpro4,
	spg_ep4.denestpro4,
	spg_cuentas.codestpro5,
	spg_ep5.denestpro5,
	spg_cuentas.spg_cuenta,
	spg_cuentas.denominacion,
	SUM(spg_cuentas.asignado),
	SUM(spg_cuentas.enero),
	SUM(spg_cuentas.febrero),
	SUM(spg_cuentas.marzo),
	SUM(spg_cuentas.abril),
	SUM(spg_cuentas.mayo),
	SUM(spg_cuentas.junio),
	SUM(spg_cuentas.julio),
	SUM(spg_cuentas.agosto),
	SUM(spg_cuentas.septiembre),
	SUM(spg_cuentas.octubre),
	SUM(spg_cuentas.noviembre),
	SUM(spg_cuentas.diciembre)
FROM
	spg_cuentas 
	INNER JOIN spg_ep1 ON spg_cuentas.codestpro1=spg_ep1.codestpro1 
	
	INNER JOIN spg_ep2 ON 	spg_cuentas.codestpro1=spg_ep2.codestpro1 AND	
				spg_cuentas.codestpro2=spg_ep2.codestpro2
				
	INNER JOIN spg_ep3 ON 	spg_cuentas.codestpro1=spg_ep3.codestpro1 AND	
				spg_cuentas.codestpro2=spg_ep3.codestpro2 AND
				spg_cuentas.codestpro3=spg_ep3.codestpro3
				
	INNER JOIN spg_ep4 ON   spg_cuentas.codestpro1=spg_ep4.codestpro1 AND	
				spg_cuentas.codestpro2=spg_ep4.codestpro2 AND
				spg_cuentas.codestpro3=spg_ep4.codestpro3 AND
				spg_cuentas.codestpro4=spg_ep4.codestpro4 

	INNER JOIN spg_ep5 ON   spg_cuentas.codestpro1=spg_ep5.codestpro1 AND
				spg_cuentas.codestpro2=spg_ep5.codestpro2 AND
				spg_cuentas.codestpro3=spg_ep5.codestpro3 AND 
				spg_cuentas.codestpro4=spg_ep5.codestpro4 AND
				spg_cuentas.codestpro5=spg_ep5.codestpro5 
GROUP BY
	spg_cuentas.codestpro1,
	spg_ep1.denestpro1,
	spg_cuentas.codestpro2,
	spg_ep2.denestpro2,
	spg_cuentas.codestpro3,
	spg_ep3.denestpro3,
	spg_cuentas.codestpro4,
	spg_ep4.denestpro4,
	spg_cuentas.codestpro5,
	spg_ep5.denestpro5,
	spg_cuentas.spg_cuenta,
	spg_cuentas.denominacion
ORDER BY
	spg_cuentas.spg_cuenta
