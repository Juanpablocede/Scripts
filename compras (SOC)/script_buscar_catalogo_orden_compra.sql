SELECT 
	soc_ordencompra.codemp, 
	soc_ordencompra.numordcom, 
	soc_ordencompra.estcondat, 
	soc_ordencompra.fecordcom, 
	soc_ordencompra.estsegcom, 
	soc_ordencompra.porsegcom, 
	soc_ordencompra.monsegcom, 
	soc_ordencompra.forpagcom, 
	soc_ordencompra.estcom, 
	soc_ordencompra.diaplacom, 
	soc_ordencompra.concom, 
	soc_ordencompra.obscom, 
	soc_ordencompra.monsubtot, 
	soc_ordencompra.monbasimp, 
	soc_ordencompra.monimp, 
	soc_ordencompra.mondes, 
	soc_ordencompra.montot, 
	soc_ordencompra.lugentnomdep, 
	soc_ordencompra.lugentdir, 
	soc_ordencompra.monant, 
	soc_ordencompra.estlugcom, 
	soc_ordencompra.tascamordcom, 
	soc_ordencompra.montotdiv, 
	soc_ordencompra.estapro, 
	soc_ordencompra.fecaprord, 
	soc_ordencompra.coduniadm, 
	soc_ordencompra.obsordcom, 
	soc_ordencompra.cod_pro, 
	soc_ordencompra.codfuefin, 
	spg_unidadadministrativa.denuniadm, 
	soc_ordencompra.codestpro1, 
	soc_ordencompra.codestpro2, 
	soc_ordencompra.tipbieordcom, 
	soc_ordencompra.codestpro3, 
	soc_ordencompra.codestpro4, 
	soc_ordencompra.codestpro5,
	soc_ordencompra.estcla, 
	sigesp_fuentefinanciamiento.denfuefin, 
	soc_ordencompra.codmon, 
	soc_ordencompra.codtipmod, 
	soc_ordencompra.codpai,
	soc_ordencompra.codest,
	soc_ordencompra.codmun,
	soc_ordencompra.codpar,
	soc_ordencompra.conanusoc, 

	(SELECT despai 
	FROM sigesp_pais 
	WHERE soc_ordencompra.codpai=sigesp_pais.codpai)AS despai, 

	(SELECT desest 
	FROM sigesp_estados 
	WHERE soc_ordencompra.codpai=sigesp_estados.codpai AND 
	soc_ordencompra.codest=sigesp_estados.codest)AS desest, 

	(SELECT denmun 
	FROM sigesp_municipio 
	WHERE soc_ordencompra.codpai=sigesp_municipio.codpai AND 
	soc_ordencompra.codest=sigesp_municipio.codest AND 
	soc_ordencompra.codmun=sigesp_municipio.codmun) AS denmun, 

	(SELECT denpar 
	FROM sigesp_parroquia 
	WHERE soc_ordencompra.codpai=sigesp_parroquia.codpai AND 
	soc_ordencompra.codest=sigesp_parroquia.codest AND 
	soc_ordencompra.codmun=sigesp_parroquia.codmun AND 
	soc_ordencompra.codpar=sigesp_parroquia.codpar) AS denpar, 

	(SELECT denmon 
	FROM sigesp_moneda 
	WHERE soc_ordencompra.codmon=sigesp_moneda.codmon)AS denmon, 

	soc_ordencompra.numanacot, 
	soc_ordencompra.uniejeaso, 
	soc_ordencompra.fechentdesde, 
	soc_ordencompra.fechenthasta, 

	(SELECT rpc_proveedor.nompro 
	FROM rpc_proveedor 
	WHERE rpc_proveedor.codemp=soc_ordencompra.codemp AND 
	rpc_proveedor.cod_pro=soc_ordencompra.cod_pro) AS nompro, 

	(SELECT rpc_proveedor.rifpro 
	FROM rpc_proveedor 
	WHERE rpc_proveedor.codemp=soc_ordencompra.codemp AND 
	rpc_proveedor.cod_pro=soc_ordencompra.cod_pro) AS rifpro, 

	(SELECT rpc_proveedor.tipconpro 
	FROM rpc_proveedor 
	WHERE rpc_proveedor.codemp=soc_ordencompra.codemp AND 
	rpc_proveedor.cod_pro=soc_ordencompra.cod_pro) AS tipconpro, 

	(SELECT denmodcla 
	FROM soc_modalidadclausulas 
	WHERE soc_ordencompra.codemp=soc_modalidadclausulas.codemp AND 
	soc_ordencompra.codtipmod=soc_modalidadclausulas.codtipmod)AS denmodcla 
FROM 
	soc_ordencompra,
	spg_unidadadministrativa,
	spg_dt_unidadadministrativa,
	sigesp_fuentefinanciamiento 
WHERE 
	soc_ordencompra.codemp = '0001' AND 
	soc_ordencompra.numordcom like '%%' AND 
	soc_ordencompra.cod_pro like '%%' AND 
	soc_ordencompra.fecordcom BETWEEN '2014-11-01' AND '2014-11-04' AND 
	soc_ordencompra.numordcom<>'000000000000000' AND 

	soc_ordencompra.codemp=spg_unidadadministrativa.codemp AND 
	soc_ordencompra.coduniadm=spg_unidadadministrativa.coduniadm AND 

	soc_ordencompra.codemp=spg_dt_unidadadministrativa.codemp AND
	soc_ordencompra.coduniadm=spg_dt_unidadadministrativa.coduniadm AND 
	soc_ordencompra.codestpro1=spg_dt_unidadadministrativa.codestpro1 AND 
	soc_ordencompra.codestpro2=spg_dt_unidadadministrativa.codestpro2 AND 
	soc_ordencompra.codestpro3=spg_dt_unidadadministrativa.codestpro3 AND 
	soc_ordencompra.codestpro4=spg_dt_unidadadministrativa.codestpro4 AND 
	soc_ordencompra.codestpro5=spg_dt_unidadadministrativa.codestpro5 AND 
	soc_ordencompra.estcla=spg_dt_unidadadministrativa.estcla AND 
	
	spg_dt_unidadadministrativa.codemp=spg_unidadadministrativa.codemp AND 
	spg_dt_unidadadministrativa.coduniadm=spg_unidadadministrativa.coduniadm AND 
	soc_ordencompra.codfuefin=sigesp_fuentefinanciamiento.codfuefin AND 
	soc_ordencompra.codemp=sigesp_fuentefinanciamiento.codemp 
ORDER BY 
	numordcom ASC