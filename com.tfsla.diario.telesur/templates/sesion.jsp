<%@ page import="java.net.InetAddress" %>
<%@ page language="java"
         import="org.opencms.jsp.CmsJspActionElement,
           org.opencms.file.CmsUser,
           org.opencms.util.CmsUUID,
           org.opencms.jsp.CmsJspLoginBean"%>
<% 
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);

out.print("loginBean.isLoggedIn() = " + loginBean.isLoggedIn());
out.print("<br />");
out.print("loginBean.getUserName() = " + loginBean.getUserName());
out.print("<br />");

out.print("SESSION = " + (String)request.getSession().getAttribute("test_session"));
out.print("<br />");

if((String)request.getSession().getAttribute("test_session") == "test"){
 out.print("LEO = " + (String)request.getSession().getAttribute("test_session"));
}else{
 request.getSession().setAttribute("test_session", "test");
 out.print("ESCRIBO = test");
}

//out.print("<br />");
//out.print(loginBean.isLoggedIn());
//out.print("<br />");
//out.print(loginBean.getUserName());
out.print("<br />");

 String ip = "";
 InetAddress inetAddress = InetAddress.getLocalHost();
 ip = inetAddress.getHostAddress();
 out.print("Server Host Name :: "+inetAddress.getHostName());
%>