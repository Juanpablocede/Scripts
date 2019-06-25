SELECT
    sno_personal.cedper,
    sno_personal.nomper,
    sno_personal.apeper,
    (select regexp_split_to_table(sno_personal.nomper,E'\\s+') as x limit 1) AS nombre,
        (select regexp_split_to_table(sno_personal.apeper,E'\\s+') as x limit 1) AS apellido
   
FROM
    sno_personal
ORDER BY
    sno_personal.nomper;
