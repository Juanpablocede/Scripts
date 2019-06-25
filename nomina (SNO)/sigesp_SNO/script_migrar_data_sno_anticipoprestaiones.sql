INSERT INTO sno_anticipoprestaciones 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2014', 
	'SELECT 
		codemp,
		codper,
		codant,
		estant,
		fecant,
		monpreant,
		monintant,
		monantant,
		monantint,
		porant,
		monant,
		monint,
		motant,
		obsant 
	FROM 
		sno_anticipoprestaciones') 
	AS 
		sno_anticipoprestaciones(
			codemp 		character(4),
			codper 		character(10),
			codant 		character(3),
			estant 		character(1),
			fecant 		date,
			monpreant 	double precision,
			monintant 	double precision,
			monantant 	double precision,
			monantint 	double precision,
			porant 		real,
			monant 		double precision,
			monint 		double precision,
			motant 		text,
			obsant 		text);