<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<% 
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String currentUri = cms.getRequestContext().getUri();

String category = (request.getParameter("category") != null ) ? request.getParameter("category") : "" ; 
String categoria;
Random r = new Random();

if (currentUri.indexOf("/news/latinaamerica") > -1 )  { 
	try{
		%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_latinaamerica.html?ram=<%=r.nextInt()%>"/> 
		<%
	}
	catch (Exception e){

	}

}
if (currentUri.indexOf("/news/world") > -1 )  { 
	try{
		%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_mundo.html?ram=<%=r.nextInt()%>"/> 
		<%
	}
	catch (Exception e){

	}
}
if (currentUri.indexOf("/news/sport") > -1 ){
	try{
		%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_deportes.html?ram=<%=r.nextInt()%>"/>
		<%
	}
	catch (Exception e){

	}
}
if (currentUri.indexOf("/news/culture") > -1 ){
	try{
		%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_cultura.html?ram=<%=r.nextInt()%>"/>
		<%
	}
	catch (Exception e){

	}
}

if (currentUri.indexOf("/news/tecnologia") > -1 ){
	try{
		%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_tecnologia.html?ram=<%=r.nextInt()%>"/>
		<%
	}
	catch (Exception e){

	}
}

%>