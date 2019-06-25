SELECT
	sno_hsalida.codper,
	sno_personal.apeper,
	sno_personal.nomper,
	sno_hsalida.codperi,
	sno_hsalida.codnom,
	sno_hsalida.anocur,
	sno_hperiodo.fecdesper,
	sno_hperiodo.fechasper,
	sno_hconstantepersonal.moncon,
	sno_hsalida.valsal
FROM
	sno_hsalida,
	sno_personal,
	sno_personalnomina,
	sno_hperiodo,
	sno_hconstantepersonal
WHERE
	sno_personalnomina.codper=sno_personal.codper AND
	sno_hsalida.codper=sno_personal.codper AND
	sno_hsalida.codnom=sno_personalnomina.codnom AND
	sno_hsalida.codnom IN('0000','0001','0002','0003','0004','0009') AND
	sno_hsalida.codnom=sno_hperiodo.codnom AND
	sno_hsalida.anocur=sno_hperiodo.anocur AND
	sno_hsalida.codperi=sno_hperiodo.codperi AND

	sno_hsalida.codper=sno_hconstantepersonal.codper AND
	sno_hsalida.codnom=sno_hconstantepersonal.codnom AND
	sno_hsalida.anocur=sno_hconstantepersonal.anocur AND
	sno_hsalida.codperi=sno_hconstantepersonal.codperi AND 
	sno_hsalida.codconc=sno_hconstantepersonal.codcons AND 
	
	sno_hsalida.tipsal='A' AND
	sno_hsalida.codperi='012' AND
	sno_hsalida.codconc='0000000005' AND
	sno_hsalida.valsal>0 
ORDER BY
	sno_hsalida.codper,
	sno_hsalida.codperi