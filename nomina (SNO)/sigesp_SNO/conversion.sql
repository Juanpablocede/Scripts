/*

https://www.youtube.com/watch?v=EXAafsXTefw

update comprobante 		set total=total/1000;
update comprobantedetalle 	set monto=monto/1000;
update cxp_dt_solicitudes 	set monto=monto/1000;
update cxp_rd 			set montotdoc=montotdoc/1000;
update cxp_rd 			set mondeddoc=mondeddoc/1000;
update cxp_rd 			set moncardoc=moncardoc/1000;
update cxp_rd 			set montot=montot/1000;
update cxp_rd_amortizacion	set monsal=monsal/1000;
update cxp_rd_amortizacion	set montotamo=montotamo/1000;
update cxp_rd_cargos		set monobjret=monobjret/1000;
update cxp_rd_cargos		set monret=monret/1000;
update cxp_rd_deducciones	set monobjret=monobjret/1000;
update cxp_rd_deducciones	set monret=monret/1000;
update cxp_rd_scg		set monto=monto/1000;
update cxp_rd_spg		set monto=monto/1000;
update cxp_sol_banco		set monto=monto/1000;
update cxp_solicitudes		set monsol=monsol/1000;
update mis_sigesp_banco		set monto=monto/1000;
update mis_sigesp_cxc		set monto=monto/1000;
update scb_conciliacion		set salseglib=salseglib/1000;
update scb_conciliacion		set salsegbco=salsegbco/1000;
update scb_conciliacion		set conciliacion=conciliacion/1000;
update scb_dt_cmp_ret		set totcmp_sin_iva=totcmp_sin_iva/1000;
update scb_dt_cmp_ret		set totcmp_con_iva=totcmp_con_iva/1000;
update scb_dt_cmp_ret		set basimp=basimp/1000;
update scb_dt_cmp_ret		set totimp=totimp/1000;
update scb_dt_cmp_ret		set iva_ret=iva_ret/1000;
update scb_historico_txt	set montototal=montototal/1000;
update scb_historico_txt	set monto=monto/1000;
update scb_movbco		set monto=monto/1000;
update scb_movbco		set monobjret=monobjret/1000;
update scb_movbco_scg		set monto=monto/1000;
update scb_movbco_scg		set monobjret=monobjret/1000;
update scb_movbco_spg		set monto=monto/1000;
update scg_dt_cmp		set monto=monto/1000;
update scg_saldos		set debe_mes=debe_mes/1000;
update scg_saldos		set haber_mes=haber_mes/1000;
update scv_dt_personal		set monpervia=monpervia/1000;
update scv_dt_scg		set monto=monto/1000;
update scv_dt_spg		set monto=monto/1000;
update scv_solicitudviatico	set monsolvia=monsolvia/1000;
update scv_tarifas		set monbol=monbol/1000;
update scv_tarifas		set mondol=mondol/1000;
update scv_tarifas		set monpas=monpas/1000;
update scv_tarifas		set monhos=monhos/1000;
update scv_tarifas		set monali=monali/1000;
update scv_tarifas		set monmov=monmov/1000;
update sep_conceptos		set monconsepe=monconsepe/1000;
update sep_cuentagasto		set monto=monto/1000;
update sep_dt_articulos		set monpre=monpre/1000;
update sep_dt_articulos		set monart=monart/1000;
update sep_dt_concepto		set monpre=monpre/1000;
update sep_dt_concepto		set moncon=moncon/1000;
update sep_dt_servicio		set monpre=monpre/1000;
update sep_dt_servicio		set monser=monser/1000;
update sep_dta_cargos		set monbasimp=monbasimp/1000;
update sep_dta_cargos		set monimp=monimp/1000;
update sep_dta_cargos		set monto=monto/1000;
update sep_dtc_cargos		set monbasimp=monbasimp/1000;
update sep_dtc_cargos		set monimp=monimp/1000;
update sep_dtc_cargos		set monto=monto/1000;
update sep_dts_cargos		set monbasimp=monbasimp/1000;
update sep_dts_cargos		set monimp=monimp/1000;
update sep_dts_cargos		set monto=monto/1000;
update sep_scv_dt_personal	set monpervia=monpervia/1000;
update sep_scv_dt_scg		set monto=monto/1000;
update sep_scv_dt_spg		set monto=monto/1000;
upate sep_solicitud		set monto=monto/1000;
upate sep_solicitud		set monbasinm=monbasinm/1000;
upate sep_solicitud		set montotcar=montotcar/1000;
update sep_solicitudcargos	set monobjret=monobjret/1000;
update sep_solicitudcargos	set monret=monret/1000;
update sep_solicitudcargos	set monto=monto/1000;
update sep_solicitudviatico	set monsolvia=monsolvia/1000;
update sigesp_cmp		set tota=total/1000;
update sigesp_cmp_md		set total=total/1000;
update sigesp_unidad_tributaria	set valunitri=valunitri/1000;
update siv_articulo		set prearta=prearta/1000;
update siv_articulo		set preartb=preartb/1000;
update siv_articulo		set preartc=preartc/1000;
update siv_articulo		set preartd=preartd/1000; 
update siv_articulo		set ultcosart=ultcosart/1000;
update siv_articulo		set cosproart=cosproart/1000;
update sno_anticipoprestaciones	set monpreant=monpreant/1000;
update sno_anticipoprestaciones	set monintant=monintant/1000;
update sno_anticipoprestaciones	set monantant=monantant/1000;
update sno_anticipoprestaciones	set monantint=monantint/1000;
update sno_anticipoprestaciones	set monant=monant/1000;
update sno_conceptopersonal	set acuemp=acuemp/1000;
update sno_conceptopersonal	set acupat=acupat/1000;
update sno_dt_scg		set monto=monto/1000;
update sno_dt_spg		set monto=monto/1000;
update sno_grado		set monsalgra=monsalgra/1000;
update sno_hgrado		set monsalgra=monsalgra/1000;
update sno_hperiodo		set totper=totper/1000;
update sno_hpersonalnomina	set sueper=surper/1000;
update sno_hpersonalnomina	set sueintper=sueintper/1000;
update sno_hpersonalnomina	set sueproper=sueproper/1000;
update sno_hprestamos		set monpre=monpre/1000;
update sno_hprestamos		set monamopre=monamopre/1000;
update sno_hprestamosamortizado	set monamo=monamo/1000;
update sno_hprestamosperiodo	set moncuo=moncuo/1000;
update sno_hresumen		set asires=asires/1000;
update sno_hresumen 		set dedres=dedres/1000;
update sno_hresumen 		set apoempres=apoempres/1000;
update sno_hresumen 		set apopatresapopatres/1000;
update sno_hresumen 		set priquires=priquires/1000;
update sno_hresumen 		set segquires=segquires/1000;
update sno_hresumen 		set monnetres=monnetres/1000;
update sno_salida 		set valsal=valsal/1000;
update sno_salida 		set monacusal=monacusal/1000;
update sno_salida 		set salsal=salsal/1000;
update sno_salida 		set priquisal=priquisal/1000;
update sno_salida 		set segquisal=segquisal/1000;
update sno_hvacacpersonal	set sueintbonvac=sueintbonvac/1000;
uptae sno_periodo		set totper=totper/1000;
update sno_personalnomina	set sueper=sueper/1000;
update sno_personalnomina	set sueintper=sueintper/1000;
update sno_personalnomina	set sueproper=sueproper/1000;
update sno_prestamos		set monpre=monpre/1000;
update sno_prestamos		set monamopre=monamopre/1000;
update sno_prestamosamortizado	set monamo=monamo/1000;
update sno_prestamosperiodo	set moncuo=moncuo/1000;
update sno_rd			set monpagper=monpagper/1000;
update sno_resumen		set asires=asires/1000;
update sno_resumen 		set dedres=dedres/1000;
update sno_resumen 		set apoempres=apoempres/1000;
update sno_resumen 		set apopatres=apopatres/1000;
update sno_resumen 		set priquires=priquires/1000;
update sno_resumen 		set segquires=segquires/1000;
update sno_resumen 		set monnetres=monnetres/1000;
update sno_salida		set valsal=valsal/1000;
update sno_salida 		set monacusal=monacusal/1000;
update sno_salida 		set salsal=salsal/1000;
update sno_salida 		set priquisal=priquisal/1000;
update sno_salida 		set segquisal=segquisal/1000;
update sno_sueldominimo		set monsuemin=monsuemin/1000;
update sno_thgrado		set monsalgra=monsalgra/1000;
update sno_thperiodo		set totper=totper/1000;
update sno_thpersonalnomina	set sueper=sueper/1000;
update sno_thpersonalnomina	set sueintper=sueintper/1000;
update sno_thpersonalnomina	set sueproper=sueproper/1000;
update sno_thprenomina		set valprenom=valprenom/1000;
update sno_thprenomina		set valhis=valhis/1000;
update sno_thprestamos		set monpre=monpre/1000;
update sno_thprestamos		set monamopre=monamopre/1000;
update sno_thprestamosamortizado	set monamo=monamo/1000;
update sno_thprestamosperiodo	set moncuo=moncuo/1000;
update sno_thresumen		set asires=asires/1000;
update sno_thresumen 		set apoempres=apoempres/1000;
update sno_thresumen 		set apopatres=apopatres/1000;
update sno_thresumen 		set priquires=priquires/1000;
update sno_thresumen 		set segquires=segquires/1000;
update sno_thresumen 		set monnetres=monnetres/1000;
update sno_thsalida 		set valsal=valsal/1000;
update sno_thsalida 		set monacusal=monacusal/1000;
update sno_thsalida 		set salsal=salsal/1000;
update sno_thsalida 		set priquisal=priquisal/1000;
update sno_thsalida 		set segquisal=segquisal/1000;
update sno_thvacacpersonal	set sueintbonvac=sueintbonvac/1000;
update sno_trabajoanterior	set ultsuetraant=ultsuetraant/1000;
update sno_vacacpersonal	set sueintbonvac=sueintbonvac/1000;











































*/