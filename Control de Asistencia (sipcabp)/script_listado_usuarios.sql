SELECT DISTINCT
	xpath_string(tb1.identidad,'/identidad/cedula') as cedula,
	xpath_string(tb1.identidad,'/identidad/nombre') as nombre,
	xpath_string(tb1.identidad,'/identidad/apellido') as apellidos,
	xpath_string(tb1.identidad,'/identidad/usuarioreg') as usuarioregistrador,
	xpath_string(tb1.identidad,'/identidad/usuarioregnomjefe') as usuarioregistradornominajefe,
	xpath_string(tb1.identidad,'/identidad/usuariorev') as usuarevisador,
	xpath_string(tb1.identidad,'/identidad/usuariorevnomjefe') as usuariorevisadornominajefe,
	xpath_string(tb1.identidad,'/identidad/usuarioaprob') as usuarioaprobador,
	xpath_string(tb1.identidad,'/identidad/ubicacionfisica') as ubicacionfisica,
	xpath_string(tb1.identidad,'/identidad/nomina') as nomina,
	xpath_string(tb1.identidad,'/identidad/unidadadministra') as unidadesadministra,
	xpath_string(tb1.identidad,'/identidad/modificarasistenciaaprob') as modificarasistenciarevisadaaprobada,
	xpath_string(tb1.identidad,'/identidad/modificarasistenciagene') as modificarasistenciagenerada,
	tb3.perfil as modulosipcabp
FROM 
	public.sesion_usuarios as tb1,
	public.sesion_acceso as tb2,
	public.sesion_perfiles as tb3
WHERE
	codigo=id_usuario AND
	tb2.id_perfil=tb3.id_perfil AND
	tb2.id_perfil <> '10000' AND
	tb2.id_perfil <> '20000' AND
	tb2.id_perfil <> '30000' AND
	tb2.id_perfil <> '40000'
ORDER BY
	cedula