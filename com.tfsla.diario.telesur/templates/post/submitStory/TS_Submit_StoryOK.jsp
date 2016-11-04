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
			<div class="txtaviso"> Estimado ${usuario}, hemos recibido su reporte, le estaremos informando cuando el mismo sea publicado en nuetra sección Soy Reportero. Agradecemos su aporte a nuestra comunidad teleSUR </div>
		</div>
	</div>
	<div class="btnConf">
		<a href="/posts/post_story.html" alt="Subir nuevo reporte" title="Subir nuevo reporte">Subir nuevo reporte</a>
		<a href="/posts/post_photo.html" alt="Subir nueva foto" title="Subir nuevo reporte">Subir nueva foto</a>
		<a href="/posts/post_video.html" alt="Subir nuevo video" title="Subir nuevo video">Subir nuevo video</a>
		<a href="/index.html" alt="Ir a Home" title="Ir a Home">Contiunuar navegando el sitio</a>
	</div>
</nt:user>