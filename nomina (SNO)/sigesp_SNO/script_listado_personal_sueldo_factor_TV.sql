select
	sno_hpersonalnomina.codper,
	rtrim(sno_personal.apeper)||'  '||rtrim(sno_personal.nomper),
	sno_hpersonalnomina.codnom,
	sno_hpersonalnomina.codperi,
	sno_hpersonalnomina.sueper,
	sno_ubicacionfisica.tietras,
	sno_hpersonalnomina.staper
from
	sno_hpersonalnomina,
	sno_personal,
	sno_ubicacionfisica
where
	sno_hpersonalnomina.codper=sno_personal.codper and
	sno_hpersonalnomina.codnom between '0006' and '0010' and
	(sno_hpersonalnomina.staper ='1' or sno_hpersonalnomina.staper='2') and
	sno_hpersonalnomina.codubifis=sno_ubicacionfisica.codubifis and 
	sno_hpersonalnomina.codperi between '001' and '009'
order by
	sno_hpersonalnomina.codnom,
	sno_hpersonalnomina.codperi

