SELECT 
	numordcom,
	cod_pro,
	fecordcom,
	montot,
	coduniadm,
	--estcondat,
	case estcondat
		when 'B' Then 'Compras'
		When 'S' Then 'Servicios'
	end as estcondat,
	(SELECT 
		nompro 
	FROM 
		rpc_proveedor 
	WHERE 
		rpc_proveedor.cod_pro=soc_ordencompra.cod_pro) AS nompro, 
	(SELECT 
		denuniadm 
	FROM 
		spg_unidadadministrativa 
	WHERE 
		spg_unidadadministrativa.coduniadm=soc_ordencompra.coduniadm) AS denuniadm 
FROM 
	soc_ordencompra 
WHERE 
	codemp='0001' AND 
	fecordcom >= '2014-01-01' AND 
	fecordcom <= '2014-12-31' AND 
	estcom>='2' AND 
	estpenalm='0' AND 
	(estcondat = 'B' OR estcondat = 'S' OR estcondat = '-') AND 
	numordcom IN 
	(SELECT 
		numdoccom 
	FROM 
		cxp_rd_spg,
		cxp_rd 
	WHERE 
		cxp_rd_spg.codemp='0001' AND 
		cxp_rd_spg.procede_doc='SOCCOC' AND 
		cxp_rd.estprodoc<>'A' AND 
		cxp_rd_spg.codemp=cxp_rd.codemp AND 
		cxp_rd_spg.numrecdoc=cxp_rd.numrecdoc AND 
		cxp_rd_spg.codtipdoc=cxp_rd.codtipdoc AND 
		cxp_rd_spg.cod_pro=cxp_rd.cod_pro AND 
		cxp_rd_spg.ced_bene=cxp_rd.ced_bene) 