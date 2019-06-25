DELETE FROM sno_anticipoprestaciones;
INSERT INTO sno_anticipoprestaciones 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
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


DELETE FROM sno_fideicomiso;
INSERT INTO sno_fideicomiso 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
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


DELETE FROM sno_fideiconfigurable;
INSERT INTO sno_fideiconfigurable 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
	'SELECT 
		codemp,
		anocurfid,
		codded,
		codtipper,
		diabonvacfid,
		diabonfinfid,
		cueprefid
	FROM 
		sno_fideiconfigurable') 
	AS 
		sno_fideiconfigurable(
			codemp 		character(4),
			anocurfid 	character(4),
			codded 		character(3),
			codtipper 	character(4),
			diabonvacfid 	integer,
			diabonfinfid 	integer,
			cueprefid 	character varying(25));	

﻿DELETE FROM sno_fideiperiodo;
INSERT INTO sno_fideiperiodo 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
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

DELETE FROM sno_fideiintereses;
﻿INSERT INTO sno_fideiintereses 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
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

﻿DELETE FROM sno_fideiperiodointereses;
INSERT INTO sno_fideiperiodointereses 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
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

DELETE FROM sno_deudaanterior;
﻿INSERT INTO sno_deudaanterior 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
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
