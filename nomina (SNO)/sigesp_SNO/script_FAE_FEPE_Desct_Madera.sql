SELECT
	sno_hsalida.codper,
	RTRIM(sno_personal.apeper)||' '||RTRIM(sno_personal.nomper),
	sno_hsalida.codconc,
	sno_concepto.nomcon,
	sno_hsalida.valsal*-1,
	sno_hsalida.codnom,
	sno_hsalida.codperi,
	sno_periodo.fecdesper,
	sno_periodo.fechasper
FROM
	sno_hsalida,
	sno_personal,
	sno_concepto,
	sno_periodo
WHERE
	sno_hsalida.codper=sno_personal.codper AND
	sno_hsalida.codnom=sno_concepto.codnom AND
	sno_hsalida.codconc=sno_concepto.codconc AND
	sno_hsalida.codnom=sno_periodo.codnom AND
	sno_hsalida.codperi=sno_periodo.codperi AND
	sno_hsalida.codconc='0000004109' AND
	sno_hsalida.codnom BETWEEN '0000' AND '0010'
ORDER BY
	sno_hsalida.codperi