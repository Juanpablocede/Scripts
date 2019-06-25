SELECT
	sno_personal.nacper,
	sno_personal.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper) AS Nombres,
	sno_personal.sexper,
	sno_personal.fecnacper,
	sno_personal.dirper,
	sno_personalnomina.codnom,
	sno_nomina.desnom,
	sno_conceptopersonal.aplcon AS "4005"
FROM 
	sno_personal,
	sno_personalnomina,
	sno_nomina,
	sno_conceptopersonal
WHERE 
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom=sno_conceptopersonal.codnom AND
	sno_personalnomina.codper=sno_conceptopersonal.codper AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND
	sno_personalnomina.staper IN('1','2') AND
	sno_conceptopersonal.codconc='0000004005' AND
	sno_conceptopersonal.aplcon=1
ORDER BY
	sno_personal.codper

--select * from sno_conceptopersonal where codper='0006880620' and codnom='0002' and codconc='0000004005'
--nacionalidad
--cedula
--primer apellido,
--segundo apellido
--primer nombre
--segundo nombre
--sexo
--fecha nacimiento
--profesion u oficio
--domicilio
--nombre de la entidad de trabajo
--estado
--ciudad

	

--select * from sno_conceptopersonal where codper='0006880620' and codnom='0002'