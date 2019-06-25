SELECT
	siv_dt_recepcion.numordcom,
	siv_dt_recepcion.numconrec,
	siv_dt_recepcion.codart,
	siv_articuloalmacen.codart,
	siv_articulo.denart,
	siv_articuloalmacen.codalm,
	siv_articulo.spg_cuenta,
	siv_articulo.sc_cuenta,
	siv_articuloalmacen.codalm
FROM
	siv_dt_recepcion,
	siv_articuloalmacen,
	siv_articulo
WHERE
	siv_dt_recepcion.codart=siv_articuloalmacen.codart AND
	siv_articulo.codart=siv_dt_recepcion.codart AND
	siv_dt_recepcion.numordcom like'%0000184'



--select * from siv_articuloalmacen
	