SELECT 
	sno_hsalida.codper,
	RTRIM(sno_personal.apeper)||'  '||RTRIM(sno_personal.nomper) as Trabajador,
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.codnom,
	sno_hsalida.codperi,
	sno_hsalida.valsal
FROM
	sno_hsalida,
	sno_personal,
	sno_hconcepto,
	sno_hpersonalnomina
WHERE
	sno_hsalida.codper=sno_personal.codper AND
	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND
	sno_hconcepto.aplarccon=1 AND
	sno_hsalida.valsal>0 AND 
	sno_hpersonalnomina.codnom=sno_hsalida.codnom AND
	sno_hpersonalnomina.codper=sno_personal.codper AND
	sno_hconcepto.codperi=sno_hpersonalnomina.codperi AND
	sno_hpersonalnomina.codperi BETWEEN '023' AND '024' AND
	(sno_hpersonalnomina.codnom BETWEEN '0000' AND '0000' OR  sno_hpersonalnomina.codnom='0011')
/*
	AND
	sno_hsalida.codper='0004216702'*/
ORDER BY
	sno_hsalida.codper,
	sno_hsalida.codnom,
	sno_hsalida.codperi