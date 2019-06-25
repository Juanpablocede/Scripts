SELECT
	sno_personal.codper,
	rtrim(sno_personal.apeper)||' '||rtrim(sno_personal.nomper),
	sno_personal.codger,
	srh_gerencia.denger,
	sno_personalnomina.coddep,
	srh_departamento.dendep,
	case sno_personalnomina.staper
		when '1' then 'Activo'
		when '2' then 'Vacaciones'
		when '4' then 'Suspendido'
	end	
FROM
	sno_personal INNER JOIN sno_personalnomina ON sno_personal.codper=sno_personalnomina.codper
	LEFT JOIN srh_gerencia ON sno_personal.codger = srh_gerencia.codger 
	LEFT JOIN srh_departamento ON sno_personalnomina.coddep = srh_departamento.coddep 
where
	sno_personal.codper=sno_personalnomina.codper and
	sno_personalnomina.codnom between '0000' and '0010' and
	sno_personalnomina.staper IN('1','2','4') 

