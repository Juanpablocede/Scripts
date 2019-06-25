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
	0,
	--Aporte Ahorro Patronal
	0 AS "Ahorro Patronal",
	--Bono Reintegro de Vacaciones (300/12)
	0 AS "Reintegro Vacacion",
	--Compensacion Economica por Disponibilidad
	0 AS "Comp. Disponibilidad",
	--Prima de Residencia
	0 AS "Prima Residencia",
	--Ayudapor Vivienda
	0,
	--Factor de tiempo de Viaje
	0 AS "Factor TV",
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
	sno_hpersonalnomina.codperi='027' 
ORDER BY
	sno_personal01.codper;


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
	sno_hsalida.codnom BETWEEN '3102' AND '3102' AND 
	(sno_hsalida.codconc='0000000001' OR
	 sno_hsalida.codconc='0000000005' OR
	 sno_hsalida.codconc='0000000009' OR
	 sno_hsalida.codconc='0000000010' OR
	 sno_hsalida.codconc='0000000011' OR
	 sno_hsalida.codconc='0000000013' OR
	 sno_hsalida.codconc='0000000014' OR
	 sno_hsalida.codconc='0000000017' OR
	 sno_hsalida.codconc='0000000018' OR
	 sno_hsalida.codconc='0000000019' OR
	 sno_hsalida.codconc='0000000020' OR
	 sno_hsalida.codconc='0000000046' OR
	 sno_hsalida.codconc='0000000050' OR
	 sno_hsalida.codconc='0000000060' OR
	 sno_hsalida.codconc='0000000075' OR
	 sno_hsalida.codconc='0000003000' OR
	 sno_hsalida.codconc='0000003001' OR
	 sno_hsalida.codconc='0000003002' OR
	 sno_hsalida.codconc='0000003003' OR
	 sno_hsalida.codconc='0000003004' OR
	 sno_hsalida.codconc='0000003005' OR
	 sno_hsalida.codconc='0000003012' OR
	 sno_hsalida.codconc='0000310001' OR
	 sno_hsalida.codconc='0000310005' OR
	 sno_hsalida.codconc='0000310009' OR
	 sno_hsalida.codconc='0000310013' OR
	 sno_hsalida.codconc='0000310017' OR
	 sno_hsalida.codconc='0000310021' OR
	 sno_hsalida.codconc='0000310025' OR
	 sno_hsalida.codconc='0000310029' OR
	 sno_hsalida.codconc='0000310045' OR
	 sno_hsalida.codconc='0000310061' OR
	 sno_hsalida.codconc='0000310062' OR
	 sno_hsalida.codconc='0000310063' OR
	 sno_hsalida.codconc='0000310064' OR
	 sno_hsalida.codconc='0000310065' OR
	 sno_hsalida.codconc='0000310066' OR
	 sno_hsalida.codconc='0000310067' OR
	 sno_hsalida.codconc='0000310082') AND
	 sno_hsalida.codperi IN('006') AND
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
valsal=(valsal + sno_fraccion_utilidad.retroactividad)
FROM
	sno_fraccion_utilidad
WHERE
	sno_hsalida.codper=sno_fraccion_utilidad.codper AND
	sno_hsalida.codnom='0010' AND
	sno_hsalida.codperi='027' AND
	sno_hsalida.codconc='0000009995';


	




