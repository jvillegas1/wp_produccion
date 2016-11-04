<%@ include file="TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE_EN"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";
%>
<div id="destacados">
    <div class="wrapDefault">	
       <nt:news-list order="priority desc,user-modification-date" zone="destacada" onmainpage="home" size="1" publication="9" searchindex="<%=index%>">
	
	<div class="block" itemscope itemtype="http://schema.org/Article">
		<meta itemprop="sameAs url" content="<nt:link/>"/>
		<article class="important">
			<div class="wpImg" itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
				
				<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
					<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
						
						<nt:preview-image>
							
							<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
			      				
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
							</nt:conditional-include>
							
							<a href="<nt:link/>" title="${imageDescription}">	
								<meta itemprop="description" content='${imageDescription}'>
								<img itemprop="contentURL" src="<nt:image-path width='628' height='353' scaletype='2'/>" width='628' height='353' alt="${imageDescription}" />
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
							<iframe width="100%" height="353" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen></iframe>
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
									<cms:param name="width" value="628"/>
									<cms:param name="height" value="353"/>
								</cms:include>
							</nt:conditional-include>	
						</div>						
					</nt:video-flash>
				</nt:conditional-include>
				
				<%--<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
					<cms:img src="/arte/sinFoto_420x260.jpg" width="628" height="353" alt="<nt:title value='home'/>"  />
				</nt:conditional-include>--%>
				
				<h2 itemprop="name headline">
					<a href="<nt:link/>" title="<nt:title value='home' />">
						<nt:title value='home' />
						<nt:edit-buttons hasNew="true" hasDelete="true"/>
					</a>
				</h2>
			</div>
			<h4><nt:sub-title maxlength="153" /> | <a href="<nt:link/>">Full Story</a></h4>
		</article>
	
		<cms:include page="TS_Home_DestacadaSecundaria.jsp" />
	</div>
      </nt:news-list> 
        
        
        
        </div>
   
</div>