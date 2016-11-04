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
<div class="cont desktop">
	<div class="titrsreg">
		Log in with
	</div>
	<div class="icoreg">
		<a href="javascript:openPopUpProviderWithRedirect('twitter',false,window.top.location,'9','<%=publicationUrl%>');" class="icoleft" title="Login Twitter">
			<cms:img src="/arte/twitblue.png" width="43" height="35" alt="Login Twitter" />
		</a>
		<a href="javascript:openPopUpProviderWithRedirect('facebook',false,window.top.location,'9','<%=publicationUrl%>');" class="icoleft" title="Login Facebook">
			<cms:img src="/arte/fbblue.png" width="43" height="35" alt="Login Facebook" />
		</a>
		<a href="javascript:openPopUpProviderWithRedirect('googlePlus',false,window.top.location,'9','<%=publicationUrl%>');" class="icoleft" title="Login Google +">
			<cms:img src="/arte/googleblue.jpg" width="35" height="35" alt="Login Google" />
		</a>
	</div>
</div>