SELECT
	sno_hconcepto.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.valsal
FROM
	sno_hconcepto,
	sno_hconceptopersonal,
	sno_hsalida
WHERE
	sno_hconcepto.codconc=sno_hconceptopersonal.codconc AND
	sno_hconcepto.codnom=sno_hconceptopersonal.codnom AND
	sno_hconcepto.codperi=sno_hconceptopersonal.codperi AND
	sno_hconcepto.sueintcon=1 AND
	sno_hconceptopersonal.codper=sno_hsalida.codper AND
	sno_hconceptopersonal.codnom=sno_hsalida.codnom AND
	sno_hconceptopersonal.codconc=sno_hsalida.codconc AND
	sno_hconceptopersonal.codperi=sno_hsalida.codperi AND
	sno_hsalida.valsal>0 AND
	sno_hconcepto.codnom='0001' AND
	sno_hconceptopersonal.codper='0006880620' AND
	sno_hsalida.codperi='005'

	
ORDER BY
	sno_hconcepto.codconc
