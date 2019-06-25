SELECT
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
    	sno_hperiodo.fecdesper,
	sno_hperiodo.fechasper,
	sno_hpersonalnomina.depuniadm||sno_hpersonalnomina.prouniadm,
	sno_unidadadmin.desuniadm,
	SUM(sno_hsalida.valsal) AS Monto
FROM
	sno_hsalida,
	sno_hconcepto,
	sno_personal,
	sno_hperiodo,
	sno_unidadadmin,
	sno_hpersonalnomina
WHERE

	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.anocur=sno_hconcepto.anocur AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND

	sno_hsalida.codper=sno_personal.codper AND

	sno_hsalida.tipsal IN('A','P1','P2') AND 
	sno_hconcepto.sigcon IN('A','P') AND
	sno_hsalida.valsal<>0 AND
	sno_hsalida.codperi BETWEEN '025' AND '025' AND
	(sno_hsalida.codnom BETWEEN '9000' AND '9005' OR
	sno_hsalida.codnom BETWEEN '0005' AND '0008') AND
	sno_hsalida.codnom=sno_hperiodo.codnom AND
	sno_hsalida.anocur=sno_hperiodo.anocur AND
	sno_hsalida.codperi=sno_hperiodo.codperi AND

	sno_hpersonalnomina.codemp=sno_hsalida.codemp AND
	sno_hpersonalnomina.codper=sno_hsalida.codper AND
	sno_hpersonalnomina.codnom=sno_hsalida.codnom AND
	sno_hpersonalnomina.codperi=sno_hsalida.codperi AND
	
	sno_hpersonalnomina.depuniadm=sno_unidadadmin.depuniadm AND
	sno_hpersonalnomina.prouniadm=sno_unidadadmin.prouniadm AND
	sno_hpersonalnomina.depuniadm IN('31','45')
	
GROUP BY
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
    	sno_hperiodo.fecdesper,
	sno_hperiodo.fechasper,
	sno_hpersonalnomina.depuniadm||sno_hpersonalnomina.prouniadm,
	sno_unidadadmin.desuniadm
ORDER BY
	sno_hpersonalnomina.depuniadm||sno_hpersonalnomina.prouniadm
    