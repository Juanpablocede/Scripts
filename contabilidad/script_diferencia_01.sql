/*DROP TABLE scg_dt_cmp_diferencia
CREATE TABLE public.scg_dt_cmp_diferencia
(
  codemp character(4) NOT NULL DEFAULT '0001'::bpchar,
  procede character(6) NOT NULL,
  comprobante character(15) NOT NULL,
  fecha date NOT NULL DEFAULT '1900-01-01'::date,
  codban character(3) NOT NULL DEFAULT '---'::bpchar,
  ctaban character(25) NOT NULL DEFAULT '-------------------------'::bpchar,
  sc_cuenta character varying(25) NOT NULL,
  procede_doc character(6) NOT NULL,
  documento character(15) NOT NULL,
  descripcion text NOT NULL,
  debe double precision DEFAULT (0)::double precision,
  haber double precision DEFAULT (0)::double precision,
  CONSTRAINT pk_scg_dt_cmp_diferencia PRIMARY KEY (codemp, procede, sc_cuenta, comprobante, procede_doc, documento, fecha, codban, ctaban, descripcion) 
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.scg_dt_cmp_diferencia
  OWNER TO postgres;*/

DELETE FROM scg_dt_cmp_diferencia;
INSERT INTO scg_dt_cmp_diferencia
--SUMA DEBITOS
SELECT
    scg_dt_cmp.codemp,
    scg_dt_cmp.procede,
    scg_dt_cmp.comprobante,
    scg_dt_cmp.fecha,
    scg_dt_cmp.codban,
    scg_dt_cmp.ctaban,
    '6439900000000000003',
    0,----scg_dt_cmp.procede_doc,
    0,----scg_dt_cmp.documento,
    scg_dt_cmp.descripcion,
    sum(scg_dt_cmp.monto),
    0
FROM
    scg_dt_cmp
WHERE
    scg_dt_cmp.debhab='D'
GROUP BY
    scg_dt_cmp.codemp,
    scg_dt_cmp.procede,
    scg_dt_cmp.comprobante,
    scg_dt_cmp.fecha,
    scg_dt_cmp.codban,
    scg_dt_cmp.ctaban,
    --scg_dt_cmp.procede_doc,
    --scg_dt_cmp.documento,
    scg_dt_cmp.descripcion;
--SUMA CREDITOS
UPDATE scg_dt_cmp_diferencia SET
haber=(SELECT
        sum(scg_dt_cmp.monto)
    FROM
        scg_dt_cmp
    WHERE
        scg_dt_cmp.debhab='H' AND
        scg_dt_cmp.codemp=scg_dt_cmp_diferencia.codemp AND
        scg_dt_cmp.procede=scg_dt_cmp_diferencia.procede AND
        scg_dt_cmp.comprobante=scg_dt_cmp_diferencia.comprobante AND
        scg_dt_cmp.fecha=scg_dt_cmp_diferencia.fecha AND
        scg_dt_cmp.codban=scg_dt_cmp_diferencia.codban AND
        scg_dt_cmp.ctaban=scg_dt_cmp_diferencia.ctaban AND
        --scg_dt_cmp.procede_doc=scg_dt_cmp_diferencia.procede_doc AND
        --scg_dt_cmp.documento=scg_dt_cmp_diferencia.documento AND
        scg_dt_cmp.descripcion=scg_dt_cmp_diferencia.descripcion  
    GROUP BY
        scg_dt_cmp.codemp,
        scg_dt_cmp.procede,
        scg_dt_cmp.comprobante,
        scg_dt_cmp.fecha,
        scg_dt_cmp.codban,
        scg_dt_cmp.ctaban,
        --scg_dt_cmp.procede_doc,
        --scg_dt_cmp.documento,
        scg_dt_cmp.descripcion)