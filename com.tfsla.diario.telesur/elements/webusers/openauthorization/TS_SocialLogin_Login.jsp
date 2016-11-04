<%@ page contentType="text/html; charset=iso-8859-1" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ page import="org.opencms.main.OpenCms" %>
<%@ page import="com.tfsla.diario.ediciones.model.TipoEdicion" %>
<%@ page import="com.tfsla.diario.ediciones.services.TipoEdicionBaseService" %>
<%@ page import="org.opencms.jsp.CmsJspActionElement" %>  
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

<style>
cont1 {
    margin: 0 10px;
    color: #222;
    
}
</style>

<div class="cont1 desktop">
	<div class="titrsreg">
		Inicia sesión con
	</div>
	<div class="icoreg">
		<a href="javascript:openPopUpProviderWithRedirect('twitter',false,window.top.location,'<%=publicationId%>','<%=publicationUrl%>');" class="icoleft" title="Login con Twitter">
			<cms:img src="/arte/twitblue.png" width="43" height="35" alt="Login con Twitter" />
		</a>
		<a href="javascript:openPopUpProviderWithRedirect('facebook',false,window.top.location,'<%=publicationId%>','<%=publicationUrl%>');" class="icoleft" title="Login con Facebook">
			<cms:img src="/arte/fbblue.png" width="43" height="35" alt="Login con Facebook" />
		</a>
		<a href="javascript:openPopUpProviderWithRedirect('googlePlus',false,window.top.location,'<%=publicationId%>','<%=publicationUrl%>');" class="icoleft" title="Login con Google +">
			<cms:img src="/arte/googleblue.jpg" width="35" height="35" alt="Login con Google" />
		</a>
	</div>
</div>