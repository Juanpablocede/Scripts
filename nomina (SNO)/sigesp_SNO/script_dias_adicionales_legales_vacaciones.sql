--Determinas los dias adicionales y legales
SELECT
	CASE ((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15)-1
		WHEN (	SELECT ((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15)-1 
			FROM sno_personal WHERE codper='0006880620' AND 
			(((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15))-1 <= 29) THEN 
			((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15)-1

		WHEN (	SELECT ((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15)-1
			FROM sno_personal WHERE codper='0006880620' AND 
			(((extract(year from  (CURRENT_DATE)) - extract(year from fecingper))+15))-1 >= 30) THEN 30
	END
FROM
	sno_personal
WHERE
	codper='0006880620'

