<%@ include file="TS_Common_Libraries.jsp" %>

<div class="contINT">					
	<div class="relacINT">Noticias Relacionadas</div>        
		<nt:news>
			<c:set var="i" value="0" scope="page"/>
					<ul>	
				<nt:related-news size="5">	
				<c:set var="i" value="${i+1}" />			
				<c:if test="${i<= 5 }">					   								
						<li>
							<article class="INT" itemscope itemtype="http://schema.org/Article">		
								<meta itemprop="url" content="<nt:link/>"/>
								
								<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
									<%--	<nt:conditional-include oncondition="${news.videoscount > 0}">
										<img <cms:img src="/arte/ico-play.png" width="35" height="25" scaleType="2" scaleColor="transparent" partialTag="true" /> width="35" height="25" alt="Telesur" class="icoPlay" />
									</nt:conditional-include>  --%>
								
									<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
										
										<nt:preview-image>
													
											<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
							      				
											<nt:conditional-include oncondition="${imageDescription == ''}">
												<c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
											</nt:conditional-include>
											
											<a href="<nt:link/>" title="${imageDescription}" alt="${imageDescription}">	
												<meta itemprop="description" content='${imageDescription}'>
												<img itemprop="contentURL" src="<nt:image-path width='180' height='120' scaletype='2'/>" data-original="<nt:image-path width='180' height='120' scaletype='2'/>" width='180' height='120' alt="${imageDescription}" />
											</a>
											
										</nt:preview-image>
										
									</div>
								</nt:conditional-include>
						
								<h2 itemprop="name headline">
									<a href="<nt:link/>" title="<nt:title value='home' />" alt="<nt:title value='home' />">
										<nt:title value="home" maxlength="63" />
									</a>
								</h2>
							<%--	<div style="position:absolute;left:0;top:0;">
									<nt:edit-buttons hasNew="true" hasDelete="true"/>
								</div>   --%>
							</article>
						</li>																					 
					
				</c:if>	
				</nt:related-news>	
				
				</ul>					
		</nt:news>	

	
</div>