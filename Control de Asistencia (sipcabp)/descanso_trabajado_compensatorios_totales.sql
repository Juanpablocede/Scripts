SELECT
	scsipcht.tsht_det_asistencia.cedula,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper),
	SUM(scsipcht.tsht_det_asistencia.dt) AS DT,
	SUM(scsipcht.tsht_det_asistencia.dc) AS DC
FROM
	scsipcht.tsht_asistencia
	INNER JOIN scsipcht.tsht_det_asistencia ON scsipcht.tsht_det_asistencia.id_asisten=scsipcht.tsht_asistencia.id_asisten,
	dblink('dbname=db_mdo_2018', 
		'SELECT sno_personal.cedper, 
			sno_personal.nomper,
			sno_personal.apeper
		FROM 
			sno_personal') AS 
			sno_personal(
			cedper varchar(10), 
			nomper varchar(50),
			apeper varchar(50))
WHERE
	scsipcht.tsht_asistencia.fecha_asisten BETWEEN '2018-01-01' AND '2018-12-31' AND
	(scsipcht.tsht_det_asistencia.dc>0 OR scsipcht.tsht_det_asistencia.dt>0) AND
	scsipcht.tsht_asistencia.cod_dpto LIKE '%0002009%' AND
	scsipcht.tsht_det_asistencia.cedula=sno_personal.cedper
GROUP BY
	scsipcht.tsht_det_asistencia.cedula,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper)


