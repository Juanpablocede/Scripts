SELECT
	sno_personal.codper,
	RTRIM(sno_personal.nomper)||' '||RTRIM(sno_personal.apeper) AS Nombres,
COALESCE((SELECT
    SUM(sno_fideiperiodo.apoper)
FROM
    sno_fideiperiodo
WHERE
    sno_fideiperiodo.codper=sno_personal.codper),0) +
COALESCE((SELECT
    SUM(sno_deudaanterior.monpreant)
FROM
    sno_deudaanterior
WHERE
    sno_deudaanterior.codper=sno_personal.codper),0) AS prestaciones_acumulada,
    
COALESCE((SELECT
    SUM(sno_anticipoprestaciones.monant)
FROM
    sno_anticipoprestaciones
WHERE
    sno_anticipoprestaciones.codper=sno_personal.codper),0) + 
COALESCE((SELECT
    SUM(sno_deudaanterior.monant)
FROM
    sno_deudaanterior
WHERE
    sno_deudaanterior.codper=sno_personal.codper),0) AS anticipo_prestaciones,
(SELECT
    MAX(sno_fideiperiodo.anocurper)
FROM
    sno_fideiperiodo
WHERE
    sno_fideiperiodo.codper=sno_personal.codper AND
    sno_fideiperiodo.anocurper::integer=(extract(year from  (CURRENT_DATE)))) AS ano,
   
(SELECT
    MAX(sno_fideiperiodo.mescurper)
FROM
    sno_fideiperiodo
WHERE
    sno_fideiperiodo.codper=sno_personal.codper AND
    sno_fideiperiodo.anocurper::integer=(extract(year from  (CURRENT_DATE))))  AS mes
   
FROM
	sno_personal
WHERE
	sno_personal.codper='0006880620'
ORDER BY
	sno_personal.codper


--select * from sno_deudaanterior where codper='0006880620'
--select * from sno_anticipoprestaciones where codper='0006880620'
