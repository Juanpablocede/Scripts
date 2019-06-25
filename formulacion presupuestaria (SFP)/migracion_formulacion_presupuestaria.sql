--INSERT INTO spg_ep1
SELECT
	codemp,
	codestpro1,
	estcla,
	denestpro1,
	0,
	' ',
	'0'
FROM
	sfp_ep1
GROUP BY
	codemp,
	codestpro1,
	estcla,
	denestpro1;

--INSERT INTO spg_ep2
SELECT
	sfp_ep2.codemp,
	sfp_ep2.codestpro1,
	sfp_ep2.estcla,
	sfp_ep2.codestpro2,
	sfp_centrocostos.nombre
FROM
	sfp_ep2,
	sfp_centrocostos
WHERE
	sfp_ep2.codestpro2=sfp_centrocostos.codccosto
GROUP BY
	sfp_ep2.codemp,
	sfp_ep2.codestpro1,
	sfp_ep2.estcla,
	sfp_ep2.codestpro2,
	sfp_centrocostos.nombre;


--INSERT INTO spg_ep3
SELECT
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	denestpro3,
	'--',
	'0',
	'0000'
FROM
	sfp_ep3
GROUP BY
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	denestpro3

--INSERT INTO spg_ep4
SELECT
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	codestpro4,
	denestpro4
FROM
	sfp_ep4
GROUP BY
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	codestpro4,
	denestpro4

--INSERT INTO spg_ep5
SELECT
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	denestpro5,
	'--',
	SUBSTRING( codestpro2,22,4)
FROM
	sfp_ep5
GROUP BY
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	denestpro5

--INSERT INTO spg_cuentas
SELECT
	codemp,
	estcla,
	codestpro1,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	cod_plancuenta,
	denominacion,
	'C',
	'0',
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	SUM(monto_enero),
	SUM(monto_febrero),
	SUM(monto_marzo),
	SUM(monto_abril),
	SUM(monto_mayo),
	SUM(monto_junio),
	SUM(monto_julio),
	SUM(monto_agosto),
	SUM(monto_septiembre),
	SUM(monto_octubre),
	SUM(monto_noviembre),
	SUM(monto_diciembre),
	'0',
	'-',
	'-',
	'-'
FROM
	sfp_cuentas
GROUP BY
	codemp,
	estcla,
	codestpro1,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	cod_plancuenta,
	denominacion



--INSERT INTO sigesp_cmp
SELECT 
	codemp,
	'SPGAPR',
	'0000000APERTURA',
	'2017-01-01',
	'---',
	'-------------------------',
	'APERTURA DE CUENTAS INICIO PRESUPUESTO 2017 (MIGRACION SFP)',
	2,
	'-',
	'----------',
	'----------',
	SUM(monto_enero+monto_febrero+monto_marzo+monto_abril+monto_mayo+monto_junio+monto_julio+monto_agosto+monto_septiembre+monto_octubre+monto_noviembre+monto_diciembre),
	0,
	0,
	0,
	'--',
	'SIGESP'
FROM
	sfp_cuentas
GROUP BY
	codemp


--INSERT INTO spg_dt_cmp
SELECT
	codemp,
	'SPGAPR',
	'0000000APERTURA',
	'2017-01-01',
	'---',
	'-------------------------',
	estcla,
	codestpro1,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	cod_plancuenta,
	'SPGAPR',
	'0000000APERTURA',
	'AAP',
	'--',
	'APERTURA CUENTAS INICIO PRESUPUESTO 2017 (MIGRACION SFP)',
	(monto_enero+monto_febrero+monto_marzo+monto_abril+monto_mayo+monto_junio+monto_julio+monto_agosto+monto_septiembre+monto_octubre+monto_noviembre+monto_diciembre),
	1
FROM
	sfp_cuentas


--CASAMIENTO DE CUENTAS CONTABLES
--Actualiza sc_cuenta de la partida 401 
UPDATE spg_cuentas SET 
sc_cuenta='611'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001' 
WHERE 
	SUBSTRING(spg_cuenta,1,3)='401'; 

--Actualiza sc_cuenta de la partida 402
UPDATE spg_cuentas SET
sc_cuenta='1130501028000100001'
WHERE 
	SUBSTRING(spg_cuenta,1,3)='402' AND
	(codestpro1='0000000000000000000000001' OR
	 codestpro1='0000000000000000000000002' OR
	 codestpro1='0000000000000000000000003' OR
	 codestpro1='0000000000000000000000004' OR
	 codestpro1='0000000000000000000000007' OR
	 codestpro1='0000000000000000000000008' OR
	 codestpro1='0000000000000000000000009' OR
	 codestpro1='0000000000000000000000010');

UPDATE spg_cuentas SET
sc_cuenta='1130501028010100001'
WHERE 
	SUBSTRING(spg_cuenta,1,3)='402' AND
	(codestpro1='0000000000000000000000005' OR
	 codestpro1='0000000000000000000000006'); 

--Actualiza sc_cuenta de la partida 403 
UPDATE spg_cuentas SET 
sc_cuenta='613'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001' 
WHERE 
	SUBSTRING(spg_cuenta,1,3)='403'; 

--Actualiza sc_cuenta de la partida 404
UPDATE spg_cuentas SET 
sc_cuenta='1230106000000000001' 
WHERE 
	SUBSTRING(spg_cuenta,1,3)='404'; 
--Actualiza sc_cuenta de la partida 404
UPDATE spg_cuentas SET
sc_cuenta='1230102000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40403';

UPDATE spg_cuentas SET
sc_cuenta='1230103000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40404';

UPDATE spg_cuentas SET
sc_cuenta='1230104000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40405';

UPDATE spg_cuentas SET
sc_cuenta='1230105000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40406';

UPDATE spg_cuentas SET
sc_cuenta='1230106000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40407';

UPDATE spg_cuentas SET
sc_cuenta='1230108000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40409';

UPDATE spg_cuentas SET
sc_cuenta='1230201000300000001'
WHERE 
	spg_cuenta='404110100';

UPDATE spg_cuentas SET
sc_cuenta='1240401000000000000'
WHERE 
	spg_cuenta='404120400';

UPDATE spg_cuentas SET
sc_cuenta='1230119000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40499';
UPDATE spg_cuentas SET
sc_cuenta='1230502000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40415';

UPDATE spg_cuentas SET
sc_cuenta='1230102000000000002'
WHERE 
	spg_cuenta='404010101' OR
	spg_cuenta='404010201';

UPDATE spg_cuentas SET
sc_cuenta='1230103000000000002'
WHERE 
	spg_cuenta='404010102' OR
	spg_cuenta='404010202';

UPDATE spg_cuentas SET
sc_cuenta='1230104000000000002'
WHERE 
	spg_cuenta='404010103' OR
	spg_cuenta='404010203';

UPDATE spg_cuentas SET
sc_cuenta='1230105000000000002'
WHERE 
	spg_cuenta='404010104' OR
	spg_cuenta='404010204';

UPDATE spg_cuentas SET
sc_cuenta='1230106000000000002'
WHERE 
	spg_cuenta='404010105' OR
	spg_cuenta='404010205';

UPDATE spg_cuentas SET
sc_cuenta='1230108000000000002'
WHERE 
	spg_cuenta='404010107' OR
	spg_cuenta='404010207' OR
       spg_cuenta='404010199' OR
       spg_cuenta='404010299';


--Actualiza sc_cuenta de la partida 405 
UPDATE spg_cuentas SET 
sc_cuenta='000'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001' 
WHERE 
	SUBSTRING(spg_cuenta,1,3)='405'; 

--Actualiza sc_cuenta de la partida 406 
UPDATE spg_cuentas SET 
sc_cuenta='000'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001' 
WHERE 
	SUBSTRING(spg_cuenta,1,3)='406'; 

--Actualiza sc_cuenta de la partida 407 
UPDATE spg_cuentas SET 
sc_cuenta='631'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001' 
WHERE 
	SUBSTRING(spg_cuenta,1,3)='407'; 
 
--Actualiza sc_cuenta de la partida 408 
UPDATE spg_cuentas SET 
sc_cuenta='614'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001' 
WHERE 
	SUBSTRING(spg_cuenta,1,3)='408'; 

--Actualiza sc_cuenta de la partida 409 
UPDATE spg_cuentas SET 
sc_cuenta='000'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001' 
WHERE 
	SUBSTRING(spg_cuenta,1,3)='409';




--IMPORTANTE
--Una vez finalizada la reconstrucción de saldos del presupuesto de gastos se ejecuta el siguiente scripts
--Actualiza los niveles 
UPDATE spg_cuentas SET 
nivel=1 
WHERE 
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)='00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)='00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00'; 
UPDATE spg_cuentas SET 
nivel=2 
WHERE 
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)='00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00'; 
UPDATE spg_cuentas SET 
nivel=3 
WHERE 
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00'; 
UPDATE spg_cuentas SET 
nivel=4 
WHERE 
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)<>'00'; 
--Actualiza las referencias 
UPDATE spg_cuentas SET 
referencia=SUBSTRING(spg_cuentas.spg_cuenta,1,3)||'000000' 
WHERE 
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)='00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)='00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00'; 
UPDATE spg_cuentas SET 
referencia=SUBSTRING(spg_cuentas.spg_cuenta,1,5)||'0000' 
WHERE 
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)='00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00'; 
UPDATE spg_cuentas SET 
referencia=SUBSTRING(spg_cuentas.spg_cuenta,1,7)||'00' 
WHERE 
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00'; 









	