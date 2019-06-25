--Migra prestamos
INSERT INTO sno_prestamos
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2016', 
	'SELECT 
		codemp,
		codnom,
		codper,
		numpre,
		codtippre,
		codconc,
		monpre,
		numcuopre,
		perinipre,
		monamopre,
		stapre,
		fecpre,
		obsrecpre,
		obssuspre,
		tipcuopre
	FROM 
		sno_prestamos ') 
	AS 
		sno_prestamos(
			codemp character(4),
			codnom character(4),
			codper character(10),
			numpre integer,
			codtippre character(10),
			codconc character(10),
			monpre double precision,
			numcuopre integer,
			perinipre character(3),
			monamopre double precision,
			stapre smallint,
			fecpre date,
			obsrecpre text,
			obssuspre text,
			tipcuopre character(1))
WHERE 
	codnom BETWEEN '0000' AND '0012' OR codnom='1000';

--Migra prestamos periodos
INSERT INTO sno_prestamosperiodo
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2016', 
	'SELECT 
		  codemp,
		  codnom,
		  codper,
		  numpre,
		  codtippre,
		  numcuo,
		  percob,
		  feciniper,
		  fecfinper,
		  moncuo,
		  estcuo
	FROM 
		sno_prestamosperiodo') 
	AS 
		sno_prestamosperiodo(
				  codemp character(4),
				  codnom character(4),
				  codper character(10),
				  numpre integer,
				  codtippre character(10),
				  numcuo integer,
				  percob character(3),
				  feciniper date,
				  fecfinper date,
				  moncuo double precision,
				  estcuo smallint)
WHERE 
	codnom BETWEEN '0000' AND '0012' OR codnom='1000';


