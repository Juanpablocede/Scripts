UPDATE sno_hpersonalnomina SET 
sueintper=(CASE WHEN 
		(SELECT 
			SUM(CASE 
				WHEN 
					sno_hsalida.valsal IS NOT NULL THEN sno_hsalida.valsal ELSE 0 
				END) 
		FROM 
			sno_hsalida, 
			sno_hconcepto 
		WHERE 
			sno_hsalida.codemp='0001' AND 
			sno_hconcepto.sueintcon=1 AND 
			sno_hsalida.codemp=sno_hconcepto.codemp AND 
			sno_hsalida.codnom=sno_hconcepto.codnom AND 
			sno_hsalida.anocur=sno_hconcepto.anocur AND 
			sno_hsalida.codperi=sno_hconcepto.codperi AND 
			sno_hsalida.codconc=sno_hconcepto.codconc AND 
			sno_hsalida.codemp=sno_hpersonalnomina.codemp AND 
			sno_hsalida.codnom=sno_hpersonalnomina.codnom AND 
			sno_hsalida.anocur=sno_hpersonalnomina.anocur AND 
			sno_hsalida.codperi=sno_hpersonalnomina.codperi AND 
			sno_hsalida.codper=sno_hpersonalnomina.codper 
		GROUP BY 
			sno_hsalida.codper ) 

		IS NOT NULL THEN 
			(SELECT 
				SUM(CASE 
					WHEN 
						sno_hsalida.valsal IS NOT NULL THEN sno_hsalida.valsal 
					ELSE 
						0 
					END) 
			FROM 
				sno_hsalida, 
				sno_hconcepto 
			WHERE 
				sno_hsalida.codemp='0001' AND 
				sno_hconcepto.sueintcon=1 AND 
				sno_hsalida.codemp=sno_hconcepto.codemp AND 
				sno_hsalida.codnom=sno_hconcepto.codnom AND 
				sno_hsalida.anocur=sno_hconcepto.anocur AND 
				sno_hsalida.codperi=sno_hconcepto.codperi AND 
				sno_hsalida.codconc=sno_hconcepto.codconc AND 
				sno_hsalida.codemp=sno_hpersonalnomina.codemp AND 
				sno_hsalida.codnom=sno_hpersonalnomina.codnom AND 
				sno_hsalida.anocur=sno_hpersonalnomina.anocur AND 
				sno_hsalida.codperi=sno_hpersonalnomina.codperi AND 
				sno_hsalida.codper=sno_hpersonalnomina.codper 
			GROUP BY 
				sno_hsalida.codper ) 
		ELSE 0 END)

