<%@ include file="TS_Common_Libraries.jsp" %>

  <!-- Slider LATEST MOBILE -->
<div class="row clear" id="latestMobile">  
	<div class="col">
		<div class="cont conttitle">
			<div class="title blue">Latest News</div>
		</div>
		<div class="cont">
			<div class="flexslider carousel">
			     	<ul class="slides">
			              	<nt:news-list size="10" order="user-modification-date desc" section="news, blog, imreporter">
						<li itemscope itemtype="http://schema.org/Article">
							<meta itemprop="sameAs url" content="<nt:link/>"/>
							<a href="<nt:link/>" title="<nt:title/>" class="her" itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
							<nt:preview-image>								
								<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
				      				<nt:conditional-include oncondition="${imageDescription != ''}">
				      					<meta itemprop="description" content='<nt:image-description/>'>	
									<img itemprop="contentURL"  src="<nt:image-path width='420' height='260'  scaletype='2'/>" alt="<nt:image-description/>" width="420" height="260" />
								</nt:conditional-include>
								<nt:conditional-include oncondition="${imageDescription == ''}">
									<meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
									<img itemprop="contentURL"  src="<nt:image-path width='420' height='260'  scaletype='2'/>" alt='${news.titles[news.titleHomeNum]}' width="420" height="260" />
								</nt:conditional-include>
							</nt:preview-image>
							<nt:conditional-exclude oncondition="${news.imagepreviewset}">
								<img src="/arte/sinFoto_420x260.jpg" width="420" height="260" alt="<nt:title/>" alt='${news.titles[news.titleHomeNum]}' />
							</nt:conditional-exclude>
							</a>
							<a href="<nt:link/>" title="<nt:title/>" class="her"><div class="caption"><h2 itemprop="name headline" ><nt:title/></h2></div></a>
						</li>
					</nt:news-list>        
				</ul>  
			</div>
		</div>
	</div>  
</div>