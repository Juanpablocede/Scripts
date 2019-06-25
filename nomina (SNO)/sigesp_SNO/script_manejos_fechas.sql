--determina el nombre del dia actual
select trim(case when to_char(current_date,'d') = '1' then 'DOMINGO'
when to_char(current_date,'d') = '2' then 'LUNES'
when to_char(current_date,'d') = '3' then 'MARTES'
when to_char(current_date,'d') = '4' then 'MIERCOLES'
when to_char(current_date,'d') = '5' then 'JUEVES'
when to_char(current_date,'d') = '6' then 'VIERNES'
when to_char(current_date,'d') = '7' then 'SABADO'
end)


--muestra el numero de dias consecutivos entre fechas
select i::date,to_char(i,'d') from generate_series('2017-06-01', 
  '2017-07-31', '1 day'::interval) i

--muestra el numero de domingos que hay entre dos fechas
SELECT 
	count(*) from generate_series('2018-11-01', 
  '2018-12-25', '1 day'::interval)  i
WHERE to_char(i,'d') = '1'


SELECT 
	codper,count(*) from sno_vacacpersonal,generate_series(sno_vacacpersonal.fecdisvac,sno_vacacpersonal.fecreivac, '1 day'::interval)  i
WHERE 
	to_char(i,'d') = '1'  group by codper
	

--calcula el año, mes y dia transcurrido entre dos fechas
SELECT age('1963-03-28','2018-08-03');
SELECT age('1963-03-28','2018-08-03')*-1

SELECT age('1963-03-28','2018-08-03');


SELECT
	sno_vacacpersonal.codper,
	dias_vacacion.codper,
	dias_vacacion.dias
FROM
	sno_vacacpersonal,
	(SELECT 
		codper,count(*) as dias 
	FROM sno_vacacpersonal as vacacion,generate_series(fecdisvac,fecreivac, '1 day'::interval) i
	WHERE 
		to_char(i,'d') = '1'
	GROUP BY
		codper) as dias_vacacion
WHERE
	sno_vacacpersonal.codper=dias_vacacion.codper


-------------
UPDATE sno_vacacpersonal SET
diapenvac=(
SELECT
	dias_vacacion.dias
FROM
	sno_vacacpersonal,
	(SELECT 
		count(*) as dias 
	FROM sno_vacacpersonal as vacacion,generate_series(fecdisvac,fecreivac, '1 day'::interval) i
	WHERE 
		to_char(i,'d') = '1' )
	GROUP BY
		codper) as dias_vacacion)
WHERE
	sno_vacacpersonal.codper=dias_vacacion.codper)




update sno_vacacpersonal set diapenvac=0 



select * from sno_vacacpersonal where codper='0006880620'
delete from sno_salida where codconc='0000000400'

select * from sno_salida where codconc='0000000400' order by codconc

INSERT INTO sno_salida
SELECT 
	sno_vacacpersonal.codper,
	(sno_vacacpersonal.sueintbonvac/30*sno_vacacpersonal.diabonvac)
FROM
	sno_vacacpersonal
WHERE
	
	sno_vacacpersonal.persalvac='014' 




SELECT
	sno_vacacpersonal.codper,
	sno_personalnomina.sueper,
	sueldo_hsalida.sueldohsalida,
	sueldo_salida.sueldosalida
FROM
	sno_vacacpersonal,
	sno_personalnomina,
	(SELECT 
		codper,
		COALESCE(sum(valsal),0.00) as sueldohsalida
	FROM 
		sno_hsalida
	WHERE 
		sno_hsalida.codper=codper AND
		sno_hsalida.codemp='0001' AND 
		sno_hsalida.codnom='0001' AND 
		(sno_hsalida.tipsal='A' OR sno_hsalida.tipsal='D' OR sno_hsalida.tipsal='P1') AND 
		sno_hsalida.codperi BETWEEN '013' AND '013' AND 
		sno_hsalida.codconc IN 
		(SELECT 
			codconc
		FROM 
			sno_concepto
		WHERE 
			codemp='0001' AND 
			codnom='0001' AND sueintvaccon=1)
	GROUP BY
		codper) AS sueldo_hsalida,
	(SELECT 
		codper,
		COALESCE(sum(valsal),0.00) as sueldosalida
	FROM 
		sno_salida
	WHERE 
		sno_salida.codper=codper AND
		sno_salida.codemp='0001' AND 
		sno_salida.codnom='0001' AND 
		(sno_salida.tipsal='A' OR sno_salida.tipsal='D' OR sno_salida.tipsal='P1') AND 
		sno_salida.codperi BETWEEN '014' AND '014' AND 
		sno_salida.codconc IN 
		(SELECT 
			codconc
		FROM 
			sno_concepto
		WHERE 
			codemp='0001' AND 
			codnom='0001' AND sueintvaccon=1)
	GROUP BY
		codper) AS sueldo_salida
WHERE
	sno_vacacpersonal.codper=sueldo_hsalida.codper AND
	sno_vacacpersonal.codper=sueldo_salida.codper AND
	sno_vacacpersonal.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom='0001'
	



