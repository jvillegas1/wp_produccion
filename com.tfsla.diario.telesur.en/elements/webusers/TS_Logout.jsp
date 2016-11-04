<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ page language="java"
         import="org.opencms.jsp.CmsJspActionElement,
         		 org.opencms.jsp.CmsJspLoginBean,
         		 org.opencms.file.CmsUser,
         		 java.util.Hashtable"%>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %> 

        		 
<%
String FIELD_LOGOUT = "logout";

//Get the action beans and current page url and current project.
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String currentUri = cms.getRequestContext().getUri();

//Set flag for currently logged in.
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);
boolean userIsLoggedIn = loginBean.isLoggedIn();

if (request.getParameter(FIELD_LOGOUT) != null ) {
	try {
		RegistrationModule.getInstance(cms.getCmsObject()).logout(request, response);
		loginBean.logout();
		// response.sendRedirect( currentUri );
	} catch(Exception e){
		// Do nothing.
	}
}
%>
