<%@ include file="TS_Common_Libraries.jsp" %>

<%
String zona = request.getParameter("category") + "_carousel" ; 

if (zona.indexOf("sport") > -1 ) { // traemos las ultimas para esta categoria

	int r = 0;
	String categoria = request.getParameter("category") ;
%>	
	
	<div class="flexslider carousel verde">
             	<ul class="slides">

		<nt:news-list category="<%=categoria %>" size="10" order="user-modification-date">
			<li>
			<div itemscope itemtype="http://schema.org/Article"> 
				<meta itemprop="sameAs url" content="<nt:link/>"/>
				<a href="<nt:link/>" title="<nt:title value='home'/>" class="her">
					<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
						<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
							<a href="<nt:link/>" title="<nt:title value='home' />" class="her">
								<nt:preview-image>
									<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
					      				<nt:conditional-include oncondition="${imageDescription != ''}">
					      					<meta itemprop="description" content='<nt:image-description/>'>	
										<img itemprop="contentURL" src="<nt:image-path width='420' height='260'  scaletype='2'/>" alt="<nt:image-description/>" width="420" height="260" />
									</nt:conditional-include>
									<nt:conditional-include oncondition="${imageDescription == ''}">
										<meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
										<img itemprop="contentURL" src="<nt:image-path width='420' height='260'  scaletype='2'/>" alt='${news.titles[news.titleHomeNum]}' width="420" height="260" />
									</nt:conditional-include>
								</nt:preview-image>
							</a>
						</div>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.homePreview == 'videoYouTube'}">
						<c:set var="y" value="0" />
						<nt:video-youtube>
							<c:set var="y" value="${y+1}" />
							<c:set var="videoHomeY"><nt:generic-news-value element='videoFlash[${y}]/mostrarEnHome'/></c:set>	
							<nt:conditional-include oncondition="${videoHomeY == 'true'}">
								<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								  	<meta itemprop="name" content="<nt:video-title/>" />
								 	<meta itemprop="publisher" content="<nt:video-publisher/>" />
								 	<meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
								 	<meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" /> 
								 	
								 	<iframe width="420" height="260" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen></iframe>
								</div>
							</nt:conditional-include>
						</nt:video-youtube>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.homePreview == 'iframe'}">
						<nt:iframe/>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.homePreview == 'videoEmbedded'}">
						<nt:video-embedded>
							<nt:conditional-include onposition="1">
								<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
									<meta itemprop="name" content='<nt:video-title/>' />
									<nt:video-code />      
								</div>
							</nt:conditional-include>
						</nt:video-embedded>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.homePreview == 'videoFlash'}">
						<c:set var="videopath" value=""/>
						<c:set var="f" value="0" />
						<nt:video-flash>	
							<c:set var="f" value="${f+1}" />
							<c:set var="videoHomeF"><nt:generic-news-value element='videoFlash[${f}]/mostrarEnHome'/></c:set>	
							<nt:conditional-include oncondition="${videoHomeF == 'true'}">
								<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
									<meta itemprop="name" content="<nt:video-title/>" />
									<meta itemprop="publisher" content="<nt:video-publisher/>" /> 
									<meta itemprop="thumbnailUrl" content="<nt:video-thumbnail />" />
									<meta itemprop="contentURL" content="<nt:video-path/>" />
									<meta itemprop="keywords" content="<nt:video-tags/>" />
									
									<c:set var="videopath">${videopath}<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>	
										<%	
										Random generator = new Random();
										r = generator.nextInt(99999); 
										/** generamos un numero random único y se lo pasamos al jwplayer 
										para que en los eventos play y pause ocultemos el titulo de la nota.
										*/						
										%>	
											<cms:include page="TS_Common_VideoFlash.jsp">
												<cms:param name="video">${videopath}</cms:param>
												<cms:param name="width" value="420"/>
												<cms:param name="height" value="260"/>
												<cms:param name="r"><%=r %></cms:param>
											</cms:include>										
								</div>	
							</nt:conditional-include>						
						</nt:video-flash>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
						<cms:img src="/arte/sinFoto_420x260.jpg" width="420" height="260" alt="<nt:title value='home'/>"  />
					</nt:conditional-include>
				</a>
				<a href="<nt:link/>" title="<nt:title value='home'/>" class="her">
				
					<nt:conditional-include oncondition="${news.homePreview == 'videoFlash'}">
						<div itemprop="name" class="caption" id="caption-<%=r %>">
					</nt:conditional-include>
					
					<nt:conditional-include oncondition="${news.homePreview == 'videoYouTube'}">
						<div class="caption">
					</nt:conditional-include>
					
					<nt:conditional-include oncondition="${news.homePreview != 'videoFlash' && news.homePreview != 'videoYouTube'}">
						<div class="caption">
					</nt:conditional-include>
							<h2 itemprop="name headline"><nt:title value='home'/></h2>
							<nt:edit-buttons hasNew="true" hasDelete="true"/>
						</div>
				</a>
			</div>
			</li>
		</nt:news-list>        
      		</ul>  
	</div>
<%
} else {
	int r = 0; 
%>	
	
	<div class="flexslider carousel ">
             	<ul class="slides">
              	<nt:news-list zone="<%=zona%>" onmainpage="home" size="10" order="priority asc, user-modification-date desc" >

			<li>
			<div itemscope itemtype="http://schema.org/Article" >
				<meta itemprop="saveAs url" content="<nt:link/>"/>
				<a href="<nt:link/>" title="<nt:title value='home'/>" class="her">
					<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
						<a href="<nt:link/>" title="<nt:title value='home' />" class="her">
							<nt:preview-image>
								<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
									<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
					      				<nt:conditional-include oncondition="${imageDescription != ''}">
					      					<meta itemprop="description" content='<nt:image-description/>'>	
										<img itemprop="contentURL" src="<nt:image-path width='420' height='260'  scaletype='2'/>" alt="<nt:image-description/>" width="420" height="260" />
									</nt:conditional-include>
									<nt:conditional-include oncondition="${imageDescription == ''}">
										<meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
										<img itemprop="contentURL" src="<nt:image-path width='420' height='260'  scaletype='2'/>" alt='${news.titles[news.titleHomeNum]}' width="420" height="260" />
									</nt:conditional-include>
								</div>
							</nt:preview-image>
						</a>
					</nt:conditional-include>
	
					<nt:conditional-include oncondition="${news.homePreview == 'videoYouTube'}">
						<c:set var="y" value="0" />
						<nt:video-youtube>
							<c:set var="y" value="${y+1}" />
							<c:set var="videoHomeY"><nt:generic-news-value element='videoFlash[${y}]/mostrarEnHome'/></c:set>	
							<nt:conditional-include oncondition="${videoHomeY == 'true'}">
								<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								  	<meta itemprop="name" content="<nt:video-title/>" />
								 	<meta itemprop="publisher" content="<nt:video-publisher/>" />
								 	<meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
								 	<meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" /> 
								 	
								 	<iframe width="420" height="260" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen></iframe>
								</div>
							</nt:conditional-include>
						</nt:video-youtube>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.homePreview == 'iframe'}">
						<nt:iframe/>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.homePreview == 'videoEmbedded'}">
						<nt:video-embedded>
							<nt:conditional-include onposition="1">
								<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
									<meta itemprop="name" content='<nt:video-title/>' />
									<nt:video-code />      
								</div>
							</nt:conditional-include>
						</nt:video-embedded>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.homePreview == 'videoFlash'}">
						<c:set var="videopath" value=""/>
						<c:set var="f" value="0" />
						<nt:video-flash>						
							<c:set var="f" value="${f+1}" />
							<c:set var="videoHomeF"><nt:generic-news-value element='videoFlash[${f}]/mostrarEnHome'/></c:set>	
							<nt:conditional-include oncondition="${videoHomeF == 'true'}">						
								<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">								
									<meta itemprop="name" content="<nt:video-title/>" />
									<meta itemprop="publisher" content="<nt:video-publisher/>" />
									<meta itemprop="thumbnailUrl" content="<nt:video-thumbnail />" />
									<meta itemprop="contentURL" content="<nt:video-path/>" />
									<meta itemprop="keywords" content="<nt:video-tags/>" />
									
									<c:set var="videopath">${videopath}<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>									
										<%							
										Random generator = new Random();							
										r = generator.nextInt(99999); 
										/** generamos un numero random único y se lo pasamos al jwplayer 
										para que en los eventos play y pause ocultemos el titulo de la nota.
										*/	
										%>	
											<cms:include page="TS_Common_VideoFlash.jsp">
												<cms:param name="video">${videopath}</cms:param>
												<cms:param name="width" value="420"/>
												<cms:param name="height" value="260"/>
												<cms:param name="r"><%=r %></cms:param>
											</cms:include>									
								</div>
							</nt:conditional-include>					
						</nt:video-flash>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
						<cms:img src="/arte/sinFoto_420x260.jpg" width="420" height="260" alt="<nt:title value='home'/>"  />
					</nt:conditional-include>
				</a>
				<a href="<nt:link/>" title="<nt:title value='home'/>" class="her">
				
					<nt:conditional-include oncondition="${news.homePreview == 'videoFlash'}">
						<div itemprop="name" class="caption" id="caption-<%=r %>">
					</nt:conditional-include>
					
					<nt:conditional-include oncondition="${news.homePreview == 'videoYouTube'}">
						<div class="caption">
					</nt:conditional-include>
					
					<nt:conditional-include oncondition="${news.homePreview != 'videoFlash' && news.homePreview != 'videoYouTube'}">
						<div class="caption">
					</nt:conditional-include>
							<h2 itemprop="name headline" ><nt:title value='home'/></h2>
							<nt:edit-buttons hasNew="true" hasDelete="true"/>
						</div>
				</a>
			</div>
			</li>
		</nt:news-list>        
      		</ul>  
	</div>	
	
<% } %>