<%@ include file="TS_Common_Libraries.jsp" %>

<%
// Create a JSP action element
org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

// Online-Offline
Boolean isProjectOnline = cms.getCmsObject().getRequestContext().currentProject().isOnlineProject();
String index = (isProjectOnline) ? "TS_NEWS_ONLINE_EN" : "TS_NEWS_OFFLINE_EN" ;
%>

<nt:news-list order="priority desc, user-modification-date desc" searchindex="<%=index %>" zone="voices_soyreporteo" onmainpage="home">
	<nt:conditional-include onposition="first">
		<article>
			<div class="headBlue"><a href="http://www.telesurtv.net/english/section/imreporter/index.html">You're the Reporter</a></div>
	</nt:conditional-include>
	
		<div class="box43" itemscope itemtype="http://schema.org/Article"> 	                
			<div class="wpXSmallImg" itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
				<nt:conditional-include oncondition="${news.imagepreviewset}" >      	
					<div class="min80" itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
					
						<nt:preview-image>
							
							<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
							
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
							</nt:conditional-include>
							
							<a href="<nt:link/>" title="${imageDescription}" alt="${imageDescription}">	
								<meta itemprop="description" content='${imageDescription}'>
								<img itemprop="contentURL" src="../arte/grey.gif" data-original="<nt:image-path width='80' height='80' scaletype='2'/>" width='80' height='80' alt="${imageDescription}" />
							</a>
							
						</nt:preview-image>
					
					</div>
				</nt:conditional-include>
			</div>
			<div class="overflow">
				<meta itemprop="saveAs url" content="<nt:link/>"/>
				<h3>
					<a href="<nt:link/>" title="<nt:title value='home'/>" alt="<nt:title value='home'/>" itemprop="name headline"><nt:title value='home'/></a>
				</h3>
				
				<nt:conditional-include oncondition="${news.authorscount > 0 && news.hideAuthor == 'false'}" >
					by
					<c:set var="divisor"></c:set>
					<nt:authors>
						<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
						<c:if test="${not empty internalUser}">
							<nt:user username="${internalUser}">
							
									<nt:conditional-include oncondition="${internalUser != 'anonymousUser'}">							
										<a itemprop="author" itemscope="" itemtype="http://schema.org/Person" href="<nt:user-link-friendly />" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>" class="autor">
										<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
										<meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
										${divisor} <nt:user-firstname/> <nt:user-lastname/>
										</a>	
									</nt:conditional-include>
									
									<nt:conditional-include oncondition="${internalUser == 'anonymousUser'}">							
								<a itemprop="author" itemscope="" itemtype="http://schema.org/Person" href="<nt:user-link-friendly />" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>" class="autor">
									<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
									<meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
									${divisor} teleSUR
								</a>	
									</nt:conditional-include>
																
							</nt:user>
						</c:if>	 
						<c:if test="${empty internalUser}">
				    			<a class="autor" itemprop="author" itemscope="" itemtype="http://schema.org/Person">
				    				<meta itemprop="name" content="<nt:author-name/>"/>
				    				${divisor} <nt:author-name/> 
				    			</a>
				    			
				    		</c:if>
				    		<c:set var="divisor">,</c:set>
				    	</nt:authors>
	            		</nt:conditional-include>
			</div>
		</div>
		
	<nt:conditional-include onposition="last">
		</article>
	</nt:conditional-include>
</nt:news-list>