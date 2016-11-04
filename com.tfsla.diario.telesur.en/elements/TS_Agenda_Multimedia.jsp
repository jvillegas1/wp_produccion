<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news>
    <% String width = "600" ;
    String height = "340" ;
    int contadorFoto = 0;
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
                <li class="fotos"><a href="#fotos" alt="Fotos" title="Fotos">PHOTOS</a></li>
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
                <li class="fotos"><a href="#fotos" alt="Fotos" title="Fotos">PHOTOS</a></li>
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
                                            <a href="/english/section/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>     <nt:categories>
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
                                            <fmt:setLocale value="en_US"/>
                                            <fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" />
                                            </div>
                                    </nt:conditional-include>
                                </span>
                                <h2><nt:image-description/></h2>
                                <%  contadorFoto++; %>                                
                                <small>Foto: <%=contadorFoto%>/${news.imagescount} <nt:image-source /></small>
				 <br>
                                 <br>
                                 <br>
                                
                            </div>    
                        
                    </nt:image-gallery>
                     </li>
                </ul>
            </div>
        </nt:conditional-include> 
        
        
        <nt:conditional-include oncondition="${news.videoscount > 0}">
           <div id="videos">
                 <ul class="slides">                          
                            <div class="wpImgNA">
                            <c:set var="videopath" value="" />                                                                      
                            <nt:video-flash>
                                <li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
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
                                </li>
                            </nt:video-flash>                  
                            <nt:video-youtube>
                                <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                    <meta itemprop="name" content='<nt:video-title/>' />
                                    <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                    <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                    <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                        <iframe width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen> </iframe>
                                </div>                                
                            </nt:video-youtube>                            
                             <nt:video-embedded>
                                <li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                    <meta itemprop="name" content='<nt:video-title/>' />
                                    <nt:video-code />      
                                </li>
                            </nt:video-embedded>               
                            
                        </div>
                                   
                    <div class="wpDataNA">
                            <span class="breadcrumb">
                                <strong>
                                    <span class="itacaput" itemprop="articleSection">   
                                        <a href="/english/section/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>                 <nt:categories>
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
                                        <fmt:setLocale value="en_US"/>
                                        <fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" />
                                    </div>
                                </nt:conditional-include>
                            </span>
                        </div>           
                    
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
                                
                                </nt:video-flash>
                       
                 

                                <nt:video-youtube>                              
                                
                                    <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                        <meta itemprop="name" content='<nt:video-title/>' />
                                        <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                        <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                        <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                            <iframe width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen> </iframe>
                                    </div>
                                </nt:video-youtube>
                        
               

                                <nt:video-embedded>
                                
                                 <div class="wpImgNA">
                                    <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                        <meta itemprop="name" content='<nt:video-title/>' />
                                        <nt:video-code />       
                                    </div>
                                    </div>
                                </nt:video-embedded>
                              </div>
                            </nt:conditional-include>
                            
                            
                            <nt:conditional-include oncondition="${news.detailPreview == 'videoYouTube'}">
                                                                             
                                <nt:video-youtube>
                                    <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                        <meta itemprop="name" content='<nt:video-title/>' />
                                        <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                        <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                        <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                            <iframe width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen> </iframe>
                                    </div>
                                </nt:video-youtube>
                          
                                <c:set var="videopath" value="" />                                                                      
                                <nt:video-flash>
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
                                </nt:video-flash>
                        
                                <nt:video-embedded>
                                    <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                        <meta itemprop="name" content='<nt:video-title/>' />
                                        <nt:video-code />         
                                    </div>
                                </nt:video-embedded>        
                            </nt:conditional-include>
                            <nt:conditional-include oncondition="${news.detailPreview == 'videoEmbedded'}">                                                 
                                <nt:video-embedded>
                                <li>
                                <div class="wpImgNA" itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                <meta itemprop="name" content="<nt:video-title/>" />
                                <nt:video-code />        
                                </div>
                                </li>
                                </nt:video-embedded>  
                            
                              
                 
            

                                <c:set var="videopath" value="" />                                                                      
                                <nt:video-flash>
                                   
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
                                   
                                </nt:video-flash>
                                <nt:video-youtube>
                                  
                                    <div  itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                        <meta itemprop="name" content='<nt:video-title/>' />
                                        <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                        <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                        <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                            <iframe width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen> </iframe>
                                    </div>
                                    
                                </nt:video-youtube>
                            </nt:conditional-include>   
                      
                </ul>
            </div>
             <div class="wpDataNA">
                            <span class="breadcrumb">
                                <strong>
                                    <span class="itacaput" itemprop="articleSection">   
                                        <a href="/english/section/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>                 <nt:categories>
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
                                        <fmt:setLocale value="en_US"/>
                                        <fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" />
                                    </div>
                                </nt:conditional-include>
                            </span>
                        </div>
                   
                   
                </ul>
            </div>              
            <br>
            <br>
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
                                            <a href="/english/section/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>     <nt:categories>
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
                                            <fmt:setLocale value="en_US"/>
                                            <fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" />
                                            </div>
                                    </nt:conditional-include>
                                </span>
                                 
                                <h2><nt:image-description/></h2>
                                <%  contadorFoto++; %>
                                <small>Photo: <%=contadorFoto%>/${news.imagescount} <nt:image-source /></small>               
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
                                            <a href="/english/section/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>     <nt:categories>
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
                                            <fmt:setLocale value="en_US"/>
                                            <fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" />
                                            </div>
                                    </nt:conditional-include>
                                </span>
                                <h2><nt:image-description/></h2> 
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
    })
</script>