DELETE FROM sno_definicion_salarial;
--INSERT INTO sno_definicion_salarial
SELECT
	sno_hpersonalnomina.codemp,
	sno_hpersonalnomina.codper,
	sno_hpersonalnomina.codnom,
	sno_hpersonalnomina.codperi,
	sno_hpersonalnomina.sueper,
	sno_sueldointegral.sueldoinegral,
	sno_sueldonormal.sueldonormal,
	sno_sueldoutilidad.sueldoutilidad
FROM
	sno_hpersonalnomina,
	--Salario Integral
	(SELECT  
		sno_hsalida.codper,
		sno_hsalida.codnom,
		sno_hsalida.codperi,
		SUM(sno_hsalida.valsal) AS sueldoinegral 
	FROM
		sno_hsalida,
		sno_hconcepto
	WHERE 
		sno_hsalida.codconc=sno_hconcepto.codconc AND
		sno_hsalida.codperi=sno_hconcepto.codperi AND
		sno_hsalida.codnom=sno_hconcepto.codnom AND
		sno_hconcepto.sueintcon=1 AND
		sno_hsalida.valsal>0
	GROUP BY 
		sno_hsalida.codper,
		sno_hsalida.codnom,
		sno_hsalida.codperi) AS sno_sueldointegral,
	--Salario Normal
	(SELECT  
		sno_hsalida.codper,
		sno_hsalida.codnom,
		sno_hsalida.codperi,
		SUM(sno_hsalida.valsal) AS sueldonormal 
	FROM
		sno_hsalida,
		sno_hconcepto
	WHERE 
		sno_hsalida.codconc=sno_hconcepto.codconc AND
		sno_hsalida.codperi=sno_hconcepto.codperi AND
		sno_hsalida.codnom=sno_hconcepto.codnom AND
		sno_hconcepto.persalnor='1' AND
		sno_hsalida.valsal>0
	GROUP BY 
		sno_hsalida.codper,
		sno_hsalida.codnom,
		sno_hsalida.codperi) AS sno_sueldonormal,
	--Salario Utilidad
	(SELECT  
		sno_hsalida.codper,
		sno_hsalida.codnom,
		sno_hsalida.codperi,
		SUM(sno_hsalida.valsal) AS sueldoutilidad 
	FROM
		sno_hsalida,
		sno_hconcepto
	WHERE 
		sno_hsalida.codconc=sno_hconcepto.codconc AND
		sno_hsalida.codperi=sno_hconcepto.codperi AND
		sno_hsalida.codnom=sno_hconcepto.codnom AND
		sno_hconcepto.aplisalnorutilidad='1' AND
		sno_hsalida.valsal>0
	GROUP BY 
		sno_hsalida.codper,
		sno_hsalida.codnom,
		sno_hsalida.codperi) AS sno_sueldoutilidad
WHERE
	sno_hpersonalnomina.codnom BETWEEN '0000' AND '0011' AND
	(sno_hpersonalnomina.staper='1' OR sno_hpersonalnomina.staper='2') AND
	
	sno_hpersonalnomina.codper=sno_sueldointegral.codper AND
	sno_hpersonalnomina.codnom=sno_sueldointegral.codnom AND
	sno_hpersonalnomina.codperi=sno_sueldointegral.codperi AND

	sno_hpersonalnomina.codper=sno_sueldonormal.codper AND
	sno_hpersonalnomina.codnom=sno_sueldonormal.codnom AND
	sno_hpersonalnomina.codperi=sno_sueldonormal.codperi AND

	sno_hpersonalnomina.codper=sno_sueldoutilidad.codper AND
	sno_hpersonalnomina.codnom=sno_sueldoutilidad.codnom AND
	sno_hpersonalnomina.codperi=sno_sueldoutilidad.codperi
ORDER BY
	sno_hpersonalnomina.codper;
