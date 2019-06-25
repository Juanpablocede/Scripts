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
	25 AS "Reintegro Vacacion",
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
	sno_hpersonalnomina.codnom BETWEEN '0009' AND '0009' AND
	sno_personal01.estper='1' AND
	sno_hpersonalnomina.staper BETWEEN '1' AND '2' AND
	sno_hpersonalnomina.codperi='012' 
ORDER BY
	sno_personal01.codper;

--Actualiza el campo ayuda_vivienda de la tabla sno_fraccion_utilidad
UPDATE sno_fraccion_utilidad SET 
ayuda_vivienda=sno_hsalida.valsal
FROM 
	sno_hsalida
WHERE
	sno_fraccion_utilidad.codper=sno_hsalida.codper AND
	sno_hsalida.codnom BETWEEN '0009' AND '0009' AND 
	sno_hsalida.codconc='0000000004' AND
	sno_hsalida.codperi='012' AND
	sno_hsalida.valsal>0;

--Actualiza el campo tiempo_viaje de la tabla sno_fraccion_utilidad
UPDATE sno_fraccion_utilidad SET
tiempo_viaje=((((sueldo+compensacion_disponibilidad+prima_residencia+ayuda_vivienda)/240)*factor_tiempo_viaje)*30);


--Actualiza tabla sno_fraccion_otros_montos DIFERENCIAS
INSERT INTO sno_fraccion_otros_montos
SELECT 
	sno_hsalida.codper,
	SUM(sno_hsalida.valsal)
FROM 
	sno_hsalida
WHERE 
	sno_hsalida.codnom BETWEEN '0009' AND '0009' AND 
	(sno_hsalida.codconc='0000000046' OR
	 sno_hsalida.codconc='0000000049' OR
	 sno_hsalida.codconc='0000000050' OR
	 sno_hsalida.codconc='0000000051' OR
	 sno_hsalida.codconc='0000000073' OR
	 sno_hsalida.codconc='0000000074' OR
	 sno_hsalida.codconc='0000000076' OR
	 sno_hsalida.codconc='0000000077' OR
	 sno_hsalida.codconc='0000000083' OR
	 sno_hsalida.codconc='0000310001' OR
	 sno_hsalida.codconc='0000310005' OR
	 sno_hsalida.codconc='0000310009' OR
	 sno_hsalida.codconc='0000310045' OR
	 sno_hsalida.codconc='0000310082' OR
	 sno_hsalida.codconc='0000310083' OR
	 sno_hsalida.codconc='0000310084' OR
	 sno_hsalida.codconc='0000310085' OR
	 sno_hsalida.codconc='0000310086' OR
	 sno_hsalida.codconc='0000004030' OR
	 sno_hsalida.codconc='0000004031' OR
	 sno_hsalida.codconc='0000004032' OR
	 sno_hsalida.codconc='0000004033' OR
	 sno_hsalida.codconc='0000004034' OR
	 sno_hsalida.codconc='0000004035' OR
	 sno_hsalida.codconc='0000004036') AND
	 sno_hsalida.codperi='012' AND
	 sno_hsalida.valsal>0
GROUP BY
	sno_hsalida.codper;

--Actualiza el campo otros_conceptos de la tabla sno_fraccion_utilidad
UPDATE sno_fraccion_utilidad SET
otros_conceptos=sno_fraccion_otros_montos.monto
FROM 
	sno_fraccion_otros_montos
WHERE
	sno_fraccion_utilidad.codper=sno_fraccion_otros_montos.codper;

/*
--Actualiza otras conceptos por diferencia retroactiva pagado el mes 06/2013
--solamente debe hacerse para el mes de julio del 2013 para todas las nominas
DELETE FROM sno_fraccion_otros_montos;
INSERT INTO sno_fraccion_otros_montos
SELECT 
	sno_hsalida.codper,
	SUM(sno_hsalida.valsal)
FROM 
	sno_hsalida
WHERE 
	sno_hsalida.codnom BETWEEN '3101' AND '3102' AND 
	(sno_hsalida.codconc='0000000001' OR
	 sno_hsalida.codconc='0000000005' OR
	 sno_hsalida.codconc='0000000009' OR
	 sno_hsalida.codconc='0000000010' OR
	 sno_hsalida.codconc='0000000046' OR
	 sno_hsalida.codconc='0000003000' OR
	 sno_hsalida.codconc='0000003001' OR
	 sno_hsalida.codconc='0000003002' OR
	 sno_hsalida.codconc='0000003003' OR
	 sno_hsalida.codconc='0000003004' OR
	 sno_hsalida.codconc='0000003005' OR
	 sno_hsalida.codconc='0000310001' OR
	 sno_hsalida.codconc='0000310005' OR
	 sno_hsalida.codconc='0000310009' OR
	 sno_hsalida.codconc='0000310045' OR
	 sno_hsalida.codconc='0000310046' OR
	 sno_hsalida.codconc='0000310061' OR
	 sno_hsalida.codconc='0000310062' OR
	 sno_hsalida.codconc='0000310063' OR
	 sno_hsalida.codconc='0000310064' OR
	 sno_hsalida.codconc='0000310065' OR
	 sno_hsalida.codconc='0000310066' OR
	 sno_hsalida.codconc='0000310067' OR
	 sno_hsalida.codconc='0000310082' OR
	 sno_hsalida.codconc='0000310083' OR
	 sno_hsalida.codconc='0000310084' OR
	 sno_hsalida.codconc='0000310085' OR
	 sno_hsalida.codconc='0000310086') AND
	 sno_hsalida.codperi IN('006','007') AND
	 sno_hsalida.valsal>0
GROUP BY
	sno_hsalida.codper;

--Actualiza el campo otros_conceptos por diferencia de retroactivo sno_fraccion_utilidad
--solamente debe hacerse para el mes de julio del 2013 para todas las nominas
UPDATE sno_fraccion_utilidad SET
retroactividad=sno_fraccion_otros_montos.monto
FROM 
	sno_fraccion_otros_montos
WHERE
	sno_fraccion_utilidad.codper=sno_fraccion_otros_montos.codper;

--Actualiza el campo asifidper de la tabla sno_hpersonalnomina
--solamente debe hacerse para el mes de julio del 2013 para todas las nominas
UPDATE sno_hsalida SET
valsal=sno_fraccion_utilidad.retroactividad
FROM
	sno_fraccion_utilidad
WHERE
	sno_hsalida.codper=sno_fraccion_utilidad.codper AND
	sno_hsalida.codnom='0009' AND
	sno_hsalida.codperi='007' AND
	sno_hsalida.codconc='0000009995';

*/
--Se incluye el ahorro patronal mas la fraccion del reintegro de vacaciones
--solamente debe hacerse para el mes de julio del 2013 para todas las nominas
UPDATE sno_hsalida SET
--valsal=(valsal + 25 + (sno_fraccion_utilidad.sueldo*0.15)) solo para el mes de julio 2013
valsal=(25 + (sno_fraccion_utilidad.sueldo*0.15))
FROM
	sno_fraccion_utilidad
WHERE
	sno_hsalida.codper=sno_fraccion_utilidad.codper AND
	sno_hsalida.codnom='0009' AND
	sno_hsalida.codperi='012' AND
	sno_hsalida.codconc='0000009995';


--Otros Tiempos de Viajes (Fluvia, Terrestre y Transbordo)
UPDATE sno_fraccion_utilidad SET
otros_tiempo_viajes=COALESCE((SELECT
				max(sno_constantepersonal.moncon)*90
			FROM 
				sno_constantepersonal,
				sno_conceptopersonal
			WHERE 
				sno_constantepersonal.codper=sno_conceptopersonal.codper AND
				sno_constantepersonal.codnom=sno_conceptopersonal.codnom AND
				sno_constantepersonal.codcons=sno_conceptopersonal.codconc AND
				sno_constantepersonal.codcons='0000000006' AND 
				sno_conceptopersonal.aplcon=1 AND
				sno_constantepersonal.codnom='0009' AND
				sno_constantepersonal.codper=sno_fraccion_utilidad.codper),0);

--Actualiza el campo fraccion_utilidad_mes de la tabla sno_fraccion_utilidad
UPDATE sno_fraccion_utilidad SET 
fraccion_utilidad_mes=(((sueldo+bono_profesionalismo+ahorro_patronal+reintegro_vacacion+
			compensacion_disponibilidad+prima_residencia+ayuda_vivienda+
			tiempo_viaje+otros_tiempo_viajes+otros_conceptos+retroactividad)/30)*10);



--Actualiza el campo salnorutilper de la tabla sno_hpersonalnomina
UPDATE sno_hpersonalnomina SET
salnorutilper=sno_fraccion_utilidad.fraccion_utilidad_mes
FROM
	sno_fraccion_utilidad
WHERE
	sno_hpersonalnomina.codper=sno_fraccion_utilidad.codper AND
	sno_hpersonalnomina.codnom='0009' AND
	sno_hpersonalnomina.codperi='012' 
	




