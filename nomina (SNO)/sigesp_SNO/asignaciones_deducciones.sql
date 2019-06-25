SELECT
	sno_hsalida.codper,
	rtrim(sno_personal.nomper)||'  '||rtrim(sno_personal.apeper) AS nombres,
	sno_hpersonalnomina.sueper,
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.tipsal,
	sno_hsalida.valsal,
	sno_hsalida.codnom,
	sno_hnomina.desnom,
	sno_hsalida.codperi,
    	sno_hperiodo.fecdesper,
	sno_hperiodo.fechasper,
	sno_hpersonalnomina.depuniadm||sno_hpersonalnomina.prouniadm AS gerencia,
	sno_unidadadmin.desuniadm
	
FROM
	sno_hsalida,
	sno_hconcepto,
	sno_personal,
	sno_hperiodo,
	sno_unidadadmin,
	sno_hpersonalnomina,
	sno_hconstantepersonal,
	sno_hnomina
WHERE

	sno_personal.codper=sno_hpersonalnomina.codper AND
	sno_hpersonalnomina.staper IN('1','2') AND

	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.anocur=sno_hconcepto.anocur AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND

	sno_hsalida.codper=sno_personal.codper AND

	sno_hsalida.tipsal<>'R' AND 
	--sno_hconcepto.sigcon IN('A','P') AND
	sno_hsalida.valsal<>0 AND

	sno_hsalida.codnom=sno_hperiodo.codnom AND
	sno_hsalida.anocur=sno_hperiodo.anocur AND
	sno_hsalida.codperi=sno_hperiodo.codperi AND

	sno_hpersonalnomina.codemp=sno_hsalida.codemp AND
	sno_hpersonalnomina.codper=sno_hsalida.codper AND
	sno_hpersonalnomina.codnom=sno_hsalida.codnom AND
	sno_hpersonalnomina.codperi=sno_hsalida.codperi AND
	
	sno_hpersonalnomina.depuniadm=sno_unidadadmin.depuniadm AND
	sno_hpersonalnomina.prouniadm=sno_unidadadmin.prouniadm AND

	sno_hconstantepersonal.codper=sno_personal.codper AND
	
	sno_hconstantepersonal.codper=sno_hpersonalnomina.codper AND
	sno_hconstantepersonal.codnom=sno_hpersonalnomina.codnom AND

	sno_hconstantepersonal.codper=sno_hsalida.codper AND
	sno_hconstantepersonal.codnom=sno_hsalida.codnom AND
	sno_hconstantepersonal.codcons=sno_hsalida.codconc AND
	sno_hconstantepersonal.codperi=sno_hsalida.codperi AND

	sno_hconstantepersonal.codnom=sno_hconcepto.codnom AND
	sno_hconstantepersonal.codcons=sno_hconcepto.codconc AND
	sno_hconstantepersonal.codperi=sno_hconcepto.codperi AND

	sno_hsalida.codnom=sno_hnomina.codnom AND
	sno_hsalida.codperi=sno_hnomina.peractnom AND

	sno_hsalida.codnom BETWEEN '0000' AND '0012' AND
	
	sno_hsalida.codper='0006880620'
ORDER BY
	sno_hsalida.codperi