DELETE FROM sfp_ep5;
DELETE FROM sfp_ep4;
DELETE FROM sfp_ep3;
DELETE FROM sfp_ep2;
DELETE FROM sfp_ep1;
DELETE FROM sfp_plan_cuentas;
DELETE FROM sfp_recursos;
DELETE FROM sfp_centrocostos;

--sfp_programas


INSERT INTO sfp_ep1
SELECT 
	codemp,
	2018,
	codestpro1,
	estcla,
	denestpro1
FROM
	spg_ep1;


INSERT INTO sfp_ep2
SELECT 
	codemp,
	2018,
	codestpro1,
	codestpro2,
	estcla
FROM
	spg_ep2;

INSERT INTO sfp_ep3
SELECT 
	codemp,
	2018,
	codestpro1,
	codestpro2,
	codestpro3,
	estcla,
	denestpro3
FROM
	spg_ep3;

INSERT INTO sfp_ep4
SELECT 
	codemp,
	2018,
	codestpro1,
	codestpro2,
	codestpro3,
	codestpro4,
	denestpro4::char(256),
	estcla
FROM
	spg_ep4;


INSERT INTO sfp_ep5
SELECT 
	codemp,
	2018,
	codestpro1,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	denestpro5,
	estcla
FROM
	spg_ep5;

INSERT INTO sfp_plan_cuentas
SELECT
	'0001',
	sig_cuenta,
	denominacion
FROM
	sigesp_plan_unico_re;

INSERT INTO sfp_recursos
SELECT
	'0001',
	codart,
	denart,
	codtipart,
	codunimed,
	spg_cuenta,
	prearta
FROM
	siv_articulo

INSERT INTO sfp_centrocostos
SELECT
	'0001',
	'0000000000'||coddep,
	dendep::char(100)
FROM
	srh_departamento









