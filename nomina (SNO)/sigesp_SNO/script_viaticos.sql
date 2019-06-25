SELECT
	scv_dt_personal.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS Nombres,
	sno_personalnomina.codban,
	scb_banco.nomban,
	sno_personalnomina.codcueban,
	SUBSTRING(scv_solicitudviatico.codestpro2,22,4),
	sno_unidadadmin.desuniadm,
	scv_solicitudviatico.codsolvia,
	scv_solicitudviatico.fecsolvia,
	scv_solicitudviatico.estsolvia,
	SUBSTRING(scv_solicitudviatico.codestpro1,24,2),
	SUBSTRING(scv_solicitudviatico.codestpro2,22,4),
	SUBSTRING(scv_solicitudviatico.codestpro3,24,2),
	SUBSTRING(scv_solicitudviatico.codestpro4,24,2),
	SUBSTRING(scv_solicitudviatico.codestpro5,24,2),
	
	scv_dt_personal.monpervia
FROM
	scv_dt_personal,
	scv_solicitudviatico,
	sno_personalnomina,
	sno_personal,
	scb_banco,
	sno_unidadadmin
WHERE
	scv_solicitudviatico.codsolvia=scv_dt_personal.codsolvia AND
	(scv_solicitudviatico.fecsolvia BETWEEN '2013/10/16' AND  '2013/10/17') AND
	scv_solicitudviatico.estsolvia='A' AND

	sno_personalnomina.codban=scb_banco.codban AND
	scv_solicitudviatico.codestpro2=sno_unidadadmin.codestpro2 AND 

	scv_dt_personal.codper=sno_personalnomina.codper AND
	scv_dt_personal.codper=sno_personal.codper AND
	sno_personalnomina.codper=sno_personal.codper AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND
	sno_personal.estper='1' AND
	sno_personalnomina.staper in('1','2')
ORDER BY
	scv_solicitudviatico.codsolvia

	