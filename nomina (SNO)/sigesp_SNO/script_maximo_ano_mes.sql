--SELECT * FROM sno_fideiperiodo WHERE codper='0003045245'

SELECT 
	sno_fideiperiodo.codper,
	MAX(sno_fideiperiodo.anocurper),
	(SELECT
		MAX(sno_fideiperiodo_02.mescurper)
	 FROM
		sno_fideiperiodo AS sno_fideiperiodo_02
	 WHERE
		sno_fideiperiodo.codper=sno_fideiperiodo_02.codper AND
		sno_fideiperiodo_02.anocurper=MAX(sno_fideiperiodo.anocurper))
FROM 
	sno_fideiperiodo 
WHERE 
	sno_fideiperiodo.codper='0003045245'
GROUP BY
	sno_fideiperiodo.codper