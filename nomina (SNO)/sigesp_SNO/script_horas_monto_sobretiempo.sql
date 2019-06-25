SELECT 
	sno_hsalida.codper,
	rtrim(sno_personal.nomper)||'  '||rtrim(sno_personal.apeper) AS nombres,
	sno_hsalida.codnom,
	sno_hsalida.codperi,
	sno_hsalida.codconc,
	sno_hpersonalnomina.minorguniadm,
	sno_hpersonalnomina.ofiuniadm,
	sno_hpersonalnomina.uniuniadm,
	sno_hpersonalnomina.depuniadm,
	sno_hpersonalnomina.prouniadm,
	sno_unidadadmin.desuniadm,
	
	sno_hconstantepersonal.moncon,
	sno_hsalida.valsal
FROM
	sno_personal,
	sno_hsalida,
	sno_hconstantepersonal,
	sno_hpersonalnomina,
	sno_unidadadmin
WHERE
	sno_hsalida.codper=sno_personal.codper AND
	sno_hsalida.codemp=sno_hconstantepersonal.codemp AND
	sno_hsalida.codper=sno_hconstantepersonal.codper AND
	sno_hsalida.codnom=sno_hconstantepersonal.codnom AND
	sno_hsalida.codperi=sno_hconstantepersonal.codperi AND
	sno_hsalida.codconc=sno_hconstantepersonal.codcons AND

	sno_hsalida.codemp=sno_hpersonalnomina.codemp AND
	sno_hsalida.codper=sno_hpersonalnomina.codper AND
	sno_hsalida.codnom=sno_hpersonalnomina.codnom AND
	sno_hsalida.codperi=sno_hpersonalnomina.codperi AND

	sno_hsalida.codemp=sno_unidadadmin.codemp AND

	sno_hpersonalnomina.codemp=sno_unidadadmin.codemp AND
	sno_hpersonalnomina.minorguniadm=sno_unidadadmin.minorguniadm AND
	sno_hpersonalnomina.ofiuniadm=sno_unidadadmin.ofiuniadm AND
	sno_hpersonalnomina.uniuniadm=sno_unidadadmin.uniuniadm AND
	sno_hpersonalnomina.depuniadm=sno_unidadadmin.depuniadm AND
	sno_hpersonalnomina.prouniadm=sno_unidadadmin.prouniadm AND

	sno_hsalida.valsal>0 AND

	sno_hsalida.codconc='0000000013' AND
	((sno_hsalida.codperi BETWEEN '027' AND '028') OR
	sno_hsalida.codperi BETWEEN '058' AND '061')


	
	
