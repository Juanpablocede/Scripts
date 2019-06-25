INSERT INTO sfp_empresa
SELECT 
	*
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
		*
	FROM 
		sfp_empresa') 
	AS 
		sfp_empresa(
			  codemp character(4),
			  nombre character varying(100),
			  telemp character varying(20),
			  faxemp character varying(18),
			  email character varying(100),
			  website character varying(100),
			  rifemp character varying(15),
			  nitemp character varying(15),
			  estemp character varying(50),
			  ciuemp character varying(50),
			  zonpos character varying(5),
			  forma_juri character varying(255),
			  ano_inicio integer,
			  mision text,
			  vision text,
			  nom_presi character varying(100),
			  tel_presi character varying(20),
			  email_presi character varying(50),
			  nom_dirplan character varying(100),
			  tel_dirplan character varying(20),
			  nom_diradmin character varying(100),
			  tel_diradmin character varying(20),
			  email_diradmin character varying(50),
			  nom_dirrh character varying(100),
			  tel_dirrh character varying(20),
			  email_dirrh character varying(50),
			  nom_respre character varying(100),
			  tel_respre character varying(20),
			  email_respre character varying(50),
			  email_dirplan character varying(50),
			  sector character varying(255),
			  base_legal character varying(255),
			  codemp_con character(4),
			  consolidadora smallint,
			  diremp character varying(255),
			  compat character varying(255),
			  politicapre text,
			  ano_presupuesto integer,
			  emprin character varying(4),
			  formpre character varying(30),
			  formspi character varying(30));

INSERT INTO spg_ep1 
SELECT 
	*
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
		codemp,
		codestpro1,
		estcla,
		denestpro1,
		0,
		'' '',
		''0''
	FROM 
		sfp_ep1') 
	AS 
		spg_ep1(
			  codemp character(4),
			  codestpro1 character(25),
			  estcla character(1),
			  denestpro1 text,
			  estint smallint,
			  sc_cuenta character varying(25),
			  estcencos character varying(1));

INSERT INTO spg_ep2
SELECT 
	* 
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
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
		sfp_centrocostos.nombre') 
	AS 
		spg_ep2(
			  codemp character(4),
			  codestpro1 character(25),
			  estcla character(1),
			  codestpro2 character(25),
			  denestpro2 text);

INSERT INTO spg_ep3
SELECT 
	*
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
		  codemp,
		  codestpro1,
		  estcla,
		  codestpro2 ,
		  codestpro3,
		  denestpro3,
		  ''--'',
		  ''0'',
		  ''0000''
	FROM 
		sfp_ep3
	GROUP BY
		codemp,
		codestpro1,
		estcla,
		codestpro2,
		codestpro3,
		denestpro3') 
	AS 
		spg_ep3(
			  codemp character(4),
			  codestpro1 character(25),
			  estcla character(1),
			  codestpro2 character(25),
			  codestpro3 character(25),
			  denestpro3 text,
			  codfuefin character(2),
			  estreradi character(1),
			  codcencos character(4));


INSERT INTO spg_ep4
SELECT 
	*
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
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
		denestpro4') 
	AS 
		spg_ep4(
			  codemp character(4),
			  codestpro1 character(25),
			  estcla character(1),
			  codestpro2 character(25),
			  codestpro3 character(25),
			  codestpro4 character(25),
			  denestpro4 text);


INSERT INTO spg_ep5
SELECT 
	*
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
		codemp,
		codestpro1,
		estcla,
		codestpro2,
		codestpro3,
		codestpro4,
		codestpro5,
		denestpro5,
		''--'',
		SUBSTRING(codestpro2,22,4)
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
		denestpro5') 
	AS 
		spg_ep5(
			  codemp character(4),
			  codestpro1 character(25),
			  estcla character(1),
			  codestpro2 character(25),
			  codestpro3 character(25),
			  codestpro4 character(25),
			  codestpro5 character(25),
			  denestpro5 text,
			  codfuefin character(2),
			  codcencos character(4));


INSERT INTO spg_cuentas
SELECT 
	*
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
		codemp,
		estcla,
		codestpro1,
		codestpro2,
		codestpro3,
		codestpro4,
		codestpro5,
		cod_plancuenta,
		denominacion,
		''C'',
		''0'',
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
		''0'',
		''-'',
		''-'',
		''-''
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
		denominacion') 
	AS 
		spg_cuentas(  
			  codemp character(4),
			  estcla character(1),
			  codestpro1 character(25),
			  codestpro2 character(25),
			  codestpro3 character(25),
			  codestpro4 character(25),
			  codestpro5 character(25),
			  spg_cuenta character varying(25),
			  denominacion character varying(254),
			  status character varying(1),
			  sc_cuenta character varying(25),
			  asignado double precision,
			  precomprometido double precision,
			  comprometido double precision ,
			  causado double precision,
			  pagado double precision ,
			  aumento double precision,
			  disminucion double precision,
			  distribuir smallint,
			  enero double precision,
			  febrero double precision,
			  marzo double precision,
			  abril double precision ,
			  mayo double precision,
			  junio double precision,
			  julio double precision,
			  agosto double precision,
			  septiembre double precision,
			  octubre double precision,
			  noviembre double precision,
			  diciembre double precision,
			  nivel smallint,
			  referencia character varying(25),
			  scgctaint character varying(25),
			  sc_cuenta_art character varying(25));

INSERT INTO sigesp_cmp
SELECT 
	*
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
		codemp,
		''SPGAPR'',
		''0000000APERTURA'',
		''2018-01-01'',
		''---'',
		''-------------------------'',
		''APERTURA DE CUENTAS INICIO PRESUPUESTO 2018 (MIGRACION SFP)'',
		2,
		''-'',
		''----------'',
		''----------'',
		SUM(monto_enero+monto_febrero+monto_marzo+monto_abril+monto_mayo+monto_junio+monto_julio+monto_agosto+monto_septiembre+monto_octubre+monto_noviembre+monto_diciembre),
		0,
		0,
		0,
		''--'',
		''SIGESP''
	FROM 
		sfp_cuentas
	GROUP BY
		codemp') 
	AS 
		sigesp_cmp(
			  codemp character(4),
			  procede character(6),
			  comprobante character(15),
			  fecha date,
			  codban character(3),
			  ctaban character(25),
			  descripcion text,
			  tipo_comp smallint,
			  tipo_destino character varying(1),
			  cod_pro character(10),
			  ced_bene character(10),
			  total double precision,
			  numpolcon double precision,
			  esttrfcmp smallint,
			  estrenfon character(1),
			  codfuefin character(2),
			  codusu character(30));;



INSERT INTO spg_dt_cmp
SELECT 
	*
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
		codemp,
		''SPGAPR'',
		''0000000APERTURA'',
		''2018-01-01'',
		''---'',
		''-------------------------'',
		estcla,
		codestpro1,
		codestpro2,
		codestpro3,
		codestpro4,
		codestpro5,
		cod_plancuenta,
		''SPGAPR'',
		''0000000APERTURA'',
		''AAP'',
		''--'',
		''APERTURA CUENTAS INICIO PRESUPUESTO 2017 (MIGRACION SFP)'',
		(monto_enero+monto_febrero+monto_marzo+monto_abril+monto_mayo+monto_junio+monto_julio+monto_agosto+monto_septiembre+monto_octubre+monto_noviembre+monto_diciembre),
		1
	FROM 
		sfp_cuentas') 
	AS 
		sigesp_cmp(
			  codemp character(4),
			  procede character(6),
			  comprobante character(15),
			  fecha date,
			  codban character(3),
			  ctaban character(25),
			  estcla character(1),
			  codestpro1 character(25),
			  codestpro2 character(25),
			  codestpro3 character(25),
			  codestpro4 character(25),
			  codestpro5 character(25),
			  spg_cuenta character varying(25),
			  procede_doc character(6),
			  documento character(15),
			  operacion character(3),
			  codfuefin character(2),
			  descripcion text,
			  monto double precision,
			  orden integer);


INSERT INTO sigesp_cencosto
SELECT 
	* 
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
		codemp,
		SUBSTRING(codccosto,22,4),
		nombre
	FROM 
		sfp_centrocostos') 
	AS 
		sigesp_cencosto(
			  codemp character(4),
			  codcencos character(4),
			  denominacion character varying(254));


INSERT INTO spg_unidadadministrativa
SELECT 
	* 
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
		codemp,
		SUBSTRING(codccosto,16,10),
		'''',
		nombre,
		1,
		''00001''
	FROM 
		sfp_centrocostos
	GROUP BY
		codemp,
		SUBSTRING(codccosto,16,10),
		nombre') 
	AS 
		spg_unidadadministrativa(
				  codemp character(4),
				  coduniadm character(10),
				  coduac character varying(5),
				  denuniadm character varying(255),
				  estemireq smallint,
				  coduniadmsig character varying(5));


INSERT INTO spg_dt_unidadadministrativa
SELECT 
	* 
FROM
	dblink('dbname=db_mdo_2017', 
	'SELECT 
		codemp,
		SUBSTRING(codestpro2,16,10),
		codestpro1,
		codestpro2,
		codestpro3,
		codestpro4,
		codestpro5,
		estcla,
		''0''
	FROM 
		spg_cuentas
	GROUP BY 
		codemp,
		SUBSTRING(codestpro2,16,10),
		codestpro1,
		codestpro2,
		codestpro3,
		codestpro4,
		codestpro5,
		estcla') 
	AS 
		spg_unidadadministrativa(
					  codemp character(4),
					  coduniadm character(10),
					  codestpro1 character(25),
					  codestpro2 character(25),
					  codestpro3 character(25),
					  codestpro4 character(25),
					  codestpro5 character(25),
					  estcla character(1),
					  central character varying(1));






