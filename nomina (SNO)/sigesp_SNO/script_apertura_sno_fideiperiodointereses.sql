SELECT 
	codemp,
	codnom,
	codper, 
	2012,
	12,
	0,0,0,0,
	MAX(moncap)
FROM
	sno_fideiperiodointereses 
WHERE
	codper='0006880620'
GROUP BY
	codemp,
	codnom,
	codper 
