
<%@ include file="TS_Common_Libraries.jsp" %>

<%   
org.opencms.jsp.CmsJspXmlContentBean cms = new
org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
 
String category = request.getParameter("category");
String title = request.getParameter("title");

int pagina 	= ( request.getParameter("pagina") != null ) ? Integer.parseInt(request.getParameter("pagina")) : 1;
int size 	= ( request.getParameter("size") != null ) ? Integer.parseInt(request.getParameter("size")) : 11;
int proxPag 	= ( pagina == 1 ) ? 3 : pagina + 1;
/**
estilos de las notas: 
pagina 1 pos 1 y 2 - Estilo 1
pagina 1 pos 3 4 y 5 - Estilo 2
pagina 2 pos 6 7 y 8 - Estilo 3 
pagina 2 pos 9 10  y 11 ó pag > 2 - Estilo 4

Nunca paginamos la pag 2 porque la 1ra es de 11 notas y luego de a 5. La nota 11 se repetiria pero tenemos la condicion en la linea 58.
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
	

	<nt:conditional-include oncondition="${ newslist.absoluteposition == 6 || newslist.absoluteposition == 7 || newslist.absoluteposition == 8 }">		
		
		<cms:include page="TS_Common_NotaEstilo3.jsp" >
			<cms:param name="path"><nt:legacy-link/></cms:param>					
		</cms:include>
		
	</nt:conditional-include>

	
	<nt:conditional-include oncondition="${ newslist.absoluteposition == 9 || newslist.absoluteposition == 10 }">  
		
		<cms:include page="TS_Common_NotaEstilo4.jsp" >
			<cms:param name="path"><nt:legacy-link/></cms:param>					
		</cms:include>
		
	</nt:conditional-include> 
	
	<nt:conditional-include oncondition="${ newslist.absoluteposition == 11  && newslist.page == 1 }">  
		
		<cms:include page="TS_Common_NotaEstilo4.jsp" >
			<cms:param name="path"><nt:legacy-link/></cms:param>					
		</cms:include>
		
	</nt:conditional-include> 
	
	<nt:conditional-include oncondition="${ newslist.absoluteposition > 11 && newslist.page != 1  }">  
		
		<cms:include page="TS_Common_NotaEstilo4.jsp" >
			<cms:param name="path"><nt:legacy-link/></cms:param>					
		</cms:include>
		
	</nt:conditional-include> 
	
	<nt:conditional-include onposition="last">

		<c:set var="hayMas" value="false"/>
		
		<nt:conditional-include oncondition="${ (newslist.size == 11 && newslist.page == 1) || (newslist.size == 5 &&  newslist.page != 1) }">
			<nt:news-list order="user-modification-date desc" category="<%=category%>" size="<%=size%>" page="<%=pagina+1%>" publication="9">
				<c:set var="hayMas" value="true"/>
			</nt:news-list>
			
			<c:if test="${hayMas == 'true'}" >
				<div id="bloque_<%=proxPag%>"></div>
				
				<div class="btnarg" id="paginador" > 
					<a class="subscrip" href="javascript:cargarMasNotas('<%=proxPag %>','<%=category%>', '<%=title%>', '5');">More <%=title%> headlines</a>
				</div>	
			</c:if>	
		</nt:conditional-include> 

	</nt:conditional-include> 
</nt:news-list>		