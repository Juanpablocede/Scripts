UPDATE sno_concepto SET
sueintcon=1
WHERE
	codnom BETWEEN '0000' AND '0005' AND
	codconc IN('0000009994','0000009995');

UPDATE sno_hconcepto SET
sueintcon=1
WHERE
	codnom BETWEEN '0000' AND '0005' AND
	codconc IN('0000009994','0000009995');

UPDATE sno_concepto SET
sueintcon=1
WHERE
	codnom BETWEEN '0006' AND '0010' AND
	codconc IN('0000009994','0000009995');

UPDATE sno_hconcepto SET
sueintcon=1
WHERE
	codnom BETWEEN '0006' AND '0010' AND
	codconc IN('0000009994','0000009995');