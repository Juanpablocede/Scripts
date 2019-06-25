SELECT * FROM  sno_hgrado WHERE codnom BETWEEN '0006' AND '0010'
SELECT * FROM sno_htabulador WHERE codnom BETWEEN '0006' AND '0010'
SELECT * FROM sno_hperiodo WHERE codnom BETWEEN '0006' AND '0010'
SELECT * FROM sno_hnomina WHERE codnom BETWEEN '0006' AND '0010' order by peractnom

--01
INSERT INTO sno_hnomina
SELECT
	codemp,
	codnom,
	anocurnom,
	'001',
	desnom,
	tippernom,
	despernom,
	fecininom,
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
	recdocnom, --
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
	sno_hnomina
WHERE 
	codnom BETWEEN '0006' AND '0010' AND 
	peractnom='002'



--02
INSERT INTO sno_hperiodo
SELECT
	codemp,
	codnom,
	anocur,
	'001',
	fecdesper,
	fechasper,
	totper,
	cerper,
	conper,
	apoconper,
	obsper,
	peradi,
	ingconper,
	fidconper,
	fidintconper
FROM 
	sno_hperiodo
WHERE 
	codnom BETWEEN '0006' AND '0010' AND 
	codperi='002'
--03
INSERT INTO sno_htabulador
SELECT
	codemp,
	codnom,
	anocur,
	'001',
	codtab,
	destab,
	maxpasgra,
	tabmed
FROM 
	sno_htabulador
WHERE 
	codnom BETWEEN '0006' AND '0010' AND 
	codperi='002'

--04
INSERT INTO sno_hgrado
SELECT
	codemp,
	codnom,
	anocur,
	'001',
	codtab,
	codpas,
	codgra,
	monsalgra,
	moncomgra,
	aniodes,
	aniohas
FROM 
	sno_hgrado
WHERE 
	codnom BETWEEN '0006' AND '0010' AND 
	codperi='002'

--05
INSERT INTO sno_hasignacioncargo
SELECT
	codemp,
	codnom,
	anocur,
	'001',
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
	sno_hasignacioncargo
WHERE 
	codnom BETWEEN '0006' AND '0010' AND 
	codperi='002'
--06
INSERT INTO sno_hconcepto
SELECT
	codemp,
	codnom,
	anocur,
	'001',
	codconc,
	nomcon,
	titcon,
	sigcon,
	forcon,
	glocon,
	acumaxcon,
	valmincon,
	valmaxcon,
	concon,
	cueprecon,
	cueconcon,
	aplisrcon,
	sueintcon,
	sueintvaccon,
	conprenom,
	intprocon,
	codestpro1,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	estcla,
	forpatcon,
	cueprepatcon,
	cueconpatcon,
	titretempcon,
	titretpatcon,
	valminpatcon,
	valmaxpatcon,
	codprov,
	cedben,
	aplarccon,
	conprocon,
	intingcon,
	poringcon,
	spi_cuenta,
	repacucon,
	repconsunicon,
	consunicon,
	quirepcon,
	asifidper,
	asifidpat,
	frevarcon,
	persalnor,
	aplresenc,
	conperenc,
	codente,
	guarrepcon,
	aplidiasadd,
	aplisalnorutilidad 
FROM 
	sno_hconcepto
WHERE 
	codnom BETWEEN '0006' AND '0010' AND 
	codperi='002'

--07
INSERT INTO sno_hcargo
SELECT
	codemp,
	codnom,
	anocur,
	'001',
	codcar,
	descar 
FROM 
	sno_hcargo
WHERE 
	codnom BETWEEN '0006' AND '0010' AND 
	codperi='002'


--08
INSERT INTO sno_hpersonalnomina
SELECT
	codemp,
	codnom,
	anocur,
	'001',
	codper,
	codsubnom,
	codasicar,
	codtab,
	codgra,
	codpas,
	sueper,
	horper,
	minorguniadm ,
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
	sueintper ,
	pagefeper,
	codage,
	sueproper,
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
	salnorutilper
FROM 
	sno_hpersonalnomina
WHERE 
	codnom BETWEEN '0006' AND '0010' AND 
	codperi='002'




--09
UPDATE sno_hconceptopersonal SET
codperi='001'
WHERE 
	codnom BETWEEN '0006' AND '0010' AND 
	codperi='002';

UPDATE sno_hconceptopersonal SET
codperi='002'
WHERE 
	codnom BETWEEN '0006' AND '0010' AND 
	codperi='003';

UPDATE sno_hconceptopersonal SET
codperi='004'
WHERE 
	codnom BETWEEN '0006' AND '0010' AND 
	codperi='004';
