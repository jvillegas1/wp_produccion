<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news-list order="priority asc, user-modification-date desc" section="analisis" onmainpage="home" size="5">
	<nt:conditional-include onposition="first">
		<article class="middleArt">
			<div class="headBlue">Analisis</div>
	</nt:conditional-include>
		
			<div class="box43" itemscope itemtype="http://schema.org/Article"> 	                
				<div class="wpXSmallImg" itemscope itemtype="http://schema.org/ImageObject">
					<nt:preview-image>
						<nt:conditional-include oncondition="${news.imagepreviewset == 'true'}">
				    			<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
					      		<nt:conditional-include oncondition="${imageDescription != ''}">
					      			<meta itemprop="description" content='<nt:image-description/>'>	
				    				<img itemprop="contentURL" src="<nt:image-path scaletype='2' width='80' height='80' />" width='80' height='80' alt="<nt:image-description/>" title="<nt:image-description/>">
							</nt:conditional-include>
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
								<img itemprop="contentURL" src="<nt:image-path scaletype='2' width='80' height='80' />"  width='80' height='80' alt='${news.titles[news.titleHomeNum]}' title='${news.titles[news.titleHomeNum]}' />
							</nt:conditional-include>
				                </nt:conditional-include>
				     	</nt:preview-image>
				</div>
				
				<div class="overflow">
					<h3><a href="<nt:link/>"><nt:title value="home"/></a></h3>

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