$ls_sql="DELETE FROM sfp_asignacion_personal ".
				 " WHERE ano_presupuesto = ".$as_anopresupuesto." AND escenario = ".$as_escenario."; ".
				 " INSERT INTO sfp_asignacion_personal ".
				 " SELECT ".
						"sno_salida.codemp, ".
						"$as_anopresupuesto, ".
						"sno_unidadadmin.codestpro1, ".
						"sno_unidadadmin.codestpro2, ".
						"sno_unidadadmin.codestpro3, ".
						"sno_unidadadmin.codestpro4, ".
						"sno_unidadadmin.codestpro5, ".
						"sno_unidadadmin.estcla, ".
						"sno_concepto.cueprecon, ".
						"$as_escenario, ".
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND  1), ".
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND  2), ".
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND  3), ".
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND  4), ".
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND  5), ".
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND  6), ".
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND  7), ".
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND  8), ".
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND  9), ".
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND 10), ". 
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND 11), ".
						"SUM(sno_salida.valsal)+SUM(sno_salida.valsal)*(SELECT SUM(porcentaje_sueldo/100) FROM sfP_variables_economicas WHERE ano_presupuesto=".$as_anopresupuesto." AND mes BETWEEN 1 AND 12)  ".
					"FROM ".
						"sno_salida, ".
						"sno_concepto, ".
						"sno_unidadadmin, ".
						"sno_personalnomina ".
					"WHERE ".
						"sno_salida.codnom=sno_concepto.codnom AND ".
						"sno_salida.codconc=sno_concepto.codconc AND ".
						"sno_salida.codnom=sno_personalnomina.codnom AND ".
						"sno_salida.codper=sno_personalnomina.codper AND ".
						"sno_unidadadmin.minorguniadm=sno_personalnomina.minorguniadm AND ".
						"sno_unidadadmin.ofiuniadm=sno_personalnomina.ofiuniadm AND ".
						"sno_unidadadmin.uniuniadm=sno_personalnomina.uniuniadm AND ".
						"sno_unidadadmin.depuniadm=sno_personalnomina.depuniadm AND ".
						"sno_unidadadmin.prouniadm=sno_personalnomina.prouniadm	AND ".
						"sno_salida.codnom BETWEEN '9998' AND '9999' AND ".
						"sno_concepto.sigcon='A' ".
					"GROUP BY ".
						"sno_salida.codemp, ".
						"sno_unidadadmin.codestpro1, ".
						"sno_unidadadmin.codestpro2, ".
						"sno_unidadadmin.codestpro3, ".
						"sno_unidadadmin.codestpro4, ".
						"sno_unidadadmin.codestpro5, ".
						"sno_unidadadmin.estcla, ".
						"sno_concepto.cueprecon ".
					"ORDER BY ".
						"sno_unidadadmin.codestpro2";
