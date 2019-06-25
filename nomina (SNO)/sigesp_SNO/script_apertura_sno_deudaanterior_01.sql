SELECT
	sno_deudaanterior.codemp,
	sno_deudaanterior.codper,
	'2012-12-31',
	sno_deudaanterior.monpreant+
	(SELECT SUM(sno_fideiperiodo.apoper) FROM sno_fideiperiodo WHERE sno_deudaanterior.codper=sno_fideiperiodo.codper) AS monpreant,
	0,
	sno_deudaanterior.monant+
	(SELECT SUM(sno_anticipoprestaciones.monant) FROM sno_anticipoprestaciones WHERE sno_deudaanterior.codper=sno_anticipoprestaciones.codper) AS monant
	

FROM
	sno_deudaanterior
WHERE
	codper='0002639376'
