<%@ include file="TS_Common_Libraries.jsp" %>
<%
String pageSeccion = (request.getParameter("pageSeccion") == null || request.getParameter("pageSeccion").equals("")) ? "home" : request.getParameter("pageSeccion") ;
%>

<ul>
	<li><a href="#" <% if (pageSeccion.equals("home")) {  %> class="active" <% } %> >inicio</a></li>
	
	<cms:contentload collector="singleFile" param="/.config/menu.html">
		<cms:contentcheck ifexistsone="NivelUno">
			<cms:contentloop element="NivelUno">
					
					<c:set var="active" value=""/>
					
					<cms:contentcheck ifexists="Parametros">
						<c:set var="Parametros" scope="page"><cms:contentshow element="Parametros" /></c:set>
					</cms:contentcheck>
					<jsp:useBean id="Parametros" type="java.lang.String" />
<% 
					if ( Parametros.equals(pageSeccion) ) { 
%>
					<c:set var="active" value="actv"/>
<%
					}
%>				
				<li class="${active}">
					
					<cms:contentcheck ifexists="Link">
						<a class="${active}"  href="<cms:contentshow element="Link" />" <% if ( Parametros.equals(pageSeccion) ) { %>class="select" <% } %> target="<cms:contentshow element="Target" />"  title="<cms:contentshow element="Descripcion" />"><cms:contentshow element="Descripcion" /></a>
					</cms:contentcheck>
					
					<cms:contentcheck ifexists="ExternalLink">
						<a class="${active}" href="<cms:contentshow element="ExternalLink" />" <% if ( Parametros.equals(pageSeccion) ) { %>class="select" <% } %> title="<cms:contentshow element="Descripcion" />"><cms:contentshow element="Descripcion" /></a>
					</cms:contentcheck>
					
					<cms:contentcheck ifexistsnone="Link,ExternalLink" >
						<a class="${active}" href="#" title="<cms:contentshow element="Descripcion" />" <% if ( Parametros.equals(pageSeccion) ) { %>class="select" <% } %>> <cms:contentshow element="Descripcion" /> </a>
					</cms:contentcheck>
					
					<c:if test="${active == 'actv'}">
						<ul class="subMob"><!--Submenu Mobile-->
							
							<cms:contentcheck ifexistsone="NivelDos">
								<cms:contentloop  element="NivelDos">
									<c:set var="linkMenu" scope="page"><cms:contentshow element="Link" /></c:set>				
									<jsp:useBean id="linkMenu" type="java.lang.String" />
				
									<c:set var="active" value=""/>
<% 
						 			CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
									String subSeccion = cms.property("subSeccion");
				
									if (subSeccion != null) {
										if ( linkMenu.indexOf(subSeccion) > -1 ) { 
								 
%>	
											<c:set var="active" value="active"/>	
<%
		 								}	
	 								}			
%>
									
									<cms:contentcheck ifexists="Link">
										<li><a class="${active}" href="<cms:contentshow element="Link" />" target="<cms:contentshow element="Target" />"  title="<cms:contentshow element="Descripcion" />"><cms:contentshow element="Descripcion" /></a></li>
									</cms:contentcheck>
									
									<cms:contentcheck ifexists="ExternalLink">
										<li><a class="${active}" href="<cms:contentshow element="ExternalLink" />" title="<cms:contentshow element="Descripcion" />"><cms:contentshow element="Descripcion" /></a></li>
									</cms:contentcheck>
									
									<cms:contentcheck ifexistsnone="Link,ExternalLink" >
										<li><a class="${active}" href="#" title="<cms:contentshow element="Descripcion" />"> <cms:contentshow element="Descripcion" /> </a></li>
									</cms:contentcheck>
								</cms:contentloop>			
							</cms:contentcheck>
						</ul>
					</c:if>
				</li>
			</cms:contentloop>			
		</cms:contentcheck>
	</cms:contentload>
</ul>