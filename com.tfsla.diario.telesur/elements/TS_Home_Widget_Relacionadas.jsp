<%@ include file="TS_Common_Libraries.jsp" %>
<div class="aside">
<ul>
	<c:set var="i" value="0" scope="page"/>
	<nt:news-list order="priority asc,user-modification-date" zone="destacada" onmainpage="home" size="1">	
		<div class="boxNews">	
				<!-- mid TOPICS -->									 	
			<nt:related-news size="4">			
				<c:set var="i" value="${i+1}" />			
				<c:if test="${i<= 4 }">
					<p>
					<li>
					<div><a href="<nt:link/>" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><nt:title value="home"/></a></div>					 
					</li>	</p>
				</c:if>	
			</nt:related-news>
			
			<div class="Moretitulos">
			<a href="http://www.telesurtv.net/seccion/news/index.html" alt="Mas Titulares" title="Mas Titulares" >Mas Titulares</a>
			</div>				
		</div>						
	</nt:news-list>			
</ul>
</div>