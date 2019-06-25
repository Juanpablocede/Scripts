DELETE FROM sigesp_constancia_intranet;
INSERT INTO sigesp_constancia_intranet
SELECT 
	sno_personal01.codper,
	sno_personal01.cedper,
	RTRIM(sno_personal01.nomper) || ' ' || RTRIM(sno_personal01.apeper) AS Nombres,
	sno_personal01.fecingper, 
	sno_personalnomina.sueper,
	--Compensacion Economica por Disponibilidad
	(SELECT 
		valunitri 
	FROM 
		sigesp_unidad_tributaria 
	WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE))) AS BonoDisponibilidad,
	--Prima de Residencia
	((SELECT valunitri 
		FROM sigesp_unidad_tributaria WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE)))*2) AS PrimaResidencia,
	--Ayuda por Vivienda
	(SELECT
		moncon
	FROM 
		sno_constantepersonal, 
		sno_personalnomina,
		sno_personal AS sno_personal02
	WHERE 
		sno_constantepersonal.codper=sno_personalnomina.codper AND
		sno_constantepersonal.codper=sno_personal02.codper AND
		sno_constantepersonal.codnom=sno_personalnomina.codnom AND
		sno_constantepersonal.codper=sno_personal01.codper AND 
		sno_constantepersonal.codnom BETWEEN '0001' AND '0008' AND 
		sno_constantepersonal.codcons='0000000004' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2') AS AyudaxVivienda,
		--Factor de tiempo de Viaje
		(SELECT
			sno_ubicacionfisica.tietras
		FROM
			sno_personal AS sno_personal03,
			sno_personalnomina,
			sno_ubicacionfisica,
			sno_nomina
		WHERE
			sno_personal03.codemp=sno_personalnomina.codemp AND
			sno_personal03.codper=sno_personalnomina.codper AND
			sno_personalnomina.codnom=sno_nomina.codnom AND
			sno_personal01.codper=sno_personal03.codper AND 
			sno_personal03.estper='1' AND
			sno_personalnomina.staper IN('1','2') AND
			sno_personalnomina.codemp=sno_ubicacionfisica.codemp AND
			sno_personalnomina.codubifis=sno_ubicacionfisica.codubifis AND
			sno_personalnomina.codnom BETWEEN '0001'AND '0008'
		ORDER BY
			sno_personalnomina.codnom) AS FactorTiempoViaje
FROM
	sno_personal AS sno_personal01,
	sno_personalnomina
WHERE
	sno_personal01.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom BETWEEN '0001' AND '0008' AND
	sno_personal01.estper='1' AND
	sno_personalnomina.staper BETWEEN '1' AND '2' AND
	sno_personal01.codper='0006880620'

