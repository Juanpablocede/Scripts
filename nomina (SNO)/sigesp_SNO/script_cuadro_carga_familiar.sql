SELECT 	
	sno_familiar.nexfam,
	sno_familiar.sexfam,
	((current_date-sno_familiar.fecnacfam)/365) as años,
	count(*)
FROM
	sno_personal,
	sno_familiar
WHERE
	sno_personal.estper='1' AND
	sno_personal.codper=sno_familiar.codper AND
	(current_date-sno_familiar.fecnacfam)/365 BETWEEN 0 AND 18
GROUP BY
	sno_familiar.nexfam,
	sno_familiar.sexfam,
	((current_date-sno_familiar.fecnacfam)/365)
ORDER BY
	((current_date-sno_familiar.fecnacfam)/365)
