SELECT 
	sno_personal.codper,
	sno_personal.nacper||'-'||to_char(sno_personal.cedper::numeric, '99G999G999'),
	to_char(sno_personal.codper::numeric, '999G999G999'),
	sno_personal.apeper,
	sno_personal.nomper,
	sno_personalnomina.sueper,
	sno_personalnomina.codnom,
	sno_nomina.desnom
FROM 
	sno_personal,
	sno_personalnomina,
	sno_nomina
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	sno_personalnomina.staper IN('1','2','4') AND
	sno_personalnomina.codnom BETWEEN '0000' AND '0010'
ORDER BY
	sno_personal.codper;

