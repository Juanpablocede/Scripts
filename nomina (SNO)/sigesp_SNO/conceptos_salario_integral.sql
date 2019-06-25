--DELETE FROM sigesp_constancia_intranet;
--INSERT INTO sigesp_constancia_intranet
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
	WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE))) AS "Bono Disponibilidad",
	--Prima de Residencia
	((SELECT valunitri 
	FROM sigesp_unidad_tributaria WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE)))*2) AS "Prima Residencia", 
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		sno_constantepersonal.codcons='0000000004' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2')AS "Ayuda por Vivienda",
	--Tiempo de Viaje
	(((((sno_personalnomina.sueper+
	--Compensacion Economica por Disponibilidad
	(SELECT 
		valunitri 
	FROM 
		sigesp_unidad_tributaria 
	WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE)))+
	--Prima de Residencia
	((SELECT valunitri 
	FROM sigesp_unidad_tributaria WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE)))*2)+
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		sno_constantepersonal.codcons='0000000004' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'))/30)/8)*30)*
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
		sno_personalnomina.codnom BETWEEN '0000'AND '0004')) AS "Tiempo de Viaje",
	--Tiempo de Viaje Transbordo
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		sno_constantepersonal.codcons='0000000006' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2')*30 AS "TV Transbordo",
	--Tiempo de Viaje Fluvial
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		sno_constantepersonal.codcons='0000000007' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2')*30 AS "TV Fluvial",	
	--Tiempo de Viaje Terrestre
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		sno_constantepersonal.codcons='0000000008' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2')*30 AS "TV Terrestre",		
	--Aporte Ahorro Patronal
	(sno_personalnomina.sueper*0.15) AS "Aporte Ahorro",
	--Bono Reintegro de Vacaciones (300/12)
	25 AS "Reintegro Vacaciones",
	--Bono por Profesionalismo
	(SELECT
		CASE sno_personal04.nivacaper
			WHEN '0' THEN (sno_personalnomina.sueper*0)
			WHEN '1' THEN (sno_personalnomina.sueper*0)
			WHEN '2' THEN (sno_personalnomina.sueper*0)
			WHEN '3' THEN (sno_personalnomina.sueper*0.08)
			WHEN '4' THEN (sno_personalnomina.sueper*0.10)
			WHEN '6' THEN (sno_personalnomina.sueper*0.12)
			WHEN '7' THEN (sno_personalnomina.sueper*0.12)
		END
	FROM 
		sno_personal AS sno_personal04,
		sno_personalnomina
	WHERE 
		sno_personalnomina.codper=sno_personal04.codper AND
		sno_personal01.codper=sno_personal04.codper AND 
		sno_personalnomina.codnom BETWEEN '0000' AND '0004' AND
		sno_personal04.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2')AS "Bono Profesionalismo",
	--Bono Subvencion
	(SELECT
		MAX(moncon)
	FROM 
		sno_constantepersonal, 
		sno_personalnomina,
		sno_personal AS sno_personal02
	WHERE 
		sno_constantepersonal.codper=sno_personalnomina.codper AND
		sno_constantepersonal.codper=sno_personal02.codper AND
		sno_constantepersonal.codnom=sno_personalnomina.codnom AND
		sno_constantepersonal.codper=sno_personal01.codper AND 
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		(sno_constantepersonal.codcons='0000000012' OR
		 sno_constantepersonal.codcons='0000000073' OR
		 sno_constantepersonal.codcons='0000000074') AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2') AS "Bono Subvencion",
	-------------
	--Fraccion de utilidades
	(((sno_personalnomina.sueper+
	--Compensacion Economica por Disponibilidad
	(SELECT 
		valunitri 
	FROM 
		sigesp_unidad_tributaria 
	WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE))) +
	--Prima de Residencia
	((SELECT valunitri 
	FROM sigesp_unidad_tributaria WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE)))*2)+ 
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		sno_constantepersonal.codcons='0000000004' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2') +
	--Tiempo de Viaje
	(((((sno_personalnomina.sueper+
	--Compensacion Economica por Disponibilidad
	(SELECT 
		valunitri 
	FROM 
		sigesp_unidad_tributaria 
	WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE)))+
	--Prima de Residencia
	((SELECT valunitri 
	FROM sigesp_unidad_tributaria WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE)))*2)+
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		sno_constantepersonal.codcons='0000000004' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'))/30)/8)*30)*
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
		sno_personalnomina.codnom BETWEEN '0000'AND '0004')) +
	--Aporte Ahorro Patronal
	(sno_personalnomina.sueper*0.15) +
	--Bono Reintegro de Vacaciones (300/12)
	25 +
	--Bono por Profesionalismo
	(SELECT
		CASE sno_personal04.nivacaper
			WHEN '0' THEN (sno_personalnomina.sueper*0)
			WHEN '1' THEN (sno_personalnomina.sueper*0)
			WHEN '2' THEN (sno_personalnomina.sueper*0)
			WHEN '3' THEN (sno_personalnomina.sueper*0.08)
			WHEN '4' THEN (sno_personalnomina.sueper*0.10)
			WHEN '6' THEN (sno_personalnomina.sueper*0.12)
			WHEN '7' THEN (sno_personalnomina.sueper*0.12)
		END
	FROM 
		sno_personal AS sno_personal04,
		sno_personalnomina
	WHERE 
		sno_personalnomina.codper=sno_personal04.codper AND
		sno_personal01.codper=sno_personal04.codper AND 
		sno_personalnomina.codnom BETWEEN '0000' AND '0004' AND
		sno_personal04.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2')+
	--Bono Subvencion
	(SELECT
		MAX(moncon)
	FROM 
		sno_constantepersonal, 
		sno_personalnomina,
		sno_personal AS sno_personal02
	WHERE 
		sno_constantepersonal.codper=sno_personalnomina.codper AND
		sno_constantepersonal.codper=sno_personal02.codper AND
		sno_constantepersonal.codnom=sno_personalnomina.codnom AND
		sno_constantepersonal.codper=sno_personal01.codper AND 
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		(sno_constantepersonal.codcons='0000000012' OR
		 sno_constantepersonal.codcons='0000000073' OR
		 sno_constantepersonal.codcons='0000000074') AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'))/30)*10) AS "Fraccion Utilidad",
	-------------
	--Alicuota Vacaciones
	(((sno_personalnomina.sueper+
	--Compensacion Economica por Disponibilidad
	(SELECT 
		valunitri 
	FROM 
		sigesp_unidad_tributaria 
	WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE))) +
	--Prima de Residencia
	((SELECT valunitri 
	FROM sigesp_unidad_tributaria WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE)))*2)+ 
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		sno_constantepersonal.codcons='0000000004' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2') +
	--Tiempo de Viaje
	(((((sno_personalnomina.sueper+
	--Compensacion Economica por Disponibilidad
	(SELECT 
		valunitri 
	FROM 
		sigesp_unidad_tributaria 
	WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE)))+
	--Prima de Residencia
	((SELECT valunitri 
	FROM sigesp_unidad_tributaria WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE)))*2)+
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		sno_constantepersonal.codcons='0000000004' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'))/30)/8)*30)*
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
		sno_personalnomina.codnom BETWEEN '0000'AND '0004')) +
	--Aporte Ahorro Patronal
	(sno_personalnomina.sueper*0.15) +
	--Bono Reintegro de Vacaciones (300/12)
	25 +
	--Bono por Profesionalismo
	(SELECT
		CASE sno_personal04.nivacaper
			WHEN '0' THEN (sno_personalnomina.sueper*0)
			WHEN '1' THEN (sno_personalnomina.sueper*0)
			WHEN '2' THEN (sno_personalnomina.sueper*0)
			WHEN '3' THEN (sno_personalnomina.sueper*0.08)
			WHEN '4' THEN (sno_personalnomina.sueper*0.10)
			WHEN '6' THEN (sno_personalnomina.sueper*0.12)
			WHEN '7' THEN (sno_personalnomina.sueper*0.12)
		END
	FROM 
		sno_personal AS sno_personal04,
		sno_personalnomina
	WHERE 
		sno_personalnomina.codper=sno_personal04.codper AND
		sno_personal01.codper=sno_personal04.codper AND 
		sno_personalnomina.codnom BETWEEN '0000' AND '0004' AND
		sno_personal04.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2')+
	--Bono Subvencion
	(SELECT
		MAX(moncon)
	FROM 
		sno_constantepersonal, 
		sno_personalnomina,
		sno_personal AS sno_personal02
	WHERE 
		sno_constantepersonal.codper=sno_personalnomina.codper AND
		sno_constantepersonal.codper=sno_personal02.codper AND
		sno_constantepersonal.codnom=sno_personalnomina.codnom AND
		sno_constantepersonal.codper=sno_personal01.codper AND 
		sno_constantepersonal.codnom BETWEEN '0000' AND '0004' AND 
		(sno_constantepersonal.codcons='0000000012' OR
		 sno_constantepersonal.codcons='0000000073' OR
		 sno_constantepersonal.codcons='0000000074') AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'))/30))*
		(SELECT
			CASE ((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15)
			WHEN (	SELECT ((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15) 
				FROM sno_personal AS sno_personal05 WHERE sno_personal01.codper=sno_personal05.codper AND 
				(((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15)) <= 29) THEN 
				((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15)

			WHEN (	SELECT ((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15) 
				FROM sno_personal AS sno_personal05 WHERE sno_personal01.codper=sno_personal05.codper AND 
				(((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15)) >= 30) THEN 30
			END
		FROM
			sno_personal AS sno_personal06
		WHERE
			sno_personal01.codper=sno_personal06.codper)/12 AS "Alicuota Vacaciones"





FROM
	sno_personal AS sno_personal01,
	sno_personalnomina
WHERE
	sno_personal01.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0004' AND
	sno_personal01.estper='1' AND
	sno_personalnomina.staper BETWEEN '1' AND '2' AND
	sno_personal01.codper='0006880620'

