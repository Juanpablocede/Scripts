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
	sno_personalnomina01.cedper,
	sno_personalnomina01.coddep,
	sno_personalnomina01.dendep		
FROM 
	public.sesion_usuarios,
	public.sesion_acceso,
	public.sesion_perfiles,
	(SELECT
		sno_personalnomina.cedper,
		sno_personalnomina.codper,
		sno_personalnomina.coddep,
		sno_personalnomina.codnom,
		sno_personalnomina.staper,
		sno_personalnomina.dendep
	FROM 
		dblink('dbname=db_mdo_2018', 
		'SELECT sno_personal.cedper, 
			sno_personalnomina.codper,
			sno_personalnomina.coddep,
			sno_personalnomina.codnom,
			sno_personalnomina.staper,
			srh_departamento.dendep
		FROM 
			sno_personalnomina, 
			sno_personal,
			srh_departamento
		WHERE 
			sno_personal.codper=sno_personalnomina.codper AND
			sno_personalnomina.coddep=srh_departamento.coddep') AS 
			sno_personalnomina(
			cedper varchar(10), 
			codper varchar(10),
			coddep varchar(15), 
			codnom varchar(4), 
			staper varchar(1),
			dendep varchar(100))
	WHERE
		sno_personalnomina.coddep BETWEEN '000000000002000' AND '000000000002099' AND 
		sno_personalnomina.codnom BETWEEN '0000' AND '0012' AND 
		sno_personalnomina.staper IN('1','2')) AS sno_personalnomina01
WHERE
	public.sesion_usuarios.codigo=public.sesion_acceso.id_usuario AND
	public.sesion_acceso.id_perfil=public.sesion_perfiles.id_perfil AND
	(public.sesion_acceso.id_perfil='30100' OR
	public.sesion_acceso.id_perfil='30200' OR
	public.sesion_acceso.id_perfil='30300') AND
	sno_personalnomina01.cedper=public.sesion_usuarios.codigo
	
ORDER BY
	xpath_string(public.sesion_usuarios.identidad,'/identidad/cedula') 


