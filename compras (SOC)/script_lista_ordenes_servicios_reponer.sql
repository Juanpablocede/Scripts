SELECT 
	soc_ordencompra.numordcom,
	soc_ordencompra.fecordcom,
	soc_ordencompra.montot,
	soc_ordencompra.cod_pro,
	rpc_proveedor.nompro,
	soc_ordencompra.coduniadm,
	spg_unidadadministrativa.denuniadm,
	soc_ordencompra.codestpro1,
	soc_ordencompra.codestpro2,
	soc_ordencompra.codestpro3,
	soc_ordencompra.codestpro4,
	soc_ordencompra.codestpro5,
	COALESCE((SELECT
		MAX(cxp_rd_spg.spg_cuenta)
	FROM
		cxp_rd_spg
	WHERE 
		soc_ordencompra.codemp=cxp_rd_spg.codemp AND 
		soc_ordencompra.numordcom=cxp_rd_spg.numdoccom AND
		cxp_rd_spg.procede_doc='SOCCOS'),'0') AS spg_cuenta,
	COALESCE((SELECT
		SUM(cxp_rd_spg.monto)
	FROM
		cxp_rd_spg
	WHERE 
		soc_ordencompra.codemp=cxp_rd_spg.codemp AND 
		soc_ordencompra.numordcom=cxp_rd_spg.numdoccom AND
		cxp_rd_spg.procede_doc='SOCCOS'),0) AS Monto_Causado,
	--Monto a reponer dismunuir del comprometido (spg_cuentas.comprometido)
	soc_ordencompra.montot-
	COALESCE((SELECT
		SUM(cxp_rd_spg.monto)
	FROM
		cxp_rd_spg
	WHERE 
		soc_ordencompra.codemp=cxp_rd_spg.codemp AND 
		soc_ordencompra.numordcom=cxp_rd_spg.numdoccom AND
		cxp_rd_spg.procede_doc='SOCCOS'),0) AS Monto_Reponer
	
FROM 
	soc_ordencompra,
	rpc_proveedor,
	spg_unidadadministrativa
WHERE 
	--soc_ordencompra.numordcom='000000000000870' AND
	soc_ordencompra.fecordcom >= '2014-01-01' AND 
	soc_ordencompra.fecordcom <= '2014-10-11' AND 
	soc_ordencompra.estcom>='2' AND 
	soc_ordencompra.estpenalm='0' AND
	(soc_ordencompra.estcondat = 'S' OR soc_ordencompra.estcondat = '-') AND
	rpc_proveedor.cod_pro=soc_ordencompra.cod_pro AND
	spg_unidadadministrativa.coduniadm=soc_ordencompra.coduniadm
ORDER BY
	soc_ordencompra.numordcom