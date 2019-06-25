SELECT
	sno_hsalida.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS Nombres,
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.codnom,
	sno_hsalida.tipsal,
	COALESCE((SELECT 
		SUM(sno_hconstantepersonal.moncon)
	FROM 
		sno_hconstantepersonal
	WHERE
		sno_hconstantepersonal.codper=sno_hsalida.codper AND
		sno_hconstantepersonal.codnom=sno_hsalida.codnom AND
		sno_hconstantepersonal.codcons=sno_hsalida.codconc AND
		sno_hconstantepersonal.codperi BETWEEN '029' AND '030'),0),

	SUM(sno_hsalida.valsal)
FROM
	sno_personal,
	sno_personalnomina,
	sno_hconcepto,
	sno_hsalida
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.staper IN('1','2') AND

	sno_hsalida.codper=sno_personalnomina.codper AND
	sno_hsalida.codnom=sno_personalnomina.codnom AND

	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND

	/*sno_hconstantepersonal.codper=sno_personal.codper AND
	
	sno_hconstantepersonal.codper=sno_personalnomina.codper AND
	sno_hconstantepersonal.codnom=sno_personalnomina.codnom AND

	sno_hconstantepersonal.codper=sno_hsalida.codper AND
	sno_hconstantepersonal.codnom=sno_hsalida.codnom AND
	sno_hconstantepersonal.codcons=sno_hsalida.codconc AND
	sno_hconstantepersonal.codperi=sno_hsalida.codperi AND

	sno_hconstantepersonal.codnom=sno_hconcepto.codnom AND
	sno_hconstantepersonal.codcons=sno_hconcepto.codconc AND
	sno_hconstantepersonal.codperi=sno_hconcepto.codperi AND*/

	
	sno_hsalida.valsal <>0 AND
	sno_hsalida.codnom IN('9002') AND --,'9001','9002','9003','9004','9005') AND
	sno_hsalida.codperi BETWEEN '029' AND '030' AND
	sno_hsalida.tipsal <>'R' --AND
	--sno_hsalida.codper='0006880620'
GROUP BY
	sno_hsalida.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper),
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.codnom,
	sno_hsalida.tipsal
ORDER BY
	sno_hsalida.codper,
	sno_hsalida.codconc