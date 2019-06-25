delete from saf_activo01
delete from saf_dta01
delete from saf_depreciacion01


--Inserta registro en la tabla saf_activo01
INSERT INTO  saf_activo01
SELECT
	*
FROM
	saf_activo
WHERE
	codact BETWEEN '000000000013518' AND '000000000013662'


--Inserta registro en la tabla saf_dta01
INSERT INTO  saf_dta01
SELECT
	*
FROM
	saf_dta
WHERE
	codact BETWEEN '000000000013518' AND '000000000013662'


--Inserta registro en la tabla saf_depreciacion01
INSERT INTO  saf_depreciacion01
SELECT
	*
FROM
	saf_depreciacion
WHERE
	codact BETWEEN '000000000013518' AND '000000000013662'

--Actualiza los codigo del articulo
SELECT actualizacodigo()

--
UPDATE saf_activo01 SET codestpro2=codact
--UPDATE saf_activo01 SET codact=codestpro1

--
UPDATE saf_dta01 SET
sat_dta01.codact=saf_activo01.codestpro1
FROM
saf_activo01
WHERE
saf_dta01.codact=saf_activo01.codestpro2

