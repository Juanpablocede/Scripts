INSERT INTO sno_fideiperiodo 
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
		bonvacper,
		bonfinper,
		sueintper,
		apoper,
		bonextper,
		diafid,
		diaadi
	FROM 
		sno_fideiperiodo') 
	AS 
		sno_fideiperiodo(
			codemp 		character(4),
			codnom 		character(4),
			codper 		character(10),
			anocurper 	character(4),
			mescurper 	integer,
			bonvacper 	double precision,
			bonfinper 	double precision,
			sueintper 	double precision,
			apoper 		double precision,
			bonextper 	double precision,
			diafid 		integer,
			diaadi 		integer);