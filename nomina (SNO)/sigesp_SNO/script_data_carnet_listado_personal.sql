﻿SELECT
	sno_personal.nacper||'-'||to_char(sno_personal.cedper::numeric,'99G999G999'),
	(SELECT regexp_split_to_table(sno_personal.nomper,E'\\s+') as x limit 1) AS nombre,
	(SELECT regexp_split_to_table(sno_personal.apeper,E'\\s+') as x limit 1) AS apellido,
	sno_personal.fecingper,
	sno_asignacioncargo.denasicar,
	sno_personal.codger,
	srh_gerencia.denger,
	SUBSTRING(sno_personalnomina.coddep,12,4) AS CENTRO_COSTO,
	srh_departamento.dendep,
	sno_personalnomina.codnom,
	sno_nomina.desnom,
	CASE sno_ubicacionfisica.desubifis
		WHEN 'ANACO-CAMPAMENTO FORESTAL MARIPA' 				THEN '10'
		WHEN 'ANZOATEGUI-CAMPAMENTO ATAPIRIRE' 					THEN '02'
		WHEN 'ARAGUA DE MATURIN-CAMPAMENTO FORESTAL UVERITO' 			THEN '12'
		WHEN 'ARAGUA DE MATURIN-SAN ANTONIO DE CAPAYACUAR' 			THEN '13'
		WHEN 'ATAPIRIRE-CAMPAMENTO ATAPIRIRE' 					THEN '02'
		WHEN 'ATAPIRIRE-CAMPAMENTO CENTELLA' 					THEN '04'
		WHEN 'ATAPIRIRE-CAMPAMENTO LA ISABEL' 					THEN '08'
		WHEN 'ATAPIRIRE-CAMPAMENTO LOS HACHOS' 					THEN '09'
		WHEN 'ATAPIRIRE-TORRE' 							THEN '05'
		WHEN 'BARINAS-BARINAS' 							THEN '03'
		WHEN 'BARRANCAS DEL ORINOCO-CAMPAMENTO FORESTAL CHAGUARAMAS' 		THEN '05'
		WHEN 'BARRANCAS DEL ORINOCO-CAMPAMENTO FORESTAL EL MEREY' 		THEN '07'
		WHEN 'BARRANCAS -CAMPAMENTO FORESTAL EL MEREY' 				THEN '07'
		WHEN 'BARRANCAS-CAMPAMENTO FORESTAL EL MEREY'				THEN '07'
		WHEN 'BARRANCAS DEL ORINOCO-CAMPAMENTO FORESTAL UVERITO' 		THEN '12'
		WHEN 'BARRANCAS DEL ORINOCO-ASERRADERO UVERITO' 			THEN '01'
		WHEN 'CAFETERA- ASERRADERO UVERITO' 					THEN '01'
		WHEN 'CAFETERA-CAMPAMENTO FORESTAL CHAGUARAMAS' 			THEN '05'
		WHEN 'CAFETERA-CAMPAMENTO FORESTAL EL MEREY' 				THEN '07'
		WHEN 'CAFETERA-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		WHEN 'CAFETERA-TORRE' 							THEN '05'
		WHEN 'CARACAS-CAMPAMENTO FORESTAL CHAGUARAMAS' 				THEN '05'
		WHEN 'CARACAS-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		WHEN 'CARACAS-OFICINA DE PUERTO ORDAZ' 					THEN '15'
		WHEN 'CENTELLA-CAMPAMENTO CENTELLA' 					THEN '04'
		WHEN 'CHAGUARAMAS-ASERRADERO UVERITO' 					THEN '01'
		WHEN 'CHAGUARAMAS-CAMPAMENTO FORESTAL CHAGUARAMAS' 			THEN '05'
		WHEN 'CHAGUARAMAS-CAMPAMENTO FORESTAL EL MEREY' 			THEN '07'
		WHEN 'CHAGUARAMAS-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		WHEN 'CHAGUARAMAS-TORRE' 						THEN '05'
		WHEN 'CHURUGUARA-HUERTO SANTA CRUZ DE BUCARAL' 				THEN '14'
		WHEN 'CIUDAD BOLIVAR-ASERRADERO UVERITO' 				THEN '01'
		WHEN 'CIUDAD BOLIVAR-CAMPAMENTO FORESTAL CHAGUARAMAS' 			THEN '05'
		WHEN 'CIUDAD BOLIVAR-CAMPAMENTO FORESTAL COLORADITO' 			THEN '06'
		WHEN 'CIUDAD BOLIVAR-CAMPAMENTO FORESTAL EL MEREY' 			THEN '07'
		WHEN 'CIUDAD BOLIVAR-CAMPAMENTO FORESTAL UVERITO' 			THEN '12'
		WHEN 'CIUDAD BOLIVAR-CAMPAMENTO LOS HACHOS' 				THEN '09'
		WHEN 'CIUDAD BOLIVAR-OFICINA DE PUERTO ORDAZ' 				THEN '15'
		WHEN 'CIUDAD BOLÍVAR - CAMPAMENTO FORESTAL MARIPA' 			THEN '10'
		WHEN 'COLORADITO-CAMPAMENTO FORESTAL COLORADITO' 			THEN '06'
		WHEN 'COLORADITO-CAMPAMENTO LA ISABEL' 					THEN '08'
		WHEN 'COLORADITO-CAMPAMENTO LOS HACHOS' 				THEN '09'
		WHEN 'EL AMPARO - ASERRADERO UVERITO' 					THEN '01'
		WHEN 'EL AMPARO - CAMPAMENTO FORESTAL UVERITO' 				THEN '03'
		WHEN 'EL TIGRE-CAMPAMENTO ATAPIRIRE' 					THEN '10'
		WHEN 'EL TIGRE-CAMPAMENTO FORESTAL CHAGUARAMAS' 			THEN '12'
		WHEN 'EL TIGRE-CAMPAMENTO FORESTAL COLORADITO' 				THEN '06'
		WHEN 'EL TIGRE-CAMPAMENTO FORESTAL EL MEREY' 				THEN '07'
		WHEN 'EL TIGRE-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		WHEN 'EL TIGRE-CAMPAMENTO LA ISABEL' 					THEN '08'
		WHEN 'EL TIGRE-CAMPAMENTO LOS HACHOS' 					THEN '09'
		WHEN 'EL TIGRITO-CAMPAMENTO FORESTAL COLORADITO' 			THEN '06'
		WHEN 'EL TRIUNFO - CAMPAMENTO FORESTAL CHAGUARAMAS' 			THEN '05'
		WHEN 'EL TRIUNFO - CAMPAMENTO FORESTAL UVERITO' 			THEN '12'
		WHEN 'GUARICO-CAMPAMENTO FORESTAL CHAGUARAMAS' 				THEN '05'
		WHEN 'GUASDUALITO-GUASDUALITO' 						THEN '11'
		WHEN 'GUASDUALITO-SAN FERNANDO DE APURE' 				THEN '11'
		WHEN 'GURI-CAMPAMENTO FORESTAL CHAGUARAMAS' 				THEN '05'
		WHEN 'LA PASTORA-BANCO DE LA VELA CAMPAMENTO FORESTAL MARIPA' 		THEN '10'
		WHEN 'LOS BARRANCOS DE FAJARDO-ASERRADERO UVERITO' 			THEN '01'
		WHEN 'LOS BARRANCOS DE FAJARDO- CAMPAMENTO FORESTAL CHAGUARAMAS' 	THEN '05'
		WHEN 'LOS BARRANCOS DE FAJARDO-CAMPAMENTO FORESTAL COLORADITO' 		THEN '06'
		WHEN 'LOS BARRANCOS DE FAJARDO-CAMPAMENTO FORESTAL EL MEREY' 		THEN '07'
		WHEN 'LOS BARRANCOS DE FAJARDO-CAMPAMENTO FORESTAL UVERITO' 		THEN '12'
		WHEN 'LOS HACHOS-CAMPAMENTO FORESTAL COLORADITO' 			THEN '06'
		WHEN 'LOS HACHOS-CAMPAMENTO LA ISABEL' 					THEN '08'
		WHEN 'LOS HACHOS-CAMPAMENTO LOS HACHOS' 				THEN '09'
		WHEN 'LOS POZOS-ASERRADERO UVERITO' 					THEN '01'
		WHEN 'LOS POZOS- CAMPAMENTO FORESTAL CHAGUARAMAS' 			THEN '05'
		WHEN 'LOS POZOS-CAMPAMENTO FORESTAL EL MEREY' 				THEN '07'
		WHEN 'LOS POZOS-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		WHEN 'MACANILLA-CAMPAMENTO PUERTO PAEZ' 				THEN '11'
		WHEN 'MARACAIBO-OFICINA MARACAIBO' 					THEN '00'
		WHEN 'MARIPA-CAMPAMENTO FORESTAL MARIPA' 				THEN '10'
		WHEN 'MATURIN-ASERRADERO UVERITO' 					THEN '01'
		WHEN 'MATURIN-CAMPAMENTO ATAPIRIRE' 					THEN '02'
		WHEN 'MATURIN-CAMPAMENTO CENTELLA' 					THEN '04'
		WHEN 'MATURIN-CAMPAMENTO FORESTAL CHAGUARAMAS' 				THEN '05'
		WHEN 'MATURIN-CAMPAMENTO FORESTAL COLORADITO' 				THEN '06'
		WHEN 'MATURIN-CAMPAMENTO FORESTAL EL MEREY' 				THEN '07'
		WHEN 'MATURIN-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		WHEN 'MATURIN-CAMPAMENTO LOS HACHOS' 					THEN '09'
		WHEN 'MATURIN-SAN ANTONIO DE CAPAYACUAR' 				THEN '13'
		WHEN 'MATURÍN-CAMPAMENTO FORESTAL MARIPA' 				THEN '10'
		WHEN 'MERIDA-CAMPAMENTO FORESTAL CHAGUARAMAS' 				THEN '05'
		WHEN 'MERIDA-CAMPAMENTO LA ISABEL' 					THEN '08'
		WHEN 'PASO NUEVO-ASERRADERO UVERITO' 					THEN '01'
		WHEN 'PASO NUEVO-CAMPAMENTO FORESTAL CHAGUARAMAS' 			THEN '05'
		WHEN 'PASO NUEVO-CAMPAMENTO FORESTAL EL MEREY' 				THEN '07'
		WHEN 'PASO NUEVO-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		WHEN 'PERNOTA EN EL CAMPAMENTO' 					THEN '00'
		WHEN 'PERNOTA EN EL CAMPAMENTO-ASERRADERO UVERITO' 			THEN '02'
		WHEN 'PORTUGUESA-OFICINA PORTUGUESA' 					THEN '00'
		WHEN 'POZO VERDE - CAMPAMENTO FORESTAL CHAGUARAMAS' 			THEN '05'
		WHEN 'POZO VERDE - CAMPAMENTO FORESTAL UVERITO' 			THEN '12'
		WHEN 'PUERTO ORDAZ-ASERRADERO UVERITO' 					THEN '01'
		WHEN 'PUERTO ORDAZ-CAMPAMENTO ATAPIRIRE' 				THEN '02'
		WHEN 'PUERTO ORDAZ - CAMPAMENTO FORESTAL CHAGUARAMAS' 			THEN '05'
		WHEN 'PUERTO ORDAZ-CAMPAMENTO FORESTAL COLORADITO' 			THEN '06'
		WHEN 'PUERTO ORDAZ-CAMPAMENTO FORESTAL EL MEREY' 			THEN '07'
		WHEN 'PUERTO ORDAZ-CAMPAMENTO FORESTAL MARIPA' 				THEN '10'
		WHEN 'PUERTO ORDAZ-CAMPAMENTO FORESTAL UVERITO' 			THEN '12'
		WHEN 'PUERTO ORDAZ-CAMPAMENTO LOS HACHOS' 				THEN '09'
		WHEN 'PUERTO ORDAZ-CHAGUARAMAS' 					THEN '05'
		WHEN 'PUERTO ORDAZ-HUERTO SANTA CRUZ DE BUCARAL' 			THEN '14'
		WHEN 'PUERTO ORDAZ-OFICINA DE PUERTO ORDAZ' 				THEN '15'
		WHEN 'PUERTO ORDAZ-TORRE' 						THEN '05'
		WHEN 'PUERTO PAEZ-CAMPAMENTO FORESTAL PUERTO PAEZ' 			THEN '11'
		WHEN 'PUERTO PAEZ-GUADUALITO' 						THEN '11'
		WHEN 'PUERTO PAEZ-PUERTO PAEZ' 						THEN '11'
		WHEN 'PUNTA DE PIEDRA - CAMPAMENTO FORESTAL CHAGUARAMAS' 		THEN '05'
		WHEN 'PUNTA DE PIEDRA - CAMPAMENTO FORESTAL UVERITO' 			THEN '12'
		WHEN 'SAN ANTONIO-SAN ANTONIO DE CAPAYACUAR' 				THEN '13'
		WHEN 'SAN FELIX-ASERRADERO UVERITO' 					THEN '01'
		WHEN 'SAN FELIX-CAMPAMENTO ATAPIRIRE' 					THEN '02'
		WHEN 'SAN FELIX-CAMPAMENTO FORESTAL CHAGUARAMAS' 			THEN '05'
		WHEN 'SAN FELIX-CAMPAMENTO FORESTAL COLORADITO' 			THEN '06'
		WHEN 'SAN FELIX-CAMPAMENTO FORESTAL EL MEREY' 				THEN '07'
		WHEN 'SAN FELIX-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		WHEN 'SAN FELIX-CAMPAMENTO LOS HACHOS' 					THEN '09'
		WHEN 'SAN FELIX-OFICINA DE PUERTO ORDAZ' 				THEN '15'
		WHEN 'SAN FELIX-TORRE' 							THEN '05'
		WHEN 'SAN FERNANDO DE APURE-CAMPAMENTO PUERTO PAEZ' 			THEN '11'
		WHEN 'SAN FERNANDO DE APURE-GUASDUALITO' 				THEN '11'
		WHEN 'SAN FERNANDO DE APURE-SAN FERNANDO DE APURE' 			THEN '11'
		WHEN 'SANTA ROSALIA-CAMPAMENTO FORESTAL MARIPA' 			THEN '10'
		WHEN 'Sin Ubicacion' 							THEN '00'
		WHEN 'SOLEDAD-CAMPAMENTO ATAPIRIRE' 					THEN '02'
		WHEN 'SOLEDAD-CAMPAMENTO FORESTAL COLORADITO' 				THEN '06'
		WHEN 'SOLEDAD-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		WHEN 'SOLEDAD-CAMPAMENTO LOS HACHOS' 					THEN '09'
		WHEN 'TEMBLADOR-ASERRADERO UVERITO' 					THEN '01'
		WHEN 'TEMBLADOR-CAMPAMENTO ATAPIRIRE' 					THEN '02'
		WHEN 'TEMBLADOR-CAMPAMENTO FORESTAL CHAGUARAMAS' 			THEN '05'
		WHEN 'TEMBLADOR-CAMPAMENTO FORESTAL COLORADITO' 			THEN '06'
		WHEN 'TEMBLADOR-CAMPAMENTO FORESTAL EL MEREY' 				THEN '07'
		WHEN 'TEMBLADOR-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		WHEN 'UPATA-ASERRADERO UVERITO' 					THEN '01'
		WHEN 'UPATA-CAMPAMENTO FORESTAL CHAGUARAMAS' 				THEN '05'
		WHEN 'UPATA-CAMPAMENTO FORESTAL COLORADITO' 				THEN '06'
		WHEN 'UPATA-CAMPAMENTO FORESTAL EL MEREY' 				THEN '07'
		WHEN 'UPATA-CAMPAMENTO FORESTAL MARIPA' 				THEN '10'
		WHEN 'UPATA-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		WHEN 'UPATA-CAMPAMENTO LOS HACHOS' 					THEN '09'
		WHEN 'UPATA-OFICINA DE PUERTO ORDAZ' 					THEN '15'
		WHEN 'UVERITO-ASERRADERO UVERITO' 					THEN '01'
		WHEN 'UVERITO-CAMPAMENTO FORESTAL CHAGUARAMAS' 				THEN '05'
		WHEN 'UVERITO-CAMPAMENTO FORESTAL COLORADITO' 				THEN '06'
		WHEN 'UVERITO-CAMPAMENTO FORESTAL EL MEREY' 				THEN '07'
		WHEN 'UVERITO-CAMPAMENTO FORESTAL UVERITO' 				THEN '12'
		ELSE '00'
	END
FROM
	sno_personal,
	sno_personalnomina,
	sno_nomina,
	srh_gerencia,
	srh_departamento,
	sno_ubicacionfisica ,
	sno_asignacioncargo
WHERE
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personalnomina.codnom=sno_nomina.codnom AND
	sno_personalnomina.staper IN('1','2','4') AND
	sno_personal.codger=srh_gerencia.codger AND
	sno_asignacioncargo.codasicar = sno_personalnomina.codasicar AND
	sno_asignacioncargo.codnom = sno_personalnomina.codnom AND
	sno_personalnomina.coddep=srh_departamento.coddep AND
	sno_personalnomina.codubifis=sno_ubicacionfisica.codubifis AND
	sno_personalnomina.codnom IN('0000','0001','0002','0003','0004','0006','0007','0008','0009')
ORDER BY
	sno_personal.fecingper;