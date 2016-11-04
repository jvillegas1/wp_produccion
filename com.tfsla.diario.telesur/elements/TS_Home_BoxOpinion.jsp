<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news-list order="priority DESC, user-modification-date desc" section="opinion, analisis" zone="opinion" onmainpage="home">
	<nt:conditional-include onposition="first">
		<article class="middleArt">
			<div class="headBlue"><a href="http://www.telesurtv.net/seccion/opinion/index.html">Opinión</a></div>
	</nt:conditional-include>
		
			<div class="box43" itemscope itemtype="http://schema.org/Article"> 	                
				
				<meta itemprop="sameAs url" content="<nt:link/>"/>
				
				<div class="wpXSmallImg" itemscope itemtype="http://schema.org/ImageObject">
				     	
				     	<nt:preview-image>
							
						<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
		      				
						<nt:conditional-include oncondition="${imageDescription == ''}">
							<c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
						</nt:conditional-include>
						
						<a href="<nt:link/>" title="${imageDescription}">	
							<meta itemprop="description" content='${imageDescription}'>
							<img itemprop="contentURL" src="arte/grey.gif" data-original="<nt:image-path width='80' height='80' scaletype='2'/>" width='80' height='80' alt="${imageDescription}" />
						</a>
						
					</nt:preview-image>
				     	
				</div>
				
				<div class="overflow">
					<h3 itemprop="name headline"><a href="<nt:link/>" alt="<nt:title value="home"/>" title="<nt:title value="home"/>"><nt:title value="home"/></a></h3>

					<nt:conditional-include oncondition="${news.authorscount > 0 && news.hideAuthor == ' false'}" >
						<p itemprop="author" itemscope="" itemtype="http://schema.org/Person">por
							<c:set var="divisor"></c:set>
							<nt:authors>
								<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
								<c:if test="${internalUser != ''}">
									<nt:user username="${internalUser}">
										<a itemprop="sameAs" href="<nt:user-link-friendly />" class="autor" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"> 
											${divisor} <nt:user-firstname/> <nt:user-lastname/> 
										</a>
										<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
									</nt:user>
								</c:if>	 
								<c:if test="${internalUser == ''}">
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