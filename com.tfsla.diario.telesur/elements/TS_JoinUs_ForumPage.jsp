<%@ include file="TS_Common_Libraries.jsp" %>
<%
int pagina 	= ( request.getParameter("pagina") != null ) ? Integer.parseInt(request.getParameter("pagina")) : 1;
int size 	= ( request.getParameter("size") != null ) ? Integer.parseInt(request.getParameter("size")) : 10;
%>
<nt:news-list newstype="foros" size="<%=size%>" page="<%=pagina%>" order="user-modification-date desc"> 
	<li>
		<div class="forpostpop "><a href="<nt:link/>" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><nt:title value="home"/></a> <nt:edit-buttons hasNew="true" hasDelete="true"/></div>
		<div class="forpost">${news.commentcount}</div>
		<div class="forup"><nt:last-modified format="dd/MM/yy"/></div>		
	</li>
	<nt:conditional-include onposition="last">
		<c:set var="hayMas" value="false"/>
	
		<nt:conditional-include oncondition="${newslist.size == 10}">
			<nt:news-list newstype="foros" order="user-modification-date desc" size="<%=size%>" page="<%=pagina+1%>">
				<c:set var="hayMas" value="true"/>
			</nt:news-list>
			
			<c:if test="${hayMas == 'true'}" >
				<div id="bloque_<%=pagina+1%>"></div>
				
				<div class="forcenter" id="paginador">    
		                    <div class="forind">
		                        <div class="thread" onclick="cargarMasNotas('<%=pagina+1%>','<%=size%>');" style="cursor:pointer">Ver más</div>
		                    </div>
		                </div>
	                </c:if>
	        </nt:conditional-include>        
        </nt:conditional-include>
</nt:news-list>