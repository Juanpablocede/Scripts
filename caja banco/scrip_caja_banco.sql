SELECT DISTINCT 
	cxp_solicitudes.numsol as numsol, 
	cxp_solicitudes.cod_pro as codproben, 
	cxp_solicitudes.fecemisol as fecemisol, 
	cxp_solicitudes.tipproben as tipproben, 
	cxp_solicitudes.fecpagsol as fecpagsol, 
	cxp_solicitudes.consol as consol, 
	cxp_solicitudes.estprosol as estprosol, 
	cxp_solicitudes.monsol as monsol, 
	cxp_solicitudes.obssol as obssol, 
	rpc_proveedor .nompro as nomproben, 
	cxp_solicitudes.numordpagmin, 
	cxp_solicitudes.codtipfon 
FROM 
	cxp_solicitudes, 
	rpc_proveedor , 
	cxp_rd, 
	cxp_dt_solicitudes 
WHERE 
	cxp_solicitudes.codemp='0001' AND 
	cxp_solicitudes.tipproben='P' AND 
	cxp_solicitudes.estprosol='C' AND 
	cxp_solicitudes.codemp=cxp_dt_solicitudes.codemp AND 
	cxp_solicitudes.numsol=cxp_dt_solicitudes.numsol AND 
	cxp_rd.codemp=cxp_dt_solicitudes.codemp AND 
	cxp_rd.numrecdoc=cxp_dt_solicitudes.numrecdoc AND 
	cxp_rd.codtipdoc=cxp_dt_solicitudes.codtipdoc AND 
	cxp_rd.cod_pro=cxp_dt_solicitudes.cod_pro AND 
	cxp_rd.ced_bene=cxp_dt_solicitudes.ced_bene AND 
	rpc_proveedor.codemp=cxp_solicitudes.codemp AND 
	rpc_proveedor.cod_pro=cxp_solicitudes.cod_pro AND 
	cxp_solicitudes.numsol NOT IN (SELECT numsol FROM scb_prog_pago WHERE codemp='0001' AND numsol=cxp_solicitudes.numsol)


