SELECT 
	sno_hsalida.codnom, 
	sno_hsalida.codconc,
	MAX(sno_hconcepto.nomcon) AS nomcon, 
	SUM(sno_hsalida.valsal) AS valsal 
FROM 
	sno_hsalida INNER JOIN sno_hconcepto ON sno_hsalida.codemp = sno_hconcepto.codemp AND 
	sno_hsalida.codnom = sno_hconcepto.codnom AND 
	sno_hsalida.anocur = sno_hconcepto.anocur AND 
	sno_hsalida.codperi = sno_hconcepto.codperi AND 
	sno_hsalida.codconc = sno_hconcepto.codconc 
	INNER JOIN sno_hperiodo ON sno_hsalida.codemp = sno_hperiodo.codemp AND 
	sno_hsalida.codnom = sno_hperiodo.codnom AND 
	sno_hsalida.anocur = sno_hperiodo.anocur AND 
	sno_hsalida.codperi = sno_hperiodo.codperi 
	INNER JOIN sno_hnomina ON sno_hsalida.codemp = sno_hnomina.codemp AND 
	sno_hsalida.codnom = sno_hnomina.codnom AND 
	sno_hsalida.anocur = sno_hnomina.anocurnom AND 
	sno_hsalida.codperi = sno_hnomina.peractnom 
WHERE 
	sno_hsalida.codemp='0001' AND 
	sno_hsalida.codper= '0001958270' AND 
	sno_hsalida.anocur = '2014' AND 
	substr(cast(sno_hperiodo.fecdesper as char(10)),6,2) = '07' AND 
	substr(cast(sno_hperiodo.fecdesper as char(10)),1,4) = '2014' AND 
	sno_hnomina.espnom = '0' AND 
	sno_hconcepto.sueintcon = 1 
GROUP BY 
	sno_hsalida.codnom,
	sno_hsalida.codconc 
ORDER BY 
	sno_hsalida.codnom,
	sno_hsalida.codconc 