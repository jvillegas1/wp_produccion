<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news-list order="user-modification-date desc" section="multimedia" category="/system/categories/SubSecciones/multimedia/webspecial/" size="5" publication="9">
	<nt:conditional-include onposition="first">
		<div class="wpAgenda">
			<a href="http://www.telesurtv.net/SubSecciones/en/multimedia/webspecial/index.html"><div class="square">Specials</div></a>
			<div class="SdSpecial">
				<ul class="slides">
	</nt:conditional-include>
	
					<li itemtype="http://schema.org/NewsArticle">
					
						<meta itemprop="sameAs url" content="<nt:link/>"/>
						
						<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
							<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject" style="height:105;">
								
								<nt:preview-image>
							
									<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
					      				
									<nt:conditional-include oncondition="${imageDescription == ''}">
										<c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
									</nt:conditional-include>
									
									<a target="_blank" href="<nt:link/>" title="${imageDescription}" alt="${imageDescription}">	
										<meta itemprop="description" content='${imageDescription}'>
										<img itemprop="contentURL" src="../arte/grey.gif" data-original="<nt:image-path width='146' height='82' scaletype='2'/>" width='146' height='82' alt="${imageDescription}" />
									</a>
									
								</nt:preview-image>
						
							</div>
						</nt:conditional-include>
						                                                    
						<%--<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
							<cms:img src="/arte/sinFoto_420x260.jpg" width='146' height='82' alt="<nt:title value='home'/>"  />
						</nt:conditional-include>--%>
						
						<h4 itemprop="name headline">
							<a target="_blank" href="<nt:link/>" title="<nt:title value='home' />" alt="<nt:title value='home' />"><nt:title value='home' maxlength="58" endchars="..." /></a>
							<nt:edit-buttons hasNew="true" hasDelete="true"/>
						</h4>
					</li>
	
	<nt:conditional-include onposition="last">
				</ul>
			</div>
		</div>
	</nt:conditional-include>
</nt:news-list>