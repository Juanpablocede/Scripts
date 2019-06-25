select
	sno_personal.codper,
	rtrim(sno_personal.nomper)||' '||rtrim(sno_personal.apeper),
	sno_personalnomina.sueper,
	sno_personalnomina.codasicar,
	sno_asignacioncargo.denasicar,
	sno_personalnomina.codnom
from
	sno_personal,
	sno_personalnomina,
	sno_asignacioncargo
where
	sno_personal.codper=sno_personalnomina.codper and
	sno_personalnomina.codnom=sno_asignacioncargo.codnom and
	sno_personalnomina.codasicar=sno_asignacioncargo.codasicar and
	(sno_personalnomina.staper='1' or sno_personalnomina.staper='2') and
	sno_personalnomina.codnom between '0000' and '0010' and
	sno_asignacioncargo.denasicar like '%JEFE%'
order by
	
	sno_personalnomina.sueper