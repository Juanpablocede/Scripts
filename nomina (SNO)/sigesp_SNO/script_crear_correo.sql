
CREATE OR REPLACE FUNCTION crearcorreo(OUT codper character, OUT cedper character, OUT nomper character, OUT apeper character)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodper 	ALIAS FOR $1;
  mcedper 	ALIAS FOR $2;
  mnomper 	ALIAS FOR $3;
  mapeper	ALIAS FOR $4;
  mcontador	INTEGER;
  mnombres	CHARACTER(60);
  mapellidos	CHARACTER(60);
  mletranom	CHARACTER(01);
  mletraape	CHARACTER(01);
  mcuenta	INTEGER;
  msw01		INTEGER;
  msw02		INTEGER;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT
	sno_personal.codper,
	sno_personal.cedper,
	sno_personal.nomper,
	sno_personal.apeper
FROM
	sno_personal
ORDER BY
	sno_personal.fecingper;

BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mcodper,
	  mcedper,
	  mnomper,
	  mapeper;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;
          msw01=0;
          msw02=0;
          
          mnombres:=LOWER(SUBSTRING(mnomper,1,1));
          IF mnombres='Ñ' THEN
		mnombres='n';
          END IF;

          mapellidos:=LOWER(SUBSTRING(mapeper,1,1));
          IF mapellidos='Ñ' THEN
		mapellidos='n';
          END IF;
          
          mcontador:=2;
	  WHILE mcontador<=60 LOOP
		IF msw01=0 THEN
			mletranom:=LOWER(SUBSTRING(mnomper,mcontador,1));
			IF mletranom='Ñ' THEN
				mletranom='n';
			END IF;
			IF mletranom='Á' THEN
				mletranom='a';
			END IF;
			IF mletranom='É' THEN
				mletranom='e';
			END IF;
			IF mletranom='Í' THEN
				mletranom='i';
			END IF;
			IF mletranom='Ó' THEN
				mletranom='o';
			END IF;
			IF mletranom='Ú' THEN
				mletranom='u';
			END IF;
			IF (mletranom=' ') THEN 
				msw01=1;
			ELSE
				mnombres:=mnombres||(mletranom);
			END IF;
		END IF;
		
		IF msw02=0 THEN
			mletraape:=LOWER(SUBSTRING(mapeper,mcontador,1));
			IF mletraape='Ñ' THEN
				mletraape='n';
			END IF;
			IF mletraape='Á' THEN
				mletraape='a';
			END IF;
			IF mletraape='É' THEN
				mletraape='e';
			END IF;
			IF mletraape='Í' THEN
				mletraape='i';
			END IF;
			IF mletraape='Ó' THEN
				mletraape='o';
			END IF;
			IF mletraape='Ú' THEN
				mletraape='u';
			END IF;
			IF (mletraape=' ') AND mapellidos<>'de' THEN 
				msw02=1;
			ELSE
				mapellidos:=mapellidos||(mletraape);
			END IF;
		END IF;
		mcontador:=mcontador+1;
	  END LOOP;
	  
	  mcuenta:=0;
	  mcuenta:=COUNT(*) FROM sno_personal WHERE sno_personal.coreleper= mnombres||'.'||mapellidos||'@maderasdelorinoco.gob.ve';

	  IF mcuenta=0 THEN
		 UPDATE sno_personal SET coreleper=mnombres||'.'||mapellidos||'@maderasdelorinoco.gob.ve' WHERE sno_personal.codper=mcodper;
	  END IF;

	  IF mcuenta>0 THEN
		UPDATE sno_personal SET coreleper=mnombres||'.'||mapellidos||SUBSTRING(cedper,1,3)||'@maderasdelorinoco.gob.ve' WHERE sno_personal.codper=mcodper;
	  END IF;

	  --UPDATE sno_personal SET coreleper=mnombres||'.'||mapellidos||'@maderasdelorinoco.gob.ve' WHERE sno_personal.codper=mcodper;
	  --INSERT INTO temporal_correo VALUES(mcodper,mnombres||'.'||mapellidos||'@maderasdeloronico.gob.ve');
     RETURN NEXT;
   END;
 END LOOP;
 CLOSE cu01;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION crearcorreo() OWNER TO postgres;

