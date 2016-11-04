<%@ include file="TS_Common_Libraries.jsp" %>


<%
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 5 );
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
int position = 0;
String categoryPath = "/system/categories/SubSecciones/en/multimedia/destacadainfografic/"; 
%>		

<div class="cont">
	<nt:news-list order="priority asc,user-modification-date" section="multimedia"  category="<%=categoryPath%>"  size="1" publication="9">
		<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
			<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject" style="height:399;">
					<a href="<nt:link/>" title="<nt:title value='home' />" class="her" TARGET="_blank">
						<nt:preview-image>
							<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
							<nt:conditional-include oncondition="${imageDescription != ''}">
								<meta itemprop="description" content='<nt:image-description/>'>	
								<img itemprop="contentURL" src="<nt:image-path width='640' height='364' scaletype='2'/>" alt="<nt:image-description/>" />
							</nt:conditional-include>
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
								<img itemprop="contentURL" src="<nt:image-path width='640' height='364' scaletype='2' />" alt='${news.titles[news.titleHomeNum]}'/>
							</nt:conditional-include>
						</nt:preview-image>
					</a>
				<nt:edit-buttons hasNew="true" hasDelete="true"/>
			</div>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.homePreview == 'videoYouTube'}">
			<nt:video-youtube>
				<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
					<meta itemprop="name" content="<nt:video-title/>" />
					<meta itemprop="publisher" content="<nt:video-publisher/>" />
					<meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
					<meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" /> 			
				</div>
				<iframe width="100%" height="399" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen></iframe>
			</nt:video-youtube>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.homePreview == 'iframe'}">
			<nt:iframe/>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.homePreview == 'videoEmbedded'}">
			<nt:video-embedded>
				<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
					<meta itemprop="name" content='<nt:video-title/>' />
				</div>
				<nt:video-code/>
			</nt:video-embedded>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.homePreview == 'videoFlash'}">
			<c:set var="videopath" value=""/>
			<nt:video-flash>	
				<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
					<meta itemprop="name" content="<nt:video-title/>" />
					<meta itemprop="publisher" content="<nt:video-publisher/>" />
					<meta itemprop="thumbnailUrl" content="<nt:video-thumbnail />" />
					<meta itemprop="contentURL" content="<nt:video-path/>" />
					<meta itemprop="keywords" content="<nt:video-tags/>" />	
					<nt:conditional-include onposition="1">
						<c:set var="videopath">${videopath}<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
					</nt:conditional-include>
					<nt:conditional-exclude onposition="1">
						<c:set var="videopath">${videopath};<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
					</nt:conditional-exclude>
					<nt:conditional-include onposition="last">
						<cms:include page="TS_Common_VideoFlash.jsp">
							<cms:param name="video">${videopath}</cms:param>
							<cms:param name="width" value="100%"/>
							<cms:param name="height" value="399"/>
						</cms:include>
					</nt:conditional-include>	
				</div>						
			</nt:video-flash>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
			<cms:img src="/arte/sinFoto_420x260.jpg" width="100%" height="399" alt="<nt:title value='home'/>"  />
		</nt:conditional-include>
	</nt:news-list>   
</div>