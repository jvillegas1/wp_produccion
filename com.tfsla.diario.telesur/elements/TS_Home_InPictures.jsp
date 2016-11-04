<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news-list zone="enimagenes" order="priority desc,user-modification-date desc" onmainpage="home">
	<nt:conditional-include onposition="first">
		<div class="block imagenes">
		
			<a href="http://www.telesurtv.net/SubSecciones/multimedia/galleries/index.html"><h6>En Imágenes <cms:img src="/arte/redes/imagenes.png" alt="Telesur" /></h6></a>
			<c:set var="xClass" scope="page">important</c:set>
			<c:set var="xWidth" scope="page">628</c:set>
			<c:set var="xHeight" scope="page">360</c:set>
	</nt:conditional-include>
	
			<article class="${xClass}" itemscope itemtype="http://schema.org/Article">
				<meta itemprop="sameAs url" content="<nt:link/>"/>
				
				<nt:conditional-include oncondition="${newslist.absoluteposition == 1}">
					<c:set var="xTitle" scope="page"><nt:title value="home" /></c:set>
				</nt:conditional-include>
				
				<nt:conditional-include oncondition="${newslist.absoluteposition > 1}">
					<c:set var="xTitle" scope="page"><nt:title value="home" /></c:set>
				</nt:conditional-include>
				
				<nt:preview-image>
							
					<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
	      				
					<nt:conditional-include oncondition="${imageDescription == ''}">
						<c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
					</nt:conditional-include>
					
					<a href="<nt:link/>" title="${imageDescription}">	
						<meta itemprop="description" content='${imageDescription}'>
						<img itemprop="contentURL" src="arte/grey.gif" data-original="<nt:image-path width='${xWidth}' height='${xHeight}' scaletype='2'/>" width='${xWidth}' height='${xHeight}' alt="${imageDescription}" />
						
						<span itemprop="name headline"><small>${news.imagescount} | </small>${xTitle}</span>
					</a>
					
				</nt:preview-image>
				
			</article>
			<c:set var="xClass" scope="page"></c:set>
			<c:set var="xWidth" scope="page">306</c:set>
			<c:set var="xHeight" scope="page">172</c:set>
	
	<nt:conditional-include onposition="last">
		</div>
	</nt:conditional-include>
</nt:news-list>