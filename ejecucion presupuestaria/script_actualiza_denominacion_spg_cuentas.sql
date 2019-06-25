update spg_cuentas set
denominacion=sigesp_plan_unico_re.denominacion
from 
sigesp_plan_unico_re
where
spg_cuentas.spg_cuenta=sigesp_plan_unico_re.sig_cuenta



