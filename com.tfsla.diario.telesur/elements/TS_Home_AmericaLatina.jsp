<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news-list zone="latinaamerica_carousel" onmainpage="home" order="user-modification-date desc">
	<nt:conditional-include onposition="first">
		<div class="block latam">
			<a href="http://www.telesurtv.net/SubSecciones/news/latinaamerica/index.html"><h6>América Latina<cms:img src="/arte/redes/latina.png" scaleType="2" alt="Telesur" /></h6></a> 
	</nt:conditional-include>
	
			<cms:include page="TS_Common_BoxArticle.jsp">			
				<cms:param name="path"><nt:local-path /></cms:param>
			</cms:include>

	<nt:conditional-include onposition="last">
		</div>
	</nt:conditional-include>
</nt:news-list>