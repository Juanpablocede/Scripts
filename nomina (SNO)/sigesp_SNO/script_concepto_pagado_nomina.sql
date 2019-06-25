select 
	sno_hsalida.codper,
	rtrim(sno_personal.apeper)||' '||rtrim(sno_personal.nomper),
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.valsal,
	sno_hsalida.codperi
from 
	sno_hsalida,
	sno_hconcepto,
	sno_personal
where 
	sno_hsalida.codconc=sno_hconcepto.codconc and
	sno_hsalida.codperi=sno_hconcepto.codperi and
	sno_hsalida.codnom=sno_hconcepto.codnom and
	sno_hsalida.codper=sno_personal.codper and
	sno_hsalida.valsal>=20000 and 
	sno_hsalida.tipsal='A' 
order by
	sno_hsalida.codconc