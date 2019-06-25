-- Function: depreciacion()

-- DROP FUNCTION depreciacion();

CREATE OR REPLACE FUNCTION depreciacion(OUT codemp character, OUT codact character, OUT ideact character, OUT feccmpact date, OUT costo double precision, OUT vidautil double precision)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodemp 	ALIAS FOR $1;
  mcodact 	ALIAS FOR $2;
  mideact 	ALIAS FOR $3;
  mfeccmpact	ALIAS FOR $4;
  mcosto	ALIAS FOR $5;
  mvidautil	ALIAS FOR $6;
  mmeses 	INTEGER;
  mcontador	INTEGER;
  mdepanual	DOUBLE PRECISION;
  mdepmensual	DOUBLE PRECISION;
  mfechadep	DATE;
  mdepacum	DOUBLE PRECISION;
  mmes		INTEGER; --para saber el mes de la fecha de compra
  mdias		INTEGER; --para determinar los meses de 28,30 y 31 dias
  manos		INTEGER; --para determinar el año de la fecha de compra. Estas tres varables son para concatenar le fecha de depreciacion
  mfdia		CHARACTER(2);
  mfmes		CHARACTER(2);
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT
	saf_activo.codemp,
	saf_activo.codact,
	saf_dta.ideact,
	saf_activo.feccmpact,
	saf_activo.costo,
	saf_activo.vidautil,
	--substr(cast(saf_activo.feccmpact as char(10)),6,2) AS mes
	EXTRACT (MONTH FROM saf_activo.feccmpact)

FROM
	saf_activo,
	saf_dta
WHERE
	saf_activo.codemp=saf_dta.codemp AND
	saf_activo.codact=saf_dta.codact AND
	saf_activo.vidautil<>0 AND
	saf_activo.codact='000000000000001'
ORDER BY
	saf_activo.codact;

BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mcodemp,
	  mcodact,
	  mideact,
	  mfeccmpact,
	  mcosto,
	  mvidautil,
	  mmes;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;
          mcontador:=1;
	  mmeses:=(mvidautil*12);
	  mfechadep:=mfeccmpact;
	  mdepanual:=(mcosto/mvidautil);
	  mdepmensual:=(mcosto/(mvidautil*12));
	  mdepacum:=mdepmensual;
	  manos:=EXTRACT (YEAR FROM mfechadep);
	  WHILE mcontador<=mmeses LOOP
		mcontador:=mcontador+1;
		--mfechadep:=(mfechadep+31);
		mmes:=(mmes+1);
		IF mmes>12 THEN
			mmes:=1;
			manos:=(manos+1);
		END IF;
		
		IF mmes IN(1,3,5,7,8,10,12) THEN
			mdias=31;
		END IF;
		IF mmes IN(4,6,9,11) THEN
			mdias=30;
		END IF;		
		IF mmes IN(2) THEN
			mdias=28;
		END IF;
		IF mmes<10 THEN
			mfmes:='0'||mmes;
		ELSE
			mfmes:=mmes;
		END IF;
		
		IF mdias<10 THEN
			mfdia:='0'||mdias;
		ELSE
			mfdia:=mdias;
		END IF;
		mfechadep:=manos||'-'||mfmes||'-'||mfdia;
	
		
		INSERT INTO saf_depreciacion VALUES (mcodemp,mcodact,mideact,mfechadep,mdepmensual,mdepanual,mdepacum,0,mfechadep,'1900-01-01');
		mdepacum:=(mdepacum+mdepmensual);
	  END LOOP;
     RETURN NEXT;
   END;
 END LOOP;
 CLOSE cu01;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE --STABLE
  COST 100
  ROWS 1000;
ALTER FUNCTION depreciacion() OWNER TO postgres;
