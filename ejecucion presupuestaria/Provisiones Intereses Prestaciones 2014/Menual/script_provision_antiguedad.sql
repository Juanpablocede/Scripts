SELECT
	sno_personalnomina.depuniadm||sno_personalnomina.prouniadm,
	SUM(sno_fideiperiodointereses.monant)
	
FROM
	sno_fideiperiodointereses,
	sno_personalnomina
WHERE 
	sno_fideiperiodointereses.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom IN('0000','0001','0002','0003','0004','0005') AND
	sno_fideiperiodointereses.anocurper='2014' AND
	sno_fideiperiodointereses.mescurper=1 AND
	sno_personalnomina.staper IN('1','2','4') 
GROUP BY
	sno_personalnomina.depuniadm||sno_personalnomina.prouniadm


--SELECT * FROM sno_nomina ORDER BY codnom
