<%@ include file="TS_Common_Libraries.jsp" %>
<%
String pageSeccion = (request.getParameter("pageSeccion") == null || request.getParameter("pageSeccion").equals("")) ? "home" : request.getParameter("pageSeccion") ;
%>

<cms:contentload collector="singleFile" param="/english/.config/menu.html">
	<cms:contentcheck ifexistsone="NivelUno">
	<cms:contentloop element="NivelUno">
		<c:set var="parametros" scope="page"><cms:contentshow element="Parametros" /></c:set>				
		<jsp:useBean id="parametros" type="java.lang.String" />
<%
		if ( parametros.indexOf(pageSeccion) > -1 ) { 
%>
		<cms:contentcheck ifexistsone="NivelDos">
		<c:set var="i" value="0"/>
		
	 	<cms:contentloop  element="NivelDos">
			
			<c:set var="linkMenu" scope="page"><cms:contentshow element="Link" /></c:set>				
			<jsp:useBean id="linkMenu" type="java.lang.String" />
				
			<c:set var="active" value=""/>
			
<% 	 			CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
				String subSeccion = cms.property("subSeccion");
				
				if (subSeccion != null) {
					if ( linkMenu.indexOf(subSeccion) > -1 ) { 
				 
%>	
					<c:set var="active" value="active"/>	
<%
		 			}	
	 			}			
%>
				<c:if test="${i == 0}">
					<div class="subMenu">
						<div class="wrap">	
				</c:if>
				
				<cms:contentcheck ifexists="Link">
					<a  class="${active}" href="<cms:contentshow element="Link" />" target="<cms:contentshow element="Target" />"  title="<cms:contentshow element="Descripcion" />">
						<cms:contentshow element="Descripcion" />
					</a>
				</cms:contentcheck>
				
				<cms:contentcheck ifexists="ExternalLink">
					<a class="${active}" href="<cms:contentshow element="ExternalLink" />" title="<cms:contentshow element="Descripcion" />">
						<cms:contentshow element="Descripcion" />
					</a>
				</cms:contentcheck>
				
				<cms:contentcheck ifexistsnone="Link,ExternalLink" >
					<a class="${active}" href="#" title="<cms:contentshow element="Descripcion" />"> 
						<cms:contentshow element="Descripcion" />
					</a> 
				</cms:contentcheck>
			
				<c:set var="i" value="1"/>	
			
			

		</cms:contentloop>	
		
		<c:if test="${i == 1}">
				</div>	<!--wrap -->
			</div>	<!--subMenu -->
		</c:if>
					
		</cms:contentcheck>
		<% } %>
	</cms:contentloop>			
	</cms:contentcheck>
</cms:contentload>