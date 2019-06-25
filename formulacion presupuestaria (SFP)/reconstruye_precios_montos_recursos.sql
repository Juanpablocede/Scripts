--Si se tilda actualizar precios recursos
UPDATE sfp_asignacion_recursos SET
costorecurso=siv_articulo.ultcosart
FROM
	siv_articulo
WHERE
	sfp_asignacion_recursos.ano_presupuesto='2018' AND
	sfp_asignacion_recursos.escenario=1 AND
	sfp_asignacion_recursos.cod_recurso=siv_articulo.codart

--Si se actualiza monto re recursos
UPDATE sfp_asignacion_recursos SET
monto_enero=(cantidad_enero*costorecurso),
monto_febrero=(cantidad_enero*costorecurso),
monto_marzo=(cantidad_enero*costorecurso),
monto_abril=(cantidad_enero*costorecurso),
monto_mayo=(cantidad_enero*costorecurso),
monto_junio=(cantidad_enero*costorecurso),
monto_julio=(cantidad_enero*costorecurso),
monto_agosto=(cantidad_enero*costorecurso),
monto_septiembre=(cantidad_enero*costorecurso),
monto_octubre=(cantidad_enero*costorecurso),
monto_noviembre=(cantidad_enero*costorecurso),
monto_diciembre=(cantidad_enero*costorecurso)
WHERE
	ano_presupuesto='2018' AND
	escenario=1
	