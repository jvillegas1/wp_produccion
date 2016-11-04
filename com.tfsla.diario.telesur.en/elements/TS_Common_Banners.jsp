<%@ include file="TS_Common_Libraries.jsp" %>

<%
String template = ( request.getParameter("template") != null ) ? request.getParameter("template") : "Home";
String key = ( request.getParameter("key") != null ) ? request.getParameter("key") : "Home";

boolean isProduction = true;

if (isProduction) { 
%>   
<%--
key <%=key %>
template : <%=template  %> 
--%>
	<cms:contentload collector="singleFile" param="/english/.config/banners.html" editable="false">
	
		<cms:contentcheck ifexistsone="<%=template %>">
			<cms:contentloop element="<%=template %>"> 
				<c:set var="bannerKey" scope="page"><cms:contentshow element="key"/></c:set>
				<c:set var="mostrar" scope="page"><cms:contentshow element="mostrar"/></c:set>
				<c:set var="value" scope="page"><cms:contentshow element="value"/></c:set>

<% 					String bannerkey = (String)pageContext.getAttribute("bannerKey");
					String mostrar = (String)pageContext.getAttribute("mostrar");

			      		if(bannerkey.equals(key) && mostrar.equals("true")){
						String value = (String)pageContext.getAttribute("value");
						value = value.replaceAll("<script type='text/javascript'>","<script type='text/javascript'><!--//<![CDATA[");
						value = value.replaceAll("</script>","//]]>--></script>");
%>		
						<%=value %>
<%					}
%>
			</cms:contentloop>
		</cms:contentcheck>
	</cms:contentload>
<% } %>