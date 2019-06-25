SELECT
	--sno_hpersonalnomina.codper,
	sno_hpersonalnomina.depuniadm||sno_hpersonalnomina.prouniadm AS unidad,
	sno_unidadadmin.desuniadm,
	sno_hpersonalnomina.coddep AS departamento,
	srh_departamento.dendep,
	SUM(sno_hsalida_aportes.aportes) AS aportes,
	SUM(sno_hsalida_asignacion.asignacion) AS asignaciones,
	SUM(sno_hsalida_deduccion.deduccion) AS deducciones
FROM
	sno_hpersonalnomina,
	sno_unidadadmin,
	srh_departamento,
	--APORTES
	(SELECT  
		sno_hsalida.codper,
		sum(sno_hsalida.valsal*-1) AS aportes 
	FROM 
		sno_hsalida
	WHERE
		sno_hsalida.tipsal like '%P%' AND
		sno_hsalida.codperi='001'
	GROUP BY
		sno_hsalida.codper) sno_hsalida_aportes,
	--ASIGNACIONES
	(SELECT 
		sno_hsalida.codper,
		sum(sno_hsalida.valsal) AS asignacion 
	FROM 
		sno_hsalida
	WHERE
		sno_hsalida.tipsal='A' AND
		sno_hsalida.codperi='001'
	GROUP BY
		sno_hsalida.codper) sno_hsalida_asignacion,
	--DEDUCCIONES
	(SELECT
		sno_hsalida.codper,
		sum(sno_hsalida.valsal*-1) AS deduccion
	FROM 
		sno_hsalida
	WHERE
		sno_hsalida.tipsal='D' AND
		sno_hsalida.codperi='001'
	GROUP BY
		sno_hsalida.codper) sno_hsalida_deduccion
WHERE
	(sno_hpersonalnomina.staper='1' OR sno_hpersonalnomina.staper='2') AND
	sno_hpersonalnomina.depuniadm=sno_unidadadmin.depuniadm AND
	sno_hpersonalnomina.prouniadm=sno_unidadadmin.prouniadm AND
	sno_hpersonalnomina.coddep=srh_departamento.coddep AND
	sno_hpersonalnomina.codper=sno_hsalida_aportes.codper AND
	sno_hpersonalnomina.codper=sno_hsalida_asignacion.codper AND
	sno_hpersonalnomina.codper=sno_hsalida_deduccion.codper AND
	sno_hpersonalnomina.codper='0006880620' AND 
	sno_hpersonalnomina.codperi='001'
GROUP BY
	sno_hpersonalnomina.depuniadm||sno_hpersonalnomina.prouniadm,
	sno_unidadadmin.desuniadm,
	sno_hpersonalnomina.coddep,
	srh_departamento.dendep
ORDER BY
	sno_hpersonalnomina.depuniadm||sno_hpersonalnomina.prouniadm,
	sno_unidadadmin.desuniadm,
	sno_hpersonalnomina.coddep,
	srh_departamento.dendep
