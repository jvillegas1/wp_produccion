<%@ include file="TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE_EN"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";
%>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script defer src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery.hc-sticky.min.js</cms:link>"></script>

	<div class="banners top1">
			<cms:include page="../elements/TS_Common_Banners.jsp">
				<cms:param name="template">Home</cms:param>
				<cms:param name="key">Advert-728x90-home</cms:param>
			</cms:include>          
	</div>		

  	<div id="destacados">
    	<!-- Aside-->
    	<aside class="v1">
      	<div class="bnrs-side">
	<cms:include page="TS_Common_Banners.jsp">
		<cms:param name="template">Home</cms:param>
		<cms:param name="key">Advert-160x600</cms:param>
	</cms:include>


	 <%--<cms:include page="TS_Common_Banners.jsp">
		<cms:param name="template">Home</cms:param>
		<cms:param name="key">Advert-183x374-b</cms:param>
	</cms:include>--%>
        </div><!-- Banners laterales -->
      </aside>
      <!-- Aside -->
 
      <!-- Overlfow -->
      <div class="content v1">
      	<!-- Nota Importante -->
       <nt:news-list order="priority desc,user-modification-date" zone="destacada" onmainpage="home" size="1" publication="9" searchindex="<%=index%>">	
            <meta itemprop="sameAs url" content="<nt:link/>"/>
      	<article class="important">
        	<div class="wpImg">
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
 
            <h2> <a href="<nt:link/>" title="<nt:title value='home' />"> <nt:title value='home' /> </a></h2>
          </div>
           <h4><nt:sub-title maxlength="153" /> | <a href="<nt:link/>">FULL STORY</a></h4>
                   
        </article>
        </nt:news-list>
      	<!-- Nota Importante -->
        
        <!-- Twitter -->
        <div class="twitter">
        <a class="twitter-timeline" href="https://twitter.com/telesurenglish" data-widget-id="637292432862937088">Tweets by @telesurenglish</a>
	<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
	</div>
        <!-- Twitter -->
        
        <!-- Notas secundarias -->
	  <cms:include page="TS_Home_Destacadas_Secundarias_Portada1.jsp" /> 
        <!-- Notas secundarias -->
        
        
         <h6><a href="#" class="plus less"></a></h6> 
        
        <!-- inicio Notas de un tema -->        
       <cms:include page="TS_Home_Destacadas_Mixta_Portada1.jsp" /> 
       <!-- fin Notas de un tema -->
        
      </div>
      <!-- Overlfow -->
      
    </div>
    
<script>
$(document).ready(function(e) {
    // mostrar mas
	$('#destacados h6 a').click(function(e) {
		e.preventDefault();
        if($(this).hasClass('less')){
			$('.listNotas').removeClass('abierto');	
			$(this).removeClass('less')
		}else{
			$('.listNotas').addClass('abierto');		
			$(this).addClass('less')			
		}
    });
    (function($) {
	// barra fija
	$('aside.v1').hcSticky({
	});
	})(jQuery);
});
</script>    