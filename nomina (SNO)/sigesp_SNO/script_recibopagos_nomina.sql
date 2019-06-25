SELECT 
	sno_personal.codper, 
	sno_personal.cedper, 
	sno_personal.rifper, 
	sno_personal.nomper, 
	sno_personal.apeper, 
	sno_personal.nacper, 
	sno_personalnomina.codcueban,
	sno_personalnomina.sueintper, 
	sno_personalnomina.tipcuebanper, 
	sno_personal.fecingper, 
	sno_personal.fecegrper, 
	sno_personalnomina.fecingper as fecingnom,
	sno_personal.codorg, 
	sno_personal.fecleypen, 
	sum(sno_salida.valsal) as total, 
	sno_unidadadmin.desuniadm, 
	sno_unidadadmin.minorguniadm,
	sno_unidadadmin.ofiuniadm,
	sno_unidadadmin.uniuniadm,
	sno_personal.dirper, 
	sno_unidadadmin.depuniadm,
	sno_tipopersonal.destipper, 
	sno_unidadadmin.prouniadm, 
	MAX(sno_personalnomina.sueper) AS sueper, 
	sno_personalnomina.obsrecper, 
	MAX(sno_personalnomina.pagbanper) AS pagbanper, 
	MAX(sno_personalnomina.fecculcontr) AS fecculcontr, 
	MAX(sno_personalnomina.pagefeper) AS pagefeper, 
	MAX(sno_ubicacionfisica.desubifis) AS desubifis, 
	MAX(sno_personalnomina.descasicar) AS descasicar, 
	MAX(sno_personalnomina.sueproper) as sueproper, 
	(SELECT 
		tipnom 
	FROM 
		sno_nomina 
	WHERE 
		sno_personalnomina.codnom = sno_nomina.codnom AND 
		sno_personalnomina.codemp = sno_nomina.codemp) AS tiponom, 
	(SELECT 
		suemin 
	FROM 
		sno_clasificacionobrero
	WHERE 
		sno_clasificacionobrero.grado = sno_personalnomina.grado AND 
		sno_clasificacionobrero.codemp = sno_personalnomina.codemp) AS sueobr, 
	(SELECT 
		desest 
	FROM 
		sigesp_estados
	WHERE 
		sigesp_estados.codpai = sno_ubicacionfisica.codpai AND 
		sigesp_estados.codest = sno_ubicacionfisica.codest) AS desest, 
	(SELECT 
		denmun 
	FROM 
		sigesp_municipio
	WHERE 
		sigesp_municipio.codpai = sno_ubicacionfisica.codpai AND 
		sigesp_municipio.codest = sno_ubicacionfisica.codest AND 
		sigesp_municipio.codmun = sno_ubicacionfisica.codmun) AS denmun, 
	(SELECT 
		denpar 
	FROM 
		sigesp_parroquia
	WHERE 
		sigesp_parroquia.codpai = sno_ubicacionfisica.codpai AND 
		sigesp_parroquia.codest = sno_ubicacionfisica.codest AND 
		sigesp_parroquia.codmun = sno_ubicacionfisica.codmun AND 
		sigesp_parroquia.codpar = sno_ubicacionfisica.codpar) AS denpar, 
	(SELECT 
		nomban 
	FROM 
		scb_banco 
	WHERE 
		scb_banco.codemp = sno_personalnomina.codemp AND 
		scb_banco.codban = sno_personalnomina.codban) AS banco, 
	(SELECT 
		nomage 
	FROM 
		scb_agencias 
	WHERE 
		scb_agencias.codemp = sno_personalnomina.codemp AND 
		scb_agencias.codban = sno_personalnomina.codban AND 
		scb_agencias.codage = sno_personalnomina.codage) AS agencia, 
	(SELECT 
		sno_categoria_rango.descat 
	FROM 
		sno_rango, 
		sno_categoria_rango
	WHERE 
		sno_rango.codemp=sno_personal.codemp AND  
		sno_rango.codcom=sno_personal.codcom AND 
		sno_rango.codran=sno_personal.codran AND 
		sno_categoria_rango.codcat=sno_rango.codcat) AS descat, 
	srh_gerencia.denger AS denger, 
	(SELECT 
		codasicar 
	FROM 
		sno_asignacioncargo 
	WHERE 
		sno_personalnomina.codemp='0001' AND 
		sno_personalnomina.codnom='0004' AND 
		sno_personalnomina.codemp = sno_asignacioncargo.codemp AND 
		sno_personalnomina.codnom = sno_asignacioncargo.codnom AND 
		sno_personalnomina.codasicar = sno_asignacioncargo.codasicar) as codcar, 
	(SELECT 
		denasicar 
	FROM 
		sno_asignacioncargo 
	WHERE 
		sno_personalnomina.codemp='0001' AND 
		sno_personalnomina.codnom='0004' AND 
		sno_personalnomina.codemp = sno_asignacioncargo.codemp AND 
		sno_personalnomina.codnom = sno_asignacioncargo.codnom AND 
		sno_personalnomina.codasicar = sno_asignacioncargo.codasicar) as descar 
FROM 
	sno_personal, 
	sno_personalnomina, 
	sno_salida, 
	sno_unidadadmin, 
	sno_ubicacionfisica, 
	sno_tipopersonal, 
	srh_gerencia 
WHERE 
	sno_salida.codemp='0001' AND 
	sno_salida.codnom='0004' AND 
	sno_salida.codperi='019' AND 
	(sno_salida.tipsal<>'P2' AND sno_salida.tipsal<>'V4' AND sno_salida.tipsal<>'W4' ) AND 
	sno_personalnomina.codper>='0004939627' AND 
	sno_personalnomina.codper<='0004939627'AND 
	sno_salida.valsal<>0 AND 
	(sno_salida.tipsal='A' OR sno_salida.tipsal='V1' OR 
	sno_salida.tipsal='W1' OR sno_salida.tipsal='D' OR sno_salida.tipsal='V2' OR 
	sno_salida.tipsal='W2' OR sno_salida.tipsal='P1' OR sno_salida.tipsal='V3' OR sno_salida.tipsal='W3') AND 
	sno_personalnomina.codemp = sno_personal.codemp AND 
	sno_personalnomina.codper = sno_personal.codper AND 
	sno_personalnomina.codemp = sno_ubicacionfisica.codemp AND 
	sno_personalnomina.codubifis = sno_ubicacionfisica.codubifis AND 
	sno_personalnomina.codemp = sno_salida.codemp AND 
	sno_personalnomina.codnom = sno_salida.codnom AND 
	sno_personalnomina.codper = sno_salida.codper AND 
	sno_personalnomina.codemp = sno_unidadadmin.codemp AND 
	
	sno_personalnomina.minorguniadm = sno_unidadadmin.minorguniadm AND 

	
	sno_personalnomina.ofiuniadm = sno_unidadadmin.ofiuniadm AND 
	sno_personalnomina.uniuniadm = sno_unidadadmin.uniuniadm AND 
	sno_personalnomina.depuniadm = sno_unidadadmin.depuniadm AND 
	sno_personalnomina.prouniadm = sno_unidadadmin.prouniadm AND 


	
	sno_personalnomina.codemp = sno_tipopersonal.codemp AND 
	sno_personalnomina.codded = sno_tipopersonal.codded AND 
	sno_personalnomina.codtipper = sno_tipopersonal.codtipper AND 
	sno_personal.codger = srh_gerencia.codger 
GROUP BY 
	sno_personal.codemp,
	sno_personal.codcom, 
	sno_personal.rifper, 
	sno_personal.codran, 
	sno_personalnomina.codemp, 
	sno_personalnomina.codnom, 
	sno_personal.codper, 
	sno_personal.cedper, 
	sno_personal.nomper, 
	sno_personal.apeper, 
	sno_personal.nacper, 
	sno_personalnomina.codcueban, 
	sno_personalnomina.tipcuebanper, 
	sno_personal.fecingper, 
	sno_personal.fecegrper, 
	sno_personal.fecleypen, 
	sno_unidadadmin.desuniadm,
	sno_personalnomina.sueintper, 
	sno_personalnomina.codcar, 
	sno_personalnomina.codban, 
	sno_unidadadmin.minorguniadm,
	sno_unidadadmin.ofiuniadm,
	sno_unidadadmin.uniuniadm,
	sno_personal.dirper, 
	sno_unidadadmin.depuniadm,
	sno_tipopersonal.destipper, 
	sno_unidadadmin.prouniadm,
	sno_personalnomina.codasicar, 
	sno_ubicacionfisica.codpai, 
	sno_ubicacionfisica.codest,
	sno_ubicacionfisica.codmun,
	sno_ubicacionfisica.codpar,
	sno_personalnomina.codage, 
	sno_personalnomina.fecingper,
	sno_personal.codorg,sueobr,
	tiponom,
	sno_personalnomina.
	obsrecper, 
	srh_gerencia.denger 
ORDER BY 
	sno_personal.codper 