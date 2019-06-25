SELECT
       t1.fecha_registro,
       nombres || ' ' || apellidos,
       t1.estado, t1.consecutivo,
       monto_aprobado
FROM 
       sisa.reembolso t1
       INNER JOIN sisa.reembolso_det t2 ON (t1.nro_solicitud = t2.nro_solicitud)
       INNER JOIN sisa.beneficiario t3 ON (t1.cedula_titular = t3.cedula_titular AND t1.consecutivo = t3.consecutivo)
WHERE 
       t1.cedula_titular = 6880620
ORDER BY 
       t1.fecha_registro desc