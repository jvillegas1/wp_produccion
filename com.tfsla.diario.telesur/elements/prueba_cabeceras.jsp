<%@ include file="TS_Common_Libraries.jsp" %>

<html>
<head>

<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">article</cms:param>
	</cms:include>
<title>Request Headers</title>

</head>
<body>
<p>
This page shows headers...
</p>
<h2>
The current time is:
</h2>
<p>
<% out.println((new java.util.Date()).toString()); %>u
</p>
	
<%
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");
if (request.getProtocol().equals("HTTP/1.1")) {
response.setHeader("Cache-Control", "no-cache");
}
%&gt
	
<p>
Request Headers
</p>
<p>
Remote_User(getHeader)= <% out.println(request.getHeader("Remote_User")); %>
</p>
<p>
remote_user(getHeader)=  <% out.println(request.getHeader("remote_user")); %>
</p>
<p>
remoteuser(getHeader)= <% out.println(request.getHeader("remoteuser")); %>
</p>
	
<p>
RemoteUser(getHeader)= <% out.println(request.getHeader("RemoteUser")); %>
</p>
	
<p>
RemoteUser(getRemoteUser())=<% out.println(request.getRemoteUser()); %>
</p>
<p>
Set-Cookie(response.getHeader)=<% out.println(response.containsHeader("cookie")); %>
</p>
	
<%
Enumeration names = request.getHeaderNames();
while (names.hasMoreElements())
{
String name = (String) names.nextElement();
Enumeration values = request.getHeaders(name);
if (values != null)
{
while (values.hasMoreElements())
{
String value = (String) values.nextElement();
out.println(name + ": " + value); %> <nb><br /> <%
}
}
}
	
%>
	

</body>
</html> 