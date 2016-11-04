<%@ page import="java.util.*,
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
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.opencms.webusers.TfsUserHelper" %>
<%@ page import="com.tfsla.exceptions.BusinessException" %>
<%@ page import="com.tfsla.diario.comentarios.services.CommentsModule" %>
<%@ page import="com.tfsla.capcha.CaptchaManager" %>

<%
Boolean showCapchaError = false;
String ou = "webUser/";

String VALIDATION_EMAIL = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";

CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);

String currentUri = cms.getRequestContext().getUri();

String providerName = (String)request.getSession().getAttribute("providerName"); 

String registrationType = "A";

if(request.getSession().getAttribute("registrationType") != null)
	registrationType = (String)request.getSession().getAttribute("registrationType");

boolean processError = false;
boolean processErrorBussines = false;
boolean ErrorMail = false;
boolean checkTermsError = false ;

String email = "";
String mensajeprocessErrorBussines = "";
String accion = (request.getParameter("accion") != null) ? request.getParameter("accion") : "" ;

//FLAG PARA VERIFICAR SI EL NICKNAME YA ESTA REGISTRADO
Boolean nickNameIsAlreadyUsed = true;

//CONTADOR PARA AGREGAR DETRÁS DEL NICKNAME EN CASO QUE YA ESTÉ REGISTRADO.
int contNickName = 0;
String nickNameTemp = "";

if(request.getParameter("accion") != null){
	
    	String providerKey = (String)request.getSession().getAttribute("providerKey");
    	String picture = (String)request.getSession().getAttribute("user_picture");
	String nickName = (String)request.getSession().getAttribute("user_nickname");
	String accessToken = (String)request.getSession().getAttribute("user_accessToken");
	String accessSecret = (String)request.getSession().getAttribute("user_accessSecret");	
  	email = request.getParameter("profile_email");
  	
	if(email.equals("")) ErrorMail = true;
	
	String j_captcha_response = request.getParameter("j_captcha_response") != null ? request.getParameter("j_captcha_response") : "";
        String capchaId = request.getSession().getId();        
        String keyId = request.getParameter("capchaKeyId");
        capchaId = capchaId + keyId;        
        showCapchaError = CaptchaManager.getInstance(cms.getCmsObject()).validateResponseForID(capchaId,j_captcha_response.toUpperCase());
	showCapchaError = Boolean.valueOf(!showCapchaError.booleanValue());
        
        if( request.getParameter("accion") != null && request.getParameter("aceptaCond") == null) checkTermsError = true;

	if(!showCapchaError && !checkTermsError  && !ErrorMail) { 
	
		if(email.matches(VALIDATION_EMAIL)){
			try{
				cms.getCmsObject().getRequestContext().setCurrentProject(cms.getCmsObject().readProject("Offline"));
			
				String username = RegistrationModule.getInstance(cms.getCmsObject()).UserNameByMail(cms.getCmsObject(), email);
				
				if(username != null && username != "")
						throw new BusinessException("The entered email is already registered");
					
				//OBTENGO PASSWORD RANDOM
				String password = RegistrationModule.getInstance(cms.getCmsObject()).getRandomPassword();
			  
				List<String> atributosExtra = new ArrayList<String>(2);	
				List<String> valoresExtra = new ArrayList<String>(2);
						
				//SETEO PICTURE
				atributosExtra.add("USER_PICTURE");
				valoresExtra.add(picture);
				
				//SI EL NICKNAME NO EXISTE LO GUARDO, SI NO, LE AGREO UN NUMERO DETRÁS Y VOY PROBANDO HASTA ENCONTRAR UNO QUE NO EXISTA
				nickNameTemp = nickName;
						
				while ( nickNameIsAlreadyUsed ) {
					
					nickNameIsAlreadyUsed = RegistrationModule.getInstance(cms.getCmsObject()).checkExistsPropertyInUsers(cms.getCmsObject(), "APODO", nickNameTemp, email, true);
					
					if ( nickNameIsAlreadyUsed ) {
						nickNameTemp = nickName + "_" + contNickName;
						contNickName++;	
					}
				}
				nickName = nickNameTemp;
				
				atributosExtra.add("APODO");
				valoresExtra.add(nickName);
				
				atributosExtra.add("TIPO_REGISTRACION");
				valoresExtra.add(registrationType);
		
				atributosExtra.add("RECIBIR_AVISO_COMENTAN_POST");
				valoresExtra.add("false");
				
				atributosExtra.add("RECIBIR_AVISO_RESPONDEN_COMENTARIO");
				valoresExtra.add("false");
					
				//REGISTRO AL USUARIO
				RegistrationModule.getInstance(cms.getCmsObject()).addWebUserOpenID(cms.getCmsObject(),
												email,
												password,
												nickName,
												null,
												email,
												providerName,
												providerKey,
												accessToken,
												accessSecret,
												true,//EL USUARIO DEBE VALIDAR EL EMAIL
												atributosExtra,
												valoresExtra,
												"1");	
			
				
				cms.getCmsObject().getRequestContext().setCurrentProject(cms.getCmsObject().readProject("Online"));
			}
			catch (BusinessException exb){
				processErrorBussines = true;
				mensajeprocessErrorBussines = exb.getMessage() ;
			}		
			catch (Exception ex){
				processError = true;
			}
		}
	
		if(!processError && !processErrorBussines && !ErrorMail && !showCapchaError)
			response.sendRedirect("/english/users/registeroknoemail.html?email=" + email);
	 } 
	

}

if (mensajeprocessErrorBussines !=null && !mensajeprocessErrorBussines.equals("")) {
	if( mensajeprocessErrorBussines.indexOf("The email address is already registered")>-1){
		ErrorMail = true;
		mensajeprocessErrorBussines  = mensajeprocessErrorBussines + "<br>You must associate the Twitter account from the user's profile";
	}
}

%>
<%-- 
<%=processError%> <%=processErrorBussines %> <%=ErrorMail %> <%=showCapchaError%>

--%>	<!-- inicio col-mid -->
	<div class="col" id="recupera">
		<div class="error conf">
			<div class="txtavisofondo">Provide the following information to register with your Twitter account and be part of the teleSUR community.</div>
		</div>

		<% if ((ErrorMail && accion != "" && mensajeprocessErrorBussines == "" ) || showCapchaError) { %> 
	                <div class="error">
				<div class="txtaviso"> Verify the highlighted fields </div>
			</div>
	       <% } %>
	       
	       <% if ( mensajeprocessErrorBussines != "" ) { %> 
	                <div class="error">
				<div class="txtaviso"> <%=mensajeprocessErrorBussines %> </div>
			</div>
	       <% } %>
	       
	       <div class="separador"></div>
	       
		<div class="col"><!-- inicio col-mid -->
			<div class="cont">
				<form method="post" name="frmSubmit" id="frmSubmit" class="form-elements">
					<input type="hidden" name="accion" value="registrar" >
					<input type="email" name="profile_email" id="profile_email" value="<%= email %>" <% if (ErrorMail && accion != "" && mensajeprocessErrorBussines == "") { %>  class="mal" <% } %> placeholder="Enter your Email *">
					<% if (ErrorMail && accion != "" && mensajeprocessErrorBussines == "") { %>  <div class="alertReg"> Complete your email </div> <% } %>
					
					<p style="float:right; font-size:1.2em; ">*Requested fields </p>
					<div class="checkline row clear"> </div>

				   	<cms:include page="../TS_Registration_Form_Captcha.jsp">
						<cms:param name="showCapchaError"> <%=showCapchaError %> </cms:param>			
					</cms:include> 
				
					<div class="checkline">   
						<br><br>
						<div class="squaredThree">
							<input type="checkbox" value="yes" id="aceptaCond" name="aceptaCond">
							<label for="aceptaCond"></label>
						</div>
						<div class="txtregister" for="aceptaCond">
							I agree with the <a href="#" id="terms" style="margin-left:7px;">terms and conditions</a>  teleSUR
						</div> 
					</div>
					
					<% if (checkTermsError) { %>
						<div class="checkline">   
					  		<div class="alertReg"> You must accept the Terms and Conditions </div>
					  	</div>
					<% } %>
					
				   	<p style="border-bottom: 1px solid #CCCCCC;float: left;margin-bottom: 25px;width: 100%;"></p>
				    	<a href="/english/index.html" id="cancelar" style="float:right">Cancel</a>
				    	<input id="subscribe" type="submit" value="Log in with Twitter" name="submit" style="float:right;max-width:none">
				</form>
			</div>
		</div>
	</div> <!-- fin col-midx --> 