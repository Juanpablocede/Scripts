CREATE OR REPLACE FUNCTION otros_conceptos(OUT codper character, OUT monto double precision)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodper 	ALIAS FOR $1;
  mmonto	ALIAS FOR $2;
  mcuenta	INTEGER;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	sno_hsalida.codper,
	SUM(sno_hsalida.valsal)
FROM 
	sno_hsalida
WHERE 
	sno_hsalida.codnom BETWEEN '0002' AND '0002' AND 
	(sno_hsalida.codconc='0000000006' OR
	 sno_hsalida.codconc='0000000007' OR
	 sno_hsalida.codconc='0000000008' OR
	 sno_hsalida.codconc='0000000046' OR
	 sno_hsalida.codconc='0000000049' OR
	 sno_hsalida.codconc='0000000050' OR
	 sno_hsalida.codconc='0000000051' OR
	 sno_hsalida.codconc='0000000074' OR
	 sno_hsalida.codconc='0000000076' OR
	 sno_hsalida.codconc='0000000083' OR
	 sno_hsalida.codconc='0000310001' OR
	 sno_hsalida.codconc='0000310005' OR
	 sno_hsalida.codconc='0000310009' OR
	 sno_hsalida.codconc='0000310045' OR
	 sno_hsalida.codconc='0000310083' OR
	 sno_hsalida.codconc='0000310084' OR
	 sno_hsalida.codconc='0000310085' OR
	 sno_hsalida.codconc='0000310086') AND
	 sno_hsalida.codperi='006' AND
	 sno_hsalida.valsal>0
GROUP BY
	sno_hsalida.codper;
BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mcodper,
	  mmonto;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

      
	  INSERT INTO sno_fraccion_otros_montos VALUES(mcodper,mmonto);


     RETURN NEXT;
   END;
 END LOOP;
 CLOSE cu01;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION otros_conceptos()
  OWNER TO postgres;

