update sisa.atencion_det_factura set monto_referencial=round((monto_referencial::numeric/100000),2) where fecha_registro>='01-01-2018';
update sisa.atencion_det_factura set monto_registrado=round((monto_registrado::numeric/100000),2) where fecha_registro>='01-01-2018';

update sisa.autorizmanualesdet set monto=round((monto::numeric/100000),2) where fecha_factura>='01-01-2018';

update sisa.baremo_empresa set monto_referencial=round((monto_referencial::numeric/100000),2) where fecha_inicio>='01-01-2018';


update sisa.baremos set monto_referencial_a=round((monto_referencial_a::numeric/100000),2) where fecha_inicio>='01-01-2018';
update sisa.baremos set monto_referencial_b=round((monto_referencial_b::numeric/100000),2) where fecha_inicio>='01-01-2018';
update sisa.baremos set monto_referencial_c=round((monto_referencial_c::numeric/100000),2) where fecha_inicio>='01-01-2018';
update sisa.baremos set monto_referencial_d=round((monto_referencial_d::numeric/100000),2) where fecha_inicio>='01-01-2018';



update sisa.carta_aval set monto_presupuesto=round((monto_presupuesto::numeric/100000),2) where fecha_emision_presupuesto>='01-01-2018';
update sisa.carta_aval set monto_aprobado=round((monto_aprobado::numeric/100000),2) where fecha_emision_presupuesto>='01-01-2018';

update sisa.claves_emergencias set monto_egreso=round((monto_egreso::numeric/100000),2) where fecha_ingreso>='01-01-2018';
update sisa.claves_emergencias set monto_ajustado=round((monto_ajustado::numeric/100000),2) where fecha_ingreso>='01-01-2018';

update sisa.claves_emergencias_det set monto_cobertura=round((monto_cobertura::numeric/100000),2) where fecha_registro>='01-01-2018';
update sisa.claves_emergencias_det set monto_facturado=round((monto_facturado::numeric/100000),2) where fecha_registro>='01-01-2018';

update sisa.detalle_atencion set monto_bloqueado=round((monto_bloqueado::numeric/100000),2) where fecha_emision>='01-01-2018';
update sisa.detalle_atencion set monto_facturado=round((monto_facturado::numeric/100000),2) where fecha_emision>='01-01-2018';


update sisa.reembolso_det set monto_solicitado=round((monto_solicitado::numeric/100000),2) where fecha_registro>='01-01-2018';
update sisa.reembolso_det set monto_aprobado=round((monto_aprobado::numeric/100000),2) where fecha_registro>='01-01-2018';

update sisa.saldo set saldo_total=round((saldo_total::numeric/100000),2) where fecha_registro>='01-01-2018';
update sisa.saldo set saldo_disponible=round((saldo_disponible::numeric/100000),2) where fecha_registro>='01-01-2018';
update sisa.saldo set saldo_bloqueado=round((saldo_bloqueado::numeric/100000),2) where fecha_registro>='01-01-2018';
update sisa.saldo set saldo_deudor=round((saldo_deudor::numeric/100000),2) where fecha_registro>='01-01-2018';
update sisa.saldo set saldo_ejecutado=round((saldo_ejecutado::numeric/100000),2) where fecha_registro>='01-01-2018';



/*

select * from sisa.atencion_det_factura where fecha_registro>='01-01-2018'

select * from sisa.autorizmanualesdet  where fecha_factura>='01-01-2018';

select * from sisa.baremo_empresa  where fecha_factura>='01-01-2018';

select * from  sisa.baremos  where fecha_inicio>='01-01-2018';

select * from  sisa.carta_aval where fecha_emision_presupuesto>='01-01-2018';

select * from  sisa.claves_emergencias  where fecha_ingreso>='01-01-2018';

select * from sisa.claves_emergencias_det where fecha_ingreso>='01-01-2018';

select * from sisa.detalle_atencion where fecha_emision>='01-01-2018';

select * from sisa.reembolso_det where fecha_registro>='01-01-2018';

select * from sisa.saldo where fecha_registro>='01-01-2018';
*/


























