SELECT DISTINCT 
	sno_personal.codper, 
	MAX(sno_personal.cedper) as cedper, 
	max(sno_personal.nomper) as nomper, 
	MAX(sno_personal.apeper) as apeper, 
	MAX(sno_personal.nacper) as nacper, 
	MAX(sno_hpersonalnomina.codcueban) AS codcueban, 
	MAX(sno_hpersonalnomina.tipcuebanper) as tipcuebanper, 
	MAX(sno_personal.fecleypen) AS fecleypen, 
	MAX(sno_personal.fecingper) as fecingper, 
	MAX(sno_personal.fecegrper) as fecegrper, 
	MAX(sno_personal.rifper) as rifper, 
	sum(sno_hsalida.valsal) as total, 
	MAX(sno_personal.coreleper) AS coreleper, 
	MAX(sno_hunidadadmin.desuniadm) as desuniadm, 
	MAX(sno_hpersonalnomina.fecingper) AS fecingnom, 
	MAX(sno_hpersonalnomina.fecculcontr) AS fecculcontr, 
	MAX(sno_hunidadadmin.minorguniadm) as minorguniadm, 
	MAX(sno_hunidadadmin.ofiuniadm) AS ofiuniadm, 
	MAX(sno_hunidadadmin.uniuniadm) AS uniuniadm, 
	MAX(sno_hunidadadmin.depuniadm) as depuniadm, 
	MAX(sno_hunidadadmin.prouniadm) AS prouniadm, 
	MAX(sno_hpersonalnomina.sueper) AS sueper, 
	MAX(sno_hpersonalnomina.pagbanper) AS pagbanper, 
	MAX(sno_hpersonalnomina.pagefeper) AS pagefeper, 
	MAX(sno_ubicacionfisica.desubifis) AS desubifis, 
	MAX(sno_hnomina.desnom) AS desnom, 
	MAX(sno_hnomina.racnom) AS racnom, 
	sno_personal.codorg, 
	MAX(sno_hnomina.adenom) AS adenom, 
	MAX(sno_hpersonalnomina.sueintper) AS sueintper, 
	MAX(sno_hpersonalnomina.codcar) AS codcar, 
	MAX(sno_hpersonalnomina.codasicar) AS codasicar, 
	MAX((	SELECT 
			desest 
		FROM 
			sigesp_estados 
		WHERE 
			sigesp_estados.codpai = sno_ubicacionfisica.codpai AND 
			sigesp_estados.codest = sno_ubicacionfisica.codest)) AS desest, 
	MAX((	SELECT 
			tipnom 
		FROM 
			sno_hnomina 
		WHERE 
			sno_hpersonalnomina.codnom = sno_hnomina.codnom AND 
			sno_hpersonalnomina.codemp = sno_hnomina.codemp AND 
			sno_hpersonalnomina.anocur=sno_hnomina.anocurnom AND 
			sno_hpersonalnomina.codperi=sno_hnomina.peractnom)) AS tiponom, 
	MAX((	SELECT 
			suemin 
		FROM 
			sno_hclasificacionobrero 
		WHERE 
			sno_hclasificacionobrero.codnom = sno_hpersonalnomina.codnom AND 
			sno_hclasificacionobrero.grado = sno_hpersonalnomina.grado AND 
			sno_hclasificacionobrero.codemp = sno_hpersonalnomina.codemp AND 
			sno_hclasificacionobrero.codperi = sno_hpersonalnomina.codperi AND 
			sno_hclasificacionobrero.anocur = sno_hpersonalnomina.anocur)) AS sueobr, 
	MAX((	SELECT 
			denmun 
		FROM 
			sigesp_municipio 
		WHERE 
			sigesp_municipio.codpai = sno_ubicacionfisica.codpai AND 
			sigesp_municipio.codest = sno_ubicacionfisica.codest AND 
			sigesp_municipio.codmun = sno_ubicacionfisica.codmun)) AS denmun, 
	MAX((	SELECT 
			denpar 
		FROM 
			sigesp_parroquia 
		WHERE 
			sigesp_parroquia.codpai = sno_ubicacionfisica.codpai AND 
			sigesp_parroquia.codest = sno_ubicacionfisica.codest AND 
			sigesp_parroquia.codmun = sno_ubicacionfisica.codmun AND 
			sigesp_parroquia.codpar = sno_ubicacionfisica.codpar)) AS denpar, 
	MAX((	SELECT 
			nomban 
		FROM 
			scb_banco 
		WHERE 
			scb_banco.codemp = sno_hpersonalnomina.codemp AND 
			scb_banco.codban = sno_hpersonalnomina.codban)) AS banco,
	MAX((	SELECT 
			MAX(nomage) 
		FROM 
			scb_agencias 
		WHERE 
			scb_agencias.codemp = sno_hpersonalnomina.codemp AND 
			scb_agencias.codban = sno_hpersonalnomina.codban AND 
			scb_agencias.codage = sno_hpersonalnomina.codage)) AS agencia, 
	MAX((	SELECT 
			MAX(denasicar) 
		FROM 
			sno_hasignacioncargo 
		WHERE 
			sno_hpersonalnomina.codemp = sno_hasignacioncargo.codemp AND 
			sno_hpersonalnomina.codnom = sno_hasignacioncargo.codnom AND 
			sno_hpersonalnomina.anocur = sno_hasignacioncargo.anocur AND 
			sno_hpersonalnomina.codasicar = sno_hasignacioncargo.codasicar)) as denasicar, 
	MAX((	SELECT 
			MAX(descar) 
		FROM
			sno_hcargo 
		WHERE 
			sno_hpersonalnomina.codemp = sno_hcargo.codemp AND 
			sno_hpersonalnomina.codnom = sno_hcargo.codnom AND 
			sno_hpersonalnomina.anocur = sno_hcargo.anocur AND 
			sno_hpersonalnomina.codcar = sno_hcargo.codcar AND 
			sno_hpersonalnomina.codperi = sno_hcargo.codperi)) as descar, 
	sno_hnomina.codnom, 
	MAX((	SELECT 
			sno_categoria_rango.descat
		FROM 
			sno_rango, 
			sno_categoria_rango 
		WHERE 
			sno_rango.codemp=sno_personal.codemp AND 
			sno_rango.codcom=sno_personal.codcom AND 
			sno_rango.codran=sno_personal.codran AND 
			sno_categoria_rango.codcat=sno_rango.codcat)) AS descat 
FROM 
	sno_personal, 
	sno_hpersonalnomina, 
	sno_hsalida, 
	sno_hunidadadmin, 
	sno_ubicacionfisica, 
	sno_hnomina, 
	sno_hperiodo 
WHERE 
	sno_hsalida.codemp='0001' AND 
	(sno_hsalida.tipsal<>'P2' AND sno_hsalida.tipsal<>'V4' AND sno_hsalida.tipsal<>'W4' ) AND 
	sno_hperiodo.fecdesper>='2014-09-16' AND sno_hperiodo.fechasper<='2014-09-30'AND 
	sno_hpersonalnomina.codnom='0001'AND 
	sno_hpersonalnomina.codper>='0006880620' AND 
	sno_hpersonalnomina.codper<='0006880620' AND 
	sno_hsalida.valsal<>0 AND 
	(sno_hsalida.tipsal='A' OR sno_hsalida.tipsal='V1' OR sno_hsalida.tipsal='W1' OR 
	sno_hsalida.tipsal='D' OR sno_hsalida.tipsal='V2' OR sno_hsalida.tipsal='W2' OR 
	sno_hsalida.tipsal='P1' OR sno_hsalida.tipsal='V3' OR sno_hsalida.tipsal='W3') AND 
	sno_hpersonalnomina.codemp = sno_hnomina.codemp AND 
	sno_hpersonalnomina.codnom = sno_hnomina.codnom AND 
	sno_hpersonalnomina.anocur = sno_hnomina.anocurnom AND 
	sno_hpersonalnomina.codperi = sno_hnomina.peractnom AND 
	sno_hnomina.codemp = sno_hperiodo.codemp AND 
	sno_hnomina.codnom = sno_hperiodo.codnom AND 
	sno_hnomina.anocurnom = sno_hperiodo.anocur AND 
	sno_hnomina.peractnom = sno_hperiodo.codperi AND 
	sno_hpersonalnomina.codemp = sno_personal.codemp AND 
	sno_hpersonalnomina.codper = sno_personal.codper AND 
	sno_hpersonalnomina.codemp = sno_ubicacionfisica.codemp AND 
	sno_hpersonalnomina.codubifis = sno_ubicacionfisica.codubifis AND 
	sno_hpersonalnomina.codemp = sno_hsalida.codemp AND 
	sno_hpersonalnomina.codnom = sno_hsalida.codnom AND 
	sno_hpersonalnomina.anocur = sno_hsalida.anocur AND 
	sno_hpersonalnomina.codperi = sno_hsalida.codperi AND 
	sno_hpersonalnomina.codper = sno_hsalida.codper AND 
	sno_hpersonalnomina.codemp = sno_hunidadadmin.codemp AND 
	sno_hpersonalnomina.anocur = sno_hunidadadmin.anocur AND 
	sno_hpersonalnomina.codperi = sno_hunidadadmin.codperi AND 
	sno_hpersonalnomina.minorguniadm = sno_hunidadadmin.minorguniadm AND 
	sno_hpersonalnomina.ofiuniadm = sno_hunidadadmin.ofiuniadm AND 
	sno_hpersonalnomina.uniuniadm = sno_hunidadadmin.uniuniadm AND 
	sno_hpersonalnomina.depuniadm = sno_hunidadadmin.depuniadm AND 
	sno_hpersonalnomina.prouniadm = sno_hunidadadmin.prouniadm 
GROUP BY 
	sno_hpersonalnomina.codemp, 
	sno_hpersonalnomina.codnom, 
	sno_hnomina.codnom, 
	sno_personal.codper, 
	sno_hpersonalnomina.codcar, 
	sno_hpersonalnomina.codasicar, 
	sno_hpersonalnomina.anocur,
	sno_hpersonalnomina.codban, 
	sno_personal.codorg 
ORDER BY 
	sno_personal.codper 
