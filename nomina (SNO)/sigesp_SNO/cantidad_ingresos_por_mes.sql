SELECT
	EXTRACT(MONTH FROM sno_personal.fecingper),
	CASE EXTRACT(MONTH FROM sno_personal.fecingper)
		WHEN 1 THEN 'Enero'
		WHEN 2 THEN 'Febrero'
		WHEN 3 THEN 'Marzo'
		WHEN 4 THEN 'Abril'
		WHEN 5 THEN 'Mayo'
		WHEN 6 THEN 'Junio'
		WHEN 7 THEN 'Julio'
		WHEN 8 THEN 'Agosto'
		WHEN 9 THEN 'Septiembre'
		WHEN 10 THEN 'Octubre'
		WHEN 11 THEN 'Noviembre'
		WHEN 12 THEN 'Diciembre'
    END AS mes,
    COUNT(*) as cantidad
FROM
    sno_personal,
    sno_personalnomina
WHERE
    sno_personal.codper=sno_personalnomina.codper and
    sno_personalnomina.codnom between '0000' and '0012' and
    --sno_personalnomina.staper IN('1','2') and
    sno_personal.fecingper between '2018-01-01' and '2018-07-31'
GROUP BY
    EXTRACT(MONTH FROM sno_personal.fecingper),mes
ORDER BY
    EXTRACT(MONTH FROM sno_personal.fecingper)