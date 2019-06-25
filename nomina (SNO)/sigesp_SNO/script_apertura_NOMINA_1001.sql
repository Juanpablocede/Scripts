--Migra sno_nomina
INSERT INTO sno_nomina
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
	'SELECT 
				  codemp,
				  codnom,
				  desnom,
				  tippernom,
				  despernom,
				  anocurnom,
				  fecininom,
				  peractnom,
				  numpernom,
				  tipnom,
				  subnom,
				  racnom,
				  adenom,
				  espnom,
				  ctnom,
				  ctmetnom,
				  diabonvacnom,
				  diareivacnom,
				  diainivacnom,
				  diatopvacnom,
				  diaincvacnom,
				  consulnom,
				  descomnom,
				  codpronom,
				  codbennom,
				  conaponom,
				  cueconnom,
				  notdebnom,
				  numvounom,
				  recdocnom,
				  tipdocnom,
				  recdocapo,
				  tipdocapo,
				  perresnom,
				  conpernom,
				  conpronom,
				  titrepnom,
				  codorgcestic,
				  confidnom,
				  recdocfid,
				  tipdocfid,
				  codbenfid,
				  cueconfid,
				  informa,
				  divcon,
				  recdocpagperche,
				  tipdocpagperche,
				  estctaalt,
				  racobrnom,
				  nomliq,
				  hojtienom,
				  cestiksuel
	FROM 
		sno_nomina') 
	AS 
		sno_nomina(
				  codemp character(4),
				  codnom character(4),
				  desnom character varying(100),
				  tippernom character varying(1),
				  despernom character varying(20),
				  anocurnom character(4),
				  fecininom date,
				  peractnom character(3),
				  numpernom integer,
				  tipnom smallint,
				  subnom character varying(1),
				  racnom character varying(1),
				  adenom character varying(1),
				  espnom character varying(1),
				  ctnom character varying(1),
				  ctmetnom character varying(2),
				  diabonvacnom integer,
				  diareivacnom integer,
				  diainivacnom integer,
				  diatopvacnom integer,
				  diaincvacnom integer,
				  consulnom character varying(50),
				  descomnom character varying(1),
				  codpronom character varying(10),
				  codbennom character varying(10),
				  conaponom character varying(50),
				  cueconnom character varying(25),
				  notdebnom character varying(1),
				  numvounom character varying(1),
				  recdocnom character varying(1),
				  tipdocnom character varying(5),
				  recdocapo character varying(1),
				  tipdocapo character varying(5),
				  perresnom character varying(3),
				  conpernom character varying(1),
				  conpronom character varying(1),
				  titrepnom character varying(50),
				  codorgcestic character varying(10),
				  confidnom character varying(5),
				  recdocfid character varying(1),
				  tipdocfid character varying(5),
				  codbenfid character varying(10),
				  cueconfid character varying(25),
				  informa text,
				  divcon character(1),
				  recdocpagperche character(1),
				  tipdocpagperche character varying(5),
				  estctaalt character(1),
				  racobrnom character varying(1),
				  nomliq character varying(1),
				  hojtienom character varying(1),
				  cestiksuel character varying(1))
WHERE 
	codnom='1001'; 


--Migra sno_tabulador
INSERT INTO sno_tabulador
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
	'SELECT 
				codemp,
				codnom,
				codtab,
				destab,
				maxpasgra,
				tabmed

	FROM 
		sno_tabulador') 
	AS 
		sno_tabulador(
				codemp character(4),
				codnom character(4),
				codtab character(20),
				destab character varying(100),
				maxpasgra integer,
				tabmed smallint)
WHERE 
	codnom='1001'; 

--Migra sno_grado
INSERT INTO sno_grado
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
	'SELECT 
				codemp,
				codnom,
				codtab,
				codpas,
				codgra,
				monsalgra,
				moncomgra,
				aniodes,
				aniohas
	FROM 
		sno_grado') 
	AS 
		sno_grado(
				codemp character(4),
				codnom character(4),
				codtab character(20),
				codpas character(15),
				codgra character(15),
				monsalgra double precision,
				moncomgra double precision,
				aniodes smallint,
				aniohas smallint)
WHERE 
	codnom='1001'; 


--Migra sno_asignacioncargo
INSERT INTO sno_asignacioncargo
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
	'SELECT 
				  codemp,
				  codnom,
				  codasicar,
				  denasicar,
				  claasicar,
				  minorguniadm,
				  ofiuniadm,
				  uniuniadm,
				  depuniadm,
				  prouniadm,
				  codtab,
				  codpas,
				  codgra,
				  codded,
				  codtipper,
				  numvacasicar,
				  numocuasicar,
				  codestpro1,
				  codestpro2,
				  codestpro3,
				  codestpro4,
				  codestpro5,
				  estcla,
				  grado
	FROM 
		sno_asignacioncargo') 
	AS 
		sno_asignacioncargo(
				  codemp character(4),
				  codnom character(4),
				  codasicar character(10),
				  denasicar character varying(100),
				  claasicar character varying(10),
				  minorguniadm character(4),
				  ofiuniadm character(2),
				  uniuniadm character(2),
				  depuniadm character(2),
				  prouniadm character(2),
				  codtab character(20),
				  codpas character(15),
				  codgra character(15),
				  codded character(3),
				  codtipper character(4),
				  numvacasicar integer,
				  numocuasicar integer,
				  codestpro1 character(25),
				  codestpro2 character(25),
				  codestpro3 character(25),
				  codestpro4 character(25),
				  codestpro5 character(25),
				  estcla character(1),
				  grado character(4))
WHERE 
	codnom='1001' and codasicar='0000000000';


--Migra sno_cargo
INSERT INTO sno_cargo
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
	'SELECT 
			codemp,
			codnom,
			codcar,
			descar
	FROM 
		sno_cargo') 
	AS 
		sno_cargo(
			codemp character(4),
			codnom character(4),
			codcar character(10),
			descar character varying(100))
WHERE 
	codnom='1001' and codcar='0001410015';


--Migra sno_subnomina
INSERT INTO sno_subnomina
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
	'SELECT 
			codemp,
			codnom ,
			codsubnom,
			dessubnom
	FROM 
		sno_subnomina') 
	AS 
		sno_subnomina(
			codemp character(4),
			codnom character(4),
			codsubnom character(10),
			dessubnom character varying(60))
WHERE 
	codnom='1001';


--Migra sno_personalnomina
INSERT INTO sno_personalnomina
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2017', 
	'SELECT 
				  codemp,
				  codnom,
				  codper,
				  codsubnom,
				  codasicar,
				  codtab,
				  codgra,
				  codpas,
				  sueper,
				  horper,
				  minorguniadm,
				  ofiuniadm,
				  uniuniadm,
				  depuniadm,
				  prouniadm,
				  pagbanper,
				  codban,
				  codcueban,
				  tipcuebanper,
				  codcar,
				  fecingper,
				  staper,
				  cueaboper,
				  fecculcontr,
				  codded,
				  codtipper,
				  quivacper,
				  codtabvac,
				  sueintper,
				  pagefeper,
				  sueproper,
				  codage,
				  fecegrper,
				  fecsusper,
				  cauegrper,
				  codescdoc,
				  codcladoc,
				  codubifis,
				  tipcestic,
				  conjub,
				  catjub,
				  codclavia,
				  codunirac,
				  pagtaqper,
				  grado,
				  fecascper,
				  descasicar,
				  coddep,
				  salnorper,
				  estencper,
				  obsrecper,
				  anovig,
				  salnorutilper,
				  estatus_tabulador
	FROM 
		sno_personalnomina') 
	AS 
		sno_personalnomina(
				  codemp character(4),
				  codnom character(4),
				  codper character(10),
				  codsubnom character(10),
				  codasicar character(10),
				  codtab character(20),
				  codgra character(15),
				  codpas character(15),
				  sueper double precision,
				  horper double precision,
				  minorguniadm character(4),
				  ofiuniadm character(2),
				  uniuniadm character(2),
				  depuniadm character(2),
				  prouniadm character(2),
				  pagbanper smallint,
				  codban character(3),
				  codcueban character varying(25),
				  tipcuebanper character varying(1),
				  codcar character(10),
				  fecingper date,
				  staper character varying(1),
				  cueaboper character varying(25),
				  fecculcontr date,
				  codded character(3),
				  codtipper character(4),
				  quivacper character(1),
				  codtabvac character(2),
				  sueintper double precision,
				  pagefeper smallint,
				  sueproper double precision,
				  codage character(10),
				  fecegrper date,
				  fecsusper date,
				  cauegrper character varying(254),
				  codescdoc character(4),
				  codcladoc character(4),
				  codubifis character(4),
				  tipcestic character(2),
				  conjub character(4),
				  catjub character(3),
				  codclavia character(1),
				  codunirac character varying(10),
				  pagtaqper smallint,
				  grado character(4),
				  fecascper date,
				  descasicar character varying(100),
				  coddep character(15),
				  salnorper double precision,
				  estencper character(1),
				  obsrecper text,
				  anovig character(4),
				  salnorutilper double precision,
				  estatus_tabulador integer)
WHERE 
	codnom='1001';


---copiar peridos
INSERT INTO sno_periodo
SELECT
	codemp,
	'1001',
	codperi,
	fecdesper,
	fechasper,
	cerper,
	totper,
	conper,
	apoconper,
	obsper,
	peradi,
	ingconper,
	fidconper,
	fidintconper
FROM
	sno_periodo
WHERE
	codnom='0000'
ORDER BY 
	codperi


