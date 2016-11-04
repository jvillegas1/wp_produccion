<%@ include file="../../elements/TS_Common_Libraries.jsp" %>
<%@ page import="org.opencms.file.CmsObject" %>
<%@ page import="com.tfsla.capcha.CaptchaManager" %>

<% 
String genKey = com.tfsla.capcha.CaptchaManager.generateRandomCapchaKey();

CmsJspActionElement cmsJsp = new CmsJspActionElement(pageContext, request, response);
CmsObject cmsObject = cmsJsp.getCmsObject();

boolean showCapchaError = Boolean.valueOf(request.getParameter("showCapchaError"));
%>

	<div id="captcha_recargado">			    	
		<div class="txtcaptcha"> Type the text from the image </div>
		<div style="float:left">
			<img src="<cms:link><%=CaptchaManager.getPathCaptchaImage(cmsObject)%>?key=<%=genKey%></cms:link>" style="width:200px" />
		</div>
		
		
		
		<div class="subcaptcha" style="margin-left:20px">
		 	<input name="j_captcha_response" type="text" id="textfield" <% if (showCapchaError) { %> class="mal" <% } %> >
			<input type="hidden" name="capchaKeyId" value="<%= genKey%>">
			<% if (showCapchaError) { %>
		        	<div class="alertReg">Incorrect code, please try again.</div>
		        <% } %>
		        <a id="recargacaptcha" class="recargacaptcha" href="javascript:reloadCaptcha();" alt="Reload" title="Reload"> Reload </a>
		</div>
		
		
	</div>