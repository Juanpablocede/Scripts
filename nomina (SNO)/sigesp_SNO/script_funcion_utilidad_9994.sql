SELECT
	codper,
	SUM(((valsal)/30)*10)
FROM
	sno_hsalida
WHERE
	codper='0006880620' AND
	codperi='010' AND
	codconc BETWEEN '0000000046' AND '0000000051' AND
	valsal<>0
GROUP BY
	codper
ORDER BY
	codper
