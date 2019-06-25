SELECT
	sno_hpersonalnomina.codper,
	sno_personal.apeper,
	sno_personal.nomper,
	sno_hpersonalnomina.sueper,
	sno_hpersonalnomina.codperi,
	sno_hpersonalnomina.codnom
FROM
	sno_hpersonalnomina,
	sno_personal
WHERE
	sno_hpersonalnomina.codper=sno_personal.codper AND
	sno_hpersonalnomina.codnom BETWEEN '0000' AND '0010' AND
	sno_hpersonalnomina.staper IN('1','2','4') AND 
	(sno_hpersonalnomina.codper='0004036525' OR
	sno_hpersonalnomina.codper='0003958622' OR
	sno_hpersonalnomina.codper='0002542126' OR
	sno_hpersonalnomina.codper='0004595789' OR
	sno_hpersonalnomina.codper='0003571921' OR
	sno_hpersonalnomina.codper='0005357895' OR
	sno_hpersonalnomina.codper='0004715488' OR
	sno_hpersonalnomina.codper='0001509777' OR
	sno_hpersonalnomina.codper='0004062872' OR
	sno_hpersonalnomina.codper='0003340644' OR
	sno_hpersonalnomina.codper='0004935510' OR
	sno_hpersonalnomina.codper='0004337447' OR
	sno_hpersonalnomina.codper='0005391788' OR
	sno_hpersonalnomina.codper='0008522839' OR
	sno_hpersonalnomina.codper='0006614655' OR
	sno_hpersonalnomina.codper='0004625189' OR
	sno_hpersonalnomina.codper='0004665288' OR
	sno_hpersonalnomina.codper='0008531169' OR
	sno_hpersonalnomina.codper='0004701119' OR
	sno_hpersonalnomina.codper='0008549248' OR
	sno_hpersonalnomina.codper='0001958270' OR
	sno_hpersonalnomina.codper='0008936600' OR
	sno_hpersonalnomina.codper='0008366402' OR
	sno_hpersonalnomina.codper='0004715489' OR
	sno_hpersonalnomina.codper='0003853652' OR
	sno_hpersonalnomina.codper='0008928445' OR
	sno_hpersonalnomina.codper='0008954908')
ORDER BY
	sno_hpersonalnomina.codper,
	sno_hpersonalnomina.codperi
