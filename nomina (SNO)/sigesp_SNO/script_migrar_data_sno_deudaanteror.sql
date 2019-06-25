INSERT INTO sno_deudaanterior 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2014', 
	'SELECT 
		codemp, 
		codper, 
		feccordeu, 
		monpreant, 
		monint, 
		monant  
	FROM 
		sno_deudaanterior') 
	AS 
		sno_deudaanterior
		(codemp 	varchar(4), 
		codper 		varchar(10),
		feccordeu 	date, 
		monpreant 	double precision, 
		monint 		double precision, 
		monant 		double precision );