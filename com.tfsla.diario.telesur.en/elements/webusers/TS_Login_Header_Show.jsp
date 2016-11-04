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

<cms:include page="TS_Logout.jsp" />    
<cms:include page="TS_RecoverySession.jsp" />
<%
//Get the action beans and set flag for currently logged in.
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);
boolean userIsLoggedIn = loginBean.isLoggedIn();
%>

<c:set var="userIsLoggedIn" scope="page"><%=userIsLoggedIn%></c:set>

<c:if test="${userIsLoggedIn}">

<%
	String user = loginBean.getUserName();
%>
	<nt:user username="<%=user%>">
		<div class="login">
	            	<a href="/usuarios/editar_perfil.html" class="btnLog" alt="<nt:user-name/>" title="<nt:user-name/>"> <nt:user-name/> </a>
	            	
	        	
	        </div>
	</nt:user>
	
</c:if> 

<c:if test="${!userIsLoggedIn}">
<%
	// Traigo la publicacion desde donde se hace la llamada y la guardo en la session
        CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
	   
        String siteName = OpenCms.getSiteManager().getCurrentSite(cms.getCmsObject()).getSiteRoot();
	String publicationId = "8";
	String publicationUrl = "";
     	TipoEdicionBaseService tService = new TipoEdicionBaseService();
        try {
		TipoEdicion tEdicion = tService.obtenerTipoEdicion(cms.getCmsObject(), cms.getCmsObject().getRequestContext().getUri());			
		if (tEdicion!=null){
			publicationId  = "" + tEdicion.getId();
			publicationUrl = tEdicion.getNombre();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
%>
   				
	<script type="text/javascript" language="javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/openauthorization.js</cms:link>"></script>
	<div class="login">
            	<a href="/usuarios/login_nativo.html" class="btnLog">Inicia sesión con:</a>
            	<a href="javascript:openPopUpProvider('twitter', false, '<%=publicationId%>', '<%=publicationUrl %>');">
            		<cms:img src="/arte/ico-twitter-head.png" scaleColor="transparent" alt="Twitter" /> 
            	</a> 
            	<a href="javascript:openPopUpProvider('facebook', false, '<%=publicationId%>', '<%=publicationUrl %>');">
            		<cms:img src="/arte/ico-face-head.png" scaleColor="transparent" alt="Facebook" />
            	</a>
            	<a href="/usuarios/registracion.html" class="singUp">Registrarse</a>
        </div>
</c:if>