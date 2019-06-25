UPDATE rpc_beneficiario SET
codban=sno_personalnomina.codban,
ctaban=sno_personalnomina.codcueban
FROM
	sno_personalnomina,
	sno_personal
WHERE
	sno_personalnomina.codper=sno_personal.codper AND
	sno_personal.cedper=rpc_beneficiario.ced_bene AND
	((sno_personalnomina.codnom BETWEEN '0000' AND '0012') OR
	sno_personalnomina.codnom='1000') 