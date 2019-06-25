select 
	sno_fideiperiodointereses.codper,
	antiguedad_acumulada.acumulada,
	sno_fideiperiodointereses.monantacu as disponible,
	sno_anticipoprestaciones.anticipos,
	sno_fideiperiodointereses01.intereses
from 
	sno_fideiperiodointereses,
	(select 
		sno_deudaanterior.codper,
		(sno_deudaanterior.monpreant+ antiguedadtotal.apoper) as acumulada
		
	from 
		sno_deudaanterior,
		(select sno_fideiperiodo.codper,sum(sno_fideiperiodo.apoper) as apoper from sno_fideiperiodo group by sno_fideiperiodo.codper)  antiguedadtotal

	where 
		sno_deudaanterior.codper=antiguedadtotal.codper
	order by 
		sno_deudaanterior.codper) antiguedad_acumulada,
	(select
		sno_anticipoprestaciones.codper,
		(sno_deudaanterior.monant +sno_anticipoprestaciones.monant) as anticipos
	from
		(select sno_anticipoprestaciones.codper,sum(sno_anticipoprestaciones.monant) as monant from sno_anticipoprestaciones group by sno_anticipoprestaciones.codper ) sno_anticipoprestaciones,
		 sno_deudaanterior
	where 
		sno_anticipoprestaciones.codper=sno_deudaanterior.codper
	) sno_anticipoprestaciones,

	(select
		sno_fideiperiodointereses.codper,
		sum(sno_fideiperiodointereses.monint) as intereses
	from
		sno_fideiperiodointereses
	group by 
		sno_fideiperiodointereses.codper) sno_fideiperiodointereses01
where 
	sno_fideiperiodointereses.anocurper='2015' and
	sno_fideiperiodointereses.mescurper='12' and
	sno_anticipoprestaciones.codper = sno_fideiperiodointereses.codper and
	sno_fideiperiodointereses01.codper = sno_fideiperiodointereses.codper and
	antiguedad_acumulada.codper= sno_fideiperiodointereses.codper
order by 
	sno_fideiperiodointereses.codper


