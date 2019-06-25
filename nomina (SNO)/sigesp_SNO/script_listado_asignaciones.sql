SELECT
	sno_personal.nacper,
	sno_hsalida.codper,
 	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[1] as x limit 1) as primer_nombre,
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[2] as x limit 1) as segundo_nombre,
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[3] as x limit 1) as tercero_nombre,
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[4] as x limit 1) as cuarto_nombre,
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[5] as x limit 1) as quinto_nombre,
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[6] as x limit 1) as sexto_nombre,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[1] as x limit 1) as primer_apellido,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[2] as x limit 1) as segundo_apellido,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[3] as x limit 1) as tercero_apellido,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[4] as x limit 1) as cuarto_apellido,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[5] as x limit 1) as quinto_apellido,
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[6] as x limit 1) as sexto_apellido,
	sno_personal.sexper,
	sno_personal.fecingper,
	CASE sno_personalnomina.codded
		WHEN '100' THEN 'Fijo Tiempo Completo'
		WHEN '200' THEN 'Fijo Tienpo Parcial'
		WHEN '300' THEN 'Personal Contratado'
	END,
	sno_hsalida.codnom,
	sno_asignacioncargo.denasicar,
	--sno_hsalida.codperi,

	sno_hconcepto.nomcon,
	sno_hsalida.tipsal,
	SUM(sno_hsalida.valsal)
FROM
	sno_personal,
	sno_personalnomina,
	sno_hconcepto,
	sno_hsalida,
	sno_asignacioncargo
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.staper IN('1','2') AND

	sno_hsalida.codper=sno_personalnomina.codper AND
	sno_hsalida.codnom=sno_personalnomina.codnom AND

	sno_personalnomina.codasicar=sno_asignacioncargo.codasicar AND
	sno_personalnomina.codnom=sno_asignacioncargo.codnom AND

	sno_hsalida.codnom=sno_hconcepto.codnom AND
	sno_hsalida.codconc=sno_hconcepto.codconc AND
	sno_hsalida.codperi=sno_hconcepto.codperi AND
	sno_hsalida.valsal >0 AND
	--sno_hsalida.codnom IN('0000','0001','0002','0003','0004','0010') AND
	sno_hsalida.codnom IN('0005','0006','0007','0008','0009') AND
	sno_hsalida.codperi BETWEEN '001' AND '005' AND
	sno_hsalida.tipsal <>'R'
GROUP BY
	sno_personal.nacper,
	sno_hsalida.codper,
 	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[1] as x limit 1),
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[2] as x limit 1),
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[3] as x limit 1),
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[4] as x limit 1),
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[5] as x limit 1),
	(select (regexp_split_to_array(sno_personal.nomper,E'\\s+'))[6] as x limit 1),
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[1] as x limit 1),
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[2] as x limit 1),
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[3] as x limit 1),
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[4] as x limit 1),
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[5] as x limit 1),
	(select (regexp_split_to_array(sno_personal.apeper,E'\\s+'))[6] as x limit 1),
	sno_personal.sexper,
	sno_personal.fecingper,
	sno_personalnomina.codded,
	sno_hsalida.codnom,
	sno_asignacioncargo.denasicar,
	--sno_hsalida.codperi,
	sno_hconcepto.nomcon,
	sno_hsalida.tipsal
ORDER BY
	sno_hsalida.codper