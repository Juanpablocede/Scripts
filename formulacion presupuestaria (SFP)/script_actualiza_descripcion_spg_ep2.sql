update spg_ep2 set 
denestpro2=spg_temporal.denestpro2
from 
	spg_temporal
where
	spg_ep2.codemp=spg_temporal.codemp AND 
	spg_ep2.codestpro1=spg_temporal.codestpro1 AND 
	spg_ep2.estcla=spg_temporal.estcla AND 
	spg_ep2.codestpro2=spg_temporal.codestpro2