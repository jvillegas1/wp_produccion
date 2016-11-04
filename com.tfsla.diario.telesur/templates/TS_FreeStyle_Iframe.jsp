<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
org.opencms.jsp.CmsJspXmlContentBean cms = new
org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
 
String title = cms.property("Title");
String uri = cms.getRequestContext().getUri();
%>
		<%cms.include(uri, "body");%>
		<%cms.include(uri, "text1");%>
		<%cms.include(uri, "text2");%>		                                              	
	