SELECT
	srh_gerencia.denger,
	COUNT(sno_personal.codger) as personas
FROM
	sno_personal
	--FULL OUTER JOIN srh_gerencia ON srh_gerencia.codger=sno_personal.codger
	--RIGHT OUTER JOIN srh_gerencia ON srh_gerencia.codger=sno_personal.codger
	--RIGHT JOIN srh_gerencia ON srh_gerencia.codger=sno_personal.codger
	LEFT JOIN srh_gerencia ON srh_gerencia.codger=sno_personal.codger
	--LEFT OUTER JOIN srh_gerencia ON srh_gerencia.codger=sno_personal.codger
GROUP BY
	srh_gerencia.denger
ORDER BY
	personas,
	srh_gerencia.denger


	--select * from sno_personal where codper='0000004700'
	--select * from srh_gerencia where codger='0000004700'
	