SELECT
	sno_fideiperiodointereses.codper,
	rtrim(sno_personal.apeper)||' '||rtrim(sno_personal.nomper) as nombres,
	sno_fideiperiodointereses.codnom,
	sno_fideiperiodointereses.anocurper,
	sno_fideiperiodointereses.mescurper,
	sno_fideiperiodointereses.monint
FROM
	sno_fideiperiodointereses,
	sno_fideiperiodo,
	sno_personal
WHERE
	sno_fideiperiodointereses.codper=sno_fideiperiodo.codper AND
	sno_fideiperiodointereses.codnom=sno_fideiperiodo.codnom AND
	sno_fideiperiodointereses.anocurper=sno_fideiperiodo.anocurper AND
	sno_fideiperiodointereses.mescurper=sno_fideiperiodo.mescurper AND
	sno_fideiperiodo.bonfinper>0 AND
	sno_fideiperiodointereses.codper=sno_personal.codper AND
	sno_fideiperiodointereses.anocurper='2014' AND
	sno_fideiperiodointereses.mescurper BETWEEN 7 AND 12
ORDER BY
	sno_fideiperiodointereses.codper,
	sno_fideiperiodointereses.anocurper,
	sno_fideiperiodointereses.mescurper

	