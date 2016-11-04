<%@ include file="TS_Common_Libraries.jsp" %>
<%
// Create a JSP action element
org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

// Online-Offline
Boolean isProjectOnline = cms.getCmsObject().getRequestContext().currentProject().isOnlineProject();
String index = (isProjectOnline) ? "TS_NEWS_ONLINE_EN" : "TS_NEWS_OFFLINE_EN" ;
%>
<nt:news-list order="priority DESC,user-modification-date desc" searchindex="<%=index %>" zone="bloguers" onmainpage="home">
	<nt:conditional-include onposition="first">
		<article class="middleArt">
			<a href="http://www.telesurtv.net/english/section/blog/index.html"><div class="headBlue">Blogs</div></a>
	</nt:conditional-include>
		
			<div class="box43" itemscope itemtype="http://schema.org/Article">
			
				<meta itemprop="sameAs url" content="<nt:link/>"/>
				
				<div class="wpXSmallImg" itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
				     	
				     	<nt:preview-image>
							
						<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
		      				
						<nt:conditional-include oncondition="${imageDescription == ''}">
							<c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
						</nt:conditional-include>
						
						<a href="<nt:link/>" title="${imageDescription}">	
							<meta itemprop="description" content='${imageDescription}'>
							<img itemprop="contentURL" src="../arte/grey.gif" data-original="<nt:image-path width='80' height='80' scaletype='2'/>" width='80' height='80' alt="${imageDescription}" />
						</a>
						
					</nt:preview-image>
				     	
				</div>
				<div class="overflow">
					<h3 itemprop="name headline"><a href="<nt:link/>" title='<nt:title value="home"/>'><nt:title value="home"/></a></h3>

					<nt:conditional-include oncondition="${news.authorscount > 0 && news.hideAuthor == ' false'}" >
						<p itemprop="author" itemscope="" itemtype="http://schema.org/Person">by
							<c:set var="divisor"></c:set>
							<nt:authors>
								<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
								<c:if test="${not empty internalUser}">
									<nt:user username="${internalUser}">
										<a itemprop="sameAs" href="<nt:user-link-friendly  urlpart='/english/staff/' />" class="autor" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"> 
											${divisor} <nt:user-firstname/> <nt:user-lastname/> 
										</a>
										<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
									</nt:user>
								</c:if>	 
								<c:if test="${empty internalUser}">
									<a itemprop="sameAs" href="javascript:void(0)" class="autor" title="<nt:author-name/>" alt="<nt:author-name/>">
										${divisor} <nt:author-name/> 
									</a>
									<meta itemprop="name" content="<nt:author-name/>"/>
								</c:if>
								<c:set var="divisor">,</c:set>
							</nt:authors>
						</p>
					</nt:conditional-include>
					
					<nt:edit-buttons hasNew="true" hasDelete="true"/>
				</div>
			</div>
		
	<nt:conditional-include onposition="last">
		</article>
	</nt:conditional-include>
</nt:news-list>