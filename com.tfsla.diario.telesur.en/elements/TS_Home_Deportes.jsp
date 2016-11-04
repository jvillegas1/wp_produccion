<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news-list category="/system/categories/SubSecciones/news/sport/" size="6" order="user-modification-date desc">
	<nt:conditional-include onposition="first">
		<div class="block sports">
			<a href="http://www.telesurtv.net/SubSecciones/en/news/sport/index.html"><h6>Sports <cms:img src="/arte/redes/deportes.png" scaleType="2" alt="Telesur" /></h6></a>
	</nt:conditional-include>
	
			<cms:include page="TS_Common_BoxArticle.jsp">			
				<cms:param name="path"><nt:local-path /></cms:param>
			</cms:include>

	<nt:conditional-include onposition="last">
		</div>
	</nt:conditional-include>
</nt:news-list>

<%--<div class="block stats">
	<h6>Scores</h6>
	<cms:include page="TS_Widget_Deporte.jsp" /> 
</div> --%>