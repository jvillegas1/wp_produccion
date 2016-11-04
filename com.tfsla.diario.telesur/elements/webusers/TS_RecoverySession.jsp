<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.opencms.webusers.Encrypter" %>
<%@ page import="org.opencms.jsp.CmsJspActionElement" %>
<%@ page import="org.opencms.jsp.CmsJspLoginBean" %>

<%
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);
boolean userIsLoggedIn = loginBean.isLoggedIn();

if(!userIsLoggedIn){
	// Me fijo si el usuario esta logueado por cookie.
	String userName = RegistrationModule.getInstance(loginBean.getCmsObject()).getUserNameFromCookie(request);
	String password = RegistrationModule.getInstance(loginBean.getCmsObject()).getPasswordFromCookie(request);

	if(userName != null && password != null) {
		//las cookies estan presentes
		try {
			loginBean.login(userName, Encrypter.decrypt(password), "Online");
			boolean loginError = false;
			loginError = !loginBean.isLoginSuccess();

			if(!loginError)
				userIsLoggedIn = true;
			else
				userIsLoggedIn = false;
				
		}catch(Exception e){
			userIsLoggedIn = false;
		}
	}
}
%>