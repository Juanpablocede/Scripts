/* Para poder actualizar el beneficiario de la tabla cxp_rd...SE DEBE EJECUTAR TODO EL SIGUIENTE SCRIPTS
--CUATRO cxp_rd
UPDATE cxp_rd SET 
ced_bene='7' 
WHERE 
	SUBSTRING(NUMRECDOC,5,4)='2004' AND 
	ced_bene<>'7';

TABLAS ASOCIADAS: cxp_rd, cxp_rd, cxp_rd_spg, cxp_rd_scg

SELECT * FROM CXP_RD WHERE substring(NUMRECDOC,5,4)='2004' AND CED_BENE <> '7'

UPDATE CXP_RD SET CED_BENE='7' WHERE substring(NUMRECDOC,5,4)='2004' AND CED_BENE <> '7'


*/

--Primero cxp_rd
INSERT INTO cxp_rd
SELECT 
	codemp,
	numrecdoc,
	codtipdoc,
	'7', --ced_bene,
	cod_pro,
	codcla,
	dencondoc,
	fecemidoc,
	fecregdoc,
	fecvendoc,
	montotdoc,
	mondeddoc,
	moncardoc,
	tipproben,
	numref,
	estprodoc,
	procede,
	estlibcom,
	estaprord,
	fecaprord,
	usuaprord,
	numpolcon,
	estimpmun,
	montot,
	codfuefin,
	codrecdoc,
	fechaconta,
	fechaanula,
	coduniadm,
	codestpro1,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	estcla,
	estact,
	numordpagmin,
	codtipfon,
	repcajchi,
	codproalt,
	conanurd,
	codproislr,
	ivater,
	muniter,
	unoter,
	islrter,
	codmet
FROM 
	cxp_rd
WHERE 
	SUBSTRING(NUMRECDOC,5,4)='2004' AND 
	ced_bene<>'7';

--Segundo cxp_rd_spg
INSERT INTO cxp_rd_spg
SELECT 
	codemp,
	numrecdoc,
	codtipdoc,
	'7', --ced_bene,
	cod_pro,
	procede_doc,
	numdoccom,
	codestpro,
	estcla,
	spg_cuenta,
	codfuefin ,
	monto
FROM
	cxp_rd_spg 
WHERE 
	SUBSTRING(numrecdoc,5,4)='2004' AND 
	ced_bene<> '7';

--Tercero cxp_rd_scg
INSERT INTO cxp_rd_scg
SELECT 
	codemp,
	numrecdoc,
	codtipdoc,
	'7', --ced_bene,
	cod_pro,
	procede_doc,
	numdoccom,
	debhab,
	sc_cuenta,
	estasicon,
	monto,
	estgenasi 
FROM
	cxp_rd_scg 
WHERE 
	SUBSTRING(numrecdoc,5,4)='2004' AND 
	ced_bene<> '7';

--Cuarto
DELETE FROM cxp_rd_scg 
WHERE 
	SUBSTRING(numrecdoc,5,4)='2004' AND 
	ced_bene<> '7';

--Quinto
DELETE FROM cxp_rd_spg 
WHERE 
	SUBSTRING(numrecdoc,5,4)='2004' AND 
	ced_bene<> '7';
--Sexto
DELETE FROM cxp_rd
WHERE 
	SUBSTRING(NUMRECDOC,5,4)='2004' AND 
	ced_bene<>'7';
