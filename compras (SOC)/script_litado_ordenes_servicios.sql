SELECT
	soc_ordencompra.numordcom,
	soc_ordencompra.estcondat,
	soc_ordencompra.cod_pro,
	rpc_proveedor.nompro,
	soc_ordencompra.fecordcom,
	soc_ordencompra.forpagcom,
	soc_ordencompra.obscom,
	--soc_ordencompra.montot,
	--soc_dt_servicio.codser,
	soc_servicios.denser,
	soc_servicios.codtipser,
	soc_tiposervicio.dentipser,
	siv_unidadmedida.denunimed,
	soc_dt_servicio.canser,
	soc_dt_servicio.monuniser,
	soc_dt_servicio.montotser,
	soc_dt_servicio.codestpro1,
	soc_dt_servicio.codestpro2,
	soc_dt_servicio.codestpro3,
	soc_dt_servicio.codestpro4,
	soc_dt_servicio.codestpro5,
	soc_servicios.spg_cuenta

FROM
	soc_ordencompra,
	rpc_proveedor,
	soc_dt_servicio,
	soc_servicios,
	soc_tiposervicio,
	siv_unidadmedida
WHERE
	soc_ordencompra.estcondat='S' AND
	soc_ordencompra.cod_pro=rpc_proveedor.cod_pro AND
	soc_ordencompra.numordcom=soc_dt_servicio.numordcom AND
	soc_dt_servicio.codser=soc_servicios.codser AND
	soc_servicios.codtipser=soc_tiposervicio.codtipser AND
	soc_servicios.codunimed=siv_unidadmedida.codunimed

