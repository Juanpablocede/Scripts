CREATE OR REPLACE FUNCTION consultaantiguedad(OUT scodper character, OUT snombres character)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodper ALIAS FOR $1;
  mnombres ALIAS FOR $2;

  existen_datos BOOLEAN;
  mexiste INTEGER;
  
cu01 CURSOR FOR 

SELECT 
	sno_personal.codper,
	sno_personal.nomper || ' ' || sno_personal.apeper
FROM 
	sno_personal, 
	sno_personalnomina
WHERE 
	sno_personal.codper=sno_personalnomina.codper AND
	sno_personal.estper='1' AND
	sno_personalnomina.staper IN('1','2') AND
	sno_personalnomina.codnom='0001' AND
	(((current_date-sno_personal.fecingper)*12)/365)>=5 
ORDER BY
	sno_personal.codper;
BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	mcodper,
	mnombres;

	mexiste :=0;

	mexiste := (SELECT COUNT(*) FROM sno_fideiperiodo WHERE codper=mcodper AND anocurper='2012' AND mescurper=2);

	snombres := mexiste;

	IF mexiste = 0 THEN 
	   INSERT INTO sno_fideiperiodo VALUES('0001','0001',mcodper,'2012',2,0,0,0,0,0,0,0); 
	END IF;
	
      IF NOT FOUND THEN
           EXIT buscar_datos;
      END IF;

     RETURN NEXT;
   END;
 END LOOP;
 CLOSE cu01;
END;
$BODY$
  LANGUAGE plpgsql volatile
  COST 100
  ROWS 1000;
ALTER FUNCTION consultaantiguedad() OWNER TO postgres;

