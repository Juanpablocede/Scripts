SELECT
	sno_personalnomina.codnom,
	sno_asignaciones.codperi,
	COUNT(sno_personalnomina.codper),
	sno_asignaciones.totalasignacion,
	sno_deducciones.totaldeduccion,
	(sno_asignaciones.totalasignacion+sno_deducciones.totaldeduccion) AS neto
FROM
	sno_personalnomina,
	(SELECT
		asignacion.codnom,
		asignacion.codperi,
		SUM(asignacion.valsal) 	AS totalasignacion
	FROM
		sno_salida as asignacion
	WHERE
		asignacion.codnom=codnom AND
		asignacion.tipsal='A'
	GROUP BY
		asignacion.codnom,
		asignacion.codperi) AS sno_asignaciones,

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
	sno_personalnomina.codnom,
	sno_asignaciones.codperi,
	sno_asignaciones.totalasignacion,
	sno_deducciones.totaldeduccion
ORDER BY
	sno_personalnomina.codnom




	