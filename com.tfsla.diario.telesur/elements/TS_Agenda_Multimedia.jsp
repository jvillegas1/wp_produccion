<%-- 
    Document   : newjsp
    Created on : 10/11/2014, 11:02:02 AM
    Author     : ysanchez
--%>

<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news>
    <% String width = "600" ;
    String height = "340" ;
    int contadorFoto = 0;
    int contadorVideo = 0;
    %>
    <nt:conditional-include oncondition="${news.sectionname == 'imreporter'}">
    <%  
    width = "540" ; 
    height = "304" ; 
    %>
    </nt:conditional-include>
    <ul class="idTabs"> 
        <nt:conditional-include oncondition="${news.detailPreview == 'imagen'}">
            <nt:conditional-include oncondition="${news.imagescount > 1 || (news.imagescount == 1 && news.videoscount > 0)}">
                <li class="fotos"><a href="#fotos" alt="Fotos" title="Fotos" onclick="StopVideos();">FOTOS</a></li>
            </nt:conditional-include>
            <nt:conditional-include oncondition="${news.videoscount > 1 || (news.videoscount > 0 && news.imagescount > 0)}">
                <li class="videos"><a href="#videos" alt="Videos" title="Videos">VIDEOS</a></li> 
            </nt:conditional-include>
        </nt:conditional-include>
        <nt:conditional-include oncondition="${news.detailPreview != 'imagen'}">
            <nt:conditional-include oncondition="${news.videoscount > 1 || (news.videoscount == 1 && news.imagescount > 0)}">
                <li class="videos"><a href="#videos" alt="Videos" title="Videos">VIDEOS</a></li>
            </nt:conditional-include>
            <nt:conditional-include oncondition="${news.imagescount > 1 || (news.imagescount > 0 && news.videoscount > 0)}">
                <li class="fotos"><a href="#fotos" alt="Fotos" title="Fotos" onclick="StopVideos();">FOTOS</a></li>
            </nt:conditional-include>
        </nt:conditional-include>                
    </ul> 
    <nt:conditional-include oncondition="${news.detailPreview == 'imagen'}">
        <nt:conditional-include oncondition="${news.imagescount > 0}">
            <div id="fotos">
                <ul class="slides">
                    <nt:image-gallery>
                        <li>
                            <div class="wpImgNA">
                                <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">                      
                                    <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>           
                                    <nt:conditional-include oncondition="${imageDescription != ''}">                    
                                        <img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' width="<%=width %>" height="<%=height %>" />
                                       
                                    </nt:conditional-include>
                                    <nt:conditional-include oncondition="${imageDescription == ''}">
                                        <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                                        <img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}' width="<%=width %>" height="<%=height %>" />
                                    </nt:conditional-include>
                                </div>  
                            </div>
                            <div class="wpDataNA">
                                <span class="breadcrumb">
                                    <strong>
                                        <span class="itacaput" itemprop="articleSection">   
                                            <a href="/seccion/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>     <nt:categories>
                                                <nt:conditional-include onposition="first">
                                                    <c:set var="id"><nt:category-name/></c:set>
                                                    <%  
                                                    String id =  pageContext.getAttribute("id").toString();
                                                    id = id.replaceAll("/system/categories","");
                                                    %>  
                                                    <a href="<%=id%>" class="her" alt="<nt:category-description/>" title="<nt:category-description/>"> > <nt:category-description/></a>     
                                                </nt:conditional-include>
                                            </nt:categories>                                
                                        </span>
                                    </strong>
                                </span>
                                <span class="date">
                                    <nt:conditional-include oncondition="${news.hideTime == 'false'}">
                                        <div class="capdate" itemprop="datePublished">
                                            <fmt:setLocale value="es_ES"/>
                                            <fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" />
                                            </div>
                                    </nt:conditional-include>
                                </span>
                                <h2><nt:image-description/></h2>
                                <%  contadorFoto++; %>
                                <small>Foto: <%=contadorFoto%>/${news.imagescount} <nt:image-source /></small>
                              <%--  <cms:include page="TS_Common_AddThis.jsp" >
					<cms:param name="link"><nt:link/></cms:param> 
					<cms:param name="titulo"><nt:title value="section"/></cms:param>       
				 </cms:include> --%>
                            </div>    
                        </li>
                    </nt:image-gallery>
                </ul>
            </div>
        </nt:conditional-include> 
        <nt:conditional-include oncondition="${news.videoscount > 0}">
           <div id="videos">
                 <ul class="slides">
                            <c:set var="videopath" value="" />                                                                      
                            <nt:video-flash>
                                <li> 
                                    <div class="wpImgNA">
                                        <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                        <c:set var="videopath"><nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
                                        <meta itemprop="name" content='<nt:video-title/>' />
                                        <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                        <meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
                                        <meta itemprop="contentURL" content="<nt:video-path/>" />
                                        <meta itemprop="keywords" content="<nt:video-tags/>" /> 
                                        <meta itemprop="duration" content="<nt:video-duration/>" />
                                        <meta itemprop="bitrate" content="<nt:video-bitrate/>" />                       
                                        <cms:include page="TS_Common_VideoFlash.jsp">
                                            <cms:param name="video">${videopath}</cms:param>
                                            <cms:param name="imagen"><nt:video-thumbnail/></cms:param>
                                            <cms:param name="titulo"><nt:video-title/></cms:param>
                                            <cms:param name="width" value="100%"/>
                                            <cms:param name="height" value="<%=height %>"/>
                                        </cms:include>
                                        </div>
                                    </div>
                                </li>
                            </nt:video-flash>
                     
                        
                            <nt:video-youtube>
                                <li>
                                    <div class="wpImgNA">
                                         <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                        <meta itemprop="name" content='<nt:video-title/>' />
                                        <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                        <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                        <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                        <iframe id="player<%=contadorVideo%>" class="iframeYT" width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>?enablejsapi=1&version=3&playerapiid=player<%=contadorVideo%>" frameborder="0" allowfullscreen> </iframe>
                                         <% contadorVideo++; %>
                                         </div>
                                    </div>
                                </li>
                            </nt:video-youtube>
                      
                    
                            <nt:video-embedded>
                                <li>
                                    <div class="wpImgNA">
                                    <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                        <meta itemprop="name" content='<nt:video-title/>' />
                                        <nt:video-code />      
                                    </div>
                                    </div>
                                </li>
                            </nt:video-embedded>        
                </ul>
            </div>
        </nt:conditional-include> 
    </nt:conditional-include>
    <nt:conditional-include oncondition="${news.detailPreview != 'imagen'}">
        <nt:conditional-include oncondition="${news.videoscount > 0}">
            <div id="videos">
                     <ul class="slides">
                        
                            <nt:conditional-include oncondition="${news.detailPreview == 'videoFlash'}">
                                <c:set var="videopath" value="" />                                                                      
                                <nt:video-flash>
                                    <li>
                                        <div class="wpImgNA">
                                            <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                                <c:set var="videopath"><nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
                                                <meta itemprop="name" content='<nt:video-title/>' />
                                                <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                                <meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
                                                <meta itemprop="contentURL" content="<nt:video-path/>" />                           
                                                <meta itemprop="keywords" content="<nt:video-tags/>" /> 
                                                <meta itemprop="duration" content="<nt:video-duration/>" />
                                                <meta itemprop="bitrate" content="<nt:video-bitrate/>" />
                                                <cms:include page="TS_Common_VideoFlash.jsp">
                                                    <cms:param name="video">${videopath}</cms:param>
                                                    <cms:param name="imagen"><nt:video-thumbnail/></cms:param>
                                                    <cms:param name="titulo"><nt:video-title/></cms:param>
                                                    <cms:param name="width" value="100%"/>
                                                    <cms:param name="height" value="<%=height %>"/>
                                                </cms:include>
                                            </div>
                                        </div> 
                                   </li>
                                </nt:video-flash>

                                <nt:video-youtube>
                                   <li>
                                       <div class="wpImgNA">
                                            <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                                <meta itemprop="name" content='<nt:video-title/>' />
                                                <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                                <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                                <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                                    <iframe id="player<%=contadorVideo%>" class="iframeYT" width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>?enablejsapi=1&version=3&playerapiid=player<%=contadorVideo%>" frameborder="0" allowfullscreen> </iframe>
                                                    <% contadorVideo++; %>
                                            </div>
                                        </div>
                                    </li>
                                </nt:video-youtube>
                        
                                <nt:video-embedded>
                                    <li>
                                        <div class="wpImgNA">
                                            <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                                <meta itemprop="name" content='<nt:video-title/>' />
                                                <nt:video-code />       
                                            </div>
                                        </div>
                                    </li>
                                </nt:video-embedded>
                            </nt:conditional-include>
                            <nt:conditional-include oncondition="${news.detailPreview == 'videoYouTube'}">                                                                            
                                <nt:video-youtube>
                                    <li>
                                        <div class="wpImgNA">
                                            <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                                <meta itemprop="name" content='<nt:video-title/>' />
                                                <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                                <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                                <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                                    <iframe id="player<%=contadorVideo%>" class="iframeYT" width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>?enablejsapi=1&version=3&playerapiid=player<%=contadorVideo%>" frameborder="0" allowfullscreen> </iframe>
                                                    <% contadorVideo++; %>
                                            </div>
                                        </div>
                                    </li>
                                </nt:video-youtube>
                          
                                <c:set var="videopath" value="" />                                                                      
                               <nt:video-flash>
                                    <li> 
                                        <div class="wpImgNA">
                                            <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                                 <c:set var="videopath"><nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
                                                 <meta itemprop="name" content='<nt:video-title/>' />
                                                 <meta itemprop="publ
                                                 isher" content="<nt:video-publisher/>" />
                                                 <meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
                                                 <meta itemprop="contentURL" content="<nt:video-path/>" />
                                                 <meta itemprop="keywords" content="<nt:video-tags/>" /> 
                                                 <meta itemprop="duration" content="<nt:video-duration/>" />
                                                 <meta itemprop="bitrate" content="<nt:video-bitrate/>" />                           
                                                 <cms:include page="TS_Common_VideoFlash.jsp">
                                                     <cms:param name="video">${videopath}</cms:param>
                                                     <cms:param name="imagen"><nt:video-thumbnail/></cms:param>
                                                     <cms:param name="titulo"><nt:video-title/></cms:param>
                                                     <cms:param name="width" value="100%"/>
                                                     <cms:param name="height" value="<%=height %>"/>
                                                 </cms:include>
                                             </div>
                                        </div>
                                    </li>
                                </nt:video-flash>
                        
                                <nt:video-embedded>
                                    <li>
                                        <div class="wpImgNA">
                                            <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                                <meta itemprop="name" content='<nt:video-title/>' />
                                                <nt:video-code />         
                                            </div>
                                        </div>
                                    </li>
                                </nt:video-embedded>        
                            </nt:conditional-include>
                            <nt:conditional-include oncondition="${news.detailPreview == 'videoEmbedded'}">                                                 
                                <nt:video-embedded>
                                    <li>
                                        <div class="wpImgNA">
                                            <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                            <meta itemprop="name" content="<nt:video-title/>" />
                                            <nt:video-code />        
                                            </div>
                                        </div>
                                    </li>
                                </nt:video-embedded>   

                                <c:set var="videopath" value="" />                                                                      
                                <nt:video-flash>
                                    <li>
                                        <div class="wpImgNA">
                                            <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                                <c:set var="videopath"><nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
                                                <meta itemprop="name" content='<nt:video-title/>' />
                                                <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                                <meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
                                                <meta itemprop="contentURL" content="<nt:video-path/>" />
                                                <meta itemprop="keywords" content="<nt:video-tags/>" />     
                                                <meta itemprop="duration" content="<nt:video-duration/>" />
                                                <meta itemprop="bitrate" content="<nt:video-bitrate/>" />                       
                                                <cms:include page="TS_Common_VideoFlash.jsp">
                                                    <cms:param name="video">${videopath}</cms:param>
                                                    <cms:param name="imagen"><nt:video-thumbnail/></cms:param>
                                                    <cms:param name="titulo"><nt:video-title/></cms:param>
                                                    <cms:param name="width" value="100%"/>
                                                    <cms:param name="height" value="<%=height %>"/>
                                                </cms:include>
                                            </div>
                                        </div>
                                    </li>
                                </nt:video-flash>
                                <nt:video-youtube>
                                    <li>
                                        <div class="wpImgNA">
                                            <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                            <meta itemprop="name" content='<nt:video-title/>' />
                                            <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                            <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                            <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                                <iframe id="player<%=contadorVideo%>" class="iframeYT" width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>?enablejsapi=1&version=3&playerapiid=player<%=contadorVideo%>" frameborder="0" allowfullscreen> </iframe>
                                                <% contadorVideo++; %>
                                            </div>
                                        </div>
                                    </li>
                                </nt:video-youtube>
                            </nt:conditional-include>   
                </ul>
            </div>
        </nt:conditional-include>
        <nt:conditional-include oncondition="${news.imagescount > 0}">
            <div id="fotos">
                <ul class="slides">
                    <nt:image-gallery>
                        <li>
                            <div class="wpImgNA">
                                <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">   
                                    <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>            
                                    <nt:conditional-include oncondition="${imageDescription != ''}">                    
                                        <img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' width="<%=width %>" height="<%=height %>" />
                                            <div class="caption" content='<nt:image-description/>'>
                                                
                                            </div>
                                    </nt:conditional-include>
                                    <nt:conditional-include oncondition="${imageDescription == ''}">
                                        <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                                            <img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}' width="<%=width %>" height="<%=height %>" />
                                    </nt:conditional-include>
                                </div>
                            </div>
                            <div class="wpDataNA">
                                <span class="breadcrumb">
                                    <strong>
                                        <span class="itacaput" itemprop="articleSection">   
                                            <a href="/seccion/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>     <nt:categories>
                                                <nt:conditional-include onposition="first">
                                                    <c:set var="id"><nt:category-name/></c:set>
                                                    <%  
                                                    String id =  pageContext.getAttribute("id").toString();
                                                    id = id.replaceAll("/system/categories","");
                                                    %>  
                                                    <a href="<%=id%>" class="her" alt="<nt:category-description/>" title="<nt:category-description/>"> > <nt:category-description/></a>     
                                                </nt:conditional-include>
                                            </nt:categories>                                
                                        </span>
                                    </strong>
                                </span>
                                <span class="date">
                                    <nt:conditional-include oncondition="${news.hideTime == 'false'}">
                                        <div class="capdate" itemprop="datePublished">
                                            <fmt:setLocale value="es_ES"/>
                                            <fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" />
                                            </div>
                                    </nt:conditional-include>
                                </span>
                                <h2><nt:image-description/></h2>
                                <%  contadorFoto++; %>
                                <small>Photo: <%=contadorFoto%>/${news.imagescount} <nt:image-source /></small>
                               <%-- <cms:include page="TS_Common_AddThis.jsp" >
					<cms:param name="link"><nt:link/></cms:param> 
					<cms:param name="titulo"><nt:title value="section"/></cms:param>       
				 </cms:include> ---%>
                            </div> 
                        </li>
                    </nt:image-gallery>
                </ul>
            </div>
        </nt:conditional-include>
    </nt:conditional-include>
    <nt:conditional-include oncondition="${news.imagescount == 0 && news.videoscount == 0}">
        <div id="fotos">
            <ul class="slides">
                <li>
                    <div class="wpImgNA">
                        <nt:preview-image>
                            <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">             
                                <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                <nt:conditional-include oncondition="${imageDescription != ''}">    
                                    <img itemprop="contentURL" src="<nt:image-path width="<%=width %>" height="<%=height %>" scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>'>
                                    <div class="caption" content='<nt:image-description/>'>
                                      
                                    </div>
                                </nt:conditional-include>
                                <nt:conditional-include oncondition="${imageDescription == ''}">
                                    <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                                        <img itemprop="contentURL" src="<nt:image-path width="<%=width %>" height="<%=height %>" scaletype='2'/>" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}'>
                                </nt:conditional-include>   
                            </div>
                    </div>
                    <div class="wpDataNA">
                        <span class="breadcrumb">
                            <strong>
                                <span class="itacaput" itemprop="articleSection">   
                                    <a href="/seccion/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>     <nt:categories>
                                        <nt:conditional-include onposition="first">
                                            <c:set var="id"><nt:category-name/></c:set>
                                            <%  
                                            String id =  pageContext.getAttribute("id").toString();
                                            id = id.replaceAll("/system/categories","");
                                            %>  
                                            <a href="<%=id%>" class="her" alt="<nt:category-description/>" title="<nt:category-description/>"> > <nt:category-description/></a>     
                                        </nt:conditional-include>
                                    </nt:categories>                                
                                </span>
                            </strong>
                        </span>
                        <span class="date">
                            <nt:conditional-include oncondition="${news.hideTime == 'false'}">
                                <div class="capdate" itemprop="datePublished">
                                    <fmt:setLocale value="es_ES"/>
                                    <fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" />
                                    </div>
                            </nt:conditional-include>
                        </span>
                        <h2><nt:image-description/></h2>
                       <%-- <cms:include page="TS_Common_AddThis.jsp" >
                            <cms:param name="link"><nt:link/></cms:param> 
                            <cms:param name="titulo"><nt:title value="section"/></cms:param>       
                        </cms:include> --%>
                    </div>
                    </nt:preview-image>   
                </li>
            </ul>
        </div>
    </nt:conditional-include>
</nt:news>

<script type="text/javascript">
	$(window).load(function(){
		//error
		$('.prev, .next').removeAttr('style');  
	});
	
	function StopVideos(){
		var YTid;
		$(".iframeYT").each(function() {
			YTid = $(this).attr("id");
			$('#'+YTid)[0].contentWindow.postMessage('{"event":"command","func":"' + 'stopVideo' + '","args":""}', '*');
			//YTid.stopVideo();
		});
		<%--jwplayer().stop();--%>
	}
	
	$(document).ready( function() {
		$("body").on( "click", ".flex-next,.flex-prev", function() {
			StopVideos();
		});
	});
</script>