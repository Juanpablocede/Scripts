update cxp_rd_scg set ced_bene='2' where numrecdoc like '00000500%' and ced_bene='1'
update cxp_rd_scg set ced_bene='2' where numrecdoc like '00000501%' and ced_bene='1'
update cxp_rd_scg set ced_bene='200000856' where numrecdoc like '00000502%' and ced_bene='1'
update cxp_rd_scg set ced_bene='6' where numrecdoc like '00000503%' and ced_bene='1'

update cxp_rd_spg set ced_bene='2' where numrecdoc like '00000500%' and ced_bene='1'
update cxp_rd_spg set ced_bene='2' where numrecdoc like '00000501%' and ced_bene='1'
update cxp_rd_spg set ced_bene='200000856' where numrecdoc like '00000502%' and ced_bene='1'
update cxp_rd_spg set ced_bene='6' where numrecdoc like '00000503%' and ced_bene='1'


delete from cxp_rd where numrecdoc like '00000500%' and ced_bene='1';
delete from cxp_rd where numrecdoc like '00000501%' and ced_bene='1';
delete from cxp_rd where numrecdoc like '00000502%' and ced_bene='1';
delete from cxp_rd where numrecdoc like '00000503%' and ced_bene='1';

select * from cxp_rd where ced_bene='1';
select * from cxp_rd_scg where ced_bene='1';
select * from cxp_rd_spg where ced_bene='1';