SELECT 
	sno_personal01.codper,
	sno_personal01.cedper,
	RTRIM(sno_personal01.nomper) || ' ' || RTRIM(sno_personal01.apeper) AS Nombres,
	sno_personal01.fecingper, 
	--Sueldo basico
	CASE sno_personalnomina.codnom
		WHEN '0000' THEN (sno_personalnomina.sueper)
		WHEN '0001' THEN (sno_personalnomina.sueper)
		WHEN '0002' THEN (sno_personalnomina.sueper)
		WHEN '0003' THEN (sno_personalnomina.sueper)
		WHEN '0004' THEN (sno_personalnomina.sueper)
		WHEN '0005' THEN (sno_personalnomina.sueper*30)
		WHEN '0006' THEN (sno_personalnomina.sueper*30)
		WHEN '0007' THEN (sno_personalnomina.sueper*30)
		WHEN '0008' THEN (sno_personalnomina.sueper*30)
		WHEN '0009' THEN (sno_personalnomina.sueper)
		WHEN '0010' THEN (sno_personalnomina.sueper*30)
	END AS Sueldo_Basico,
	--Compensacion Economica por Disponibilidad
	(SELECT 
		valunitri 
	FROM 
		sigesp_unidad_tributaria 
	WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE))) AS Bono_Dispo,
	--Prima de Residencia
	((SELECT valunitri 
	FROM sigesp_unidad_tributaria WHERE extract(year from fecentvig) =  extract(year from  (CURRENT_DATE)))*2) AS Prima_Resi,
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0010' AND 
		sno_constantepersonal.codcons='0000000004' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2') AS Ayuda_Vivienda,
	--Tiempo de Viaje
	(((((CASE sno_personalnomina.codnom
		WHEN '0000' THEN (sno_personalnomina.sueper)
		WHEN '0001' THEN (sno_personalnomina.sueper)
		WHEN '0002' THEN (sno_personalnomina.sueper)
		WHEN '0003' THEN (sno_personalnomina.sueper)
		WHEN '0004' THEN (sno_personalnomina.sueper)
		WHEN '0005' THEN (sno_personalnomina.sueper*30)
		WHEN '0006' THEN (sno_personalnomina.sueper*30)
		WHEN '0007' THEN (sno_personalnomina.sueper*30)
		WHEN '0008' THEN (sno_personalnomina.sueper*30)
		WHEN '0009' THEN (sno_personalnomina.sueper)
		WHEN '0010' THEN (sno_personalnomina.sueper*30)
	END+
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0010' AND 
		sno_constantepersonal.codcons='0000000004' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'))/30)/8)*22)*
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
		sno_personalnomina.codnom BETWEEN '0000'AND '0010')) AS Tiempo_Viaje,
	--Tiempo de Viaje Transbordo
	COALESCE((SELECT
		moncon
	FROM 
		sno_constantepersonal, 
		sno_personalnomina,
		sno_personal AS sno_personal02,
		sno_conceptopersonal
	WHERE 
		sno_constantepersonal.codper=sno_personalnomina.codper AND
		sno_constantepersonal.codper=sno_personal02.codper AND
		sno_constantepersonal.codnom=sno_personalnomina.codnom AND
		sno_constantepersonal.codper=sno_personal01.codper AND 
		sno_constantepersonal.codnom BETWEEN '0000' AND '0010' AND 
		sno_constantepersonal.codcons='0000000006' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2' AND
		sno_constantepersonal.codper=sno_conceptopersonal.codper AND
		sno_constantepersonal.codnom=sno_conceptopersonal.codnom AND
		sno_constantepersonal.codcons=sno_conceptopersonal.codconc AND
		sno_conceptopersonal.aplcon='1')*22,0) AS TV_Transbordo,
	--Tiempo de Viaje Fluvial
	COALESCE((SELECT
		moncon
	FROM 
		sno_constantepersonal, 
		sno_personalnomina,
		sno_personal AS sno_personal02,
		sno_conceptopersonal
	WHERE 
		sno_constantepersonal.codper=sno_personalnomina.codper AND
		sno_constantepersonal.codper=sno_personal02.codper AND
		sno_constantepersonal.codnom=sno_personalnomina.codnom AND
		sno_constantepersonal.codper=sno_personal01.codper AND 
		sno_constantepersonal.codnom BETWEEN '0000' AND '0010' AND 
		sno_constantepersonal.codcons='0000000007' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'AND
		sno_constantepersonal.codper=sno_conceptopersonal.codper AND
		sno_constantepersonal.codnom=sno_conceptopersonal.codnom AND
		sno_constantepersonal.codcons=sno_conceptopersonal.codconc AND
		sno_conceptopersonal.aplcon='1')*22,0) AS TV_Fluvial,	
	--Tiempo de Viaje Terrestre
	COALESCE((SELECT
		moncon
	FROM 
		sno_constantepersonal, 
		sno_personalnomina,
		sno_personal AS sno_personal02,
		sno_conceptopersonal
	WHERE 
		sno_constantepersonal.codper=sno_personalnomina.codper AND
		sno_constantepersonal.codper=sno_personal02.codper AND
		sno_constantepersonal.codnom=sno_personalnomina.codnom AND
		sno_constantepersonal.codper=sno_personal01.codper AND 
		sno_constantepersonal.codnom BETWEEN '0000' AND '0010' AND 
		sno_constantepersonal.codcons='0000000008' AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'AND
		sno_constantepersonal.codper=sno_conceptopersonal.codper AND
		sno_constantepersonal.codnom=sno_conceptopersonal.codnom AND
		sno_constantepersonal.codcons=sno_conceptopersonal.codconc AND
		sno_conceptopersonal.aplcon='1')*22,0) AS TV_Terrestre,		
	--Aporte Ahorro Patronal
	(CASE sno_personalnomina.codnom
		WHEN '0000' THEN (sno_personalnomina.sueper)
		WHEN '0001' THEN (sno_personalnomina.sueper)
		WHEN '0002' THEN (sno_personalnomina.sueper)
		WHEN '0003' THEN (sno_personalnomina.sueper)
		WHEN '0004' THEN (sno_personalnomina.sueper)
		WHEN '0005' THEN (sno_personalnomina.sueper*30)
		WHEN '0006' THEN (sno_personalnomina.sueper*30)
		WHEN '0007' THEN (sno_personalnomina.sueper*30)
		WHEN '0008' THEN (sno_personalnomina.sueper*30)
		WHEN '0009' THEN (sno_personalnomina.sueper)
		WHEN '0010' THEN (sno_personalnomina.sueper*30)
	END*0.15) AS Ahorro_Patronal,
	--Bono Reintegro de Vacaciones (300/12)
	25 AS Reintegro_Vacac,
	--Bono por Profesionalismo Se combina el nivel academico y la nomina para determinar el procentaje
	--de Bono de Profesionalismno;debido a que la nomina diaria tambien existen algunas personas con 
	--esta asignacion
	COALESCE((SELECT
		CASE sno_personal04.nivacaper||sno_personalnomina.codnom
			--nivel academico cero (0) combinacion nominas desde 0000 hasta 0010
			WHEN '00000' THEN (sno_personalnomina.sueper*0)
			WHEN '00001' THEN (sno_personalnomina.sueper*0)
			WHEN '00002' THEN (sno_personalnomina.sueper*0)
			WHEN '00003' THEN (sno_personalnomina.sueper*0)
			WHEN '00004' THEN (sno_personalnomina.sueper*0)
			WHEN '00005' THEN (sno_personalnomina.sueper*0)
			WHEN '00006' THEN (sno_personalnomina.sueper*0)
			WHEN '00007' THEN (sno_personalnomina.sueper*0)
			WHEN '00008' THEN (sno_personalnomina.sueper*0)
			WHEN '00009' THEN (sno_personalnomina.sueper*0)
			WHEN '00010' THEN (sno_personalnomina.sueper*0)
			WHEN '00000' THEN (sno_personalnomina.sueper*0)
			--nivel academico uno (1) combinacion nominas desde 0000 hasta 0010
			WHEN '10001' THEN (sno_personalnomina.sueper*0)
			WHEN '10002' THEN (sno_personalnomina.sueper*0)
			WHEN '10003' THEN (sno_personalnomina.sueper*0)
			WHEN '10004' THEN (sno_personalnomina.sueper*0)
			WHEN '10005' THEN (sno_personalnomina.sueper*0)
			WHEN '10006' THEN (sno_personalnomina.sueper*0)
			WHEN '10007' THEN (sno_personalnomina.sueper*0)
			WHEN '10008' THEN (sno_personalnomina.sueper*0)
			WHEN '10009' THEN (sno_personalnomina.sueper*0)
			WHEN '10010' THEN (sno_personalnomina.sueper*0)
			--nivel academico dos (2) combinacion nominas desde 0000 hasta 0010
			WHEN '20000' THEN (sno_personalnomina.sueper*0)
			WHEN '20001' THEN (sno_personalnomina.sueper*0)
			WHEN '20002' THEN (sno_personalnomina.sueper*0)
			WHEN '20003' THEN (sno_personalnomina.sueper*0)
			WHEN '20004' THEN (sno_personalnomina.sueper*0)
			WHEN '20005' THEN (sno_personalnomina.sueper*0)
			WHEN '20006' THEN (sno_personalnomina.sueper*0)
			WHEN '20007' THEN (sno_personalnomina.sueper*0)
			WHEN '20008' THEN (sno_personalnomina.sueper*0)
			WHEN '20009' THEN (sno_personalnomina.sueper*0)
			WHEN '20010' THEN (sno_personalnomina.sueper*0)
			--nivel academico tres (3) combinacion nominas desde 0000 hasta 0010
			WHEN '30000' THEN (sno_personalnomina.sueper*0.08)
			WHEN '30001' THEN (sno_personalnomina.sueper*0.08)
			WHEN '30002' THEN (sno_personalnomina.sueper*0.08)
			WHEN '30003' THEN (sno_personalnomina.sueper*0.08)
			WHEN '30004' THEN (sno_personalnomina.sueper*0.08)
			WHEN '30005' THEN (sno_personalnomina.sueper*0.08)
			WHEN '30006' THEN (sno_personalnomina.sueper*0.08)
			WHEN '30007' THEN (sno_personalnomina.sueper*0.08)
			WHEN '30008' THEN (sno_personalnomina.sueper*0.08)
			WHEN '30009' THEN (sno_personalnomina.sueper*0.08)
			WHEN '30010' THEN (sno_personalnomina.sueper*0.08)
			--nivel academico cuatro (4) combinacion nominas desde 0000 hasta 0010
			WHEN '40000' THEN (sno_personalnomina.sueper*0.10)
			WHEN '40001' THEN (sno_personalnomina.sueper*0.10)
			WHEN '40002' THEN (sno_personalnomina.sueper*0.10)
			WHEN '40003' THEN (sno_personalnomina.sueper*0.10)
			WHEN '40004' THEN (sno_personalnomina.sueper*0.10)
			WHEN '40005' THEN (sno_personalnomina.sueper*0.10)
			WHEN '40006' THEN (sno_personalnomina.sueper*0.10)
			WHEN '40007' THEN (sno_personalnomina.sueper*0.10)
			WHEN '40008' THEN (sno_personalnomina.sueper*0.10)
			WHEN '40009' THEN (sno_personalnomina.sueper*0.10)
			WHEN '40010' THEN (sno_personalnomina.sueper*0.10)
			--nivel academico seis (6) combinacion nominas desde 0000 hasta 0010
			WHEN '60000' THEN (sno_personalnomina.sueper*0.12)
			WHEN '60001' THEN (sno_personalnomina.sueper*0.12)
			WHEN '60002' THEN (sno_personalnomina.sueper*0.12)
			WHEN '60003' THEN (sno_personalnomina.sueper*0.12)
			WHEN '60004' THEN (sno_personalnomina.sueper*0.12)
			WHEN '60005' THEN (sno_personalnomina.sueper*0.12)
			WHEN '60006' THEN (sno_personalnomina.sueper*0.12)
			WHEN '60007' THEN (sno_personalnomina.sueper*0.12)
			WHEN '60008' THEN (sno_personalnomina.sueper*0.12)
			WHEN '60009' THEN (sno_personalnomina.sueper*0.12)
			WHEN '60010' THEN (sno_personalnomina.sueper*0.12)
			--nivel academico siete (7) combinacion nominas desde 0000 hasta 0010
			WHEN '70000' THEN (sno_personalnomina.sueper*0.12)
			WHEN '70001' THEN (sno_personalnomina.sueper*0.12)
			WHEN '70002' THEN (sno_personalnomina.sueper*0.12)
			WHEN '70003' THEN (sno_personalnomina.sueper*0.12)
			WHEN '70004' THEN (sno_personalnomina.sueper*0.12)
			WHEN '70005' THEN (sno_personalnomina.sueper*0.12)
			WHEN '70006' THEN (sno_personalnomina.sueper*0.12)
			WHEN '70007' THEN (sno_personalnomina.sueper*0.12)
			WHEN '70008' THEN (sno_personalnomina.sueper*0.12)
			WHEN '70009' THEN (sno_personalnomina.sueper*0.12)
			WHEN '70010' THEN (sno_personalnomina.sueper*0.12)
		END
	FROM 
		sno_personal AS sno_personal04,
		sno_personalnomina
	WHERE 
		sno_personalnomina.codper=sno_personal04.codper AND
		sno_personal01.codper=sno_personal04.codper AND 
		sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND
		sno_personal04.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'),0) AS Bono_Profesion,
	--Bono Subvencion
	COALESCE((SELECT
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
		sno_constantepersonal.codnom BETWEEN '0000' AND '0010' AND 
		(sno_constantepersonal.codcons='0000000073' OR
		 sno_constantepersonal.codcons='0000000074') AND 
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'),0) AS Bono_Subvencion,
	--Prima por Jerarquia
	COALESCE((SELECT
		MAX(sno_personalnomina.sueper)
	FROM 
		sno_personalnomina,
		sno_personal AS sno_personal02,
		sno_conceptopersonal
	WHERE 
		sno_conceptopersonal.codper=sno_personalnomina.codper AND
		sno_conceptopersonal.codper=sno_personal02.codper AND
		sno_conceptopersonal.codnom=sno_personalnomina.codnom AND
		sno_conceptopersonal.codnom BETWEEN '0000' AND '0010' AND 
		sno_conceptopersonal.codconc='0000004030' AND 
		sno_conceptopersonal.codper=sno_personal01.codper AND
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'AND
		sno_conceptopersonal.aplcon='1')*0.10,0) AS Prima_Jerarquia,	
	--Prima de Alto Nivel
	COALESCE((SELECT
		MAX(sno_personalnomina.sueper)
	FROM 
		sno_personalnomina,
		sno_personal AS sno_personal02,
		sno_conceptopersonal
	WHERE 
		sno_conceptopersonal.codper=sno_personalnomina.codper AND
		sno_conceptopersonal.codper=sno_personal02.codper AND
		sno_conceptopersonal.codnom=sno_personalnomina.codnom AND
		sno_conceptopersonal.codnom BETWEEN '0000' AND '0010' AND 
		sno_conceptopersonal.codconc='0000004031' AND 
		sno_conceptopersonal.codper=sno_personal01.codper AND
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'AND
		sno_conceptopersonal.aplcon='1')*0.15,0) AS Prima_Alto_Nivel,
	--Bono Frontera 01
	COALESCE((SELECT
		MAX(sno_personalnomina.sueper)
	FROM 
		sno_personalnomina,
		sno_personal AS sno_personal02,
		sno_conceptopersonal
	WHERE 
		sno_conceptopersonal.codper=sno_personalnomina.codper AND
		sno_conceptopersonal.codper=sno_personal02.codper AND
		sno_conceptopersonal.codnom=sno_personalnomina.codnom AND
		sno_conceptopersonal.codnom BETWEEN '0000' AND '0010' AND 
		sno_conceptopersonal.codconc='0000004032' AND 
		sno_conceptopersonal.codper=sno_personal01.codper AND
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'AND
		sno_conceptopersonal.aplcon='1')*0.05,0) AS Bono_Frontera_01,
	--Prima de Responsabilidad
	COALESCE((SELECT
		MAX(sno_personalnomina.sueper)
	FROM 
		sno_personalnomina,
		sno_personal AS sno_personal02,
		sno_conceptopersonal
	WHERE 
		sno_conceptopersonal.codper=sno_personalnomina.codper AND
		sno_conceptopersonal.codper=sno_personal02.codper AND
		sno_conceptopersonal.codnom=sno_personalnomina.codnom AND
		sno_conceptopersonal.codnom BETWEEN '0000' AND '0010' AND 
		sno_conceptopersonal.codconc='0000004033' AND 
		sno_conceptopersonal.codper=sno_personal01.codper AND
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'AND
		sno_conceptopersonal.aplcon='1')*0.10,0) AS Prima_Responsabilidad,
	--Bono Frontera_02
	COALESCE((SELECT
		MAX(sno_personalnomina.sueper)
	FROM 
		sno_personalnomina,
		sno_personal AS sno_personal02,
		sno_conceptopersonal
	WHERE 
		sno_conceptopersonal.codper=sno_personalnomina.codper AND
		sno_conceptopersonal.codper=sno_personal02.codper AND
		sno_conceptopersonal.codnom=sno_personalnomina.codnom AND
		sno_conceptopersonal.codnom BETWEEN '0000' AND '0010' AND 
		sno_conceptopersonal.codconc='0000004034' AND 
		sno_conceptopersonal.codper=sno_personal01.codper AND
		sno_personal02.estper='1' AND
		sno_personalnomina.staper BETWEEN '1' AND '2'AND
		sno_conceptopersonal.aplcon='1')*0.10,0) AS Bono_Frontera_02
FROM
	sno_personal AS sno_personal01,
	sno_personalnomina
WHERE
	sno_personal01.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND
	sno_personal01.estper='1' AND
	sno_personalnomina.staper BETWEEN '1' AND '2' AND
	sno_personal01.codper='0003011075'

