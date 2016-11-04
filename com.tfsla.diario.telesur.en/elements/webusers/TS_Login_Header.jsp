<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ page language="java"
         import="org.opencms.jsp.CmsJspActionElement,
         		 org.opencms.jsp.CmsJspLoginBean,
         		 org.opencms.file.CmsUser,
         		 java.util.Hashtable"%>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.opencms.webusers.TfsUserHelper" %>
<%@ page import="com.tfsla.exceptions.BusinessException" %>
<%@ page import="org.opencms.file.CmsGroup" %>
<%@ page import="org.opencms.main.OpenCms" %>
<%@ page import="com.tfsla.diario.ediciones.model.TipoEdicion" %>
<%@ page import="com.tfsla.diario.ediciones.services.TipoEdicionBaseService" %>
<%@ page import="org.opencms.jsp.CmsJspActionElement" %>  

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />

<cms:include page="TS_Logout.jsp" />    
<cms:include page="TS_RecoverySession.jsp" />

<script type="text/javascript">

$( '#header' ).on( 'click', '#end1', function( e ){
e.preventDefault();
$.get("/dynamic/baseLoginFunctions.html?logout", function(data){
var wt = window.top.location;
if( (wt+"").indexOf( "/english/users/" ) != -1){
window.top.location = "/";
}else if( (wt+"").indexOf( "/staff/" ) != -1 || (wt+"").indexOf( "/u/" ) != -1 ){
location.reload(true);
}else{
$( "#header" ).removeClass( "hdm-logged" ).addClass( "hdm-not_logged" );
$( "body" ).removeClass("logged").addClass("not-logged");

$.get("/dynamic/login_user_english.html", function(data){
$('#header-content-1').html(data);
});

}
});
});

</script>
<%

// Traigo la publicacion desde donde se hace la llamada y la guardo en la session
        CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
        
        
//Get the action beans and set flag for currently logged in.
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);
boolean userIsLoggedIn = loginBean.isLoggedIn();
%>

<c:set var="userIsLoggedIn" scope="page"><%=userIsLoggedIn%></c:set>

<c:if test="${userIsLoggedIn}">

<%
	String user = loginBean.getUserName();
%>
	<nt:user username="<%=user%>">
	        
	        <div class="btnLogueado"><i></i>
	        	<c:set var="usuario" scope="page" />
			
			<nt:conditional-include oncondition="${ntuser.infoextra['USER_MOSTRAR_NOMBRE'] == 'TRUE' || empty ntuser.infoextra['USER_MOSTRAR_NOMBRE']}">
				<c:set var="usuario" scope="page"> <nt:user-firstname/> <nt:user-lastname/> </c:set>
			</nt:conditional-include>
			
			<nt:conditional-include oncondition="${ntuser.infoextra['USER_MOSTRAR_APODO'] == 'TRUE'}">
				<c:set var="usuario" scope="page"> <nt:user-nickname/> </c:set>
			</nt:conditional-include>
			          	
			<span>${usuario}</span>
			<ul>
				<li><a href="/english/users/profile_edit.html">Edit Profile</a></li>
				<li><a href="/english/posts/post_story.html">Submit a story</a></li>
				<li><a id="end1" href="/english/index.html?logout">Logout</a></li>            	
			</ul>
		</div>
	        
	</nt:user>
	
</c:if> 

<c:if test="${!userIsLoggedIn}">
<script type="text/javascript" language="javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/openauthorization.js</cms:link>"></script>		

   	<div class="btnLogin" id="abrir-login2"><span>Log in</span></div>
	<div class="modal fade modal-user"  id="modal-login-1"></div>
        
</c:if>