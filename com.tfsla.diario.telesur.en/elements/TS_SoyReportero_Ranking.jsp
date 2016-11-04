<%@ include file="/system/modules/com.tfsla.diario.telesur/elements/TS_Common_Libraries.jsp" %>
<% 
String template = (request.getParameter("template") != null ) ? request.getParameter("template") : "" ; 


CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String currentUri = cms.getRequestContext().getUri();
%>


<%
	try{
	%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_imreporter.html"/> 
	<%
	}
	catch (Exception e){
		out.print("Loading...");
	}
%>