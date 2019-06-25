INSERT INTO sno_fideicomiso 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2014', 
	'SELECT 
		codemp,
		codper,
		codfid,
		ficfid,
		ubifid,
		cuefid,
		fecingfid,
		capfid,
		capantcom,
		fecconpreant,
		conpreant,
		porintcap,
		scg_cuentafid,
		scg_cuentaintfid,
		calintfid 
	FROM 
		sno_fideicomiso') 
	AS 
		sno_fideicomiso(
			codemp 			character(4),
			codper 			character(10),
			codfid 			character varying(10),
			ficfid 			character varying(10),
			ubifid 			character varying(10),
			cuefid 			character varying(25),
			fecingfid 		date,
			capfid 			character varying(1),
			capantcom 		character varying(1),
			fecconpreant 		date,
			conpreant 		character(1),
			porintcap 		double precision,
			scg_cuentafid 		character varying(25),
			scg_cuentaintfid 	character varying(25),
			calintfid 		character(1));