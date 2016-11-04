<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
<%@ include file="TS_Common_Libraries.jsp" %> 



<%
String name = (request.getParameter("name") == null ) ? "" : request.getParameter("name") ;

if ( name.indexOf("profile") > -1 ) {   

String email = request.getParameter("email");

if ( name.indexOf("suscribirse") > -1 ) { /**  Suscripcion del newsleter en el login y perfil del usuario */ %>
<form name="OKRegistracion" id="OKRegistracion" method="post">
	<input id="email" class="inputbox" type="hidden" value="<%=email %>" name="email" size="30" maxlength="255" />
</form>
<script type="text/javascript">
	$(document).ready(function() {
		$('.OKRegistracion').fadeIn('fast');
		document.Automatico.submit(); 
	});
</script>
<% } else { /**  desuscripcion del newsleter en el perfil del usuario */  %>

<% /******* PONER CODIGO*********/ %>

<% }  %>
<% } else if ( name.equals("header") ) {  /**  Suscripcion del newsleter en el header */  %>

<div id="suscrip" class="activ">
	<h5><i><span></span></i>Suscribe to the Bulletin 
		<img <cms:img src="/arte/closeLog.jpg" scaleType="2" partialTag="true" /> alt="Telesur" class="closeLog" /></h5>
		<div class="wpSus">
			<form name="Principal" id="Principal" method="post" enctype="multipart/form-data" onsubmit="return ValidarHeader();"> 
				<input id="email" class="inputbox" type="text" placeholder="Enter your email"  name="email" size="30" maxlength="255" />
				<input id="subscribe1" type="submit" value="Subscribe" name="boton1" />	
				
				
			</form>
			<div id="RegistroPrincipal" class="validarForm msjerror" style="display: none; clear:both;z-index:9999">
			</div>
		</div>
	</div>

 <script type="text/javascript"> //script que envia los datos al template TS_DMDS
 	$(function () {
 	jQuery.fn.reset = function () {
 	$(this).each(function () {
 	this.reset();
 	});
 }
 	$("#subscribe1").click(function () {
 	var dataString = $('#Principal').serialize();
            if (email == "") { }
            	else  {
                         var url = "/system/modules/com.tfsla.diario.telesur.en/templates/TS_DMDS_INGLES.jsp"; // El script a dónde se realizará la petición.
                         $.ajax({
                            type: "POST",
                            url: url,
			    data: dataString, // datos serializados 
			    async: false,
			    dataType: "text",
			    success: function (data){
				 $("#RegistroPrincipal").css("display", "block");
				 	var n = data.search("111");
				 	if(n==-1){
				 		var y = data.search("0 relaciones nuevas");
				 		if(y==-1){
				 			$("#RegistroPrincipal").css("background-color", "#1A2042");
				 			$("#RegistroPrincipal").html("Your email has been successfully registered");
				 		}
				 		else{
				 			$("#RegistroPrincipal").html("This email address is already registered");
				 		}
				 	}
				 	else if (n>-1){
				 		$("#RegistroPrincipal").html("The email you entered is incorrect");
				 	}
				 	
				 	$("#Principal").reset();                                                                  
				 }
				});
				                        } 
				                        return false;                                
				                    }); 
				 	});
				 	
 </script> 
 
 <% } else if ( name.equals("footer") ) {   /**  Suscripcion del newsleter en el footer */ %>

 <span>Subscribe to our news bulletins</span>
 <form name="Footer" id="Footer" method="post" enctype="multipart/form-data" onsubmit="return ValidarFooter();">
 	<input id="email" class="inputbox" type="text" placeholder="Enter your email" name="email" size="30" maxlength="255" />
 	<input id="subscribe2" type="submit" value="Subscribe" name="boton2" />		
 </form>
 
 <div id="RegistroFooter" class="validarForm msjerrorFooter" style="display: none; clear:both;">
 
 <script type="text/javascript"> <%-- script que envia los datos al template TS_DMDS --%>
 	$(function () {
 	jQuery.fn.reset = function () {
 	$(this).each(function () {
 	this.reset();
 	});
 }
 	$("#subscribe2").click(function () {
 	var String = $('#Footer').serialize();
          if (email == "") { }
            	else  {
                           var url = "/system/modules/com.tfsla.diario.telesur.en/templates/TS_DMDS_INGLES.jsp"; // El script a dónde se realizará la petición.
                           $.ajax({
                            type: "POST",
                            url: url,
                            data: String, // datos serializados 
                            async: false,
                            success: function (data){
			 	$("#RegistroFooter").css("display", "block");
			 	var n = data.search("111");
			 	if(n==-1){
			 		var y = data.search("0 relaciones nuevas");
			 		if(y==-1){
			 			$("#RegistroFooter").html("Your email has been successfully registered");
			 		}
			 		else{
			 			$("#RegistroFooter").html("This email address is already registered");
			 		}
			 	}
			 	else if (n>-1){
			 		$("#RegistroFooter").html("The email you entered is incorrect");
			 	}
			 	
			 	$("#Footer").reset();                                                                  
			 }
			});
			                        } 
			                        return false;                                
			                    }); 
			 	});
 	
 </script>

 <script LANGUAGE="JavaScript">
 	function ValidarHeader(){
 		var RegEmail = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
 		validar = true;
 		if(document.Principal.email.value.length == 0){
 			document.getElementById('diverrorHeader').style.display = "block";
 			document.Principal.email.focus();
 			return false;
 		}
 		if(document.Principal.email.value.match(RegEmail)){
 			$('.OKheader').fadeIn('fast');
 			$('.ocultarBulletinHeader').fadeOut('fast');
 			document.getElementById('diverrorHeader').style.display = "none";
 			return validar;	
 		} else {
 			document.getElementById('diverrorHeader').style.display = "block";
 			document.Principal.email.focus();
 			return false;
 		}				   	
 	}
 	function ValidarFooter(){
 		var RegEmail = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
 		validar = true;
 		if(document.Footer.email.value.length == 0){
 			document.getElementById('diverrorFooter').style.display = "block";
 			document.Footer.email.focus();
 			return false;
 		}
 		if(document.Footer.email.value.match(RegEmail)){
 			$('.OKfooter').fadeIn('fast');
 			$('.ocultarBulletinFooter').fadeOut('fast');
 			document.getElementById('diverrorFooter').style.display = "none";
 			return validar;	
 		} else {
 			document.getElementById('diverrorFooter').style.display = "block";
 			document.Principal.email.focus();
 			return false;
 		}				   	
 	}
 	function ValidarBloque(){
 		var RegEmail = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
 		validar = true;
 		if(document.Bloque.correo.value.length == 0){
 			document.getElementById('diverror').style.display = "block";
 			document.Bloque.correo.focus();
 			return false;
 		}
 		if(document.Bloque.correo.value.match(RegEmail)){
 			$('.OK').fadeIn('fast');
 			$('.ocultarBulletin').fadeOut('fast');
 			document.getElementById('diverror').style.display = "none";
 			return validar;	
 		} else {
 			document.getElementById('diverror').style.display = "block";
 			document.Bloque.correo.focus();
 			return false;
 		}				   	
 	}	
 </script>

 <% } else {  /**  Suscripcion del newsleter en blocks (columna dercha)  */ %>
 <%-- Formulario de suscripcion al Newsletter --%>
 <div class="bulletin cont ocultarBulletin desktop" id="bulletin">
 	<div class="titlebulletin borderb">		
 		<div class="titlebulletin img"><cms:img src="/arte/logo-side.png" alt="teleSUR" title="teleSUR"/></div>	
 		<div class="titlebulletin txt">Newsletter</div>	
 		<div class="titlebulletin txt">Get our newsletter delivered directly to your inbox</div>
 		<div class="subsside">
 			<form name="Bloque" id="Bloque" method="post" enctype="multipart/form-data" onsubmit="return ValidarBloque();" >
 				<input id="email" class="mail" type="text" placeholder="Enter your email" name="email"  maxlength="255" />
 				<input id="subscribe3" type="submit" value="Subscribe" name="boton3" />		 
 			</form>
 		</div>
 		<div id="RegistroBloque" class="validarForm" style="display: none; clear:both;"></div>			
 	</div>
 </div> 
 
  <script type="text/javascript"> //script que envia los datos al template TS_DMDS
 	$(function () {
 	jQuery.fn.reset = function () {
 	$(this).each(function () {
 	this.reset();
 	});
 }
 	$("#subscribe3").click(function () {
 	var dataString = $('#Bloque').serialize();
            if (email == "") { }
            	else  {
                         var url = "/system/modules/com.tfsla.diario.telesur.en/templates/TS_DMDS_INGLES.jsp"; // El script a dónde se realizará la petición.
                         $.ajax({
                            type: "POST",
                            url: url,
			    data: dataString, // datos serializados 
			    async: false,
			    dataType: "text",
			    success: function (data){
				 $("#RegistroBloque").css("display", "block");
				 	var n = data.search("111");
				 	if(n==-1){
				 		var y = data.search("0 relaciones nuevas");
				 		if(y==-1){
				 			$("#RegistroBloque").html("Your email has been successfully registered");
				 		}
				 		else{
				 			$("#RegistroBloque").html("This email address is already registered");
				 		}
				 	}
				 	else if (n>-1){
				 		$("#RegistroBloque").html("The email you entered is incorrect");
				 	}
				 	
				 	$("#Bloque").reset();                                                                  
				 }
				});
				                        } 
				                        return false;                                
				                    }); 
				 	});
				 	
 </script> 
 
 <%-- Mensaje de OK al suscribirse en el Newsletter, se mostrará mendiante JS una vez validado el mail del usuario --%>
 <div class="bulletin cont OK desktop" id="bulletin" style="display: none;">
 	<div class="titlebulletin borderb">
 		<div class="titlebulletin img"><cms:img src="/arte/logo-side.png" alt="teleSUR" title="teleSUR"/></div><div class="titlebulletin txt">Boletines</div>
 		<div class="titlebulletin txt">Your email has been successfully registered.</div>
 	</div>
 </div>
 <% } %>	