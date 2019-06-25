SELECT 
	sno_personal.codper,
	sno_personal.nomper,
	sno_personal.apeper,
	sno_personal.rifper,
	sno_hconstantepersonal.moncon,
	sno_hsalida.valsal,
	sno_hsalida01.montoarc
	
FROM
	sno_personal,
	sno_personalnomina,
	--LA SALARIO PARA EL CALCULO DEL ISLR
	(select 
		sno_hsalida.codper,
		sno_hsalida.codnom,
		sno_hsalida.codperi,
		sno_hsalida.valsal as montoarc
	from 
		sno_hsalida
	where
		sno_hsalida.codperi='004' AND
		sno_hsalida.codconc='0000009992') sno_hsalida01,
	--LA CONSTANTE 4998 QUE ES EL % DE ISLR
	(select 
		sno_hconstantepersonal.codper,
		sno_hconstantepersonal.codnom,
		sno_hconstantepersonal.moncon
	from 
		sno_hconstantepersonal
	where
		sno_hconstantepersonal.codcons like '%004998' AND
		sno_hconstantepersonal.codperi='004') sno_hconstantepersonal,
	--EL CONCEPTO 5004 QUE ES EL MONTO DE ISLR
	(select 
		sno_hsalida.codper,
		sno_hsalida.codnom,
		sno_hsalida.valsal
	from 
		sno_hsalida
	where
		sno_hsalida.codconc like '%005004' AND
		sno_hsalida.codperi='004') sno_hsalida
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	((sno_personalnomina.codnom BETWEEN '0000' AND '0005') OR
	 sno_personalnomina.codnom ='0011') AND
	(sno_personalnomina.staper='1' or sno_personalnomina.staper='2') AND
	
	sno_personal.codper=sno_hconstantepersonal.codper AND
	sno_personalnomina.codnom=sno_hconstantepersonal.codnom AND
	
	sno_personal.codper=sno_hsalida.codper AND
	sno_personalnomina.codnom=sno_hsalida.codnom AND
	sno_personalnomina.codper=sno_hsalida.codper AND
	sno_hconstantepersonal.codnom=sno_hsalida.codnom AND

	sno_personal.codper=sno_hsalida01.codper AND
	sno_personalnomina.codnom=sno_hsalida01.codnom AND
	sno_personalnomina.codper=sno_hsalida01.codper AND
	sno_hconstantepersonal.codnom=sno_hsalida01.codnom
	