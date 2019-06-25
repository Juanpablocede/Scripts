select * from spg_dtmp_cmp where comprobante ='000000000000010'

insert into sigesp_cmp_md
select codemp,procede,comprobante,'2013-11-07',descripcion,tipo_comp,tipo_destino,cod_pro,ced_bene,total,
	numpolcon,estapro,fechaconta,fechaanula,codfuefin,coduac,codtipmodpre,esttrares,numtrares
from   sigesp_cmp_md
where  comprobante ='000000000000010' and
       procede = 'SPGCRA' and
       fecha = '2013-12-03';


insert into spg_dtmp_cmp
select codemp,procede,comprobante,'2013-11-07',codestpro1,codestpro2,codestpro3,codestpro4,codestpro5,
	estcla,spg_cuenta,procede_doc,documento,operacion,codfuefin,descripcion,monto,orden
from   spg_dtmp_cmp
where         comprobante ='000000000000010' and
       procede = 'SPGCRA' and
       fecha = '2013-12-03';


delete         from         spg_dtmp_cmp
where         comprobante ='000000000000010' and
       procede = 'SPGCRA' and
       fecha = '2013-12-03';

delete         from         sigesp_cmp_md
where         comprobante ='000000000000010' and
       procede = 'SPGCRA' and
       fecha = '2013-12-03';

