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
		<div class="txtcaptcha"> Escriba el texto de la imagen </div>
		<div class="imgcaptcha">
			<img src="<cms:link><%=CaptchaManager.getPathCaptchaImage(cmsObject)%>?key=<%=genKey%></cms:link>" style="width:200px" />
		</div>
		
		
		
		<div class="subcaptcha">
		 	<input name="j_captcha_response" type="text" id="textfield" <% if (showCapchaError) { %> class="mal" <% } %> >
			<input type="hidden" name="capchaKeyId" value="<%= genKey%>">
			<% if (showCapchaError) { %>
		        	<div class="alertReg">Código incorrecto, intentá de nuevo.</div>
		        <% } %>
		        <a id="recargacaptcha" href="javascript:reloadCaptcha();" class="recargacaptcha" alt="Recargar" title="Recargar"> Recargar </a>
		</div>
		
		
	</div>