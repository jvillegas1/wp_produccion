<%@ include file="TS_Common_Libraries.jsp" %>
<% int cont1 = 0; int cont2 = 0; int cont3 = 0; %>

<%
try{
%>
	<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_opinionEn.html"/>
<%
}
catch (Exception e){
	out.print("Loading...");
}

%>