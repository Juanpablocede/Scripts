select
	sno_conceptopersonal.codnom,
	sno_conceptopersonal.codper,
	sno_conceptopersonal.codconc,
	sno_concepto.nomcon,
	sno_hsalida.codperi,
	sno_concepto.sueintcon,
	sno_hsalida.valsal
from 
	sno_conceptopersonal,
	sno_concepto, 
	sno_hsalida
where 
	sno_conceptopersonal.codper='0006880620' and
	sno_conceptopersonal.codconc=sno_concepto.codconc and
	sno_conceptopersonal.codnom=sno_concepto.codnom and
	sno_concepto.sueintcon=1 and 

	sno_conceptopersonal.codnom=sno_hsalida.codnom and
	sno_conceptopersonal.codper=sno_hsalida.codper and
	sno_conceptopersonal.codconc=sno_hsalida.codconc and

	sno_concepto.codnom=sno_hsalida.codnom and
	sno_concepto.codconc=sno_hsalida.codconc and

	sno_hsalida.valsal>0 and

	sno_hsalida.codperi='001' and 
	sno_hsalida.anocur='2013'

order by
	sno_hsalida.codperi
	