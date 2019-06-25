CREATE OR REPLACE FUNCTION actualizaconcepto(OUT codper character, OUT valsal double precision)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodper 	ALIAS FOR $1;
  mvalsal 	ALIAS FOR $2;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	codper,
	SUM(((valsal)/30)*10)
FROM 
	sno_hsalida
WHERE 
	codperi='010' AND
	codconc BETWEEN '0000000046' AND '0000000051' AND
	valsal<>0
GROUP BY
	codper;

BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mcodper,
	  mvalsal;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

	  UPDATE sno_hsalida SET sno_hsalida.valsal=sno_hsalida.valsal+mvalsal WHERE sno_hsalida.codper=mcoper AND sno_hsalida.codperi='010' AND sno_hsalida.codconc='0000009994';

     RETURN NEXT;
   END;
 END LOOP;
 CLOSE cu01;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION actualizaconcepto() OWNER TO postgres;

