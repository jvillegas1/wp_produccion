<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<% 
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String currentUri = cms.getRequestContext().getUri();

String category = (request.getParameter("category") != null ) ? request.getParameter("category") : "" ; 
String categoria;


if (currentUri.indexOf("/news/latinaamerica") > -1 )  { 
	try{
	%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_latinaamericaEn.html"/> 
	<%
	}
	catch (Exception e){

	}

}
if (currentUri.indexOf("/news/world") > -1 )  { 
	try{
	%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_world.html"/> 
	<%
	}
	catch (Exception e){
		out.print("Loading...");
	}
}
if (currentUri.indexOf("/news/sport") > -1 ){
	try{
	%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_sports.html"/>
	<%
	}
	catch (Exception e){
		out.print("Loading...");
	}
}
if (currentUri.indexOf("/news/culture") > -1 ){
	try{
	%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_culture.html"/>
	<%
	}
	catch (Exception e){
		out.print("Loading...");
	}
}

if (currentUri.indexOf("/news/technology") > -1 ){
	try{
	%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_technology.html"/>
	<%
	}
	catch (Exception e){
		out.print("Loading...");
	}
}



%>