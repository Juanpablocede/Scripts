INSERT INTO sno_fideiintereses 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2014', 
	'SELECT 
		codemp,
		mesint,
		anoint,
		nrogacint,
		fecviggacint,
		montasint
	FROM 
		sno_fideiintereses') 
	AS 
		sno_fideiintereses(
			codemp 		character(4),
			mesint 		integer,
			anoint 		character(4),
			nrogacint 	character varying(15),
			fecviggacint 	date,
			montasint 	real);