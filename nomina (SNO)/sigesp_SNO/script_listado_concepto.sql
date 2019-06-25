SELECT
	codnom,
	codconc,
	nomcon,
	titcon,
	forcon,
	sigcon,
	glocon,
	aplisrcon,
	sueintcon,
	sueintvaccon,
	aplarccon,
	persalnor,
	aplisalnorutilidad
FROM
	sno_concepto
WHERE
	codnom BETWEEN '0000' and '0010'
ORDER BY
	codnom,
	codconc
