<%@ include file="TS_Common_Libraries.jsp" %>
<%
String tag = (request.getParameter("tag") == null ) ? "" : request.getParameter("tag") ;
String estilo = (request.getParameter("estilo") == null ) ? "" : request.getParameter("estilo") ;
%>
<nt:polls-box  tags="<%=tag%>" order="creation-date"  state="active" group="Sumario" style="<%=estilo%>"> 
</nt:polls-box>


        