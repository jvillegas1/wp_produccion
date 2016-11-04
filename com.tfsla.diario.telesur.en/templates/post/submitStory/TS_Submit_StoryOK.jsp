<!DOCTYPE html>
<%@ include file="/system/modules/com.tfsla.diario.telesur/elements/TS_Common_Libraries.jsp" %>
<%@ include file="/system/modules/com.tfsla.diario.telesur/elements/webusers/TS_RecoverySession.jsp" %>
<%@ page import="org.opencms.jsp.CmsJspLoginBean" %>
<%@ page import="org.opencms.file.CmsUser" %>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.opencms.webusers.TfsUserHelper" %>

<%
//Get the action beans and set flag for currently logged in.
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String username = "";

if (request.getParameter("apodo") != null)
{
    	String tipoPerfil = request.getParameter("tipoPerfil");
      
	if(tipoPerfil.equals("wp")){
		username = request.getParameter("apodo");
	}else{
		String apodoFrm = request.getParameter("apodo");
		byte bytesApodo[] = apodoFrm.getBytes("ISO-8859-1"); 
		apodoFrm = new String(bytesApodo, "UTF-8");
		
		username = "webUser/" + RegistrationModule.getInstance(cms.getCmsObject()).UserNameByAdditionalInfo(cms.getCmsObject(), "APODO", apodoFrm); 	
	}
	
} else {
	username = loginBean.getUserName();
}
%>

<nt:user username="<%=username %>">
	<nt:conditional-include oncondition="${ntuser.infoextra['USER_MOSTRAR_NOMBRE'] == 'TRUE' || empty ntuser.infoextra['USER_MOSTRAR_NOMBRE']}">
		<c:set var="usuario" scope="page"> <nt:user-firstname/> <nt:user-lastname/> </c:set>
	</nt:conditional-include>
	
	<nt:conditional-include oncondition="${ntuser.infoextra['USER_MOSTRAR_APODO'] == 'TRUE'}">
		<c:set var="usuario" scope="page"> <nt:user-nickname/> </c:set>
	</nt:conditional-include>

	<div class="cont">
		<div class="aprobado">
			<div class="txtaviso"> ${usuario} we have received your report, we will inform you when we publish it in out You're the Reporter section. </div>
		</div>
	</div>
	<div class="btnConf">
		<a href="/english/posts/post_story.html" alt="Upload a new report " title="Upload a new report ">Upload a new report</a>
		<a href="/english/posts/post_photo.html" alt="Upload a new picture" title="Upload a new picture">Upload a new picture</a>
		<a href="/english/posts/post_video.html" alt="Upload a video" title="Upload a video">Upload a video</a>
		<a href="/english/index.html" alt="Continue browsing the site" title="Continue browsing the site">Continue browsing the site</a>
	</div>
</nt:user>