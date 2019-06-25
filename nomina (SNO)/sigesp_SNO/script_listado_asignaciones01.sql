select 
	sno_personal.codper,
	sno_personal.nomper,
	sno_personal.apeper,
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.tipsal,
	sno_hsalida.valsal,
	sno_hsalida.codnom,
	sno_hsalida.codperi,
	sno_hperiodo.fecdesper,
	sno_hperiodo.fechasper
from
	sno_personal,
	sno_hsalida,
	sno_hconcepto,
	sno_hperiodo
where
	sno_hsalida.codper=sno_personal.codper and
	sno_hsalida.codnom=sno_hconcepto.codnom and
	sno_hsalida.codperi=sno_hconcepto.codperi and
	sno_hsalida.codconc=sno_hconcepto.codconc and
	sno_hconcepto.sigcon='A' and
	sno_hsalida.codperi=sno_hperiodo.codperi and
	sno_hsalida.codnom=sno_hperiodo.codnom and
	(sno_personal.codper='0018385504' or
	 sno_personal.codper='0016389329' or
	 sno_personal.codper='0015902955' or
	 sno_personal.codper='0013570145') and
	sno_hsalida.valsal>0 and
	sno_hsalida.codnom between '0000' and '0012'
order by
	sno_hsalida.codperi,
	sno_hsalida.codconc
	
	
