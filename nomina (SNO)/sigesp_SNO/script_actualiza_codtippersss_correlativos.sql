INSERT INTO  sno_tipopersonalsss VALUES('0001','0000016','PASANTES');

UPDATE sno_personal SET codtippersss='0000001';

DELETE FROM sno_tipopersonalsss WHERE codtippersss='-------';

UPDATE sno_personal SET numexpper='';

--Pasantes
UPDATE sno_personal SET 
codtippersss='0000016'
FROM 
	sno_personalnomina
WHERE
	sno_personal.codper=sno_personalnomina.codper AND 
	sno_personalnomina.codnom ='1000';

--Empleados Fijos
UPDATE sno_personal SET 
codtippersss='0000001'
FROM 
	sno_personalnomina
WHERE
	sno_personal.codper=sno_personalnomina.codper AND 
	sno_personalnomina.codnom BETWEEN '0000' AND '0004';

--Empleados Contratados
UPDATE sno_personal SET 
codtippersss='0000002'
FROM 
	sno_personalnomina
WHERE
	sno_personal.codper=sno_personalnomina.codper AND 
	sno_personalnomina.codnom='0005';

--Obrero Fijos
UPDATE sno_personal SET 
codtippersss='0000004'
FROM 
	sno_personalnomina
WHERE
	sno_personal.codper=sno_personalnomina.codper AND 
	sno_personalnomina.codnom BETWEEN '0006' AND '0009';

--Obrero Contratados
UPDATE sno_personal SET 
codtippersss='0000005'
FROM 
	sno_personalnomina
WHERE
	sno_personal.codper=sno_personalnomina.codper AND 
	sno_personalnomina.codnom='0010';

--Comision de Servicios
UPDATE sno_personal SET 
codtippersss='0000011'
FROM 
	sno_personalnomina
WHERE
	sno_personal.codper=sno_personalnomina.codper AND 
	sno_personalnomina.codnom='0011';

--Pensionados y Jubilados
UPDATE sno_personal SET 
codtippersss='0000014'
FROM 
	sno_personalnomina
WHERE
	sno_personal.codper=sno_personalnomina.codper AND 
	sno_personalnomina.codnom='0012';

SELECT * FROM actualiza_expediente();
SELECT * FROM actualiza_expediente_pasante();


/*
Los siguientes psos son:

1.-) Inhabilatar la entrada de datos Numero de Expediente en el formulario sigesp_srh_d_personal.php
2.-) Hacer la funcion y/o triger que permita llevar un correlativo automatico cada vez que se ingrese un trabajador
tomando en consideracion la nomenclatur de los pasates P1, P2, P3......Pn.
*/