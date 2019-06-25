SELECT 
	sno_personal.codper, 
	sno_personal.cedper, 
	sno_personal.nomper, 
	sno_personal.apeper, 
	sno_personal.rifper, 
	sno_personal.nacper, 
	sno_personal.fecegrper, 
	sno_personal.fecleypen,
	sno_personal.codorg, 
	sno_thpersonalnomina.obsrecper, 
	sno_thpersonalnomina.codcueban, 
	sno_thpersonalnomina.tipcuebanper, 
	sno_personal.fecingper, 
	sum(sno_thsalida.valsal) as total, 
	sno_thunidadadmin.desuniadm, 
	sno_thunidadadmin.minorguniadm,
	sno_thunidadadmin.ofiuniadm,
	sno_thunidadadmin.uniuniadm,
	sno_thunidadadmin.depuniadm, 
	sno_thunidadadmin.prouniadm, 
	MAX(sno_thpersonalnomina.sueper) AS sueper, 
	MAX(sno_thpersonalnomina.pagbanper) AS pagbanper, 
	MAX(sno_thpersonalnomina.pagefeper) AS pagefeper, 
	MAX(sno_ubicacionfisica.desubifis) AS desubifis, 
	MAX(sno_thpersonalnomina.fecculcontr) AS fecculcontr, 
	MAX(sno_thpersonalnomina.descasicar) AS descasicar,
	MAX(sno_thpersonalnomina.sueintper) AS sueintper, 
	MAX(sno_thpersonalnomina.sueproper) as sueproper, 
	(SELECT 
		tipnom 
	FROM 
		sno_thnomina 
	WHERE 
		sno_thpersonalnomina.codemp = sno_thnomina.codemp AND 
		sno_thpersonalnomina.codnom = sno_thnomina.codnom AND 
		sno_thpersonalnomina.anocur = sno_thnomina.anocurnom AND 
		sno_thpersonalnomina.codperi = sno_thnomina.peractnom) AS tiponom, 
	(SELECT 
		suemin 
	FROM 
		sno_thclasificacionobrero 
	WHERE 
		sno_thclasificacionobrero.codemp = sno_thpersonalnomina.codemp AND 
		sno_thclasificacionobrero.codnom = sno_thpersonalnomina.codnom AND 
		sno_thclasificacionobrero.anocur = sno_thpersonalnomina.anocur AND 
		sno_thclasificacionobrero.codperi = sno_thpersonalnomina.codperi AND 
		sno_thclasificacionobrero.grado = sno_thpersonalnomina.grado) AS sueobr, 
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
		scb_banco.codemp = sno_thpersonalnomina.codemp AND 
		scb_banco.codban = sno_thpersonalnomina.codban) AS banco, 
	(SELECT 
		nomage 
	FROM 
		scb_agencias 
	WHERE 
		scb_agencias.codemp = sno_thpersonalnomina.codemp AND 
		scb_agencias.codban = sno_thpersonalnomina.codban AND 
		scb_agencias.codage = sno_thpersonalnomina.codage) AS agencia, 
	(SELECT 
		sno_categoria_rango.descat 
	FROM 
		sno_rango, sno_categoria_rango 
	WHERE 
		sno_rango.codemp=sno_personal.codemp AND 
		sno_rango.codcom=sno_personal.codcom AND 
		sno_rango.codran=sno_personal.codran AND 
		sno_categoria_rango.codcat=sno_rango.codcat) AS descat, 
	srh_gerencia.denger AS denger, 
	(SELECT 
		codasicar 
	FROM 
		sno_thasignacioncargo 
	WHERE 
		sno_thpersonalnomina.codemp = sno_thasignacioncargo.codemp AND 
		sno_thpersonalnomina.codnom = sno_thasignacioncargo.codnom AND 
		sno_thpersonalnomina.anocur = sno_thasignacioncargo.anocur AND 
		sno_thpersonalnomina.codperi = sno_thasignacioncargo.codperi AND 
		sno_thpersonalnomina.codasicar = sno_thasignacioncargo.codasicar) as codcar, 
	(SELECT 
		denasicar 
	FROM 
		sno_thasignacioncargo 
	WHERE 
		sno_thpersonalnomina.codemp = sno_thasignacioncargo.codemp AND 
		sno_thpersonalnomina.codnom = sno_thasignacioncargo.codnom AND 
		sno_thpersonalnomina.anocur = sno_thasignacioncargo.anocur AND 
		sno_thpersonalnomina.codperi = sno_thasignacioncargo.codperi AND 
		sno_thpersonalnomina.codasicar = sno_thasignacioncargo.codasicar) as descar 
FROM 
	sno_personal, 
	sno_thpersonalnomina, 
	sno_thsalida, 
	sno_thunidadadmin, 
	sno_ubicacionfisica, 
	srh_gerencia 
WHERE 
	sno_thsalida.codemp='0001' AND 
	sno_thsalida.codnom='0001' AND 
	sno_thsalida.anocur='2014' AND 
	sno_thsalida.codperi='018' AND 
	(sno_thsalida.tipsal<>'P2' AND sno_thsalida.tipsal<>'V4' AND sno_thsalida.tipsal<>'W4') AND 
	sno_thpersonalnomina.codper>='0006880620' AND sno_thpersonalnomina.codper<='0006880620'AND 
	sno_thsalida.valsal<>0 AND (sno_thsalida.tipsal='A' OR sno_thsalida.tipsal='V1' OR 
	sno_thsalida.tipsal='W1' OR sno_thsalida.tipsal='D' OR sno_thsalida.tipsal='V2' OR 
	sno_thsalida.tipsal='W2' OR sno_thsalida.tipsal='P1' OR sno_thsalida.tipsal='V3' OR sno_thsalida.tipsal='W3') AND 
	sno_thpersonalnomina.codemp = sno_thsalida.codemp AND 
	sno_thpersonalnomina.codnom = sno_thsalida.codnom AND 
	sno_thpersonalnomina.anocur = sno_thsalida.anocur AND 
	sno_thpersonalnomina.codperi = sno_thsalida.codperi AND 
	sno_thpersonalnomina.codper = sno_thsalida.codper AND 
	sno_thpersonalnomina.codemp = sno_ubicacionfisica.codemp AND 
	sno_thpersonalnomina.codubifis = sno_ubicacionfisica.codubifis AND 
	sno_thpersonalnomina.codemp = sno_personal.codemp AND 
	sno_thpersonalnomina.codper = sno_personal.codper AND 
	sno_thpersonalnomina.codemp = sno_thunidadadmin.codemp AND 
	sno_thpersonalnomina.codnom = sno_thunidadadmin.codnom AND 
	sno_thpersonalnomina.anocur = sno_thunidadadmin.anocur AND 
	sno_thpersonalnomina.codperi = sno_thunidadadmin.codperi AND 
	sno_thpersonalnomina.minorguniadm = sno_thunidadadmin.minorguniadm AND 
	sno_thpersonalnomina.ofiuniadm = sno_thunidadadmin.ofiuniadm AND 
	sno_thpersonalnomina.uniuniadm = sno_thunidadadmin.uniuniadm AND 
	sno_thpersonalnomina.depuniadm = sno_thunidadadmin.depuniadm AND 
	sno_thpersonalnomina.prouniadm = sno_thunidadadmin.prouniadm AND 
	sno_personal.codger = srh_gerencia.codger 
GROUP BY 
	sno_thpersonalnomina.codemp, 
	sno_thpersonalnomina.codnom, 
	sno_thpersonalnomina.anocur, 
	sno_thpersonalnomina.codperi, 
	sno_personal.codemp,
	sno_personal.codcom, 
	sno_personal.codran, 
	sno_personal.codper, 
	sno_personal.cedper, 
	sno_personal.nomper, 
	sno_personal.apeper, 
	sno_personal.rifper, 
	sno_personal.nacper,
	sno_personal.fecingper, 
	sno_personal.fecegrper, 
	sno_personal.fecleypen, 
	sno_thpersonalnomina.codcueban, 
	sno_thpersonalnomina.tipcuebanper, 
	sno_personal.fecingper,
	sno_thunidadadmin.desuniadm, 
	sno_thpersonalnomina.codasicar, 
	sno_thpersonalnomina.codcar, 
	sno_thpersonalnomina.codban, 
	sno_thunidadadmin.minorguniadm,
	sno_thunidadadmin.ofiuniadm, 
	sno_thunidadadmin.uniuniadm,
	sno_thunidadadmin.depuniadm, 
	sno_thunidadadmin.prouniadm, 
	sno_ubicacionfisica.codpai, 
	sno_ubicacionfisica.codest,
	sno_ubicacionfisica.codmun,
	sno_ubicacionfisica.codpar,
	sno_thpersonalnomina.codage,
	sno_personal.codorg,
	sno_thpersonalnomina.grado, 
	sno_thpersonalnomina.obsrecper, 
	srh_gerencia.denger 
ORDER BY 
	sno_personal.codper 