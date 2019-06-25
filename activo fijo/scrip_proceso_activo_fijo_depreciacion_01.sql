DROP TABLE saf_activo_depreciacion01;

CREATE TABLE saf_activo_depreciacion01
(
  id_activo character(15) NOT NULL,
  descripcion character(100),
  marca character(100),
  modelo character(100),
  fecha_compra date,
  costo double precision,
  vida_util double precision,
  fecha_depreciacion date,
  depreciacion_mensual double precision,
  meses_depreciados double precision,
  depreciacion_acumulada double precision,
  CONSTRAINT saf_activo_depreciacion01_pkey PRIMARY KEY (id_activo)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE saf_activo_depreciacion01 OWNER TO postgres;


DROP TABLE saf_activo_depreciacion02;

CREATE TABLE saf_activo_depreciacion02
(
  id_activo character(15) NOT NULL,
  fecha_depreciacion date,
  CONSTRAINT saf_activo_depreciacion02_pkey PRIMARY KEY (id_activo)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE saf_activo_depreciacion02 OWNER TO postgres;


DROP TABLE saf_activo_depreciacion03;

CREATE TABLE saf_activo_depreciacion03
(
  id_activo character(15) NOT NULL,
  depreciacion_mensual double precision,
  CONSTRAINT saf_activo_depreciacion03_pkey PRIMARY KEY (id_activo)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE saf_activo_depreciacion03 OWNER TO postgres;


DROP TABLE saf_activo_depreciacion04;

CREATE TABLE saf_activo_depreciacion04
(
  id_activo character(15) NOT NULL,
  meses_depreciados double precision,
  CONSTRAINT saf_activo_depreciacion04_pkey PRIMARY KEY (id_activo)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE saf_activo_depreciacion04 OWNER TO postgres;


DROP TABLE saf_activo_depreciacion05;

CREATE TABLE saf_activo_depreciacion05
(
  id_activo character(15) NOT NULL,
  depreciacion_acumulada double precision,
  CONSTRAINT saf_activo_depreciacion05_pkey PRIMARY KEY (id_activo)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE saf_activo_depreciacion05 OWNER TO postgres;


DELETE FROM saf_activo_depreciacion01;
DELETE FROM saf_activo_depreciacion02;
DELETE FROM saf_activo_depreciacion03;
DELETE FROM saf_activo_depreciacion04;
DELETE FROM saf_activo_depreciacion05;

CREATE OR REPLACE FUNCTION dataactivofijo01(OUT id_activo character, OUT descripcion character, OUT marca character, OUT modelo character, OUT fecha_compra date, OUT costo double precision, OUT vida_util double precision)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mid_activo 	ALIAS FOR $1;
  mdescripcion 	ALIAS FOR $2;
  mmarca 	ALIAS FOR $3;
  mmodelo	ALIAS FOR $4;
  mfecha_compra ALIAS FOR $5;
  mcosto	ALIAS FOR $6;
  mvida_util	ALIAS FOR $7;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	saf_activo.codact,
	saf_activo.denact,
	saf_activo.maract,
	saf_activo.modact,
	saf_activo.feccmpact,
	saf_activo.costo,
	saf_activo.vidautil*12 AS vidautil
FROM
	saf_activo
ORDER BY
	saf_activo.codact;
BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mid_activo,
	  mdescripcion,
	  mmarca,
	  mmodelo,
	  mfecha_compra,
	  mcosto,
	  mvida_util;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

          INSERT INTO saf_activo_depreciacion01 VALUES(mid_activo,mdescripcion,mmarca,mmodelo,mfecha_compra,mcosto,mvida_util);

	  --UPDATE saf_activo_depreciacion SET fecha_depreciacion=(SELECT MIN(saf_depreciacion.fecdep) FROM saf_depreciacion WHERE saf_depreciacion.codact=mid_activo);

   RETURN NEXT;
   END;
 END LOOP;
 CLOSE cu01;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION dataactivofijo01() OWNER TO postgres;


CREATE OR REPLACE FUNCTION dataactivofijo02(OUT id_activo character, OUT fecha_depreciacion date)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mid_activo 		ALIAS FOR $1;
  mfecha_depreciacion 	ALIAS FOR $2;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	codact, 
	MIN(fecdep)	
FROM 
	saf_depreciacion
GROUP BY
	codact;

BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mid_activo,
	  mfecha_depreciacion;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

          INSERT INTO saf_activo_depreciacion02 VALUES(mid_activo,mfecha_depreciacion);

   RETURN NEXT;
   END;
 END LOOP;
 CLOSE cu01;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION dataactivofijo02() OWNER TO postgres;


CREATE OR REPLACE FUNCTION dataactivofijo03(OUT id_activo character, OUT depreciacion_mensual double precision)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mid_activo 		ALIAS FOR $1;
  mdepreciacion_mensual	ALIAS FOR $2;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	codact, 
	MAX(mondepmen)	
FROM 
	saf_depreciacion
GROUP BY
	codact;

BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mid_activo,
	  mdepreciacion_mensual;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

          INSERT INTO saf_activo_depreciacion03 VALUES(mid_activo,mdepreciacion_mensual);

   RETURN NEXT;
   END;
 END LOOP;
 CLOSE cu01;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION dataactivofijo03() OWNER TO postgres;


CREATE OR REPLACE FUNCTION dataactivofijo04(OUT id_activo character, OUT meses_depreciados double precision)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mid_activo 		ALIAS FOR $1;
  mmeses_depreciados	ALIAS FOR $2;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	codact,
	COUNT(*) 
FROM 
	saf_depreciacion
WHERE 
	saf_depreciacion.fecdep<=(CURRENT_DATE)
GROUP BY 
	codact;

BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mid_activo,
	  mmeses_depreciados;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

          INSERT INTO saf_activo_depreciacion04 VALUES(mid_activo,mmeses_depreciados);

   RETURN NEXT;
   END;
 END LOOP;
 CLOSE cu01;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION dataactivofijo04() OWNER TO postgres;


CREATE OR REPLACE FUNCTION dataactivofijo05(OUT id_activo character, OUT depreciacion_acumulada double precision)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mid_activo 			ALIAS FOR $1;
  mdepreciacion_acumulada	ALIAS FOR $2;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	codact,
	SUM(mondepmen) 
FROM 
	saf_depreciacion
WHERE 
	saf_depreciacion.fecdep<=(CURRENT_DATE)
GROUP BY 
	codact;

BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mid_activo,
	  mdepreciacion_acumulada;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

          INSERT INTO saf_activo_depreciacion05 VALUES(mid_activo,mdepreciacion_acumulada);

   RETURN NEXT;
   END;
 END LOOP;
 CLOSE cu01;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION dataactivofijo05() OWNER TO postgres;


SELECT * FROM dataactivofijo01();
SELECT * FROM dataactivofijo02();
SELECT * FROM dataactivofijo03();
SELECT * FROM dataactivofijo04();
SELECT * FROM dataactivofijo05();

--Actualizando la fecha de depreciacion
UPDATE saf_activo_depreciacion01 SET
fecha_depreciacion=saf_activo_depreciacion02.fecha_depreciacion
FROM
	saf_activo_depreciacion02
WHERE
	saf_activo_depreciacion01.id_activo = saf_activo_depreciacion02.id_activo;


--Actualizando la depreciacion mensual
UPDATE saf_activo_depreciacion01 SET
depreciacion_mensual=saf_activo_depreciacion03.depreciacion_mensual
FROM
	saf_activo_depreciacion03
WHERE
	saf_activo_depreciacion01.id_activo = saf_activo_depreciacion03.id_activo;


--Actualizando los meses depreciados
UPDATE saf_activo_depreciacion01 SET
meses_depreciados=saf_activo_depreciacion04.meses_depreciados
FROM
	saf_activo_depreciacion04
WHERE
	saf_activo_depreciacion01.id_activo = saf_activo_depreciacion04.id_activo;


--Actualizando la depreciacion acumulada
UPDATE saf_activo_depreciacion01 SET
depreciacion_acumulada=saf_activo_depreciacion05.depreciacion_acumulada
FROM
	saf_activo_depreciacion05
WHERE
	saf_activo_depreciacion01.id_activo = saf_activo_depreciacion05.id_activo;

SELECT * FROM saf_activo_depreciacion01 ORDER BY id_activo;
