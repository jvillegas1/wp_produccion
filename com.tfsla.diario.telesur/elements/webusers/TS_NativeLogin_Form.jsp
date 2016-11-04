<%@ include file="../TS_Common_Libraries.jsp" %>

<%@ page language="java"
         import="org.opencms.jsp.CmsJspActionElement,
         	 org.opencms.jsp.CmsJspLoginBean"%>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.opencms.webusers.Encrypter" %>
<%@ page import="java.util.regex.*" %>

<%
//Get the action beans.
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

//Login user if form was submitted.
boolean loginError = false;

if ( request.getParameter("R") != null ){
	request.getSession().setAttribute("noticiaLogin", request.getParameter("R"));
}
if ( request.getParameter("P") != null ){
	request.getSession().setAttribute("linkLogin", request.getParameter("P"));
}

String redirectUri = "/";

if ( request.getSession().getAttribute("noticiaLogin") != null ){
	redirectUri = (String)request.getSession().getAttribute("noticiaLogin") + "?#comentarios";
}
if ( request.getSession().getAttribute("linkLogin") != null ){
	redirectUri = (String)request.getSession().getAttribute("linkLogin");
}

if ( request.getParameter("login_username") != null ) {
	//Get input username and password.
	String inputUsername = request.getParameter("login_username").toString();
	String inputPassword = request.getParameter("login_password").toString();
	String rememberMe = request.getParameter("rememberMe");


	//Progress only if they both have values.
	if(inputUsername.trim().length()>0 && inputPassword.trim().length()>0){
		try {
			loginBean.login("webuser/" + inputUsername, inputPassword,"Online");
			loginError = !loginBean.isLoginSuccess();
			if( !loginError ) {
				RegistrationModule.getInstance(cms.getCmsObject()).login(loginBean, inputPassword, response, rememberMe);
				Cookie userCookie = new Cookie("logd", "webuser/" + inputUsername);
				userCookie.setMaxAge(-1);
				userCookie.setPath("/");
				response.addCookie(userCookie);
			}
		}catch(Exception e){
			loginError = true;
		}
	}else {
		loginError = true;
	}
} else {
	//no vino el usuario desde el form de login, asi que buscamos si estan las cookies
	String userName = RegistrationModule.getInstance(cms.getCmsObject()).getUserNameFromCookie(request);
	String password = RegistrationModule.getInstance(cms.getCmsObject()).getPasswordFromCookie(request);

	if(userName != null && password != null) {
	//las cookies estan presentes
		try {
			loginBean.login(userName, password, "Online");
			loginError = !loginBean.isLoginSuccess();
			
		}catch(Exception e){
			loginError = true;
		}
	}
}

//Set flag for currently logged in.
boolean userIsLoggedIn = loginBean.isLoggedIn();

//Get current page url and current project.
String currentUri = cms.getRequestContext().getUri();

if (userIsLoggedIn) {
	response.sendRedirect(redirectUri);
}

String errorDescription = "";
	if(request.getParameter("E") != null) errorDescription = request.getParameter("E");
	
%>
  	
		<% if(!errorDescription.equals("")){ %>
			<div class="cont">
				<div class="error">
					<div class="txtaviso"><%= errorDescription %></div>
				</div>
			</div>
			<div class="separador"></div>
		<% } %>
		
		<% if(loginError && request.getParameter("login_username") != null){ %>
			<div class="cont">
				<div class="error">
					<div class="txtaviso">Usuario y/o clave incorrectos.</div>
				</div>
			</div>
			<div class="separador"></div>
		<% } %>
		<div class="row clear">
			<div class="col">
				<div class="cont titreg">Ingresa a teleSUR </div>

				<div class="col-mid"><!-- inicio col-mid -->
					<div class="cont" style="height:340px">
						<form id="login" name="login" class="form-elements" method="post" action="<%= currentUri %>">
							<input <% if ( loginError && request.getParameter("login_username") != null ) { %>  class="mal" <% } %> type="text" id="login_username" name="login_username" value="" placeholder="Email*" >
						        <input <% if ( loginError && request.getParameter("login_password") != null ) { %>  class="mal" <% } %> type="password" id="login_password"  name="login_password" placeholder="Contraseña*" />		

						         <p style="float:right; font-size:1.2em; ">*Campos Obligatorios</p>
						
							<div class="checkline row clear">   
								<div class="squaredThree">
									<input type="checkbox" name="rememberMe" id="rememberMe" checked>
									<label for="rememberMe"></label>
								</div>
								<div class="txtregister" style="width:50%">Recordar mi usuario</div>
						
					       		</div>    
					       		<p style="border-bottom: 1px solid #CCCCCC;float: left;margin-bottom: 25px;width: 100%;"></p> 
					    
					    		<a href="/usuarios/recuperar_clave.html" class="olvideLogIn">¿Olvidaste tu contraseña?</a>
					       		<a href="/index.html" id="cancelar" style="float:right">Cancelar</a>
					       		<input id="subscribe" type="submit" value="Enviar" name="submit" style="float:right">
				       		</form>
			       		</div>
			    	</div>
			</div><!-- fin col-mid -->       
			<div class="col-mid">
				<cms:include page="../../elements/webusers/openauthorization/TS_SocialLogin_Login.jsp"/>
			</div>
		</div>