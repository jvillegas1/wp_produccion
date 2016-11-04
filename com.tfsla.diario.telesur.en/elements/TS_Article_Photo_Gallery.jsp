<%@ include file="TS_Common_Libraries.jsp" %>
<nt:news>
        <% String width = "789" ;
        String height = "440" ;
        %>
    <nt:conditional-include oncondition="${news.sectionname == 'imreporter'}">
        <%  
        width = "540" ; 
        height = "304" ; 
        %>
    </nt:conditional-include>
    <nt:conditional-include oncondition="${news.detailPreview == 'imagen'}">
        <nt:conditional-include oncondition="${news.imagescount > 0}">
            <nt:image-gallery>
                <div class="wpGaleria">
                    <div class="contImgGal">
                        <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">                      
                            <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>           
                            <nt:conditional-include oncondition="${imageDescription != ''}">                    
                                <img itemprop="" src="<nt:image-path />" alt='<nt:image-description/>' title='<nt:image-description/>' " />
                            </nt:conditional-include>
                            <nt:conditional-include oncondition="${imageDescription == ''}">
                                <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                                <img itemprop="contentURL" src="<nt:image-path />" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}' " />
                            </nt:conditional-include>
                        </div>  
                    </div>   
                    <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">                      
	                    <c:set var="imageSource" scope="page"><nt:image-source /></c:set>           
	                    <nt:conditional-include oncondition="${imageSource != ''}">    
	                    <div class="infoGal overflow">
	                        <nt:image-description/>
	                        <span>Photo:<nt:image-source /></span>
	                    </div>
	                    </nt:conditional-include>
	                    <nt:conditional-include oncondition="${imageSource == ''}">    
	                    <div class="infoGal overflow">
	                        <nt:image-description/>
	                        <span><nt:image-source /></span>
	                    </div>
	                    </nt:conditional-include>
		    </div>
                </div>
            </nt:image-gallery>
        </nt:conditional-include>
    </nt:conditional-include>
    <nt:conditional-include oncondition="${news.imagescount == 0 && news.videoscount == 0}">
        <div class="wpGaleria">
            <nt:preview-image>
                <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">             
                    <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                    <nt:conditional-include oncondition="${imageDescription != ''}">    
                        <img itemprop="contentURL" src="<nt:image-path /> " alt='<nt:image-description/>' title='<nt:image-description/>'>
                        </div>
                    </nt:conditional-include>
                    <nt:conditional-include oncondition="${imageDescription == ''}">
                        <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                        <img itemprop="contentURL" src="<nt:image-path />" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}'>
                    </nt:conditional-include>   
                </div>
            </nt:preview-image> 
        </div>
       </div>
    </nt:conditional-include>
</nt:news>
    <script type="text/javascript">
    $(window).load(function(){
    //error
    $('.prev, .next').removeAttr('style');  
    })
</script>