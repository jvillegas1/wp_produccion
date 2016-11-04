<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news-list zone="world_carousel" onmainpage="home" order="priority asc,user-modification-date desc">
<%--<nt:news-list category="news/world" size="6" order="priority asc,user-modification-date desc">--%>
	<nt:conditional-include onposition="first">
		<div class="block world">
			<a href="http://www.telesurtv.net/SubSecciones/en/news/world/index.html"><h6>World <cms:img src="/arte/redes/mundo.png" scaleType="2" alt="Telesur" /></h6></a>
	</nt:conditional-include>
	
			<cms:include page="TS_Common_BoxArticle.jsp">			
				<cms:param name="path"><nt:local-path /></cms:param>
			</cms:include>

	<nt:conditional-include onposition="last">
		</div>
	</nt:conditional-include>
</nt:news-list>