<%@ include file="TS_Common_Libraries.jsp" %>
<% 
String template = (request.getParameter("template") != null ) ? request.getParameter("template") : "" ; 

CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String currentUri = cms.getRequestContext().getUri();

String seccion = (request.getParameter("seccion") != null ) ? request.getParameter("seccion") : "" ; 


%>

<%
try{
%>
	<c:import url="http://www.telesurtv.net/static_rankings_reportero.html"/>
<%
}
catch (Exception e){
	out.print("Cargando...");
}
%>