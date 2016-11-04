<%@page import="org.apache.commons.httpclient.HttpStatus"%>
<%@page import="org.apache.commons.httpclient.methods.GetMethod"%>
<%@page import="org.apache.commons.httpclient.HttpClient"%>

<%
String mailUsuario = request.getParameter("email");
String url = "https://dmds-telesur.planisys.net/api-get.php?pedido=cargarSuscriptos&serverKey=g2pqbQCjvJnXAsQcRDFK731m3P03SR6m&suscriptos%5B0%5D%5Bemail%5D="+mailUsuario+"&suscriptos%5B0%5D%5Borigenes%5D%5B1%5D=Newsletter";
HttpClient client = new HttpClient();
GetMethod method = new GetMethod(url);
int responseCode = client.executeMethod(method);
String responseBody = "";    
switch (responseCode) {
    case HttpStatus.SC_OK:
       responseBody = method.getResponseBodyAsString();
       break;
     default:
        break;
    }
method.releaseConnection();
%>
 
<%=responseBody%>