<%@ include file="TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE_EN"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";
%>

<nt:news-list advancedfilter="seccion:news AND NOT home.zone:destacada AND NOT home.zone:destacada_secundaria AND NOT home.zone:ultimas" order="user-modification-date desc" size="3" publication="9">
	<nt:conditional-include onposition="first">
		<div class="block latest">
			<a href="http://www.telesurtv.net/english/section/news/index.html"><h6>Latest News</h6></a>
	</nt:conditional-include>
	
			<cms:include page="TS_Common_BoxArticle.jsp">			
				<cms:param name="path"><nt:local-path /></cms:param>
			</cms:include>

	<nt:conditional-include onposition="last">
			<div class="banners pos640">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Home</cms:param>
					<cms:param name="key">Advert-Mobile-300x150-a</cms:param>
				</cms:include>
			</div>
		</div>
	</nt:conditional-include>
</nt:news-list>