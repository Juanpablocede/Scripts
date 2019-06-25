SELECT 
	sno_hsalida.codper,
	RTRIM(sno_personal.apeper)||'  '||RTRIM(sno_personal.nomper),
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.codnom,
	sno_hsalida.codperi,
	sno_hsalida.valsal
FROM
	sno_hsalida,
	sno_personal,
	sno_hconcepto
WHERE
	sno_hsalida.codper=sno_personal.codper AND
	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND
	sno_hconcepto.aplarccon=1 AND
	sno_hsalida.valsal>0 --AND
	--sno_hsalida.codper='0006880620'
ORDER BY
	sno_hsalida.codper,
	sno_hsalida.codnom,
	sno_hsalida.codperi