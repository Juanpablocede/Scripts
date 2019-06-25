DELETE FROM sfp_asignacion_personal
WHERE ano_presupuesto = 2018 AND escenario = 1; 
INSERT INTO sfp_asignacion_personal 
SELECT
	sno_salida.codemp,
	2018,
	sno_unidadadmin.codestpro1,
	sno_unidadadmin.codestpro2,
	sno_unidadadmin.codestpro3,
	sno_unidadadmin.codestpro4,
	sno_unidadadmin.codestpro5,
	sno_unidadadmin.estcla,
	sno_salida.codconc,
	sno_concepto.cueprecon,
	1,
	--enero
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--febrero
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--marzo
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--abril
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--mayo
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--junio
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--julio
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--agosto
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_agosto/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_agosto=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--septiembre
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_agosto/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_agosto=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_septiembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_septiembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--octubre
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_agosto/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_agosto=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_septiembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_septiembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_octubre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_octubre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--noviembre
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_agosto/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_agosto=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_septiembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_septiembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_octubre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_octubre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_noviembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_noviembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--diciembre
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_agosto/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_agosto=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_septiembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_septiembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_octubre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_octubre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_noviembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_noviembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_diciembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_diciembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc))
FROM 
	sno_salida,
	sno_concepto,
	sno_unidadadmin,
	sno_personalnomina,
	sfp_aplica_concepto_formulacion,
	sno_nomina
WHERE 
	sno_salida.codnom=sno_concepto.codnom AND
	sno_salida.codconc=sno_concepto.codconc AND
	sno_salida.codnom=sfp_aplica_concepto_formulacion.codnom AND
	sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc AND
	sno_salida.codnom=sno_personalnomina.codnom AND
	sno_salida.codper=sno_personalnomina.codper AND
	sno_unidadadmin.minorguniadm=sno_personalnomina.minorguniadm AND
	sno_unidadadmin.ofiuniadm=sno_personalnomina.ofiuniadm AND
	sno_unidadadmin.uniuniadm=sno_personalnomina.uniuniadm AND
	sno_unidadadmin.depuniadm=sno_personalnomina.depuniadm AND
	sno_unidadadmin.prouniadm=sno_personalnomina.prouniadm	AND
	sno_salida.codnom=sno_nomina.codnom AND
	sno_nomina.tipnom=16 AND
	sno_concepto.sigcon='A' AND
	sno_concepto.intprocon='0'
GROUP BY
	sno_salida.codemp,
	sno_unidadadmin.codestpro1,
	sno_unidadadmin.codestpro2,
	sno_unidadadmin.codestpro3,
	sno_unidadadmin.codestpro4,
	sno_unidadadmin.codestpro5,
	sno_unidadadmin.estcla, 
	sno_salida.codconc,
	sno_concepto.cueprecon
ORDER BY
	sno_unidadadmin.codestpro2;
INSERT INTO sfp_asignacion_personal 
SELECT
	sno_salida.codemp,
	2018,
	sno_concepto.codestpro1,
	sno_concepto.codestpro2,
	sno_concepto.codestpro3,
	sno_concepto.codestpro4,
	sno_concepto.codestpro5,
	sno_concepto.estcla,
	sno_salida.codconc,
	sno_concepto.cueprecon,
	1,
	--enero
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--febrero
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--marzo
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--abril
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--mayo
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--junio
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--julio
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--agosto
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_agosto/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_agosto=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--septiembre
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_agosto/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_agosto=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_septiembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_septiembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--octubre
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_agosto/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_agosto=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_septiembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_septiembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_octubre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_octubre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--noviembre
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_agosto/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_agosto=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_septiembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_septiembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_octubre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_octubre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_noviembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_noviembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)),
	--diciembre
	(SUM(sno_salida.valsal)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_enero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_enero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_febrero/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_febrero=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_marzo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_marzo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_abril/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_abril=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_mayo/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_mayo=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_junio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_junio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_julio/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_julio=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_agosto/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_agosto=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_septiembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_septiembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_octubre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_octubre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 1 ELSE MAX(porc_noviembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_noviembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc)*
		(SELECT 
			CASE COUNT(*) WHEN 0 THEN 0 ELSE MAX(porc_diciembre/100)+1 END
		FROM 
			sfp_aplica_concepto_formulacion 
		WHERE 
			ano_presupuesto=2018 AND 
			aplic_diciembre=1 AND
			sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc))
FROM 
	sno_salida,
	sno_concepto,
	--sno_unidadadmin,
	sno_personalnomina,
	sfp_aplica_concepto_formulacion,
	sno_nomina
WHERE 
	sno_salida.codnom=sno_concepto.codnom AND
	sno_salida.codconc=sno_concepto.codconc AND
	sno_salida.codnom=sfp_aplica_concepto_formulacion.codnom AND
	sno_salida.codconc=sfp_aplica_concepto_formulacion.codconc AND
	sno_salida.codnom=sno_personalnomina.codnom AND
	sno_salida.codper=sno_personalnomina.codper AND
	--sno_unidadadmin.minorguniadm=sno_personalnomina.minorguniadm AND
	--sno_unidadadmin.ofiuniadm=sno_personalnomina.ofiuniadm AND
	--sno_unidadadmin.uniuniadm=sno_personalnomina.uniuniadm AND
	--sno_unidadadmin.depuniadm=sno_personalnomina.depuniadm AND
	--sno_unidadadmin.prouniadm=sno_personalnomina.prouniadm	AND
	sno_salida.codnom=sno_nomina.codnom AND
	sno_nomina.tipnom=16 AND
	sno_concepto.sigcon='A' AND
	sno_concepto.intprocon='1'
GROUP BY
	sno_salida.codemp,
	sno_concepto.codestpro1,
	sno_concepto.codestpro2,
	sno_concepto.codestpro3,
	sno_concepto.codestpro4,
	sno_concepto.codestpro5,
	sno_concepto.estcla, 
	sno_salida.codconc,
	sno_concepto.cueprecon
ORDER BY
	sno_concepto.codestpro2;