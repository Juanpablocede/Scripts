SELECT 
	tipo_registro||
	nacionalidad||
	cedula||
	primer_apellido||
	segundo_apellido||
	primer_nombre||
	segundo_nombre||
	to_char((fecha_nacimiento),'yyyy')||
	to_char((fecha_nacimiento),'mm')||
	to_char((fecha_nacimiento),'dd')||
	to_char(ingreso_mensual*100::numeric, '000999999999')||
	to_char((fecha_ingreso),'yyyy')||
	to_char((fecha_ingreso),'mm')||
	to_char((fecha_ingreso),'dd')||
	atividad_economica||
	cargo||
	sexo||
	estado_civil||
	ubicacion||
	avenida||
	conjunto||
	numero||
	ciudad||
	estado||
	pais||
	CASE length(telefono)
		WHEN 0  THEN  '00000000000'
		WHEN 1  THEN   '0000000000'||telefono
		WHEN 2  THEN    '000000000'||telefono
		WHEN 3  THEN     '00000000'||telefono
		WHEN 4  THEN      '0000000'||telefono
		WHEN 5  THEN       '000000'||telefono
		WHEN 6  THEN        '00000'||telefono
		WHEN 7  THEN         '0000'||telefono
		WHEN 8  THEN          '000'||telefono
		WHEN 9  THEN           '00'||telefono
		WHEN 10 THEN            '0'||telefono
		WHEN 11 THEN                 telefono
	END||
	CASE length(fax)
		WHEN 0  THEN  '00000000000'
		WHEN 1  THEN   '0000000000'||telefono
		WHEN 2  THEN    '000000000'||telefono
		WHEN 3  THEN     '00000000'||telefono
		WHEN 4  THEN      '0000000'||telefono
		WHEN 5  THEN       '000000'||telefono
		WHEN 6  THEN        '00000'||telefono
		WHEN 7  THEN         '0000'||telefono
		WHEN 8  THEN          '000'||telefono
		WHEN 9  THEN           '00'||telefono
		WHEN 10 THEN            '0'||telefono
		WHEN 11 THEN                 telefono
	END||	
	CASE length(celular)
		WHEN 0  THEN  '00000000000'
		WHEN 1  THEN   '0000000000'||telefono
		WHEN 2  THEN    '000000000'||telefono
		WHEN 3  THEN     '00000000'||telefono
		WHEN 4  THEN      '0000000'||telefono
		WHEN 5  THEN       '000000'||telefono
		WHEN 6  THEN        '00000'||telefono
		WHEN 7  THEN         '0000'||telefono
		WHEN 8  THEN          '000'||telefono
		WHEN 9  THEN           '00'||telefono
		WHEN 10 THEN            '0'||telefono
		WHEN 11 THEN                 telefono
	END||
	internet||
	zona_postal||
	accion||
	tipo_empleado||
	codgo_area_telefono||
	nro_telefono_trabajo||
	tipo_cuenta||
	codigo_oficina||
	nro_cuenta||
	filler
		
FROM 
	apertura_cuenta
