SELECT
	sno_personal.nacper,
	sno_personal.cedper,
	sno_personal.nomper,
	sno_personal.apeper,
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[1] as x limit 1) as primer_nombre,
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[2] as x limit 1) as segundo_nombre,
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[3] as x limit 1) as tercero_nombre,
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[4] as x limit 1) as cuarto_nombre,
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[5] as x limit 1) as cuarto_nombre,
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[6] as x limit 1) as cuarto_nombre,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[1] as x limit 1) as primer_apellido,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[2] as x limit 1) as segundo_apellido,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[3] as x limit 1) as tercero_apellido,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[4] as x limit 1) as cuarto_apellido,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[5] as x limit 1) as cuarto_apellido,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[6] as x limit 1) as cuarto_apellido,
	sno_personal.sexper,
	sno_personal.fecnacper,
	sno_personal.codpro,
	sno_profesion.despro,
	sno_personal.dirper,
	sno_personalnomina.depuniadm||sno_personalnomina.prouniadm,
	sno_unidadadmin.desuniadm,
	sno_personalnomina.codubifis,
	sno_ubicacionfisica.desubifis,
	sno_personal.codest,
	sigesp_estados.desest,
	sno_personal.codmun,
	sigesp_municipio.denmun,
	sno_personal.codpar,
	sigesp_parroquia.denpar
FROM
	sno_personal,
	sno_profesion,
	sno_personalnomina,
	sno_unidadadmin,
	sno_ubicacionfisica,
	sigesp_pais,
	sigesp_estados,
	sigesp_municipio,
	sigesp_parroquia,
	sno_conceptopersonal
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom=sno_conceptopersonal.codnom AND
	sno_personalnomina.codper=sno_conceptopersonal.codper AND
	sno_conceptopersonal.codconc='0000004005' AND
	sno_conceptopersonal.aplcon=1 AND
	sno_personalnomina.staper IN('1','2','4') AND
	(sno_personalnomina.codnom BETWEEN '0005' AND '0008' OR
	 sno_personalnomina.codnom BETWEEN '9000' AND '9005' OR
	 sno_personalnomina.codnom='0010') AND
	sno_personal.codpro=sno_profesion.codpro AND
	sno_personalnomina.depuniadm=sno_unidadadmin.depuniadm AND
	sno_personalnomina.prouniadm=sno_unidadadmin.prouniadm AND
	sno_personalnomina.codubifis=sno_ubicacionfisica.codubifis AND
	
	sno_personal.codpai=sigesp_pais.codpai AND
	
	sno_personal.codpai=sigesp_estados.codpai AND
	sno_personal.codest=sigesp_estados.codest AND

	sno_personal.codpai=sigesp_municipio.codpai AND
	sno_personal.codest=sigesp_municipio.codest AND
	sno_personal.codmun=sigesp_municipio.codmun AND
	
	sno_personal.codpai=sigesp_parroquia.codpai AND
	sno_personal.codest=sigesp_parroquia.codest AND
	sno_personal.codmun=sigesp_parroquia.codmun AND
	sno_personal.codpar=sigesp_parroquia.codpar

ORDER BY
	sno_personal.codper
	
