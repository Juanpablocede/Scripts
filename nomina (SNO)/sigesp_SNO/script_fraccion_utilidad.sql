--select * from sno_hpersonalnomina where codnom='0001' and salnorutilper<>0 order by codper,codperi


SELECT 
	codper,
	codnom,
	codperi,
	SUM(((valsal)/30)*10)

FROM
	sno_hsalida
WHERE
	(codconc='0000000073' OR
	codconc='0000000046' OR
	codconc='0000000049' OR
	codconc='0000000050' OR
	codconc='0000000051' OR
	codconc='0000310001' OR
	codconc='0000310005' OR
	codconc='0000310009' OR
	codconc='0000310045' OR
	codconc='0000310083' OR
	codconc='0000310084' OR
	codconc='0000310085' OR
	codconc='0000310086' OR
	codconc='0000000076') AND
	codnom='0001' AND
	codperi='003'
GROUP BY
	codper,
	codnom,
	codperi



