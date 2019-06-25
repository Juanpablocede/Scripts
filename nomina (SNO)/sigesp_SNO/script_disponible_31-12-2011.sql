DELETE FROM sno_fideiperiodointereses
DELETE FROM sno_fideiperiodo
DELETE FROM sno_fideicomiso
INSERT INTO sno_fideicomiso
SELECT
	sno_deudaanterior.codemp,
	sno_deudaanterior.codper,
	'"',
	'0000000000',
	'0000000000',
	'0',
	'2011-12-31',
	'S',
	0,
	'1900-01-01',
	' ',
	0,
	'"',
	'"',
	0
FROM
	sno_deudaanterior



INSERT INTO sno_fideiperiodo
SELECT 
	sno_deudaanterior.codemp,
	sno_personalnomina.codnom,
	sno_deudaanterior.codper,
	'2011','12',0,0,0,0,0,0,0	
FROM 
	sno_deudaanterior,
	sno_personal,
	sno_personalnomina
WHERE 
	sno_deudaanterior.codper=sno_personal.codper AND
	sno_deudaanterior.codper=sno_personalnomina.codper AND
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personal.estper='1' AND
	sno_personalnomina.staper IN('1','2','4') AND
	sno_personalnomina.codnom BETWEEN '0001' AND '0009'
ORDER BY 
	sno_deudaanterior.codper


INSERT INTO sno_fideiperiodointereses
SELECT 
	sno_deudaanterior.codemp,
	sno_personalnomina.codnom,
	sno_deudaanterior.codper,
	'2011','12',0,0,0,0, monpreant-monant
	
FROM 
	sno_deudaanterior,
	sno_personal,
	sno_personalnomina
WHERE 
	sno_deudaanterior.codper=sno_personal.codper AND
	sno_deudaanterior.codper=sno_personalnomina.codper AND
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personal.estper='1' AND
	sno_personalnomina.staper IN('1','2','4') AND
	sno_personalnomina.codnom BETWEEN '0001' AND '0009'
ORDER BY 
	sno_deudaanterior.codper

