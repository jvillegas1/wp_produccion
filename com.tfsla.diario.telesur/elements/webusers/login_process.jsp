<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ page language="java"
import="org.opencms.jsp.CmsJspActionElement,
org.opencms.jsp.CmsJspLoginBean"%>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.opencms.webusers.Encrypter" %>
<%@ page import="java.util.regex.*" %>

<%
//Constants.
String PROJECT_ONLINE = "Online";
String JSON = "";

//Get the action beans.
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

//Login user if form was submitted.
boolean loginError = false;

if ( request.getParameter("R") != null ){
request.getSession().setAttribute("noticiaLogin", request.getParameter("R"));
}

String redirectUri = "";

if ( request.getSession().getAttribute("noticiaLogin") != null ){
redirectUri = (String)request.getSession().getAttribute("noticiaLogin");
}

if ( request.getParameter("cal_login_username") != null ) {
//Get input username and password.
String inputUsername = request.getParameter("cal_login_username").toString();
String inputPassword = request.getParameter("cal_login_password").toString();
String rememberMe = request.getParameter("rememberMe");


//Progress only if they both have values.
if(inputUsername.trim().length()>0 && inputPassword.trim().length()>0){
try {
loginBean.login("webuser/" + inputUsername, inputPassword,PROJECT_ONLINE);
loginError = !loginBean.isLoginSuccess();
if( !loginError ) {
RegistrationModule.getInstance(cms.getCmsObject()).login(loginBean, Encrypter.encrypt(inputPassword), response, rememberMe);
Cookie userCookie = new Cookie("logd", "webuser/" + inputUsername);
Boolean enableAutoLogin = true;
String folderPath = cms.info("opencms.request.folder");
org.opencms.file.CmsProperty propEnableAutoLogin = cms.getCmsObject().readPropertyObject(folderPath,"enableAutoLogin",true);

if (propEnableAutoLogin!=null && propEnableAutoLogin!=org.opencms.file.CmsProperty.getNullProperty()) {

String value = propEnableAutoLogin.getValue("");
if (value.trim().toLowerCase().equals("false"))
enableAutoLogin = false;
}

if (enableAutoLogin)
userCookie.setMaxAge(86400 * RegistrationModule.getInstance(cms.getCmsObject()).getUserSessionExpirationDays());
else
userCookie.setMaxAge(-1);
userCookie.setPath("/");
response.addCookie(userCookie);
}
}catch(Exception e){
loginError = true;
}
}else {
loginError = true;
}
}

//Set flag for currently logged in.
boolean userIsLoggedIn = loginBean.isLoggedIn();

//Get current page url and current project.
String currentUri = cms.getRequestContext().getUri();

//Datos que recibimos en el '$.post' que vimos anteriormente para realizar la accion necesaria.
if ( userIsLoggedIn && !redirectUri.equals("") ) {
JSON = "{\"message\": \"redirect\"}"; 
} else if ( userIsLoggedIn && redirectUri.equals("") ) {

JSON = "{\"message\": \"ok\"}"; 
} else {
JSON = "{\"message\": \"error\"}";


}

response.setContentType("text/javascript");
out.write( JSON );
%>