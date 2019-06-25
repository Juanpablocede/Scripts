SELECT
	scsipcht.tsht_asistencia.id_asisten,
	scsipcht.tsht_asistencia.fecha_asisten,
	scsipcht.tsht_asistencia.id_det_asisten,
	scsipcht.tsht_asistencia.estatus,
	scsipcht.tsht_asistencia.cod_dpto,
	scsipcht.tsht_asistencia.dpto_adscrito,
	scsipcht.tsht_asistencia.usuario_elaborador,
	scsipcht.tsht_asistencia.fecha_registro,
	scsipcht.tsht_asistencia.usuario_aprobador,
	scsipcht.tsht_asistencia.fecha_aprobado,
	scsipcht.tsht_asistencia.estatus,
	scsipcht.tsht_det_asistencia.id_incidencia_ma,
	scsipcht.tsht_det_asistencia.id_incidencia_tar,
	scsipcht.tsht_det_asistencia.observacion
FROM
	scsipcht.tsht_asistencia
	INNER JOIN scsipcht.tsht_det_asistencia ON scsipcht.tsht_asistencia.id_asisten = scsipcht.tsht_det_asistencia.id_asisten
WHERE 
	scsipcht.tsht_det_asistencia.cedula='6880620' AND
	(id_incidencia_ma='DC' or id_incidencia_ma='DT')

ORDER BY
	scsipcht.tsht_asistencia.fecha_asisten

--select * from scsipcht.tsht_asistencia where id_asisten=13058
--select * from scsipcht.tsht_det_asistencia where cedula='6880620'