
INSERT INTO sesion_acceso 
SELECT 
	*
FROM 
	dblink('dbname=bd_sipcabp', 
	'SELECT 
		id_usuario,
		cod_empresa,
		id_perfil,
		estado
	FROM 
		sesion_acceso') 
	AS 
		sesion_acceso(
			id_usuario	character(20),
			cod_empresa	integer,
			id_perfil	character(20),
			estado		character(2));

INSERT INTO sesion_usuarios 
SELECT 
	*
FROM 
	dblink('dbname=bd_sipcabp', 
	'SELECT 
		codigo,
		clave,
		identidad,
		privilegios,
		preferencias
	FROM 
		sesion_usuarios') 
	AS 
		sesion_usuarios(
			codigo		character varying(10),
			clave		character varying(150),
			identidad	text,
			privilegios	text,
			preferencias	text);



select * FROM sesion_usuarios WHERE codigo='8962263'