SELECT
	substring(spg_cuentas.codestpro1,24,2)||'-'||
	substring(spg_cuentas.codestpro2,22,4)||'-'||
	substring(spg_cuentas.codestpro3,24,2)||'-'||
	substring(spg_cuentas.codestpro4,24,2)||'-'||
	substring(spg_cuentas.codestpro5,24,2),
	spg_ep1.denestpro1||'-'||spg_ep2.denestpro2||'-'||spg_ep3.denestpro3||'-'||spg_ep4.denestpro4||'-'||spg_ep5.denestpro5,
	spg_cuentas.spg_cuenta,
	spg_cuentas.denominacion,
	spg_cuentas.asignado,
	spg_cuentas.asignado+spg_cuentas.aumento-spg_cuentas.disminucion-spg_cuentas.comprometido AS disponible

FROM
	spg_cuentas,
	spg_ep1,
	spg_ep2,
	spg_ep3,
	spg_ep4,
	spg_ep5
WHERE
	spg_cuentas.codestpro1 like '%02' AND
	spg_cuentas.codestpro2 like '%02008' AND
	spg_cuentas.codestpro3 like '%02' AND
	spg_cuentas.codestpro4 like '%01' AND
	spg_cuentas.codestpro5 like '%01' AND

	spg_cuentas.codestpro1=spg_ep1.codestpro1 AND
	spg_cuentas.estcla=spg_ep1.estcla AND

	spg_cuentas.codestpro1=spg_ep2.codestpro1 AND
	spg_cuentas.codestpro2=spg_ep2.codestpro2 AND

	spg_cuentas.codestpro1=spg_ep3.codestpro1 AND
	spg_cuentas.codestpro2=spg_ep3.codestpro2 AND
	spg_cuentas.codestpro3=spg_ep3.codestpro3 AND

	spg_cuentas.codestpro1=spg_ep4.codestpro1 AND
	spg_cuentas.codestpro2=spg_ep4.codestpro2 AND
	spg_cuentas.codestpro3=spg_ep4.codestpro3 AND
	spg_cuentas.codestpro4=spg_ep4.codestpro4 AND
	
	spg_cuentas.codestpro1=spg_ep5.codestpro1 AND
	spg_cuentas.codestpro2=spg_ep5.codestpro2 AND
	spg_cuentas.codestpro3=spg_ep5.codestpro3 AND
	spg_cuentas.codestpro4=spg_ep5.codestpro4 AND
	spg_cuentas.codestpro5=spg_ep5.codestpro5 AND

	spg_ep1.codestpro1=spg_ep2.codestpro1 AND

	spg_ep2.codestpro1=spg_ep3.codestpro1 AND
	spg_ep2.codestpro2=spg_ep3.codestpro2 AND

	spg_ep3.codestpro1=spg_ep4.codestpro1 AND
	spg_ep3.codestpro2=spg_ep4.codestpro2 AND
	spg_ep3.codestpro3=spg_ep4.codestpro3 AND

	spg_ep4.codestpro1=spg_ep5.codestpro1 AND
	spg_ep4.codestpro2=spg_ep5.codestpro2 AND
	spg_ep4.codestpro3=spg_ep5.codestpro3 AND
	spg_ep4.codestpro4=spg_ep5.codestpro4
	
ORDER BY 
	spg_cuenta

