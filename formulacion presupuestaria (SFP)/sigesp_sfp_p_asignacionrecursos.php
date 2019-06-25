<?php
    session_start();
	//////////////////////////////////////////////         SEGURIDAD               /////////////////////////////////////////////
	if(!array_key_exists("la_logusr",$_SESSION))
	{
		print "<script language=JavaScript>";
		print "location.href='../sigesp_inicio_sesion.php'";
		print "</script>";		
	}
	$ls_logusr=$_SESSION["la_logusr"];
	//require_once("class_folder/class_funciones_nomina.php");//echo getcwd(); die();
	require_once("class_folder/class_funciones_sfp.php");
	$io_fun_sfp=new class_funciones_sfp();
	$io_fun_sfp->uf_load_seguridad("SFP","sigesp_sfp_p_asignacionrecursos.php",$ls_permisos,$la_seguridad,$la_permisos);
	//////////////////////////////////////////////         SEGURIDAD               /////////////////////////////////////////////

   //--------------------------------------------------------------
   function uf_limpiarvariables()
   {
		//////////////////////////////////////////////////////////////////////////////
		//	     Function: uf_limpiarvariables
		//		   Access: private
		//	  Description: Función que limpia todas las variables necesarias en la página
		//	  Creado Por: Sistemas de Informacion MDO
		// Fecha Creación: 26/08/2017 								Fecha Última Modificación : 
		//////////////////////////////////////////////////////////////////////////////
   			
		global $ls_anopresupuesto,$ls_codestpro1,$ls_denestpro1,$ls_codestpro2,$ls_denestpro2;
		global $ls_codestpro3,$ls_denestpro3,$ls_codestpro4,$ls_denestpro4;
		global $ls_codestpro5,$ls_denestpro5,$ls_estcla;
		
		global $ls_tipopersonal,$ls_activarcodigo,$ls_existe,$ls_operacion,$io_fun_sfp;

		
		$ls_anopresupuesto="";
		$ls_codestpro1="";
		$ls_denestpro1="";
		$ls_codestpro2="";
		$ls_denestpro2="";
		$ls_codestpro3="";
		$ls_denestpro3="";
		$ls_codestpro4="";
		$ls_denestpro4="";
		$ls_codestpro5="";
		$ls_denestpro5="";
		$ls_estcla="";

		$ls_tipopersonal="disabled";
		$ls_activarcodigo="";
		$ls_existe=$io_fun_sfp->uf_obtenerexiste();					
		$ls_operacion =$io_fun_sfp->uf_obteneroperacion();
   }
   //--------------------------------------------------------------

   //--------------------------------------------------------------
   function uf_load_variables()
   {
		//////////////////////////////////////////////////////////////////////////////
		//	     Function: uf_load_variables
		//		   Access: private
		//	  Description: Función que carga todas las variables necesarias en la página
		//	  Creado Por: Sistemas de Informacion MDO
		// Fecha Creación: 26/08/2017 								Fecha Última Modificación : 
		//////////////////////////////////////////////////////////////////////////////
   				
		global $ls_anopresupuesto,$ls_codestpro1,$ls_denestpro1,$ls_codestpro2,$ls_denestpro2;
		global $ls_codestpro3,$ls_denestpro3,$ls_codestpro4,$ls_denestpro4;
		global $ls_codestpro5,$ls_denestpro5,$ls_estcla;
		
		$ls_anopresupuesto=$_POST["txtanopresupuesto"];
		$ls_codestpro1=$_POST["txtcodestpro1"];
		$ls_denestpro1=$_POST["txtdenestpro1"];
		$ls_codestpro2=$_POST["txtcodestpro2"];		      
		$ls_denestpro2=$_POST["txtdenestpro2"];
		$ls_codestpro3=$_POST["txtcodestpro3"];		      
		$ls_denestpro3=$_POST["txtdenestpro3"];
		$ls_codestpro4=$_POST["txtcodestpro4"];		      
		$ls_denestpro4=$_POST["txtdenestpro4"];
		$ls_codestpro5=$_POST["txtcodestpro5"];		      
		$ls_denestpro5=$_POST["txtdenestpro5"];
		$ls_estcla=$_POST["txtestcla"];
		
   }
   //--------------------------------------------------------------
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" language="JavaScript1.2" src="../shared/js/disabled_keys.js"></script>
<script language="javascript">
	if(document.all)
	{ //ie 
		document.onkeydown = function(){ 
		if(window.event && (window.event.keyCode == 122 || window.event.keyCode == 116 || window.event.ctrlKey)){
		window.event.keyCode = 505; 
		}
		if(window.event.keyCode == 505){ 
		return false; 
		} 
		} 
	}
</script>
<title >Asignaci&oacute;n de Recursos</title>
<meta http-equiv="imagetoolbar" content="no"> 
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EFEBEF;
}

a:link {
	color: #006699;
}
a:visited {
	color: #006699;
}
a:active {
	color: #006699;
}

-->
</style>
<script type="text/javascript" language="JavaScript1.2" src="js/stm31.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="js/funcion_sfp.js"></script>
<link href="css/nomina.css" rel="stylesheet" type="text/css">
<link href="../shared/css/tablas.css" rel="stylesheet" type="text/css">
<link href="../shared/css/ventanas.css" rel="stylesheet" type="text/css">
<link href="../shared/css/cabecera.css" rel="stylesheet" type="text/css">
<link href="../shared/css/general.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php 
	require_once("sigesp_sfp_c_fuentefinanciamiento.php");
	$io_financiamiento=new sigesp_sfp_c_fuentefinanciamiento();
	uf_limpiarvariables();
	switch ($ls_operacion) 
	{
		case "GUARDAR":
			uf_load_variables();
			$lb_valido=$io_financiamiento->uf_guardar($ls_existe,$ls_anopresupuesto,$ls_codestpro1,$ls_codestpro2,$ls_codestpro3,$ls_codestpro4,$ls_codestpro5,$ls_denestpro5,$ls_estcla,$la_seguridad);
			if($lb_valido)
			{
				uf_limpiarvariables();
				$ls_existe="FALSE";
			}
			break;

		case "ELIMINAR":
			uf_load_variables();
			$lb_valido=$io_financiamiento->uf_delete_fuentefinanciamiento($ls_anopresupuesto,$ls_codestpro1,$ls_codestpro2,$ls_codestpro3,$ls_codestpro4,$ls_codestpro5,$ls_estcla,$la_seguridad);
			if($lb_valido)
			{
				uf_limpiarvariables();
				$ls_existe="FALSE";
			}
			break;
			
		case "BUSCAR":
			uf_limpiarvariables();
			$ls_anopresupuesto=$_POST["ano_presupuesto"];
			$ls_codestpro1=$_POST["codestpro1"];
			$ls_codestpro2=$_POST["codestpro2"];
			$ls_codestpro3=$_POST["codestpro3"];
			$ls_codestpro4=$_POST["codestpro4"];
			$ls_codestpro5=$_POST["codestpro5"];
			$ls_estcla=$_POST["estcla"];
			$lb_valido=$io_financiamiento->uf_load_fuentefinanciamiento($ls_existe,$ls_anopresupuesto,$ls_codestpro1,$ls_codestpro2,$ls_codestpro3,$ls_codestpro4,$ls_codestpro5,$ls_estcla);
			$ls_activarcodigo=" readonly";
			break;
	}
	$io_financiamiento->uf_destructor();
	unset($io_financiamiento);
?>
<table width="762" border="0" align="center" cellpadding="0" cellspacing="0" class="contorno">
  <tr>
    <td width="780" height="30" colspan="11" class="cd-logo"><img src="../shared/imagebank/header.jpg" width="778" height="40"></td>
  </tr>
  <tr>
    <td width="432" height="20" colspan="11" bgcolor="#E7E7E7">
		<table width="762" border="0" align="center" cellpadding="0" cellspacing="0">
			<td width="432" height="20" bgcolor="#E7E7E7" class="descripcion_sistema">Sistema Formulacion Presupuestaria</td>
			<td width="346" bgcolor="#E7E7E7" class="letras-pequenas"><div align="right"><b><?php print date("j/n/Y")." - ".date("h:i a");?></b></div></td>
	  	    <tr>
	  	      <td height="20" bgcolor="#E7E7E7" class="descripcion_sistema">&nbsp;</td>
	  	      <td bgcolor="#E7E7E7" class="letras-pequenas"><div align="right"><b><?PHP print $_SESSION["la_nomusu"]." ".$_SESSION["la_apeusu"]." - <font style='color:red'>".strtoupper($_SESSION["ls_database"])."</font>";?></b></div></td></tr>
        </table>
	</td>
   </tr>
  <tr>
    <td height="20" colspan="11" bgcolor="#E7E7E7" class="cd-menu"><script type="text/javascript" language="JavaScript1.2" src="js/menu.js"></script></td>
  </tr>
  <tr>
    <td width="780" height="13" colspan="11" class="toolbar"></td>
  </tr>
  <tr>
    <td height="20" width="25" class="toolbar"><div align="center"><a href="javascript: ue_nuevo();"><img src="../shared/imagebank/tools20/nuevo.gif"  title="Nuevo" alt="Nuevo" width="20" height="20" border="0"></a></div></td>
    <td class="toolbar" width="25"><div align="center"><a href="javascript: ue_guardar();"><img src="../shared/imagebank/tools20/grabar.gif" title="Guardar" alt="Grabar" width="20" height="20" border="0"></a></div></td>
    <td class="toolbar" width="25"><div align="center"><a href="javascript: ue_buscar();"><img src="../shared/imagebank/tools20/buscar.gif" title="Buscar" alt="Buscar" width="20" height="20" border="0"></a></div></td>
    <td class="toolbar" width="25"><div align="center"><a href="javascript: ue_eliminar();"><img src="../shared/imagebank/tools20/eliminar.gif" title="Eliminar" alt="Eliminar" width="20" height="20" border="0"></a></div></td>
    <td class="toolbar" width="25"><div align="center"><a href="javascript: ue_cerrar();"><img src="../shared/imagebank/tools20/salir.gif" title="Salir" alt="Salir" width="20" height="20" border="0"></a></div></td>
    <td class="toolbar" width="25"><div align="center"><a href="javascript: ue_ayuda();"><img src="../shared/imagebank/tools20/ayuda.gif" title="Ayuda" alt="Ayuda" width="20" height="20" border="0"></a></div></td>
    <td class="toolbar" width="25"><div align="center"></div></td>
    <td class="toolbar" width="25"><div align="center"></div></td>
    <td class="toolbar" width="25"><div align="center"></div></td>
    <td class="toolbar" width="25"><div align="center"></div></td>
    <td class="toolbar" width="530">&nbsp;</td>
  </tr>
</table>

<p>&nbsp;</p>
<form name="form1" method="post" action="">
<?php
//////////////////////////////////////////////         SEGURIDAD               /////////////////////////////////////////////
	$io_fun_sfp->uf_print_permisos($ls_permisos,$la_permisos,$ls_logusr,"location.href='sigespwindow_blank.php'");
	unset($io_fun_sfp);
//////////////////////////////////////////////         SEGURIDAD               /////////////////////////////////////////////
?>		  
<table width="850" border="0" align="center" cellpadding="0" cellspacing="0" class="formato-blanco">
  <tr>
    <td >
      <p>&nbsp;</p>
      <table width="820" border="0" align="center" cellpadding="1" cellspacing="0" class="formato-blanco">
        <tr class="titulo-ventana">
          <td height="20" colspan="2" class="titulo-ventana">Estructura Presupuestaria </td>
        </tr>
	   
	   <!--	
	   <tr>
          <td width="86" height="22">&nbsp;</td>
          <td width="302">&nbsp;</td>
        </tr>
		!-->
		
		<tr>
          <td height="22"><div align="right">A&ntildeo Presupuesto</div></td>
          <td><div align="left">
            <input name="txtanopresupuesto" type="text" id="txtanopresupuesto" size="4" maxlength="4" value="<?php  print $ls_anopresupuesto ? $ls_anopresupuesto : (int)(substr(($_SESSION["ls_database"]),-4))+1   ;?>" onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,4);" <?php print $ls_activarcodigo;?>>
          </div></td>
        </tr>
		
		<tr>
                <td height="22"><div align="right">Proyecto</div></td>
                <td height="22" colspan="3" align="left">
					<input name="txtcodestpro1" type="text" id="txtcodestpro1" style="text-align:center" value="<?php print $ls_codestpro1; ?>" size="25" readonly>
					<input name="txtdenestpro1" type="text" class="sin-borde" id="txtdenestpro1" value="<?php print $ls_denestpro1; ?>" size="60">
				</td>
        </tr>
		
		<tr>
                <td height="22"><div align="right">Unidad Ejecutora</div></td>
                <td height="22" colspan="3" align="left">
					<input name="txtcodestpro2" type="text" id="txtcodestpro2" style="text-align:center" value="<?php print $ls_codestpro2; ?>" size="25" readonly>
					<input name="txtdenestpro2" type="text" class="sin-borde" id="txtdenestpro2" value="<?php print $ls_denestpro2; ?>" size="60">
				</td>
        </tr>
		
		<tr>
                <td height="22"><div align="right">Acciones Especificas</div></td>
                <td height="22" colspan="3" align="left">
					<input name="txtcodestpro3" type="text" id="txtcodestpro3" size="25" maxlength="25" style="text-align:center" value="<?php print $ls_codestpro3; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,25);" <?php print $ls_activarcodigo;?>>
					<input name="txtdenestpro3" type="text" class="sin-borde" id="txtdenestpro3" value="<?php print $ls_denestpro3; ?>" size="60">
				</td>
        </tr>

		<tr>
                <td height="22"><div align="right">Actividades</div></td>
                <td height="22" colspan="3" align="left">
					<input name="txtcodestpro4" type="text" id="txtcodestpro4" style="text-align:center" value="<?php print $ls_codestpro4; ?>" size="25" readonly>
					<a href="javascript: ue_catalogo('sigesp_sfp_cat_actividades.php');"><img src="../shared/imagebank/tools15/buscar.gif" width="15" height="15" border="0"></a>
					<input name="txtdenestpro4" type="text" class="sin-borde" id="txtdenestpro4" value="<?php print $ls_denestpro4; ?>" size="60">
				</td>
        </tr>
		
		<tr>
                <td height="22"><div align="right">Fuente de Financiamiento</div></td>
                <td height="22" colspan="3" align="left">
					<input name="txtcodestpro5" type="text" id="txtcodestpro5" size="25" maxlength="25" style="text-align:center" value="<?php print $ls_codestpro5; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,25);" <?php print $ls_activarcodigo;?>>
				</td>				  
		</tr>
	
        <tr class="titulo-ventana">
          <td height="20" colspan="2" class="titulo-ventana">Definici&oacute;n del Recursos </td>
        </tr>
        <tr>	
	
		<tr>
                <td height="22"><div align="right">Recurso</div></td>
                <td height="22" colspan="3" align="left">
					<input name="txtrecurso" type="text" id="txtrecurso" style="text-align:center" value="<?php print $ls_codrecurso; ?>" size="25" readonly>
					<a href="javascript: ue_catalogo('sigesp_sfp_cat_recursos.php');"><img src="../shared/imagebank/tools15/buscar.gif" width="15" height="15" border="0"></a>
					<input name="txtdescrecurso" type="text" class="sin-borde" id="txtdescrecurso" value="<?php print $ls_descrecurso; ?>" size="60">
				</td>
        </tr>	
		
		<tr>
            <td height="22">
				<div align="right">Tipo</div>
			</td>
			<td>
				<div align="left">
					<select name="txtestcla" id="txtestcla">
						<option value=P select>Proyecto</option>
						<option value=A>Acci&oacute;n</option>
					</select>
               </div>
            </td>
		</tr>
		
		<tr>
            <td height="22">
				<div align="right">Escenario</div>
			</td>
			<td>
				<div align="left">
					<select name="txtescenario" id="txtescenario">
						<option value=1 select>1</option>
						<option value=2>2</option>
						<option value=3>3</option>
					</select>
               </div>
            </td>
		</tr>
		
        <tr class="titulo-ventana">
          <td height="20" colspan="2" class="titulo-ventana">Distribuci&oacute;n del Recursos </td>
        </tr>
      
		<table width="820" border="0" align="center" cellpadding="0" cellspacing="0" class="formato-blanco">
			<tr>
					<td height="22"><div align="right">Enero</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidadenero" type="text" id="txtcantidadenero" size="10" maxlength=10" style="text-align:center" value="<?php print $ls_cantidadenero; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontoenero" type="text" id="txtmontoenero" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montoenero; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>
					
					<td height="22"><div align="right">Febrero</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidadfebrero" type="text" id="txtcantidadfebrero" size="10" maxlength="10" style="text-align:center" value="<?php print $ls_cantidadfebrero; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontofebrero" type="text" id="txtmontofebrero" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montofebrero; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>
					
					<td height="22"><div align="right">Marzo</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidadmarzo" type="text" id="txtcantidadmarzo" size="10" maxlength="10" style="text-align:center" value="<?php print $ls_cantidadmarzo; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontomarzo" type="text" id="txtmontomarzo" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montomarzo; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>	
			</tr>

			<tr>
					<td height="22"><div align="right">Abril</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidadabril" type="text" id="txtcantidadabril" size="10" maxlength=10" style="text-align:center" value="<?php print $ls_cantidadabril; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontoabril" type="text" id="txtmontoabril" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montoenero; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>
					
					<td height="22"><div align="right">Mayo</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidadmayo" type="text" id="txtcantidadmayo" size="10" maxlength="10" style="text-align:center" value="<?php print $ls_cantidadmayo; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontomayo" type="text" id="txtmontomayo" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montomayo; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>
					
					<td height="22"><div align="right">Junio</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidadjunio" type="text" id="txtcantidadjunio" size="10" maxlength="10" style="text-align:center" value="<?php print $ls_cantidadjunio; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontojunio" type="text" id="txtmontojunio" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montojunio; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>	
			</tr>

			<tr>
					<td height="22"><div align="right">Julio</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidadjulio" type="text" id="txtcantidadjulio" size="10" maxlength=10" style="text-align:center" value="<?php print $ls_cantidadjulio; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontojulio" type="text" id="txtmontojulio" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montojulio; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>
					
					<td height="22"><div align="right">Agosto</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidadagosto" type="text" id="txtcantidadagosto" size="10" maxlength="10" style="text-align:center" value="<?php print $ls_cantidadagosto; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontoagosto" type="text" id="txtmontoagosto" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montoagosto; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>
					
					<td height="22"><div align="right">Septiembre</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidadseptiembre" type="text" id="txtcantidadseptiembre" size="10" maxlength="10" style="text-align:center" value="<?php print $ls_cantidadseptiembre; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontoseptiembre" type="text" id="txtmontoseptiembre" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montoseptiembre; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>	
			</tr>
			
			<tr>
					<td height="22"><div align="right">Octubre</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidadoctubre" type="text" id="txtcantidadoctubre" size="10" maxlength=10" style="text-align:center" value="<?php print $ls_cantidadoctubre; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontooctubre" type="text" id="txtmontooctubre" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montooctubre; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>
					
					<td height="22"><div align="right">Noviembre</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidadnoviembre" type="text" id="txtcantidadnoviembre" size="10" maxlength="10" style="text-align:center" value="<?php print $ls_cantidadnoviembre; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontonoviembre" type="text" id="txtmontonoviembre" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montonoviembre; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>
					
					<td height="22"><div align="right">Diciembre</div></td>
					<td height="22" colspan="3" align="left">
						<input name="txtcantidaddiciembre" type="text" id="txtcantidaddiciembre" size="10" maxlength="10" style="text-align:center" value="<?php print $ls_cantidaddiciembre; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,10);" <?php print $ls_activarcodigo;?>>
						<input name="txtmontodiciembre" type="text" id="txtmontodiciembre" size="20" maxlength="20" style="text-align:center" value="<?php print $ls_montodiciembre; ?>"onKeyUp="javascript: ue_validarnumero(this);" onBlur="javascript: ue_rellenarcampo(this,20);" <?php print $ls_activarcodigo;?>>
					</td>	
			</tr>
		</table>	  
		
		
		
		


		
		
       	<tr>
          <td height="22">&nbsp;</td>
          <td><input name="operacion" type="hidden" id="operacion">
            <input name="existe" type="hidden" id="existe" value="<?php print $ls_existe;?>"></td>
        </tr>
        
		<!--<tr>
          <td height="22">&nbsp;</td>
          <td><input name="btnCrear" type="button" class="boton" id="btnCrear" value=""></td>
        </tr>-->
      </table>
      <p>&nbsp;</p></td>
  </tr>
</table>
</form>      
<p>&nbsp;</p>
</body>
<script language="javascript">
function ue_nuevo()
{
	f=document.form1;
	li_incluir=f.incluir.value;
	if(li_incluir==1)
	{	
		f.operacion.value="NUEVO";
		f.existe.value="FALSE";		
		f.action="sigesp_sfp_d_fuentefinanciamiento.php";
		f.submit();
   	}
	else
   	{
 		alert("No tiene permiso para realizar esta operacion");
   	}
}

function ue_guardar()
{
	f=document.form1;
	li_incluir=f.incluir.value;
	li_cambiar=f.cambiar.value;
	lb_existe=f.existe.value;
	if(((lb_existe=="TRUE")&&(li_cambiar==1))||(lb_existe=="FALSE")&&(li_incluir==1))
	{
		codestpro1 = ue_validarvacio(f.txtcodestpro1.value);
		codestpro2 = ue_validarvacio(f.txtcodestpro2.value);
		codestpro3 = ue_validarvacio(f.txtcodestpro3.value);
		codestpro4 = ue_validarvacio(f.txtcodestpro4.value);
		codestpro5 = ue_validarvacio(f.txtcodestpro5.value);
		denestpro5 = ue_validarvacio(f.txtdenestpro5.value);
		if((codestpro1!="")&&(codestpro2!="")&&(codestpro3!="")&&(codestpro4!="")&&(codestpro5!="")&&(denestpro5!=""))
		{
			f.operacion.value="GUARDAR";
			f.action="sigesp_sfp_d_fuentefinanciamiento.php";
			f.submit();
		}
		else
		{
			alert("Debe llenar todos los datos.");
		}
   	}
	else
   	{
 		alert("No tiene permiso para realizar esta operacion");
   	}
}

function ue_eliminar()
{
	f=document.form1;
	li_eliminar=f.eliminar.value;
	if(li_eliminar==1)
	{
		if(f.existe.value=="TRUE")
		{
			codestpro1 = ue_validarvacio(f.txtcodestpro1.value);
			codestpro2 = ue_validarvacio(f.txtcodestpro2.value);
			codestpro3 = ue_validarvacio(f.txtcodestpro3.value);
			codestpro4 = ue_validarvacio(f.txtcodestpro4.value);
			codestpro5 = ue_validarvacio(f.txtcodestpro5.value);
			estcla = ue_validarvacio(f.txtestcla.value);
			if((codestpro1!="")&&(codestpro2!="")&&(codestpro3!="")&&(codestpro4!="")&&(codestpro5!="")&&(estcla!=""))
			{
				if(confirm("¿Desea eliminar el Registro actual?"))
				{
					f.operacion.value="ELIMINAR";
					f.action="sigesp_sfp_d_fuentefinanciamiento.php";
					f.submit();
				}
			}
			else
			{
				alert("Debe buscar el registro a eliminar.");
			}
		}
		else
		{
			alert("Debe buscar el registro a eliminar.");
		}
   	}
	else
   	{
 		alert("No tiene permiso para realizar esta operacion");
   	}
}

function ue_cerrar()
{
	location.href = "sigespwindow_blank.php";
}

function ue_buscar()
{
	f=document.form1;
	li_leer=f.leer.value;
	if (li_leer==1)
   	{
		window.open("sigesp_sfp_cat_fuentefinanciamiento.php","catalogo","menubar=no,toolbar=no,scrollbars=yes,width=530,height=400,left=50,top=50,location=no,resizable=no");
   	}
	else
   	{
 		alert("No tiene permiso para realizar esta operacion");
   	}
}

function ue_ayuda()
{
	width=(screen.width);
	height=(screen.height);
	//window.open("../hlp/index.php?sistema=SNO&subsistema=SNR&nomfis=sno/sigesp_hlp_snr_dedicacion.php","Ayuda","menubar=no,toolbar=no,scrollbars=yes,width="+width+",height="+height+",resizable=yes,location=no");
}
function ue_catalogo(ls_catalogo)
{
	// abre el catalogo que se paso por parametros
	//window.open(ls_catalogo+"?tipo=proyecto","_blank","menubar=no,toolbar=no,scrollbars=yes,width=550,height=400,left=50,top=50,location=no,resizable=yes");
	window.open(ls_catalogo+"?tipo=financiamiento","_blank","menubar=no,toolbar=no,scrollbars=yes,width=550,height=400,left=50,top=50,location=no,resizable=yes");
}

</script> 
</html>