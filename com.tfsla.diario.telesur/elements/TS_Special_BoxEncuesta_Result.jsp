<%@ include file="TS_Common_Libraries.jsp" %>
<%
String tag = (request.getParameter("tag") == null ) ? "" : request.getParameter("tag") ;
%>
<nt:polls-box  tags="<%=tag%>" order="creation-date"  state="active" group="Sumario" style="TS-ES/ESPECIAL-RES"> 
</nt:polls-box>