<%@ include file="../../TS_Common_Libraries.jsp" %>

<%@page import="java.util.*,
		 java.io.*,
		 org.opencms.jsp.*,
		 org.opencms.file.CmsProperty,
		 org.opencms.file.CmsPropertyDefinition,
		 org.opencms.security.CmsSecurityException,
		 org.opencms.file.types.CmsResourceTypePlain,
		 org.opencms.file.CmsResource,
		 org.opencms.file.CmsProject,
		 org.opencms.util.CmsFileUtil,
		 org.opencms.file.CmsObject,
		 org.opencms.file.CmsFile,
		 org.opencms.main.*" %>
<%@ page import="org.opencms.db.CmsPublishList" %>
<%@ page import="org.opencms.file.CmsResourceFilter" %>
<%@ page import="org.opencms.report.CmsStringBufferReport" %>

<%@ page language="java"
         import="org.opencms.jsp.CmsJspActionElement,
         		 org.opencms.jsp.CmsJspLoginBean,
         		 org.opencms.file.CmsUser,
         		 java.util.Hashtable"%>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.opencms.webusers.TfsUserHelper" %>
<%@ page import="com.tfsla.exceptions.BusinessException" %>

<%
String ou = "webUser/";
String VALIDATION_PASSWORD      = "[A-Za-z0-9]{5,}";

CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);


String username = loginBean.getUserName();
if(username.indexOf("/")>-1){
	String[] arrayUser = username.split("/");
	username = arrayUser[1];
}

CmsUser currentUser 	= RegistrationModule.getInstance(cms.getCmsObject()).retrieveUser(cms.getCmsObject(), username);

boolean processError 	= false;
boolean process 	= false;
boolean errorConf 	= false;
boolean errorVal 	= false;
String tipoError 	= ""; 

if(request.getParameter("accion") != null){
    	
  	String password_value = request.getParameter("password");
  	String confirm_password_value = request.getParameter("confirm_password");   
  	
	if (!password_value.equals(confirm_password_value)){
		errorConf = true;
	}
	
	if (!password_value.matches(VALIDATION_PASSWORD )){
		errorVal = true;
	}
	
	if (!errorConf && !errorVal){
		
		cms.getCmsObject().getRequestContext().setCurrentProject(cms.getCmsObject().readProject("Offline"));
		try{
			RegistrationModule.getInstance(cms.getCmsObject()).changePassword(request, 
									response, 
									cms.getCmsObject(), 
									currentUser, 
									RegistrationModule.getInstance(cms.getCmsObject()).PasswOpenID(cms.getCmsObject(), ou + username), 
									confirm_password_value);
			process = true;								
		}catch (Exception e){
			processError = true;
			tipoError = tipoError+ "changePassword ";
		}
		
		try{
			RegistrationModule.getInstance(cms.getCmsObject()).SaveOpenIdPassw(ou + username, confirm_password_value);
		}catch (Exception e){
			processError = true;
			tipoError = tipoError+ "SaveOpenIdPassw ";
		}
		
		try{							
			RegistrationModule.getInstance(cms.getCmsObject()).changeNativePasswordFlag(ou + username, true);
			
		}catch (Exception e){
			processError = true;
			tipoError = tipoError+ "changeNativePasswordFlag ";
		}
		
		cms.getCmsObject().getRequestContext().setCurrentProject(cms.getCmsObject().readProject("Online"));
	}
	
	if (!errorConf && !errorVal && !processError && process)
		response.sendRedirect(request.getScheme() + "://" + request.getServerName() + "/usuarios/editar_perfil.html?CNP");
	
}
%>
	
	<div class="col-mid">
      		<div class="cont titreg"> Seleccionar contraseña </div>
		
		<% if(processError){%>
		<div class="cont">
			<div class="error">
				<div class="txtaviso">
      					<%=tipoError %>
                         	</div>
                       </div><!-- fin error -->
                 </div><!--fin cont-->
	     	<%}%>
	     	
		<% if (errorVal) { %>	     	
	                <div class="cont"><!--ini content error-->
	                       <div class="error"><!--ini box error-->
	                               	<div class="txtaviso">
	                               		 La contraseña debe ser mayor a 7 dígitos y contener números y letras.
	                         	</div>
	                       </div><!-- fin error -->
	                </div><!--fin cont-->
                <% } %>
                
                <% if (errorConf && !errorVal) { %>	     	
	                <div class="cont"><!--ini content error-->
	                       <div class="error"><!--ini box error-->
	                               	<div class="txtaviso">
	                               		 Las contraseñas no coinciden.
	                         	</div>
	                       </div><!-- fin error -->
	                </div><!--fin cont-->
                <% } %>
                 
		<form class="reg-form" id="frmSubmit" name="frmSubmit" action="/usuarios/seleccionarclave.html" method="post">
			<input type="hidden" name="accion" value="seleccionarclave">
        		
        		<input type="password" placeholder="Contraseña" id="password" name="password" required>*
        		<div class="anote">Debe ser mayor de 7 dígitos y contener números y letras.</div>
        		
        		<input type="password" placeholder="Repetir Contraseña" id="confirm_password" name="confirm_password" required>*
		        
	            	<div class="clear"></div>
		    	<input type="submit" value="Seleccionar Clave" id="seleccionarClave" style="width: 150px;">
		    	<div class="clear"></div>
		    	<div class="anote" style="margin-top:8px;">* Todos Los campos son obligatorios.</div>
		    	<a href="/usuarios/seleccionarclave.html" class="cancelForm">Cancelar</a>
	     	</from>
	     	
	     	<p style="color:#666666;width:50%;margin-right:2%; float:left; font-size:1.2em; line-height:1.5em;">
			Te enviaremos un Email a la siguiente dirección. La utilizarás para iniciar sesión en teleSUR.
            	</p>
            	
	     	
     	</div>
