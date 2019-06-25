DELETE FROM sno_antiguedad_intereses_prestaciones;
INSERT INTO sno_antiguedad_intereses_prestaciones
SELECT
	sno_fideiperiodo.codemp,
	sno_fideiperiodo.codnom,
	sno_fideiperiodo.codper,
	sno_fideiperiodo.anocurper,
	sno_fideiperiodo.mescurper,
	0,
	sno_fideiperiodo.bonvacper+sno_fideiperiodo.bonfinper+sno_fideiperiodo.sueintper+sno_fideiperiodo.bonextper,
	sno_fideiperiodo.apoper,
	antiguedad_acumulada_anticipo.antiguedad,
	sno_fideiperiodo.diafid,
	sno_fideiperiodo.diaadi,
	antiguedad_acumulada_anticipo.tasainteres,
	antiguedad_acumulada_anticipo.montointeres,
	0,
	0
FROM 
	sno_fideiperiodo,
	(SELECT
		sno_fideiperiodointereses.codemp,
		sno_fideiperiodointereses.codnom,
		sno_fideiperiodointereses.codper,
		sno_fideiperiodointereses.anocurper,
		sno_fideiperiodointereses.mescurper,
		sno_fideiperiodointereses.porint AS tasainteres,
		sno_fideiperiodointereses.monint AS montointeres,
		sno_fideiperiodointereses.moncap AS antiguedad
		
	FROM
		sno_fideiperiodointereses) AS antiguedad_acumulada_anticipo 
WHERE
	sno_fideiperiodo.codemp=antiguedad_acumulada_anticipo.codemp AND
	sno_fideiperiodo.codnom=antiguedad_acumulada_anticipo.codnom AND
	sno_fideiperiodo.codper=antiguedad_acumulada_anticipo.codper AND
	sno_fideiperiodo.anocurper=antiguedad_acumulada_anticipo.anocurper AND
	sno_fideiperiodo.mescurper=antiguedad_acumulada_anticipo.mescurper;

UPDATE sno_antiguedad_intereses_prestaciones SET
anticipos_prestaciones=sno_anticipoprestaciones.monant
FROM
	sno_anticipoprestaciones
WHERE
	sno_antiguedad_intereses_prestaciones.codemp=sno_anticipoprestaciones.codemp AND
	sno_antiguedad_intereses_prestaciones.codper=sno_anticipoprestaciones.codper AND
	sno_antiguedad_intereses_prestaciones.anocurper=EXTRACT(YEAR  FROM(sno_anticipoprestaciones.fecant))::varchar AND
	sno_antiguedad_intereses_prestaciones.mescurper=EXTRACT(MONTH FROM(sno_anticipoprestaciones.fecant));

UPDATE sno_antiguedad_intereses_prestaciones SET
antiguedad_acumulada=antiguedad_acumulada_anticipo+monto_interes;


select * from sno_antiguedad_intereses_prestaciones where codper='0006880620' order by codper,anocurper,mescurper


