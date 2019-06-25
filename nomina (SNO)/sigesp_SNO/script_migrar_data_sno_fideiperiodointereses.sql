INSERT INTO sno_fideiperiodointereses 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2014', 
	'SELECT 
		codemp,
		codnom,
		codper,
		anocurper,
		mescurper,
		monantacu,
		monant,
		porint,
		monint,
		moncap
	FROM 
		sno_fideiperiodointereses') 
	AS 
		sno_fideiperiodointereses(
			codemp 		character(4),
			codnom 		character(4),
			codper 		character(10),
			anocurper 	character(4),
			mescurper 	integer,
			monantacu 	double precision,
			monant 		double precision,
			porint 		real,
			monint 		double precision,
			moncap 		double precision);