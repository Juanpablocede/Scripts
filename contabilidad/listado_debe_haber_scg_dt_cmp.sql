SELECT
    scg_dt_cmp.codemp,
    scg_dt_cmp.procede,
    scg_dt_cmp.comprobante,
    scg_dt_cmp.fecha,
    scg_dt_cmp.codban,
    scg_dt_cmp.ctaban,
    /*scg_dt_cmp.procede_doc,
    scg_dt_cmp.documento,*/
    MAX(debe.montodebe) AS debe,
    MAX(haber.montohaber) AS haber
FROM
    scg_dt_cmp,
    (SELECT
        procede,
        comprobante,
        SUM(monto) AS montodebe
    FROM
        scg_dt_cmp
    WHERE
        debhab='D'
    GROUP BY
        procede,
        comprobante) as debe,
    (SELECT
        procede,
        comprobante,
        SUM(monto) AS montohaber
    FROM
        scg_dt_cmp
    WHERE
        debhab='H'
    GROUP BY
        procede,
        comprobante) as haber
WHERE
    scg_dt_cmp.procede=debe.procede AND
    scg_dt_cmp.comprobante=debe.comprobante AND
    scg_dt_cmp.procede=haber.procede AND
    scg_dt_cmp.comprobante=haber.comprobante
GROUP BY
    scg_dt_cmp.codemp,
    scg_dt_cmp.procede,
    scg_dt_cmp.comprobante,
    scg_dt_cmp.fecha,
    scg_dt_cmp.codban,
    scg_dt_cmp.ctaban /*,
    scg_dt_cmp.procede_doc,
    scg_dt_cmp.documento*/
ORDER BY
    scg_dt_cmp.codemp,
    scg_dt_cmp.procede,
    scg_dt_cmp.comprobante,
    scg_dt_cmp.fecha,
    scg_dt_cmp.codban,
    scg_dt_cmp.ctaban /*,
    scg_dt_cmp.procede_doc,
    scg_dt_cmp.documento*/
    