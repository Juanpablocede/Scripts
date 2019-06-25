SELECT
	sno_salida.codnom,
	COUNT(sno_personalnomina.codper),
	sno_asignaciones.totalasignacion,
	sno_deducciones.totaldeduccion
FROM
	sno_salida
	INNER JOIN
	sno_personalnomina ON sno_salida.codper=sno_personalnomina.codper AND
	sno_salida.codnom=sno_personalnomina.codnom,
	(SELECT
		asignacion.codnom,
		SUM(asignacion.valsal) 	AS totalasignacion
	FROM
		sno_salida as asignacion
	WHERE
		asignacion.codnom=codnom AND
		asignacion.tipsal='A'
	GROUP BY
		asignacion.codnom) AS sno_asignaciones,

	(SELECT
		deduccion.codnom,
		SUM(deduccion.valsal) 	AS totaldeduccion
	FROM
		sno_salida as deduccion
	WHERE
		deduccion.codnom=codnom AND
		deduccion.tipsal='D'
	GROUP BY
		deduccion.codnom) AS sno_deducciones
WHERE
	sno_personalnomina.codnom BETWEEN '0000' AND '0010' AND
	sno_personalnomina.staper='1' AND
	sno_personalnomina.codnom=sno_asignaciones.codnom AND
	sno_personalnomina.codnom=sno_deducciones.codnom
GROUP BY
	sno_salida.codnom,
	sno_asignaciones.totalasignacion,
	sno_deducciones.totaldeduccion

	