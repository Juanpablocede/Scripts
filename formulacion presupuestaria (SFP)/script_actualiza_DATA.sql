--select * from spe_int_arts where precio_uni=0
--Actualiza spe_int_arts con los articulos
UPDATE spe_int_arts SET
precio_uni=siv_articulo.ultcosart,
sig_cuenta=siv_articulo.spg_cuenta
FROM
	siv_articulo
WHERE
	siv_articulo.codart=spe_int_arts.codart;

--Actualiza spe_int_arts con los servicios
UPDATE spe_int_arts SET
precio_uni=soc_servicios.preser,
sig_cuenta=soc_servicios.spg_cuenta
FROM
	soc_servicios
WHERE
	soc_servicios.codser=spe_int_arts.codart;

--Actualiza el total de spe_int_arts 
UPDATE spe_int_arts SET
total=(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre)*precio_uni;

--Elimina los registro en cero de spe_int_arts
DELETE FROM spe_int_arts WHERE (enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre)=0;





