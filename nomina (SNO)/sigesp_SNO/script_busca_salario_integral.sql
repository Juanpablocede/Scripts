select 
	sno_hsalida.codconc,
	sno_hconcepto.nomcon,
	sno_hsalida.codperi,
	sno_hconcepto.sigcon,
	sno_hsalida.valsal
from
	sno_hsalida,
	sno_hconcepto
where 
	sno_hsalida.codconc=sno_hconcepto.codconc and
	sno_hsalida.codperi=sno_hconcepto.codperi and
	sno_hsalida.codnom=sno_hconcepto.codnom and
	sno_hconcepto.sueintcon=1 and
	sno_hsalida.codper='0006880620' and
	sno_hsalida.codperi='006' and
	sno_hsalida.valsal>0

--select * from sno_hconcepto where codnom='0002' and codperi='006' and sueintcon=1