SELECT DISTINCT
	public.sesion_usuarios.codigo,
	xpath_string(public.sesion_usuarios.identidad,'/identidad/cedula') 		AS cedula,
	xpath_string(public.sesion_usuarios.identidad,'/identidad/nombre') 		AS nombre,
	xpath_string(public.sesion_usuarios.identidad,'/identidad/apellido') 		AS apellidos,
	xpath_string(public.sesion_usuarios.identidad,'/identidad/usuarioreg') 		AS usuarioregistrador,
	xpath_string(public.sesion_usuarios.identidad,'/identidad/usuariorev') 		AS usuarevisador,
	xpath_string(public.sesion_usuarios.identidad,'/identidad/usuarioaprob') 	AS usuarioaprobador,
	xpath_string(public.sesion_usuarios.identidad,'/identidad/ubicacionfisica') 	AS ubicacionfisica,
	xpath_string(public.sesion_usuarios.identidad,'/identidad/unidadadministra') 	AS unidadesadministra,
	(SELECT
		
		sno_personal.codger 
	FROM 
		dblink('dbname=db_mdo_2018', 
		'SELECT cedper,codger FROM sno_personal') AS 
		sno_personal(cedper varchar(10), codger varchar(10)) 
	WHERE
		sno_personal.cedper=public.sesion_usuarios.codigo)
FROM 
	public.sesion_usuarios,
	public.sesion_acceso,
	public.sesion_perfiles
WHERE
	public.sesion_usuarios.codigo=public.sesion_acceso.id_usuario AND
	public.sesion_acceso.id_perfil=public.sesion_perfiles.id_perfil AND
	(public.sesion_acceso.id_perfil='30100' OR
	public.sesion_acceso.id_perfil='30200' OR
	public.sesion_acceso.id_perfil='30300') 
ORDER BY
	cedula






	