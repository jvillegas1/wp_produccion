<%@ include file="TS_Common_Libraries.jsp" %>
<%
// Create a JSP action element
org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

// Online-Offline
Boolean isProjectOnline = cms.getCmsObject().getRequestContext().currentProject().isOnlineProject();
String index = (isProjectOnline) ? "TS_NEWS_ONLINE" : "TS_NEWS_OFFLINE" ;
%>

<nt:news-list zone="voices_foros" order="priority DESC, user-modification-date asc" onmainpage="home" searchindex="<%=index%>" >
	<nt:conditional-include onposition="first">
		<article>
			<div class="headBlue">Foros</div>
	</nt:conditional-include>

		<div class="box43" itemscope itemtype="http://schema.org/Article">
			<meta itemprop="sameAs url" content="<nt:link/>"/>
			<p>
				<a href="<nt:link/>" itemprop="name headline" title="<nt:title value='home' />">
					<nt:title value="home"/>
				</a>
			</p>
		</div>

	<nt:conditional-include onposition="last">
		</article>
	</nt:conditional-include>
</nt:news-list>