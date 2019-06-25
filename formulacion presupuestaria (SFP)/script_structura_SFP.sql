select
	sfp_estpro5.codemp,
	sfp_estpro5.ano_presupuesto,
	sfp_estpro5.codestpro1,
	sfp_estpro1.denestpro1,
	sfp_estpro5.codestpro2,
	sfp_estpro2.denestpro2,
	sfp_estpro5.codestpro3,
	sfp_estpro3.denestpro3,
	sfp_estpro5.codestpro4,
	sfp_estpro4.denestpro4,
	sfp_estpro5.codestpro5,
	sfp_estpro5.denestpro5
from
	sfp_estpro1,
	sfp_estpro2,
	sfp_estpro3,
	sfp_estpro4,
	sfp_estpro5
where
	sfp_estpro5.codestpro1=sfp_estpro1.codestpro1 and
	
	sfp_estpro5.codestpro1=sfp_estpro2.codestpro1 and
	sfp_estpro5.codestpro2=sfp_estpro2.codestpro2 and

	sfp_estpro5.codestpro1=sfp_estpro3.codestpro1 and
	sfp_estpro5.codestpro2=sfp_estpro3.codestpro2 and
	sfp_estpro5.codestpro3=sfp_estpro3.codestpro3 and

	sfp_estpro5.codestpro1=sfp_estpro4.codestpro1 and
	sfp_estpro5.codestpro2=sfp_estpro4.codestpro2 and
	sfp_estpro5.codestpro3=sfp_estpro4.codestpro3 and
	sfp_estpro5.codestpro4=sfp_estpro4.codestpro4 

order by
	sfp_estpro5.codestpro1,
	sfp_estpro5.codestpro2,
	sfp_estpro5.codestpro3,
	sfp_estpro5.codestpro4,
	sfp_estpro5.codestpro5
	

	