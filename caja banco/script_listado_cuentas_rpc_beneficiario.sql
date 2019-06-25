SELECT
	sno_personal.codper,
	sno_personal.cedper,
	rpc_beneficiario.ced_bene,
	rtrim(sno_personal.nomper)||' '||rtrim(sno_personal.apeper),
	sno_personalnomina.codban,
	sno_personalnomina.codcueban,
	rpc_beneficiario.codban,
	rpc_beneficiario.ctaban
FROM
	sno_personalnomina,
	sno_personal,
	rpc_beneficiario
WHERE
	sno_personalnomina.codper=sno_personal.codper AND
	sno_personal.cedper=rpc_beneficiario.ced_bene AND
	((sno_personalnomina.codnom BETWEEN '0000' AND '0012') OR
	sno_personalnomina.codnom='1000') 


	