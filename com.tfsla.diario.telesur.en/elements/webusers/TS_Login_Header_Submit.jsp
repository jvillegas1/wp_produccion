<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ page language="java"
         import="org.opencms.jsp.CmsJspActionElement,
         		 org.opencms.jsp.CmsJspLoginBean,
         		 org.opencms.file.CmsUser,
         		 java.util.Hashtable"%>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.opencms.webusers.TfsUserHelper" %>
<%@ page import="com.tfsla.exceptions.BusinessException" %>
<%@ page import="org.opencms.file.CmsGroup" %>
<%@ page import="org.opencms.main.OpenCms" %>
<%@ page import="com.tfsla.diario.ediciones.model.TipoEdicion" %>
<%@ page import="com.tfsla.diario.ediciones.services.TipoEdicionBaseService" %>
<%@ page import="org.opencms.jsp.CmsJspActionElement" %>  

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />

<head>


<script type="text/javascript">

$(function() {
	$( "#form-login-submit" ).on('click', function( event ) {
		var _username = $('#cal_login_username').val();
		var _password = $('#cal_login_password').val();
		var _rememberMe = $('#rememberMe:checked').val();
		var _redirectUrl = $('#redirectUrl').val();
		var username = $('#cal_login_username').val().length;
  		

		var url = $("#form-login").attr("action");
		var data = { 
			cal_login_username: _username, 
			cal_login_password: _password, 
			rememberMe: _rememberMe, 
			R: _redirectUrl 
		};
		$.post( url, data, function(data, textStatus, xhr) {
			
			var response = $.parseJSON(data)
			alert(response.message)
			
			if ( response.message == "error" ) {
				//Podemos modificar el 'alert' por cualquier mensaje que querramos mostrar dentro del popUp
				
				if($('#cal_login_username').val().length == 0 && $('#cal_login_password').val().length == 0)
				{
					$("#error").html( "<div class='alert alert-danger'><a href='#' class='' data-dismiss='alert'>&times;</a><strong>Error!</strong> Enter your user.</div>" );
					$("#error").show();
					$("#error1").html( "<div class='alert alert-danger'><a href='#' class='' data-dismiss='alert'>&times;</a><strong>Error!</strong> Enter your password.</div>" );
					$("#error1").show();
				}
					
				if($('#cal_login_username').val().length > 0 && $('#cal_login_password').val().length == 0)
				{
					$("#error1").html( "<div class='alert alert-danger'><a href='#' class='' data-dismiss='alert'>&times;</a><strong>Error!</strong> Enter your password.</div>" );
					$("#error1").show();
					$("#error").hide();
				}	
				
				if($('#cal_login_username').val().length == 0 && $('#cal_login_password').val().length > 0)
				{
					$("#error").html( "<div class='alert alert-danger'><a href='#' class='' data-dismiss='alert'>&times;</a><strong>Error!</strong> Enter your user.</div>" );
					$("#error").show();
					$("#error1").hide();
				}	
				
				if($('#cal_login_username').val().length > 0 && $('#cal_login_password').val().length > 0)
				{
					$("#error1").html( "<div class='alert alert-danger'><a href='#' class='' data-dismiss='alert'>&times;</a><strong>Error!</strong> User and / or password incorrect.</div>" );
					$("#error1").show();
					$("#error").hide();
				}				
				
				$('#cal_login_username').val().empty();
				$('#cal_login_password').val().empty();
				
				
				
			} else if ( response.message == "ok" ) {
				
				//Hacemos el GET del html que creamos en los pasos 2 y 3, mostrando los datos del usuario logueado
				$.get("/dynamic/login_user_english.html", function(data){
					$("#header-content-1").html(data);
				});
				

				//Tambien podemos utilizar este proceso para agregar clases especificas a nuestro HTML (No es obligatorio)
				$("body").addClass("logged").removeClass("not-logged");

				$("#modal-login1").hide();
				$("#abrir-login").hide();

			} else if ( response.message == "redirect" ) {

			}
		});

		return false;
	});

	$('#form-cerrar-login').on('click', function(e){
		e.preventDefault();
		$("#modal-login1").hide();
	});
	$('.closeLog').on('click', function(e){
		e.preventDefault();
		$("#modal-login1").hide();
	});
});	


</script>



</head>

<% String redirectUrl = request.getParameter("redirectUrl") != null ? request.getParameter("redirectUrl") : ""; %>
<script type="text/javascript" language="javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/openauthorization.js</cms:link>"></script>

<div  class="popLogin" >
	<div class="modal-dialog modal-md"> 
	<div class="logIn">
			<h5><i><span></span></i>Log in to teleSUR <img <cms:img src="/arte/closeLog.jpg" scaleType="2" partialTag="true" /> alt="Telesur"  class="closeLog" /></h5>
			
			<div class="wpLog">
				<form method="post" role="form" data-toggle="validator" id="form-login" class="form-horizontal ajax-call" action="/usuarios/process_login.html">
					<input type="hidden" name="redirectUrl" id="redirectUrl" value="<%=redirectUrl%>" />
					<div class="form-group">						
						<!--No modificar el NAME ni ID del input-->
						<input type="text" class="form-control-login"  placeholder="User*" id="cal_login_username" name="cal_login_username" data-validation="email" data-validation-error-msg="No es un email válido"/>
						<div id="error"></div>
					</div>
				<div class="form-group">
						
						<!--No modificar el NAME ni ID del input-->
						<input type="password" class="form-control-login" placeholder="Password*" id="cal_login_password" name="cal_login_password" data-validation="required" data-validation-error-msg="Este campo es oligatorio"/>
						<div id="error1"></div>
				 	<div class="col-sm-8 col-sm-offset-3">
				 	
						<input type="checkbox" name="rememberMe" id="rememberMe1" checked="">
						<br>
						<div class="txtregister1" style="width:60%">Remember me</div>

					</div>
				</div>
				<button id="form-login-submit" type="submit" class="bt-reg btn btn-lg btn-primary pull-left">Submit</button>
				<button id="form-cerrar-login" class="btn btn-link btn-lg" data-dismiss="modal">Cancel</button>				
				<span>o ingresar con:</span>
		
				
		<nt:publication-context>
		
			<a href="#tw" onclick="javascript:openPopUpProvider('twitter', false, '${publication.id}', '${publication.name}' );" class="btnTwit">
				<cms:img src="/arte/ico-twitter.png" scaleType="2" alt="twitter" />
			</a>
			<a href="#fb" onclick="javascript:openPopUpProvider('facebook', false, '${publication.id}', '${publication.name}' );" class="btnFace">
				<cms:img src="/arte/ico-facebook.png" scaleType="2" alt="facebook" />
			</a>
			<a href="#gp" onclick="javascript:openPopUpProvider('googlePlus', false, '${publication.id}', '${publication.name}' );" class="btnGPlus">
				<cms:img src="/arte/ico-google.png" scaleType="2" alt="google plus" />
			</a>
		</nt:publication-context>
		<hr>
			</form>
				<a href="english/users/register.html" class="btnReg">Sign Up</a>
				<br><br> 
			</div>
		</div>
		</div>
		</div>
		<script src="https://www.google.com/recaptcha/api.js"></script>
<script>
$(document).ready(function () {

    $('#registration').telesurValidation();

</script>