SELECT
    sno_personal.codper,
    RTRIM(sno_personal.nomper) AS nombres,
    RTRIM(sno_personal.apeper) AS apellidos,
    sno_personal.fecingper,
    sno_hsalida.codconc,
    sno_hconcepto.nomcon,
    sno_hsalida.valsal,
    sno_hpersonalnomina.codnom,
    sno_hnomina.desnom
FROM
    sno_personal
    INNER JOIN
        sno_hpersonalnomina ON sno_personal.codper=sno_hpersonalnomina.codper
    INNER JOIN
        sno_hsalida ON sno_hsalida.codnom=sno_hpersonalnomina.codnom AND
        sno_hsalida.codper=sno_hpersonalnomina.codper AND
        sno_hsalida.codperi=sno_hpersonalnomina.codperi
    INNER JOIN
        sno_hnomina ON sno_hnomina.codnom=sno_hsalida.codnom AND
        sno_hnomina.peractnom=sno_hsalida.codperi
    INNER JOIN
        sno_hconcepto ON sno_hconcepto.codnom=sno_hsalida.codnom AND
        sno_hconcepto.codperi=sno_hsalida.codperi AND
        sno_hconcepto.codconc=sno_hsalida.codconc AND

        sno_hconcepto.codnom=sno_hnomina.codnom AND
        sno_hconcepto.codperi=sno_hnomina.peractnom
WHERE
    sno_hsalida.codnom BETWEEN '0000' AND '0012' AND
    sno_hsalida.codconc='0000000403' AND
    sno_hsalida.valsal<>0
ORDER BY
    sno_personal.nomper