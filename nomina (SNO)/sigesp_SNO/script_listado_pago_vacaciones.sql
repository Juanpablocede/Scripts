select
	sno_hsalida.codper,
	rtrim(sno_personal.nomper)||' '||rtrim(sno_personal.apeper) as nombres,
	sno_hsalida.codnom,
	sno_nomina.desnom,
	sno_hsalida.codperi,
	sno_hsalida.codconc,
	sno_concepto.nomcon,
	sno_hsalida.valsal
from
	sno_hsalida,
	sno_concepto,
	sno_personal,
	sno_nomina
where
	sno_hsalida.codnom=sno_concepto.codnom and
	sno_hsalida.codconc=sno_concepto.codconc and
	sno_hsalida.codconc='0000003001' and
	sno_hsalida.codnom=sno_nomina.codnom and
	sno_concepto.codnom=sno_nomina.codnom and
	sno_hsalida.codper=sno_personal.codper and
	sno_hsalida.valsal>0 
order by
	sno_hsalida.codperi