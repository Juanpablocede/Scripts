SELECT
	siv_articulo.codart,
	siv_articulo.denart,
	siv_articulo.codtipart,
	siv_tipoarticulo.dentipart,
	siv_articulo.codunimed,
	siv_unidadmedida.denunimed,
	siv_articulo.ultcosart,
	siv_articulo.cosproart,
	siv_articulo.spg_cuenta,
	siv_articulo.sc_cuenta
FROM
	siv_articulo,
	siv_tipoarticulo,
	siv_unidadmedida
WHERE
	siv_articulo.codtipart=siv_tipoarticulo.codtipart AND
	siv_articulo.codunimed=siv_unidadmedida.codunimed
ORDER BY
	siv_articulo.denart



