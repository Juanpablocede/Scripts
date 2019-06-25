select 
	sno_salida.codconc,
	sno_salida.codnom,
	SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*
	COALESCE((SELECT 
		(porc_enero/100)
	FROM 
		sno_salida left join sfp_aplica_concepto_formulacion on sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc
	WHERE 
		sfp_aplica_concepto_formulacion.ano_presupuesto=2018 AND 
		sfp_aplica_concepto_formulacion.aplic_enero=1),0),
	SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*
	COALESCE((SELECT 
		((porc_enero+porc_febrero)/100)
	FROM 
		sno_salida left join sfp_aplica_concepto_formulacion on sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc
	WHERE 
		sfp_aplica_concepto_formulacion.ano_presupuesto=2018 AND 
		sfp_aplica_concepto_formulacion.aplic_febrero=1),0)
from
	sno_salida
where
	sno_salida.codnom='9998'
group by
	sno_salida.codconc,
	sno_salida.codnom
order by
	sno_salida.codconc



