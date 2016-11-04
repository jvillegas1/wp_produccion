<%@ include file="TS_Common_Libraries.jsp" %>
<%
String path = ( request.getParameter("path") != null ) ? request.getParameter("path") : "";
%>

<nt:news path="<%=path%>">
	<article itemscope itemtype="http://schema.org/Article">
		
		<meta itemprop="url" content="<nt:link/>"/>
		
		<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
			<nt:conditional-include oncondition="${news.videoscount > 0}">
				<img <cms:img src="/arte/ico-play.png" width="35" height="25" scaleType="2" scaleColor="transparent" partialTag="true" /> width="35" height="25" alt="Telesur" class="icoPlay" />
			</nt:conditional-include>
		
			<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
				
				<nt:preview-image>
							
					<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
	      				
					<nt:conditional-include oncondition="${imageDescription == ''}">
						<c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
					</nt:conditional-include>
					
					<a href="<nt:link/>" title="${imageDescription}" alt="${imageDescription}">	
						<meta itemprop="description" content='${imageDescription}'>
						<img itemprop="contentURL" src="../arte/grey.gif" data-original="<nt:image-path width='306' height='172' scaletype='2'/>" width='306' height='172' alt="${imageDescription}" />
					</a>
					
				</nt:preview-image>
				
			</div>
		</nt:conditional-include>
		
		<nt:conditional-include oncondition="${news.homePreview == 'videoYouTube'}">
			<nt:video-youtube>
				<nt:conditional-include onposition='1'>
					<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
					 	<meta itemprop="name" content="<nt:video-title/>" />
					 	<meta itemprop="publisher" content="<nt:video-publisher/>" />
					 	<meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
					 	<meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" /> 			
					</div>
					<iframe width="100%" height="169" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen></iframe>
				</nt:conditional-include>
			</nt:video-youtube>
		</nt:conditional-include>
		
		<nt:conditional-include oncondition="${news.homePreview == 'iframe'}">
			<nt:iframe/>
		</nt:conditional-include>
		
		<nt:conditional-include oncondition="${news.homePreview == 'videoEmbedded'}">
			<nt:video-embedded>
				<nt:conditional-include onposition='1'>
					<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
						<meta itemprop="name" content='<nt:video-title/>' />
					</div>
					<nt:video-code/>
				</nt:conditional-include>
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
							<cms:param name="width" value="306"/>
							<cms:param name="height" value="172"/>
						</cms:include>
					</nt:conditional-include>	
				</div>						
			</nt:video-flash>
		</nt:conditional-include>
		
		<%--<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
			<cms:img src="/arte/sinFoto_420x260.jpg" width="306" height="172" alt="<nt:title value='home'/>"  />
		</nt:conditional-include>--%>

		<h2 itemprop="name headline">
			<a href="<nt:link/>" title="<nt:title value='home' />" alt="<nt:title value='home' />">
				<nt:title value="home" maxlength="63" />
			</a>
		</h2>
		<div style="position:absolute;left:0;top:0;">
			<nt:edit-buttons hasNew="true" hasDelete="true"/>
		</div>
	</article>
</nt:news>