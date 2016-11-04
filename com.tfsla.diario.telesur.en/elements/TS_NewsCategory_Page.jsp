	<%@ include file="TS_Common_Libraries.jsp" %>

<%   
org.opencms.jsp.CmsJspXmlContentBean cms = new
org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
 
String category = request.getParameter("category");	
String title = request.getParameter("title");

int pagina 	= ( request.getParameter("pagina") != null ) ? Integer.parseInt(request.getParameter("pagina")) : 1;
int size 	= ( request.getParameter("size") != null ) ? Integer.parseInt(request.getParameter("size")) : 9;
/**
La primerab vez traemos 9 notas, los estilos son: 
pagina 1 pos 1 y 2 - Estilo 1
pagina 1 pos 3 4, 5  - Estilo 2
pagina 1 pos 6, 7, 8 y 9 - Estilo 3

Al darle cargar mas, vamos a paginar de a 7 notas, por ende se reacomodan las notas asi
pagina 1 .. notas: 1 2 3 4 5 6 7
pagina 2 .. notas: 8 9 10 11 12 13 14 
*/
%>

<nt:news-list order="user-modification-date desc" category="<%=category%>" size="<%=size%>" page="<%=pagina%>" publication="9">
	<nt:conditional-include oncondition="${ newslist.absoluteposition == 1 || newslist.absoluteposition == 2}"> 
		
		<cms:include page="TS_Common_NotaEstilo1.jsp" >
			<cms:param name="path"><nt:legacy-link/></cms:param>					
		</cms:include>
		
	</nt:conditional-include>
	
	<nt:conditional-include oncondition="${ newslist.absoluteposition == 3 || newslist.absoluteposition == 4 || newslist.absoluteposition == 5 }"> 
		
		<cms:include page="TS_Common_NotaEstilo2.jsp" >
			<cms:param name="path"><nt:legacy-link/></cms:param>					
		</cms:include>
		
	</nt:conditional-include>
	
	
	<nt:conditional-include oncondition="${ newslist.absoluteposition > 5 && newslist.page == 1 }">		
		
		<cms:include page="TS_Common_NotaEstilo3.jsp" >
			<cms:param name="path"><nt:legacy-link/></cms:param>					
		</cms:include>
		
	</nt:conditional-include>
	
	<% /** notas llamadas por el paginador */ %>
	<nt:conditional-include oncondition="${newslist.absoluteposition > 9 && newslist.page != 1 }">		
		
		<cms:include page="TS_Common_NotaEstilo3.jsp" >
			<cms:param name="path"><nt:legacy-link/></cms:param>					
		</cms:include>
		
	</nt:conditional-include>
	
	
	<nt:conditional-include onposition="last">

		<c:set var="hayMas" value="false"/>
		
		<nt:conditional-include oncondition="${ (newslist.size == 9 && newslist.page == 1) || (newslist.size == 7 &&  newslist.page != 1) }">
			<nt:news-list order="user-modification-date desc" category="<%=category%>" size="<%=size%>" page="<%=pagina+1%>"  publication="9">
				<c:set var="hayMas" value="true"/>
			</nt:news-list>
			
			<c:if test="${hayMas == 'true'}" >
				<div id="bloque_<%=pagina+1%>"></div>
				
				<div class="btnarg" id="paginador" > 
					<a class="subscrip" href="javascript:cargarMasNotas('<%=pagina+1%>','<%=category%>','<%=title %>','7');">More <%=title%> headlines</a>
				</div>	
			</c:if>	
		</nt:conditional-include> 

	</nt:conditional-include> 
</nt:news-list>		