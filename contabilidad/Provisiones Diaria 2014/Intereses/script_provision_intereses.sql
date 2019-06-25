SELECT
	sno_personalnomina.depuniadm||sno_personalnomina.prouniadm,
	SUM(sno_fideiperiodointereses.monint)
	
FROM
	sno_fideiperiodointereses,
	sno_personalnomina
WHERE 
	sno_fideiperiodointereses.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom IN('0006','0007','0008','0009','0010') AND
	sno_fideiperiodointereses.mescurper=6 AND
	sno_personalnomina.staper IN('1','2','4') 
GROUP BY
	sno_personalnomina.depuniadm||sno_personalnomina.prouniadm
