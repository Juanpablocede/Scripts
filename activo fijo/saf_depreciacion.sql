SELECT SUM(saf_depreciacion.mondepmen) AS monto, SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),1,4) AS anio, ".
				"		SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),6,2) AS mes, 'I' AS estact,  ".
				"		MAX(saf_depreciacion.fechaconta) AS fechaconta, MAX(saf_depreciacion.fechaanula) AS fechaanula  ".
                " FROM saf_depreciacion, saf_activo, saf_dta ".
                " WHERE saf_depreciacion.codemp = '".$ls_codemp."' ".
				"   AND saf_depreciacion.estcon = ".$ai_estatus.
				"   AND saf_activo.estdepact = 1 ".
				"	AND saf_dta.estact <> 'D' ".				
				"  ".$ls_criterio.
				"   AND saf_depreciacion.codemp = saf_activo.codemp ".
				"   AND saf_depreciacion.codact = saf_activo.codact ".
				"   AND saf_depreciacion.codemp = saf_dta.codemp ".
				"   AND saf_depreciacion.codact = saf_dta.codact ".
				"   AND saf_depreciacion.ideact = saf_dta.ideact ".
				" GROUP BY saf_depreciacion.fecdep ".
				" UNION ".
				"SELECT SUM((saf_depreciacion.mondepmen/30)*CAST(SUBSTR(CAST(saf_dta.fecdesact as char(10)),8,2) AS INT)) AS monto, SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),1,4) AS anio, ".
				"		SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),6,2) AS mes, 'D' AS estact,  ".
				"		MAX(saf_depreciacion.fechaconta) AS fechaconta, MAX(saf_depreciacion.fechaanula) AS fechaanula  ".
                " FROM saf_depreciacion, saf_activo, saf_dta ".
                " WHERE saf_depreciacion.codemp = '".$ls_codemp."' ".
				"   AND saf_depreciacion.estcon = ".$ai_estatus.
				"   AND saf_activo.estdepact = 1 ".
				"	AND saf_dta.estact = 'D' ".				
				"  ".$ls_criterio.
				"   AND SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),6,2) = SUBSTR(CAST(saf_dta.fecdesact as char(10)),6,2) ".
				"   AND SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),1,4) = SUBSTR(CAST(saf_dta.fecdesact as char(10)),1,4) ".
				"   AND saf_depreciacion.codemp = saf_activo.codemp ".
				"   AND saf_depreciacion.codact = saf_activo.codact ".
				"   AND saf_depreciacion.codemp = saf_dta.codemp ".
				"   AND saf_depreciacion.codact = saf_dta.codact ".
				"   AND saf_depreciacion.ideact = saf_dta.ideact ".
				" GROUP BY saf_depreciacion.fecdep ".
				" UNION ".
				"SELECT SUM(saf_depreciacion.mondepmen) AS monto, SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),1,4) AS anio, ".
				"		SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),6,2) AS mes, 'D' AS estact,  ".
				"		MAX(saf_depreciacion.fechaconta) AS fechaconta, MAX(saf_depreciacion.fechaanula) AS fechaanula  ".
                " FROM saf_depreciacion, saf_activo, saf_dta ".
                " WHERE saf_depreciacion.codemp = '".$ls_codemp."' ".
				"   AND saf_depreciacion.estcon = ".$ai_estatus.
				"   AND saf_activo.estdepact = 1 ".
				"	AND saf_dta.estact = 'D' ".				
				"  ".$ls_criterio.
				"   AND SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),6,2) < SUBSTR(CAST(saf_dta.fecdesact as char(10)),6,2) ".
				"   AND SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),1,4) <= SUBSTR(CAST(saf_dta.fecdesact as char(10)),1,4) ".
				"   AND saf_depreciacion.codemp = saf_activo.codemp ".
				"   AND saf_depreciacion.codact = saf_activo.codact ".
				"   AND saf_depreciacion.codemp = saf_dta.codemp ".
				"   AND saf_depreciacion.codact = saf_dta.codact ".
				"   AND saf_depreciacion.ideact = saf_dta.ideact ".
				" GROUP BY saf_depreciacion.fecdep ".
				" ORDER BY mes ";

$ls_criterio=$ls_criterio." AND SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),6,2) = '".$as_mes."' ";

$ls_criterio=$ls_criterio." AND SUBSTR(CAST(saf_depreciacion.fecdep as char(10)),1,4) = '".$as_ano."'";




