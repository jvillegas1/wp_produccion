<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ include file="TS_Common_UserFunctions.jsp" %>
<%@ include file="TS_RecoverySession.jsp" %>

<%@ page language="java"
         import="org.opencms.jsp.CmsJspActionElement,
		 org.opencms.jsp.CmsJspActionElement,
                 org.opencms.jsp.CmsJspLoginBean,
                 org.opencms.file.CmsUser,
                 java.util.Hashtable" %>
             
<%
//Get the action beans and set flag for currently logged in.
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String username         = "";
String usuarioLogueado 	= ( userIsLoggedIn ) ? loginBean.getUserName() : "";
String currentUri 	= cms.getRequestContext().getUri();
boolean perfilPublico 	= (currentUri.indexOf("/usuarios/perfil.html") > -1 ) ? true : false ;

String getURL=request.getLocalName().toString();
String lastUrl = "";
String seccion = "";
if(session.getAttribute("seccion") != null){
	seccion = (String)session.getAttribute("seccion");
}else{
	seccion = "blogs";
}

if(session.getAttribute("url") != null){
	lastUrl = (String)session.getAttribute("url");
}else{
	lastUrl = "/seccion/blog/index.html";
}


if (request.getParameter("apodo") != null)
{
    	String tipoPerfil = request.getParameter("tipoPerfil");
      
	if(tipoPerfil.equals("wp")){
		username = request.getParameter("apodo").replaceAll("-"," ");
	}else{
		String apodoFrm = request.getParameter("apodo").replaceAll("-"," ");
		byte bytesApodo[] = apodoFrm.getBytes("ISO-8859-1"); 
		apodoFrm = new String(bytesApodo, "UTF-8");
		
		username = "webUser/" + RegistrationModule.getInstance(cms.getCmsObject()).UserNameByAdditionalInfo(cms.getCmsObject(), "APODO", apodoFrm); 	
	}
	
} else {
	username = loginBean.getUserName();
}

String query = "( internalUser:( " + username + ")^1 )";
int totalNotas = 0; 
String link = "/staff/"+username;
String titulo = "teleSUR Perfiles";
char primero = seccion.charAt(0);
String seccionCamelCase = Character.toUpperCase(primero)+seccion.substring(1, seccion.length());
%>
			
<nt:user username="<%=username %>">
	<div class="col-620 cont">			             	
		<div class="nworldtop cont">
			<span class="itacaput" itemprop="articleSection">
			<c:set var="group"><nt:user-groups><nt:user-groups-name/></nt:user-groups></c:set>
			<c:if test="${group == 'Bloggers_en' || group == 'Bloggers' }">		
				<a href="<%= lastUrl %>" class="her" alt="" title=""><%= seccionCamelCase %> > </a>						
			</c:if>	
				<a href="<nt:user-link-friendly />" class="her" title="<%=titulo%>"> <nt:user-firstname/> <nt:user-lastname/></a> 	
			</span>
		</div>
	</div>
	
	<!-- Banner 1 -->
	<div class="row clear marginchica"> 
		<div class="banners adv970">
			<cms:include page="../TS_Common_Banners.jsp">
				<cms:param name="template">profile</cms:param>
				<cms:param name="key">Advert-950x90</cms:param>
	  		</cms:include> 
	  	</div>
	</div>
	
	<!-- Banner mobile -->
	<div class="row clear bannerMobile"> 
		<cms:include page="../TS_Common_Banners.jsp">
			<cms:param name="template">profile</cms:param>
			<cms:param name="key">Advert-468x60-a-mobile</cms:param>
  		</cms:include> 
	</div>
	
	<div class="cont">
	<div class="box_gray">
		<div class="redback">
			<c:set var="usuario" scope="page" />
			<c:set var="pipe" scope="page" />
			
			<!--<nt:conditional-include oncondition="${ntuser.infoextra['USER_MOSTRAR_NOMBRE'] == 'TRUE' || empty ntuser.infoextra['USER_MOSTRAR_NOMBRE']}">
				<c:set var="usuario" scope="page"> <nt:user-firstname/> <nt:user-lastname/> </c:set>
			</nt:conditional-include>-->
			
			<!--<nt:conditional-include oncondition="${ntuser.infoextra['USER_MOSTRAR_APODO'] == 'TRUE'}">
				<c:set var="usuario" scope="page"> <nt:user-nickname/> </c:set>
			</nt:conditional-include>-->
			<c:set var="usuario" scope="page"> <nt:user-firstname/> <nt:user-lastname/> </c:set>
			${usuario}
			
			<div class="sharing">
			
		
			<div class="addthis_toolbox addthis_default_style addthis_16x16_style" addthis:title='<%=titulo%>' addthis:url="http://www.telesurtv.net<%=link%>" > 
				<a class="addthis_button_facebook"></a>
				<a class="addthis_button_twitter"></a>
				<a class="addthis_button_google_plusone_share"></a>
				<a class="addthis_button_email"></a>
			</div>
			
			<script type="text/javascript">var addthis_share = { url_transforms : { shorten: { twitter: 'bitly'} }, shorteners : { bitly : {login:'telesur',apiKey:'R_8925c37a76786f9a5620d8c3f0f9e65c'} }}</script>
			<script type="text/javascript">var addthis_config = {"data_track_clickback":false};</script>									
			<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5526cf4817b3bd2e" async="async"></script>


			</div>	
		
		</div>
		
		
		
		<div class="left"> 
			<nt:conditional-include oncondition="${ntuser.infoextra['USER_PICTURE'] != null && !empty ntuser.infoextra['USER_PICTURE'] }">
				<img src="<nt:user-image width='120px' height='120px' scaletype='2' />" width='120px' height='120px'  alt="${usuario}" title="${usuario}" />
			</nt:conditional-include>
			<nt:conditional-include oncondition="${ntuser.infoextra['USER_PICTURE'] == null  || empty ntuser.infoextra['USER_PICTURE']  }">
				<cms:img src="/arte/perfil_user.jpg" width="120px" height="120px" scaleType="2"  alt="${usuario}" title="${usuario}" />		
			</nt:conditional-include>
		</div>
		
		<div class="right">
			<div>
				<p style="float:left; color:#1A2042; font-size:2.5em;">			

					<nt:providers>
						<c:set var="urlUserProvider" scope="page">url_${provider.name}</c:set>
						
						<nt:conditional-include oncondition="${ntuser.isassociatedto[provider.name] == 'true' }">
							${pipe} 
							<a href="<nt:user-info value='${urlUserProvider}'/>" target="_blank" >
								<img style="width:20px" <cms:img src="${provider.logo}" partialTag="true" /> alt="${provider.description}" title="Ingresa al perfil de ${provider.description}" />
							</a>
							<c:set var="pipe" scope="page" value="|" />
						</nt:conditional-include>
					</nt:providers>
				</p>
				<% if (usuarioLogueado.equals(username) && perfilPublico) { %>
					<a style="float:right; color:#666; font-size:1.4em; margin: 17px 0px 0px;" href="/usuarios/editar_perfil.html">
						Editar perfil
					</a>
				<% } %>
				<% if (usuarioLogueado.equals(username) && !perfilPublico) { %>
					<a style="float:right; color:#666; font-size:1.4em; margin: 17px 0px 0px;" href="<nt:user-link-friendly />">
						Ver Perfil Público
					</a>
				<% } %>
			</div>
		<div class="bottom">
			
				<div class="blue_user_data">
					<nt:conditional-include oncondition="${ntuser.infoextra['USER_DESCRIPTION'] != null && ntuser.infoextra['USER_DESCRIPTION'] != ''}">
			          				<div class="txtprofileblog clear" style="padding:5px 5px !important;">${ntuser.infoextra['USER_DESCRIPTION']}</div>
			          	</nt:conditional-include>
			          	
					<nt:news-list advancedfilter="<%=query%>" size="9999" state="publicada" order="user-modification-date" >
						<c:set var="size" scope="page">${newslist.size}</c:set>
						<jsp:useBean id="size" type="java.lang.String" />
						<% totalNotas = Integer.parseInt(size); %>
					</nt:news-list>
					
					<% if (totalNotas == 0 ) { %>
						<p style="font-size: 1.4em; margin: 0px;"> No tiene notas publicadas </p>
					<% } %>
					
					<% if (totalNotas == 1 ) { %>
						<p style="font-size: 1.4em; margin: 0px;"> <%=totalNotas %> Nota publicada </p>
					<% } %>
					
					<% if (totalNotas > 1 ) { %>
						<p style="font-size: 1.4em; margin: 0px;"> <%=totalNotas %> Notas publicadas </p>
					<% } %>
					
					<nt:conditional-include oncondition="${ntuser.infoextra['USER_MOSTRAR_MAIL'] == 'TRUE'}">
						<a style="color:#666; font-size:1.2em"> <nt:user-email/> </a>  
					</nt:conditional-include>
					
				</div>
				<% if (usuarioLogueado.equals(username)) { %>
					<a href="/posts/post_story.html" title="Enviar reporte">
						<input type="submit" style="float: right;" id="subscribe" name="submit" value="Enviar reporte">
					</a>
					<a href="/posts/post_photo.html" title="Enviar imagen">
						<input type="submit" style="float: right;" id="subscribe" name="submit" value="Enviar imagen">
					</a>
					<a href="/posts/post_video.html" title="Enviar video">
						<input type="submit" style="float: right;" id="subscribe" name="submit" value="Enviar video">
					</a>
				<% } %>
			</div>
		</div>
	</div>
	</div>
</nt:user>

<script type="text/javascript">var addthis_share = { url_transforms : { shorten: { twitter: 'bitly'} }, shorteners : { bitly : {} }}</script>
<script type="text/javascript">var addthis_config = {"data_track_clickback":false};</script>									
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4f2d726c065de481"></script>