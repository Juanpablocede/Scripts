SELECT 
	MAX(anocurper) AS anocurper,  
	( 	SELECT 
			MAX(mescurper) AS mescurper 
		FROM 
			sno_fideiperiodointereses T2
		WHERE 
			T2.anocurper= MAX(T1.anocurper))
FROM 
	sno_fideiperiodointereses T1
WHERE 
	T1.codemp='0001'
