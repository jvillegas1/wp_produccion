<%@ include file="TS_Common_Libraries.jsp" %>

<div class="row clear desktop" itemscope itemtype="http://schema.org/Article">
	<div class="cont">
		<div class="blue tt-latest">Últimas Galerías</div>
		<div id="slideHorizontaLA" class="slideHor carousel latestmul" itemscope itemtype="http://schema.org/ImageObject">
			<ul class="slides">
				<nt:news-list order="priority asc, user-modification-date desc" section="multimedia" category="/SubSecciones/multimedia/galleries/" size="10">
					<li itemscope itemtype="http://schema.org/Article"> 
						<a itemprop="image" itemscope itemtype="http://schema.org/ImageObject" href="#PhotoGallery" onclick="cargarDestacada('<nt:local-path/>');" class="her" title="${news.titles[news.titleSectionNum]}">
							<nt:preview-image>
								<nt:conditional-include oncondition="${imageDescription != ''}">
									<meta itemprop="description" content='<nt:image-description/>'>	
									<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="170" height="105" />" alt="<nt:image-description/>" />
								</nt:conditional-include>
								<nt:conditional-include oncondition="${imageDescription == ''}">
									<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
									<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="170" height="105" />" alt='${news.titles[news.titleSectionNum]}' />
								</nt:conditional-include>
							</nt:preview-image>
						</a>
						<div class="caption"> 
							<a href="#PhotoGallery" onclick="cargarDestacada('<nt:local-path/>');" class="her" title="${news.titles[news.titleSectionNum]}">
								<h2 itemprop="name">${news.titles[news.titleSectionNum]}</h2>
								<meta itemprop="sameAs url" content="<nt:link/>"/>
							</a>
						</div>
					</li>
				</nt:news-list>
			</ul>
		</div>
	</div>
</div>

<div class="row clear" id="latestMobile" itemscope itemtype="http://schema.org/Article">
	<div class="col">
		<div class="cont conttitle">
			<div class="title blue">Galería</div>
		</div>
		<div class="cont">
			<div class="flexslider carousel"  itemscope itemtype="http://schema.org/ImageObject">
				<ul class="slides conttitle">
					<nt:news-list order="user-modification-date desc" section="multimedia" category="/SubSecciones/multimedia/galleries/" size="10">
					      <li itemscope itemtype="http://schema.org/Article">
					      		<a itemprop="image" itemscope itemtype="http://schema.org/ImageObject" href="#PhotoGallery" onclick="cargarDestacada('<nt:local-path/>');" title="${news.titles[news.titleSectionNum]}" class="her">
								<nt:preview-image>
									<nt:conditional-include oncondition="${imageDescription != ''}">
										<meta itemprop="description" content='<nt:image-description/>'>	
										<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="170" height="105" />" alt="<nt:image-description/>" />
									</nt:conditional-include>
									<nt:conditional-include oncondition="${imageDescription == ''}">
										<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
										<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="170" height="105" />" alt='${news.titles[news.titleSectionNum]}' />
									</nt:conditional-include> 
								</nt:preview-image>
					      		</a> 
							<a href="#PhotoGallery" onclick="cargarDestacada('<nt:local-path/>');" title="${news.titles[news.titleSectionNum]}" class="her">
								<div class="caption" itemprop="name headline">
									<h2 itemprop="name">${news.titles[news.titleSectionNum]}</h2>
									<meta itemprop="sameAs url" content="<nt:link/>"/>
								</div>
							</a> 
					      </li>
					</nt:news-list>  
				</ul>
			</div>
		</div>
	</div>
</div>