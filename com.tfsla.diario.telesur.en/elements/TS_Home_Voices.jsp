<%@ include file="TS_Common_Libraries.jsp" %>

<div class="block voces">
	<h6>Voices <cms:img src="/arte/redes/voces.png" scaleType="2" alt="Telesur" /></h6>
	
	<cms:include page="TS_Home_BoxReportero.jsp"></cms:include>
	<cms:include page="TS_Home_Interviews.jsp"></cms:include>
	
	<article class="bannerInt">
		<cms:include page="TS_Common_Banners.jsp">
			<cms:param name="template">Home</cms:param>
			<cms:param name="key">Advert-300x250-a</cms:param>
		</cms:include>
	</article>
</div>