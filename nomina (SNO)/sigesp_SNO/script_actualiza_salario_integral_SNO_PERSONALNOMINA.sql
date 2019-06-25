
CREATE TABLE sno_temporal_salario_integral
(
  codper character(10) NOT NULL,
  codnom character(4) NOT NULL,
  codperi character(4) NOT NULL,
  sueldo_integral double precision DEFAULT 0,
  CONSTRAINT sno_temporal_salario_integral_pkey PRIMARY KEY (codper, codnom, codperi)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sno_temporal_salario_integral OWNER TO postgres;

INSERT INTO sno_temporal_salario_integral
SELECT
	sno_hsalida.codper,
	sno_hconcepto.codnom,
	sno_hconcepto.codperi,
	sum(sno_hsalida.valsal)
FROM
	sno_hconcepto,
	sno_hconceptopersonal,
	sno_hsalida
WHERE
	sno_hconcepto.codconc=sno_hconceptopersonal.codconc AND
	sno_hconcepto.codnom=sno_hconceptopersonal.codnom AND
	sno_hconcepto.codperi=sno_hconceptopersonal.codperi AND
	sno_hconcepto.sueintcon=1 AND
	sno_hconceptopersonal.codper=sno_hsalida.codper AND
	sno_hconceptopersonal.codnom=sno_hsalida.codnom AND
	sno_hconceptopersonal.codconc=sno_hsalida.codconc AND
	sno_hconceptopersonal.codperi=sno_hsalida.codperi AND
	sno_hsalida.valsal>0 AND
	sno_hconcepto.codnom BETWEEN '0000' AND '0010'
GROUP BY
	sno_hsalida.codper,
	sno_hconcepto.codnom,
	sno_hconcepto.codperi;

UPDATE sno_hpersonalnomina SET
sueintper=sno_temporal_salario_integral.sueldo_integral
FROM
	sno_temporal_salario_integral
WHERE
	sno_hpersonalnomina.codper=sno_temporal_salario_integral.codper AND
	sno_hpersonalnomina.codnom=sno_temporal_salario_integral.codnom AND
	sno_hpersonalnomina.codperi=sno_temporal_salario_integral.codperi;

DROP TABLE sno_temporal_salario_integral;

