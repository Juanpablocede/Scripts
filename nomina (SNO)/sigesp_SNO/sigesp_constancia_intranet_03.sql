--DELETE FROM sigesp_constancia_intranet;
--INSERT INTO sigesp_constancia_intranet
SELECT 
	sno_personal01.codper,
	sno_personal01.cedper,
	RTRIM(sno_personal01.nomper) || ' ' || RTRIM(sno_personal01.apeper) AS Nombres,
	sno_personal01.fecingper, 
	sno_hpersonalnomina.sueper,
	--Compensacion Economica por Disponibilidad
	(SELECT 
		valunitri
	FROM 
		sigesp_unidad_tributaria 
	WHERE 
		extract(year from fecentvig) =  extract(year from  (CURRENT_DATE))-1) AS "Comp. Disponibilidad",
	--Prima de Residencia
	((SELECT valunitri 
	FROM sigesp_unidad_tributaria 
	WHERE 
		extract(year from fecentvig) =  extract(year from  (CURRENT_DATE))-1)*2) AS "Prima Residencia",

	--Factor de tiempo de Viaje
	(SELECT
		sno_ubicacionfisica.tietras
	FROM
		sno_ubicacionfisica,
		sno_nomina
	WHERE
		sno_personal01.codemp=sno_hpersonalnomina.codemp AND
		sno_personal01.codper=sno_hpersonalnomina.codper AND
		sno_hpersonalnomina.codnom=sno_nomina.codnom AND
		sno_personal01.estper='1' AND
		sno_hpersonalnomina.staper IN('1','2') AND
		sno_hpersonalnomina.codemp=sno_ubicacionfisica.codemp AND
		sno_hpersonalnomina.codubifis=sno_ubicacionfisica.codubifis AND
		sno_hpersonalnomina.codnom BETWEEN '0003'AND '0003') AS "Factor TV",
	--Aporte Ahorro Patronal
	(sno_hpersonalnomina.sueper*0.15) AS "Ahorro Patronal",
	--Bono Reintegro de Vacaciones (300/12)
	25 AS "Reintegro Vacacion", 
	--Bono por Profesionalismo
	(SELECT
		CASE sno_personal01.nivacaper
			WHEN '0' THEN (sno_hpersonalnomina.sueper*0)
			WHEN '1' THEN (sno_hpersonalnomina.sueper*0)
			WHEN '2' THEN (sno_hpersonalnomina.sueper*0)
			WHEN '3' THEN (sno_hpersonalnomina.sueper*0.08)
			WHEN '4' THEN (sno_hpersonalnomina.sueper*0.10)
			WHEN '6' THEN (sno_hpersonalnomina.sueper*0.12)
			WHEN '7' THEN (sno_hpersonalnomina.sueper*0.12)
		END),
	(SELECT
		(moncon)
	FROM 
		sno_constantepersonal
	WHERE 
		sno_constantepersonal.codper=sno_hpersonalnomina.codper AND
		sno_constantepersonal.codper=sno_personal01.codper AND 
		sno_constantepersonal.codnom=sno_hpersonalnomina.codnom AND
		sno_personal01.estper='1' AND
		sno_hpersonalnomina.staper IN('1','2') AND
		sno_constantepersonal.codnom BETWEEN '0003' AND '0003' AND 
		sno_constantepersonal.codcons='0000000004') AS "Ayuda por Vivienda"
FROM
	sno_personal AS sno_personal01,
	sno_hpersonalnomina
WHERE
	sno_personal01.codper=sno_hpersonalnomina.codper AND
	sno_hpersonalnomina.codnom BETWEEN '0003' AND '0003' AND
	sno_personal01.estper='1' AND
	sno_hpersonalnomina.staper BETWEEN '1' AND '2' AND
	sno_hpersonalnomina.codperi='001' --AND
	--sno_personal01.codper='0006880620' 
