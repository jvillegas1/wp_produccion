<%@ include file="TS_Common_Libraries.jsp" %>

<%
org.opencms.jsp.CmsJspXmlContentBean cms = new
org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
 
String category = cms.property("subSeccion");
String title = cms.property("Title");
String keiwords = cms.property("Keywords");


%>


<link rel="stylesheet" href="/system/modules/com.tfsla.diario.telesur/resources/css/css/reset.css">
<link rel="stylesheet" href="/system/modules/com.tfsla.diario.telesur/resources/css/css/estilos.css">
<link rel="stylesheet" href="/system/modules/com.tfsla.diario.telesur/resources/css/css/destacadoss.css">
<link href='http://fonts.googleapis.com/css?family=Arimo:400,700,400italic' rel='stylesheet' type='text/css'> 
<section>
    <div id="destacados">
	<!-- Aside-->
	<aside class="v1">
		<div class="bnrs-side">
			<cms:include page="TS_Common_Banners.jsp">
				<cms:param name="template">Home</cms:param>
				<cms:param name="key">Advert-183x374-a</cms:param>
			</cms:include>
			
			
			<cms:include page="TS_Common_Banners.jsp">
				<cms:param name="template">Home</cms:param>
				<cms:param name="key">Advert-183x374-b</cms:param>
			</cms:include>
		</div><!-- Banners laterales -->
	</aside>
	<!-- Aside -->

        <!-- Overlfow -->
        <div class="content v1">

            <div class="dest" itemscope itemtype="http://schema.org/Article">

                <%--<nt:news-list section="news" order="priority asc,user-modification-date desc" onmainpage="section" zone="destacada" size="1" >--%>
                <c:set var="i" value="0" />
                <nt:news-list size="13" order="modification-date" section="news" tags="<%=keiwords%>"  state="publicada">
                    <c:set var="i" value="${i+1}" />
                    <c:if test="${i==1 }">	
                        <article class="important">
                            <div class="wpImg">                
                                <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
                                    <div class="img-destnew npc" itemscope itemtype="http://schema.org/ImageObject">	
                                        <a href="<nt:link/>" title="<nt:title value='section' />" class="her">
                                            <nt:preview-image>
                                                <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                                <nt:conditional-include oncondition="${imageDescription != ''}">
                                                    <meta itemprop="description" content='<nt:image-description/>'>	
                                                    <img itemprop="contentURL" src="<nt:image-path width='631' height='354'  scaletype='2'/>" alt="<nt:image-description/>" title="<nt:image-description/>" width="634" height="354" />
                                                </nt:conditional-include>
                                                <nt:conditional-include oncondition="${imageDescription == ''}">
                                                    <meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
                                                    <img itemprop="contentURL" src="<nt:image-path width='631' height='354'  scaletype='2'/>" alt="${fn:escapeXml(news.titles["section"])}" title="${fn:escapeXml(news.titles["section"])}" width="634" height="354" />
                                                </nt:conditional-include>
                                            </nt:preview-image>
                                        </a>
                                    </div>
                                </nt:conditional-include>

                                <nt:conditional-include oncondition="${news.homePreview == 'videoYouTube'}">
                                    <div itemscope itemtype="http://schema.org/VideoObject">
                                        <c:set var="y" value="0" />	
                                        <nt:video-youtube>
                                            <c:set var="y" value="${y+1}" />
                                            <c:set var="videoHomeY"><nt:generic-news-value element='videoFlash[${y}]/mostrarEnHome'/></c:set>	
                                            <nt:conditional-include oncondition="${videoHomeY == 'true'}">
                                                <meta itemprop="name" content='<nt:video-title/>' />
                                                <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                                <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                                <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                                <iframe height="354" width="100%" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen></iframe>
                                            </nt:conditional-include>	
                                        </nt:video-youtube>
                                    </div>
                                </nt:conditional-include>

                                <nt:conditional-include oncondition="${news.homePreview == 'iframe'}">
                                    <div class="img-destnew npc">
                                        <nt:iframe/>
                                    </div>
                                </nt:conditional-include>

                                <nt:conditional-include oncondition="${news.homePreview == 'videoEmbedded'}">
                                    <div class="img-destnew npc" itemscope itemtype="http://schema.org/VideoObject">
                                        <nt:video-embedded>
                                            <nt:conditional-include onposition="1">
                                                <meta itemprop="name" content='<nt:video-title/>' />	
                                                <nt:video-code /> 
                                            </nt:conditional-include>         
                                        </nt:video-embedded>
                                    </div>
                                </nt:conditional-include>

                                <nt:conditional-include oncondition="${news.homePreview == 'videoFlash'}">
                                    <div class="img-destnew npc" itemscope itemtype="http://schema.org/VideoObject">
                                        <c:set var="videopath" value=""/>
                                        <nt:video-flash>	
                                            <nt:conditional-include onposition="1">
                                                <c:set var="videopath">${videopath}<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
                                            </nt:conditional-include>
                                            <nt:conditional-exclude onposition="1">
                                                <c:set var="videopath">${videopath};<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
                                            </nt:conditional-exclude>
                                            <nt:conditional-include onposition="last">
                                                <meta itemprop="name" content='<nt:video-title/>' />
                                                <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                                <meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
                                                <meta itemprop="contentURL" content="<nt:video-path/>" />
                                                <meta itemprop="keywords" content="<nt:video-tags/>" />	
                                                <meta itemprop="duration" content="<nt:video-duration/>" />
                                                <meta itemprop="bitrate" content="<nt:video-bitrate/>" />
                                                <cms:include page="TS_Common_VideoFlash.jsp">
                                                    <cms:param name="video">${videopath}</cms:param>
                                                    <cms:param name="width" value="100%"/>
                                                    <cms:param name="height" value="100%"/>
                                                </cms:include>
                                            </nt:conditional-include>							
                                        </nt:video-flash>  
                                    </div>            
                                </nt:conditional-include>
                                <h2><a href="<nt:link />" title="<nt:title value='section' />"><nt:title value='section' /></a></h2>
                            </div>
                            <nt:conditional-include oncondition="${news.subtitle != '' && news.hideCopete == 'false'}">
                                <div itemprop='description alternativeHeadline'>		
                                    <h4><nt:sub-title/><a class="blue bold" href='<nt:link />' alt="Leer Más" title="Leer Más" >| LEER MÁS</a></h4>
                                </div>
                            </nt:conditional-include>

                        </article><!-- Nota Importante -->	
                        
                        <!-- Twitter -->
		        <div class="twitter">
			<a class="twitter-timeline" href="https://twitter.com/teleSURtv" data-widget-id="637279365852733440">Tweets por el @teleSURtv.</a>
				<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
			        </div>
		        <!-- Twitter -->
                        	
                     <!--   <div class="twitter">
                            <a class="twitter-timeline"  href="https://twitter.com/teleSURtv" data-widget-id="609733914714873856">Tweets por el @teleSURtv.</a>
                            <script>!function (d, s, id) {
                                    var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
                                    if (!d.getElementById(id)) {
                                        js = d.createElement(s);
                                        js.id = id;
                                        js.src = p + "://platform.twitter.com/widgets.js";
                                        fjs.parentNode.insertBefore(js, fjs);
                                    }
                                }(document, "script", "twitter-wjs");</script>
                        </div><!-- Twitter --> 
                        <div class="wpArticles">
                    </c:if>
                    
                    
                    
                    <c:if test="${i>1 && i<5 }">
                       <article> 
                            <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
                                <div itemscope itemtype="http://schema.org/ImageObject">	
                                    <a href="<nt:link/>" title="<nt:title value='section' />" class="her">
                                        <nt:preview-image>
                                            <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                            <nt:conditional-include oncondition="${imageDescription != ''}">
                                                <meta itemprop="description" content='<nt:image-description/>'>	
                                                <img itemprop="contentURL" src="<nt:image-path width='311' height='174'  scaletype='2'/>" alt="<nt:image-description/>" title="<nt:image-description/>" width="311" height="174" />
                                            </nt:conditional-include>
                                            <nt:conditional-include oncondition="${imageDescription == ''}">
                                                <meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
                                                <img itemprop="contentURL" src="<nt:image-path width='311' height='174'  scaletype='2'/>" alt="${fn:escapeXml(news.titles["section"])}" title="${fn:escapeXml(news.titles["section"])}" width="311" height="174%" />
                                            </nt:conditional-include>
                                        </nt:preview-image>
                                    </a>
                                </div>
                            </nt:conditional-include>

                            <nt:conditional-include oncondition="${news.homePreview == 'videoYouTube'}">
                                <div  itemscope itemtype="http://schema.org/VideoObject">
                                    <c:set var="y" value="0" />	
                                    <nt:video-youtube>
                                        <c:set var="y" value="${y+1}" />
                                        <c:set var="videoHomeY"><nt:generic-news-value element='videoFlash[${y}]/mostrarEnHome'/></c:set>	
                                        <nt:conditional-include oncondition="${videoHomeY == 'true'}">
                                            <meta itemprop="name" content='<nt:video-title/>' />
                                            <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                            <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                            <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                            <iframe height="174" width="100%" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen></iframe>
                                        </nt:conditional-include>	
                                    </nt:video-youtube>
                                </div>
                            </nt:conditional-include>

                            <nt:conditional-include oncondition="${news.homePreview == 'iframe'}">
                                <div>
                                    <nt:iframe/>
                                </div>
                            </nt:conditional-include>

                            <nt:conditional-include oncondition="${news.homePreview == 'videoEmbedded'}">
                                <div  itemscope itemtype="http://schema.org/VideoObject">
                                    <nt:video-embedded>
                                        <nt:conditional-include onposition="1">
                                            <meta itemprop="name" content='<nt:video-title/>' />	
                                            <nt:video-code /> 
                                        </nt:conditional-include>         
                                    </nt:video-embedded>
                                </div>
                            </nt:conditional-include>

                            <nt:conditional-include oncondition="${news.homePreview == 'videoFlash'}">
                                <div itemscope itemtype="http://schema.org/VideoObject">
                                    <c:set var="videopath" value=""/>
                                    <nt:video-flash>	
                                        <nt:conditional-include onposition="1">
                                            <c:set var="videopath">${videopath}<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
                                        </nt:conditional-include>
                                        <nt:conditional-exclude onposition="1">
                                            <c:set var="videopath">${videopath};<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
                                        </nt:conditional-exclude>
                                        <nt:conditional-include onposition="last">
                                            <meta itemprop="name" content='<nt:video-title/>' />
                                            <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                            <meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
                                            <meta itemprop="contentURL" content="<nt:video-path/>" />
                                            <meta itemprop="keywords" content="<nt:video-tags/>" />	
                                            <meta itemprop="duration" content="<nt:video-duration/>" />
                                            <meta itemprop="bitrate" content="<nt:video-bitrate/>" />
                                            <cms:include page="TS_Common_VideoFlash.jsp">
                                                <cms:param name="video">${videopath}</cms:param>
                                                <cms:param name="width" value="100%"/>
                                                <cms:param name="height" value="100%"/>
                                            </cms:include>
                                        </nt:conditional-include>							
                                    </nt:video-flash>  
                                </div>            
                            </nt:conditional-include>
                            <h2><a href="<nt:link />" title="<nt:title value='section' />"><nt:title value='section' /></a></h2>
                        </article>
                        
                    </c:if>
                    
                    
                    <c:if test="${i==5 }">
                        </div><!-- Notas secundarias -->
                        
                        <div class="listNotas abierto">
                    </c:if>
                    
                    
                    <c:if test="${i>=5 && i<=13 }">
                        <article>
                            <div class="wpSmallImg">        	
                                <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
                                    <div class="img-destnew npc" itemscope itemtype="http://schema.org/ImageObject">	
                                        <a href="<nt:link/>" title="<nt:title value='section' />" class="her">
                                            <nt:preview-image>
                                                <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                                <nt:conditional-include oncondition="${imageDescription != ''}">
                                                    <meta itemprop="description" content='<nt:image-description/>'>	
                                                    <img itemprop="contentURL" src="<nt:image-path width='146' height='82'  scaletype='2'/>" alt="<nt:image-description/>" title="<nt:image-description/>" width="146" height="82" />
                                                </nt:conditional-include>
                                                <nt:conditional-include oncondition="${imageDescription == ''}">
                                                    <meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
                                                    <img itemprop="contentURL" src="<nt:image-path width='146' height='82'  scaletype='2'/>" alt="${fn:escapeXml(news.titles["section"])}" title="${fn:escapeXml(news.titles["section"])}" width="146" height="82" />
                                                </nt:conditional-include>
                                            </nt:preview-image>
                                        </a>
                                    </div>
                                </nt:conditional-include>

                                <nt:conditional-include oncondition="${news.homePreview == 'videoYouTube'}">
                                    <div class="img-destnew npc" itemscope itemtype="http://schema.org/VideoObject">
                                        <c:set var="y" value="0" />	
                                        <nt:video-youtube>
                                            <c:set var="y" value="${y+1}" />
                                            <c:set var="videoHomeY"><nt:generic-news-value element='videoFlash[${y}]/mostrarEnHome'/></c:set>	
                                            <nt:conditional-include oncondition="${videoHomeY == 'true'}">
                                                <meta itemprop="name" content='<nt:video-title/>' />
                                                <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                                <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                                <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                                <iframe width="100%" height="82" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen></iframe>
                                            </nt:conditional-include>	
                                        </nt:video-youtube>
                                    </div>
                                </nt:conditional-include>

                                <nt:conditional-include oncondition="${news.homePreview == 'iframe'}">
                                    <div class="img-destnew npc">
                                        <nt:iframe/>
                                    </div>
                                </nt:conditional-include>

                                <nt:conditional-include oncondition="${news.homePreview == 'videoEmbedded'}">
                                    <div class="img-destnew npc" itemscope itemtype="http://schema.org/VideoObject">
                                        <nt:video-embedded>
                                            <nt:conditional-include onposition="1">
                                                <meta itemprop="name" content='<nt:video-title/>' />	
                                                <nt:video-code /> 
                                            </nt:conditional-include>         
                                        </nt:video-embedded>
                                    </div>
                                </nt:conditional-include>

                                <nt:conditional-include oncondition="${news.homePreview == 'videoFlash'}">
                                    <div class="img-destnew npc" itemscope itemtype="http://schema.org/VideoObject">
                                        <c:set var="videopath" value=""/>
                                        <nt:video-flash>	
                                            <nt:conditional-include onposition="1">
                                                <c:set var="videopath">${videopath}<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
                                            </nt:conditional-include>
                                            <nt:conditional-exclude onposition="1">
                                                <c:set var="videopath">${videopath};<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
                                            </nt:conditional-exclude>
                                            <nt:conditional-include onposition="last">
                                                <meta itemprop="name" content='<nt:video-title/>' />
                                                <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                                <meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
                                                <meta itemprop="contentURL" content="<nt:video-path/>" />
                                                <meta itemprop="keywords" content="<nt:video-tags/>" />	
                                                <meta itemprop="duration" content="<nt:video-duration/>" />
                                                <meta itemprop="bitrate" content="<nt:video-bitrate/>" />
                                                <cms:include page="TS_Common_VideoFlash.jsp">
                                                    <cms:param name="video">${videopath}</cms:param>
                                                    <cms:param name="width" value="100%"/>
                                                    <cms:param name="height" value="100%"/>
                                                </cms:include>
                                            </nt:conditional-include>							
                                        </nt:video-flash>  
                                    </div>            
                                </nt:conditional-include>
                            </div>
                            <div class="overflow">
                                <h4><a href="<nt:link />" title="<nt:title value='section' />"><nt:title value='section' /></a></h4>
                            </div>
                        </article>

                    </c:if>
                    <c:if test="${i==13 }">
                        </div>
                    </c:if>
                </nt:news-list>

            </div>
            </section>