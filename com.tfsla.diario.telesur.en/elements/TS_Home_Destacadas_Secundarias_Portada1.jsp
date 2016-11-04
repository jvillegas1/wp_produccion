<%@ include file="TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE_EN"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";
%>

<div class="wpArticles">
	
	<nt:news-list order="priority desc,user-modification-date desc" zone="destacada_secundaria" onmainpage="home" size="3" publication="9" searchindex="<%=index%>">
		<meta itemprop="sameAs url" content="<nt:link/>"/>
		
		
		<cms:include page="TS_Common_BoxArticle.jsp">			
			<cms:param name="path"><nt:local-path /></cms:param>
		</cms:include>           
	</nt:news-list>
</div>