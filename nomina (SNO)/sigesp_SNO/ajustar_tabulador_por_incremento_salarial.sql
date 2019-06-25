--Se actualiza sno_grado; una vez creadas las cabeceras de los tabuladores en la tabla sno_tabulador
--Nomina 0000
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020171009',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201710072' AND
	codnom='0000';

--Nomina 0001
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020170909',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201709072' AND
	codnom='0001';

--Nomina 0001
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020171109',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201711072' AND
	codnom='0001';

--Nomina 0002
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020170809',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201708072' AND
	codnom='0002';

--Nomina 0002
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020171309',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201713072' AND
	codnom='0002';


--Nomina 0003
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020170609',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201706072' AND
	codnom='0003';


--Nomina 0003
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020170709',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201707072' AND
	codnom='0003';

--Nomina 0003
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020171209',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201712072' AND
	codnom='0003';

--Nomina 0004
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020170509',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201705072' AND
	codnom='0004';

--Nomina 0006
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020170409',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201704072' AND
	codnom='0006';

--Nomina 0007
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020170309',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201703072' AND
	codnom='0007';


--Nomina 0008
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020170109',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201701072' AND
	codnom='0008';

--Nomina 0009
INSERT INTO sno_grado
SELECT 
	codemp,
	codnom,
	'00000000000020170209',
	codpas,
	codgra,
	monsalgra*1.1116,
	moncomgra,
	aniodes,
	aniohas
FROM
	sno_grado 
where
	codtab='00000000000201702072' AND
	codnom='0009';

--Se actualiza la tabla sno_asignacioncargo con el nuevo tabulador
--Nomina 0000
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020171009'
WHERE
	codtab= '00000000000201710072' AND
	codnom='0000';


--Nomina 0001
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020170909'
WHERE
	codtab= '00000000000201709072' AND
	codnom='0001';

--Nomina 0001
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020171109'
WHERE
	codtab= '00000000000201711072' AND
	codnom='0001';

--Nomina 0002
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020170809'
WHERE
	codtab= '00000000000201708072' AND
	codnom='0002';

--Nomina 0002
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020171309'
WHERE
	codtab= '00000000000201713072' AND
	codnom='0002';

--Nomina 0003
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020170609'
WHERE
	codtab= '00000000000201706072' AND
	codnom='0003';

--Nomina 0003
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020170709'
WHERE
	codtab= '00000000000201707072' AND
	codnom='0003';

--Nomina 0003
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020171209'
WHERE
	codtab= '00000000000201712072' AND
	codnom='0003';


--Nomina 0003
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020171209'
WHERE
	codtab= '00000000000201712072' AND
	codnom='0003';


--Nomina 0004
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020170509'
WHERE
	codtab= '00000000000201705072' AND
	codnom='0004';

--Nomina 0006
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020170409'
WHERE
	codtab= '00000000000201704072' AND
	codnom='0006';

--Nomina 0007
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020170309'
WHERE
	codtab= '00000000000201703072' AND
	codnom='0007';


--Nomina 0008
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020170109'
WHERE
	codtab= '00000000000201701072' AND
	codnom='0008';
	

--Nomina 0009
UPDATE  sno_asignacioncargo SET 
codtab='00000000000020170209'
WHERE
	codtab= '00000000000201702072' AND
	codnom='0009';



--Se actualiza la tabla sno_personalnomina el codigo delk tabulador de cada trabajador
--Nomina 0000
UPDATE sno_personalnomina SET
codtab='00000000000020171009'
WHERE
	codtab= '00000000000201710072' AND
	codnom='0000';

--Nomina 0001
UPDATE sno_personalnomina SET
codtab='00000000000020170909'
WHERE
	codtab= '00000000000201709072' AND
	codnom='0001';


--Nomina 0001
UPDATE sno_personalnomina SET
codtab='00000000000020171109'
WHERE
	codtab= '00000000000201711072' AND
	codnom='0001';

--Nomina 0002
UPDATE sno_personalnomina SET
codtab='00000000000020170809'
WHERE
	codtab= '00000000000201708072' AND
	codnom='0002';

--Nomina 0002
UPDATE sno_personalnomina SET
codtab='00000000000020171309'
WHERE
	codtab= '00000000000201713072' AND
	codnom='0002';


--Nomina 0003
UPDATE sno_personalnomina SET
codtab='00000000000020170609'
WHERE
	codtab= '00000000000201706072' AND
	codnom='0003';


--Nomina 0003
UPDATE sno_personalnomina SET
codtab='00000000000020170709'
WHERE
	codtab= '00000000000201707072' AND
	codnom='0003';

--Nomina 0003
UPDATE sno_personalnomina SET
codtab='00000000000020171209'
WHERE
	codtab= '00000000000201712072' AND
	codnom='0003';


--Nomina 0004
UPDATE sno_personalnomina SET
codtab='00000000000020170509'
WHERE
	codtab= '00000000000201705072' AND
	codnom='0004';

--Nomina 0006
UPDATE sno_personalnomina SET
codtab='00000000000020170409'
WHERE
	codtab= '00000000000201704072' AND
	codnom='0006';

--Nomina 0007
UPDATE sno_personalnomina SET
codtab='00000000000020170309'
WHERE
	codtab= '00000000000201703072' AND
	codnom='0007';

--Nomina 0008
UPDATE sno_personalnomina SET
codtab='00000000000020170109'
WHERE
	codtab= '00000000000201701072' AND
	codnom='0008';

--Nomina 0009
UPDATE sno_personalnomina SET
codtab='00000000000020170209'
WHERE
	codtab= '00000000000201702072' AND
	codnom='0009';


