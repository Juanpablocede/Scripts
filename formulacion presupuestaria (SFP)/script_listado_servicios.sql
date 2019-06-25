SELECT
	soc_servicios.codser,
	soc_servicios.denser,
	(SELECT 
		max(soc_dt_servicio.monuniser)
	FROM
		soc_dt_servicio
	WHERE
		soc_dt_servicio.codser=soc_servicios.codser) AS precio,
	soc_servicios.codtipser,
	soc_tiposervicio.dentipser,
	soc_servicios.codunimed,
	siv_unidadmedida.denunimed,
	soc_servicios.spg_cuenta
FROM

	soc_servicios,
	soc_tiposervicio,
	siv_unidadmedida
WHERE
	soc_servicios.codtipser=soc_tiposervicio.codtipser AND
	soc_servicios.codunimed=siv_unidadmedida.codunimed 