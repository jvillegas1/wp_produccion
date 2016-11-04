<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ page import="org.opencms.jsp.CmsJspActionElement" %>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="org.opencms.file.CmsUser" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="org.opencms.main.CmsLog" %>
<%@ page import="com.tfsla.exceptions.BusinessException" %>
<%@ page import="com.tfsla.capcha.CaptchaManager" %>

<%
//init local variables.
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String currentUri 	= cms.getRequestContext().getUri();

boolean RecuperaPassMailSent = false;
boolean error = false;
Boolean showCapchaError = false;
String errorMessage = null;
String valueEmail = "";

//Register user if form was submitted.
if(request.getParameter("registration_email") != null){
	
	String j_captcha_response = request.getParameter("j_captcha_response") != null ? request.getParameter("j_captcha_response") : "";
        String capchaId = request.getSession().getId();        
        String keyId = request.getParameter("capchaKeyId");
        capchaId = capchaId + keyId;        
        showCapchaError = CaptchaManager.getInstance(cms.getCmsObject()).validateResponseForID(capchaId,j_captcha_response.toUpperCase());
	showCapchaError = Boolean.valueOf(!showCapchaError.booleanValue());
                
        valueEmail = request.getParameter("registration_email").toString().trim();
	
	if (!showCapchaError) { 
		//Register the user.
		try{
				RegistrationModule.getInstance(cms.getCmsObject()).forgotPassword(
					cms.getCmsObject(), 
					valueEmail, 
					valueEmail);
	
				RecuperaPassMailSent = true;
			
		} 
		catch(BusinessException e) {
			errorMessage = e.getMessage();
			error = true;
		}
		catch (Exception e) {
			error = true;
			try {
				CmsLog.getLog(this).fatal(e.getMessage(), e);
			} catch(Exception e2) {
				//nada por hacer
			}
		}
	} else {
		errorMessage = "Verify the highlighted fields.";
	}	
}
%>

<c:set var="RecuperaPassMailSent" value='<%=RecuperaPassMailSent %>'/>
<c:set var="error" value='<%=error %>'/>
<c:set var="errorMessage" value='<%=errorMessage %>'/>
<c:set var="showCapchaError" value='<%=showCapchaError %>'/>

<c:if test='${RecuperaPassMailSent == "true"}' >

	<div class="cont">
		<div class="aprobado">
			<div class="txtaviso"> Sent an e-mail with your account information to you again enter teleSUR. </div>
		</div>
	</div>
	
	<div class="cont">
  		<div class="btnConf">
       			<a href="/english/index.html">Back to teleSUR</a>
    		</div>
	</div>
	
	<div class="separador"></div>  
</c:if>

<c:if test='${RecuperaPassMailSent == "false"}'>

	<c:if test='${error == "true" || showCapchaError == "true"}'>
		
		<div class="cont">
			<div class="error">
				<div class="txtaviso">${errorMessage} </div>
			</div>
		</div>
		
		<div class="separador"></div>  
	</c:if>

	<div class="col errorRecu" id="recupera">
		<div class="cont titreg"> Account password recovery </div>
		<form id="cal_registration_form" name="cal_registration_form" method="post" action="<%= currentUri %>"  class="form-elements" >
		<div class="col-mid">
			<div class="cont" style="height:340px">
					<c:if test='${error == "true"}'>
						<input type="text" class="mal" value="<%=valueEmail %>" name="registration_email" placeholder="Enter your e-mail *">
					</c:if>
					<c:if test='${error != "true"}'>
						<input type="text" value="<%=valueEmail %>" name="registration_email" placeholder="Enter your e-mail *">
					</c:if>
					
					<p style="float:right; font-size:1.2em; ">*Requested fields</p>
					
					<div class="checkline row clear"> </div>
					<p style="border-bottom: 1px solid #CCCCCC;float: left;margin-bottom: 25px;width: 100%;"></p>
					
					<a href="/english/index.html" id="cancelar" style="float:right">Cancel</a>
					<input id="subscribe" type="submit" value="Account password recovery" name="submit" style="float:right;max-width:none">
				
				
			</div>
		</div>
		<div class="col-mid">
			<cms:include page="TS_Registration_Form_Captcha.jsp">
				<cms:param name="showCapchaError">${showCapchaError}</cms:param>			
			</cms:include> 
		</div>
		</form>
	</div>
</c:if>