--Recordar ENERO 90 y 180 los demas meses 107 y 214 UNIDAD TRIBUTARIA
DELETE FROM sno_fraccion_utilidad;
DELETE FROM sno_fraccion_otros_montos;
--Ingresa los registros en la tabla sno_fraccion_utilidad segun SELECT
INSERT INTO sno_fraccion_utilidad
SELECT 
	sno_personal01.codper,
	RTRIM(sno_personal01.nomper) || ' ' || RTRIM(sno_personal01.apeper) AS Nombres,
	sno_personal01.fecingper, 
	sno_hpersonalnomina.sueper AS "Sueldo",
	--Bono por Profesionalismo
	CASE sno_personal01.nivacaper
		WHEN '' THEN (sno_hpersonalnomina.sueper*0)
		WHEN '0' THEN (sno_hpersonalnomina.sueper*0)
		WHEN '1' THEN (sno_hpersonalnomina.sueper*0)
		WHEN '2' THEN (sno_hpersonalnomina.sueper*0)
		WHEN '3' THEN (sno_hpersonalnomina.sueper*0.08)
		WHEN '4' THEN (sno_hpersonalnomina.sueper*0.10)
		WHEN '5' THEN (sno_hpersonalnomina.sueper*0)
		WHEN '6' THEN (sno_hpersonalnomina.sueper*0.12)
		WHEN '7' THEN (sno_hpersonalnomina.sueper*0.12)
	END AS "Bono Profesionalismo",
	--Aporte Ahorro Patronal
	(sno_hpersonalnomina.sueper*0.15) AS "Ahorro Patronal",
	--Bono Reintegro de Vacaciones (300/12)
	0.83 AS "Reintegro Vacacion",
	--Compensacion Economica por Disponibilidad
	(SELECT 
		valunitri
	FROM 
		sigesp_unidad_tributaria 
	WHERE 
		extract(year from fecentvig) =  extract(year from  (CURRENT_DATE))-1)/30 AS "Comp. Disponibilidad",
	--Prima de Residencia
	((SELECT valunitri 
	FROM sigesp_unidad_tributaria 
	WHERE 
		extract(year from fecentvig) =  extract(year from  (CURRENT_DATE))-1)*2)/30 AS "Prima Residencia",
	--Ayudapor Vivienda
	0,
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
		sno_hpersonalnomina.codemp=sno_ubicacionfisica.codemp AND
		sno_hpersonalnomina.codubifis=sno_ubicacionfisica.codubifis) AS "Factor TV",
	--Tiempo de Viaje
	0,
	--Otros Tiempos de Viajes
	0,
	--Otros Conceptos
	0,
	--Factor Utilidad Mensual
	0
FROM
	sno_personal AS sno_personal01,
	sno_hpersonalnomina
WHERE
	sno_personal01.codper=sno_hpersonalnomina.codper AND
	sno_hpersonalnomina.codnom BETWEEN '0010' AND '0010' AND
	sno_personal01.estper='1' AND
	sno_hpersonalnomina.staper BETWEEN '1' AND '2' AND
	sno_hpersonalnomina.codperi BETWEEN '052' AND '052'
ORDER BY
	sno_personal01.codper;

--Actualiza el campo ayuda_vivienda de la tabla sno_fraccion_utilidad
UPDATE sno_fraccion_utilidad SET 
ayuda_vivienda=sno_hsalida.valsal
FROM 
	sno_hsalida
WHERE
	sno_fraccion_utilidad.codper=sno_hsalida.codper AND
	sno_hsalida.codnom BETWEEN '0010' AND '0010' AND 
	sno_hsalida.codconc='0000000004' AND
	sno_hsalida.codperi BETWEEN '052' AND '052' AND
	sno_hsalida.valsal>0;

--Actualiza el campo tiempo_viaje de la tabla sno_fraccion_utilidad
UPDATE sno_fraccion_utilidad SET
tiempo_viaje=((((sueldo+compensacion_disponibilidad+prima_residencia+ayuda_vivienda)/8)*factor_tiempo_viaje)*1);


--Otros Tiempos de Viajes (Fluvia, Terrestre y Transbordo)
UPDATE sno_fraccion_utilidad SET
otros_tiempo_viajes=COALESCE((SELECT
				max(sno_constantepersonal.moncon)*3
			FROM 
				sno_constantepersonal,
				sno_conceptopersonal
			WHERE 
				sno_constantepersonal.codper=sno_conceptopersonal.codper AND
				sno_constantepersonal.codnom=sno_conceptopersonal.codnom AND
				sno_constantepersonal.codcons=sno_conceptopersonal.codconc AND
				sno_constantepersonal.codcons='0000000006' AND 
				sno_conceptopersonal.aplcon=1 AND
				sno_constantepersonal.codnom='0010' AND
				sno_constantepersonal.codper=sno_fraccion_utilidad.codper),0);

--Actualiza el campo fraccion_utilidad_mes de la tabla sno_fraccion_utilidad
UPDATE sno_fraccion_utilidad SET 
fraccion_utilidad_mes=(((sueldo+bono_profesionalismo+ahorro_patronal+reintegro_vacacion+
			compensacion_disponibilidad+prima_residencia+ayuda_vivienda+
			tiempo_viaje+otros_tiempo_viajes+otros_conceptos+retroactividad))*2.31);



--Actualiza el campo salnorutilper de la tabla sno_hpersonalnomina
UPDATE sno_hpersonalnomina SET
salnorutilper=sno_fraccion_utilidad.fraccion_utilidad_mes
FROM
	sno_fraccion_utilidad
WHERE
	sno_hpersonalnomina.codper=sno_fraccion_utilidad.codper AND
	sno_hpersonalnomina.codnom='0010' AND
	sno_hpersonalnomina.codperi BETWEEN '052' AND '052' 
	




