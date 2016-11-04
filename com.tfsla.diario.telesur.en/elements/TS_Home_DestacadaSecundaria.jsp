<%@ include file="TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE_EN"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";
%>

<c:set var="FirstPos" scope="page">true</c:set>
<nt:news-list order="priority asc,user-modification-date" zone="destacada_secundaria" onmainpage="home" size="4" publication="9" searchindex="<%=index%>">
	<%--Si son 3 incluye el banner en la posicion derecha--%>
	<nt:conditional-include oncondition="${newslist.size < 4}">
		<nt:conditional-include oncondition="${FirstPos == true}">
			<div class="aside">
				<div class="boxProg">
				<%  try{ %> 
								
					<ul>
						<c:import url="http://www.telesurtv.net/_static_rankings/static_liveBoxHomeEng.html"/>
					</ul>
				<% } catch (Exception e){%> Loading... <% } %>	
					
								
				
				
					
					<a href="/english/section/programs/index.html">All Programs</a>					
				</div>
				
				<article class="dest">
				
				<cms:include page="TS_Common_Blocks.jsp">
					<cms:param name="template">Dest-secundaria</cms:param>
				</cms:include>
				
				</article>
			</div>
			
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">Publicidad-950x90</cms:param>
			</cms:include>
			
			<c:set var="FirstPos" scope="page">false</c:set>
		</nt:conditional-include>
		
		<cms:include page="TS_Common_BoxArticle.jsp">			
			<cms:param name="path"><nt:local-path /></cms:param>
		</cms:include>
	</nt:conditional-include>
	
	<%--Si son 4 no incluye el banner en la posicion derecha y muestra la noticia--%>
	<nt:conditional-include oncondition="${newslist.size > 3}">
		<nt:conditional-include onposition="1">
			<div class="aside">
				<div class="boxProg">
			<%  try{ %> 
								
					<ul>
						<c:import url="http://www.telesurtv.net/_static_rankings/static_liveBoxHomeEng.html"/>
					</ul>
				<% } catch (Exception e){%> Loading... <% } %>	
				
				
					<a href="/seccion/programas/index.html">All Programs</a>
					
				</div>
				
				<article class="dest" itemscope="" itemtype="http://schema.org/NewsArticle">
					
					<meta itemprop="sameAs url" content="<nt:link/>"/>
					
					<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
						<nt:conditional-include oncondition="${news.videoscount > 0}">
							<img <cms:img src="/arte/ico-play.png" scaleType="2" width="35" height="25" scaleColor="transparent" partialTag="true" /> width="35" height="25" alt="Telesur" class="icoPlay" />
						</nt:conditional-include>
					
						<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
							
							<nt:preview-image>
							
								<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
				      				
								<nt:conditional-include oncondition="${imageDescription == ''}">
									<c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
								</nt:conditional-include>
								
								<a href="<nt:link/>" title="${imageDescription}">	
									<meta itemprop="description" content='${imageDescription}'>
									<img itemprop="contentURL" src="<nt:image-path width='306' height='172' scaletype='2'/>" width='306' height='172' alt="${imageDescription}" />
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
							<iframe width='100%' height='172' src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen></iframe>
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
					
					<hgroup>
						<nt:categories>
							<nt:conditional-include onposition='1'>
								<h5><nt:category-description/></h5>
							</nt:conditional-include>	
						</nt:categories>
						
						<h4>
							<a href="<nt:link/>" title="<nt:title value='home' />" itemprop="name headline">
								<nt:title value='home' maxlength="100" endchars="..." />
							</a>
						</h4>
					</hgroup>
					
					<div style="position:absolute;right:0;bottom:0;">
						<nt:edit-buttons hasNew="true" hasDelete="true"/>
					</div>
				</article>
			</div>
			
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">Publicidad-950x90</cms:param>
			</cms:include>
			
			
		</nt:conditional-include>
		
		<nt:conditional-include oncondition="${newslist.absoluteposition > 1}">
			<cms:include page="TS_Common_BoxArticle.jsp">			
				<cms:param name="path"><nt:local-path /></cms:param>
			</cms:include>
		</nt:conditional-include>
	</nt:conditional-include>
</nt:news-list>