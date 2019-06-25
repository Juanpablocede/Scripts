SELECT DISTINCT
	sno_personal.cedper,
	sno_personalnomina.codnom,
	sno_personal.apeper,
	sno_personal.nomper,
	sno_personal.sexper,
	sno_personal.fecnacper,
	sno_personal.codpro,
	sno_profesion.despro,
	sno_personalnomina.codubifis,
	sno_ubicacionfisica.desubifis,
	sno_personal.dirper,
	sno_personal.codpai,
	sigesp_pais.despai,
	sno_personal.codest,
	sigesp_estados.desest,
	sno_personal.codmun,
	sigesp_municipio.denmun,
	sno_personal.codpar,
	sigesp_parroquia.denpar
FROM
	sno_personal,
	sno_personalnomina,
	sno_profesion,
	sno_ubicacionfisica,
	sigesp_pais,
	sigesp_estados,
	sigesp_municipio,
	sigesp_parroquia,
	sno_conceptopersonal
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personal.codpro=sno_profesion.codpro AND
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
	sno_personal.codpar=sigesp_parroquia.codpar AND

	sno_personalnomina.codnom BETWEEN '0000' AND '0011' AND
	(sno_personalnomina.staper='1' OR sno_personalnomina.staper='2') AND
	sno_personal.codper=sno_conceptopersonal.codper AND
	sno_conceptopersonal.codconc='0000005005' AND
	sno_conceptopersonal.aplcon=1
ORDER BY
	sno_personal.apeper



	
	