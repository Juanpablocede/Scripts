INSERT INTO sss_derechos_usuarios 
SELECT 
	*
FROM 
	dblink('dbname=db_mdo_2016', 
	'SELECT 
		codemp,
		codusu,
		codsis,
		nomven,
		codintper,
		visible,
		enabled,
		leer,
		incluir,
		cambiar,
		eliminar,
		imprimir,
		administrativo,
		anular,
		ejecutar
	FROM 
		sss_derechos_usuarios') 
	AS 
		sss_derechos_usuarios(
			codemp 		character(4),
			codusu 		character(30),
			codsis 		character(3),
			nomven 		character(80),
			codintper 	character varying(126),
			visible 	smallint,
			enabled 	smallint,
			leer 		smallint,
			incluir 	smallint,
			cambiar 	smallint,
			eliminar 	smallint,
			imprimir 	smallint,
			administrativo 	smallint,
			anular 		smallint,
			ejecutar 	smallint);