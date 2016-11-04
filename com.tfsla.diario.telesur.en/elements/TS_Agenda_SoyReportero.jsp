<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news-list size="3" order="priority asc, user-modification-date" zone="voices_soyreporteo"  page="1"  state="publicada" publication="9">
	<nt:conditional-include onposition="first">
		
			<div class="headBlue">You're the Reporter</div>
	</nt:conditional-include>
	
		<div class="box43" itemscope itemtype="http://schema.org/Article"> 	                
			<div class="wpXSmallImg" itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
				<nt:conditional-include oncondition="${news.imagepreviewset}" >      	
		                      <div itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
						<a href="<nt:link/>" title="<nt:title value='home' />" class="her">
						<nt:preview-image>
							<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
							<nt:conditional-include oncondition="${imageDescription != ''}">
								<meta itemprop="description" content='<nt:image-description/>'>	
								<img itemprop="contentURL" src="<nt:image-path width='80' height='80' scaletype='2'/>" alt="<nt:image-description/>" />
							</nt:conditional-include>
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
								<img itemprop="contentURL" src="<nt:image-path width='80' height='80' scaletype='2'/>" alt='${fn:escapeXml(news.titles["home"])}' />
							</nt:conditional-include>
						</nt:preview-image>
						</a>
		                      </div>
				</nt:conditional-include>
			</div>
			<div class="overflow">
				<meta itemprop="saveAs url" content="<nt:link/>"/>
				<h3>
					<a href="<nt:link/>" itemprop="name headline"><nt:title value='home'/></a>
				</h3>
				  <nt:edit-buttons hasNew="true" hasDelete="true"/>
				<nt:conditional-include oncondition="${news.authorscount > 0 && news.hideAuthor == 'false'}" >
					<nt:authors>
						<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
						<c:if test="${not empty internalUser}">
							<nt:user username="${internalUser}">
								<a itemprop="author" itemscope="" itemtype="http://schema.org/Person" href="<nt:user-link-friendly />" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>" class="autor">
									<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
									<meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
									by: <nt:user-firstname/> <nt:user-lastname/>
								</a>										
							</nt:user>
						</c:if>	 
						<c:if test="${empty internalUser}">
				    			<a class="autor" itemprop="author" itemscope="" itemtype="http://schema.org/Person">
				    				<meta itemprop="name" content="<nt:author-name/>"/>
				    				by: <nt:author-name/> 
				    			</a>
				    			
				    		</c:if>
				    	</nt:authors>
	            		</nt:conditional-include>
			</div>
		</div>
		
	<nt:conditional-include onposition="last">
		
	</nt:conditional-include>
</nt:news-list>