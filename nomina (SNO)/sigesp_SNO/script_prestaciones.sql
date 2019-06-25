  SELECT 
	sno_hpersonalnomina01.codper, 
	sno_hpersonalnomina01.codnom, 
	MAX(sno_hpersonalnomina01.codded) AS codded, 
	MAX(sno_hpersonalnomina01.codtipper) AS codtipper, 
	sno_personal.fecingper, 
	MAX(sno_hpersonalnomina01.codtabvac) AS codtabvac, 
	SUM(sno_hpersonalnomina01.sueintper) AS sueintper, 
	SUM(sno_hpersonalnomina01.sueper) AS sueper, 
	SUM(sno_hpersonalnomina01.salnorutilper) AS salnorutilper, 
	(SELECT 
		SUM(sno_hsalida.valsal) 
	FROM 
		sno_hsalida, 
		sno_hconcepto, 
		sno_hpersonalnomina AS sno_hpersonalnomina02, 
		sno_hperiodo 
	WHERE 
		sno_hsalida.codper=sno_hpersonalnomina01.codper AND 
		sno_hsalida.codnom='0005' AND 
		(sno_hsalida.tipsal='A' OR sno_hsalida.tipsal='R' OR sno_hsalida.tipsal='P1') AND 
		sno_hsalida.codemp = sno_hconcepto.codemp AND 
		sno_hsalida.codnom = sno_hconcepto.codnom AND 
		sno_hsalida.anocur = sno_hconcepto.anocur AND 
		sno_hsalida.codperi = sno_hconcepto.codperi AND 
		sno_hsalida.codconc = sno_hconcepto.codconc AND 
		sno_hconcepto.asifidper ='1' AND 
		sno_hsalida.codemp = sno_hpersonalnomina02.codemp AND 
		sno_hsalida.codnom = sno_hpersonalnomina02.codnom AND 
		sno_hsalida.anocur = sno_hpersonalnomina02.anocur AND 
		sno_hsalida.codperi = sno_hpersonalnomina02.codperi AND 
		sno_hsalida.codper = sno_hpersonalnomina02.codper AND 
		substr(cast(sno_hperiodo.fecdesper as char(10)),6,2) = '07' AND 
		substr(cast(sno_hperiodo.fecdesper as char(10)),1,4)= '2013' AND 
		sno_hsalida.codnom=sno_hperiodo.codnom AND 
		sno_hsalida.codperi=sno_hperiodo.codperi AND
		--sno_hsalida.codperi='007' AND 
		sno_hsalida.anocur=sno_hperiodo.anocur) AS asifidper, 
	(SELECT 
		SUM(sno_hsalida.valsal) 
	FROM 
		sno_hsalida, 
		sno_hconcepto, 
		sno_hpersonalnomina AS sno_hpersonalnomina03, 
		sno_hperiodo 
	WHERE 
		sno_hsalida.codper=sno_hpersonalnomina01.codper AND 
		sno_hsalida.codnom='0005' AND 
		(sno_hsalida.tipsal='A' OR sno_hsalida.tipsal='R' OR sno_hsalida.tipsal='P1') AND 
		sno_hsalida.codemp = sno_hconcepto.codemp AND 
		sno_hsalida.codnom = sno_hconcepto.codnom AND 
		sno_hsalida.anocur = sno_hconcepto.anocur AND 
		sno_hsalida.codperi = sno_hconcepto.codperi AND 
		sno_hsalida.codconc = sno_hconcepto.codconc AND 
		sno_hconcepto.asifidpat ='1' AND 
		sno_hsalida.codemp = sno_hpersonalnomina03.codemp AND 
		sno_hsalida.codnom = sno_hpersonalnomina03.codnom AND 
		sno_hsalida.anocur = sno_hpersonalnomina03.anocur AND 
		sno_hsalida.codperi = sno_hpersonalnomina03.codperi AND 
		sno_hsalida.codper = sno_hpersonalnomina03.codper AND 
		substr(cast(sno_hperiodo.fecdesper as char(10)),6,2) = '07' AND 
		substr(cast(sno_hperiodo.fecdesper as char(10)),1,4)= '2013' AND 
		sno_hsalida.codnom=sno_hperiodo.codnom AND 
		sno_hsalida.codperi='007' AND 
		sno_hsalida.anocur=sno_hperiodo.anocur) AS asifidpat, 
	(SELECT 
		sno_fideicomiso.capantcom 
	FROM 
		sno_fideicomiso 
	WHERE 
		sno_fideicomiso.codper = sno_hpersonalnomina01.codper 
	GROUP BY 
		sno_fideicomiso.capantcom) AS capantcom, 
	(SELECT 
		MAX(sno_hpersonalnomina04.sueintper) 
	FROM 
		sno_hpersonalnomina AS sno_hpersonalnomina04, 
		sno_hperiodo 
	WHERE 
		sno_hpersonalnomina04.codper=sno_hpersonalnomina01.codper AND 
		sno_hpersonalnomina04.codnom='5000' AND 
		sno_hpersonalnomina04.codemp =sno_hperiodo.codemp AND 
		sno_hpersonalnomina04.codnom =sno_hperiodo.codnom AND 
		sno_hpersonalnomina04.anocur =sno_hperiodo.anocur AND 
		sno_hpersonalnomina04.codperi=sno_hperiodo.codperi AND 
		substr(cast(sno_hperiodo.fecdesper as char(10)),6,2) = '07' AND 
		substr(cast(sno_hperiodo.fecdesper as char(10)),1,4)= '2013') AS vacaciones 
FROM 
	sno_hpersonalnomina AS sno_hpersonalnomina01, 
	sno_hperiodo, 
	sno_personal, 
	sno_hnomina 
WHERE
	sno_hpersonalnomina01.codnom='0005' AND 
	sno_hpersonalnomina01.anocur = '2013' AND 
	(sno_hpersonalnomina01.staper='1' OR sno_hpersonalnomina01.staper='2') AND 
	sno_hpersonalnomina01.codemp =sno_hperiodo.codemp AND 
	sno_hpersonalnomina01.codnom =sno_hperiodo.codnom AND 
	sno_hpersonalnomina01.anocur =sno_hperiodo.anocur AND 
	sno_hpersonalnomina01.codperi=sno_hperiodo.codperi AND 
	substr(cast(sno_hperiodo.fecdesper as char(10)),6,2) = '07' AND 
	substr(cast(sno_hperiodo.fecdesper as char(10)),1,4)= '2013' AND 
	sno_hpersonalnomina01.codper=sno_personal.codper AND 
	sno_personal.estper='1' AND (sno_hnomina.espnom = '0' OR sno_hnomina.espnom = '1') AND 
	sno_hpersonalnomina01.codemp = sno_hnomina.codemp AND 
	sno_hpersonalnomina01.codnom = sno_hnomina.codnom AND 
	sno_hpersonalnomina01.anocur = sno_hnomina.anocurnom AND 
	sno_hpersonalnomina01.codperi = sno_hnomina.peractnom AND
	sno_hpersonalnomina01.codper='0004105112'
GROUP BY 
	sno_hpersonalnomina01.codper, 
	sno_hpersonalnomina01.codnom, 
	sno_personal.fecingper 
ORDER BY 
	sno_hpersonalnomina01.codper 