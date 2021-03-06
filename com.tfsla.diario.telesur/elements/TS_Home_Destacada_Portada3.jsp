<%@ include file="TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE";
%>

<div id="destacados">
    <div class="content v3">	
        <nt:news-list order="priority desc,user-modification-date" zone="destacada" onmainpage="home" size="1" searchindex="<%=index%>">	
            <meta itemprop="sameAs url" content="<nt:link/>"/>
            <article class="important port3" >

                <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
                    <div itemprop="image" itemscope itemtype="http://schema.org/ImageObject">

                        <nt:preview-image>

                            <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>

                            <nt:conditional-include oncondition="${imageDescription == ''}">
                                <c:set var="imageDescription" scope="page"><nt:image-path /></c:set>
                            </nt:conditional-include>

                            <a href="<nt:link/>" title="${imageDescription}">	
                                <meta itemprop="description" content='${imageDescription}'>
                                <img itemprop="contentURL" src="<nt:image-path width='610' height='342' scaletype='2'/>" title="${imageDescription}" alt="${imageDescription}" />
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


                <h2>
                    <a href="<nt:link/>" title="<nt:title value='home' />">
                        <nt:title value='home' />

                    </a>
                </h2>	

                <h4><nt:sub-title maxlength="153" /> | <a href="<nt:link/>">LEER MÁS</a></h4>	
                <div class="wpArticles">
                    <nt:related-news size="2">        
                        <c:set var="i" value="${i+1}" />			
                        <c:if test="${i> 0 and i<= 2 }">
                            <article>
                                <div class="wpSmallImg">
                                
                                    <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>

                            <nt:conditional-include oncondition="${imageDescription == ''}">
                                <c:set var="imageDescription" scope="page"><nt:image-path /></c:set>
                            </nt:conditional-include>
                                                               
                                    <nt:preview-image> 
                                        <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                        <a href="<nt:link/>" title="${imageDescription}" alt="${imageDescription}">	
                                		<meta itemprop="description" content='${imageDescription}'>
                                        <img itemprop="contentURL" src="<nt:image-path width='146' height='82' scaletype='4' />" />   	
                                        </a>
                                    </nt:preview-image>
                                </div>
                                <div class="overflow">
                                    <h4>						                                                 <!--Se aplica las mejores practicas de imagenes -->     
                                        <a href="<nt:link/>" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><nt:title value="home"/></a>
                                    </h4>
                            </article>  
                        </c:if> 
                        <c:if test="${i< 0}">
                            <article>
                                <div class="wpSmallImg">
                                    <div class="separadorRelation"></div>        
                                </div>
                                <div class="overflow">
                                    <div class="separadorRelation"></div>        
                            </article>  
                        </c:if>  		 					
                    </nt:related-news>                  
                </div>		
            </article>	
        </nt:news-list>        
        <cms:include page="TS_Home_Destacadas_Secundarias_Vertical.jsp" />              
    </div>   
    <cms:include page="TS_Home_Video_Portada3.jsp" />
    
   	<div class="wrap">	
		<cms:include page="../elements/TS_Common_Blocks.jsp">
			<cms:param name="template">Publicidad-950x90</cms:param>
		</cms:include>
				
		<c:set var="FirstPos" scope="page">false</c:set>	
	</div>   
</div>
