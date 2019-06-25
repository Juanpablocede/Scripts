--Nomina
UPDATE sno_nomina SET
recdocfid='1',
tipdocfid='00001',
codbenfid='15'
WHERE
	codnom BETWEEN '0000' AND '0010';

--Historico de nomina
UPDATE sno_hnomina SET
recdocfid='1',
tipdocfid='00001',
codbenfid='15'
WHERE
	codnom BETWEEN '0000' AND '0010';
	