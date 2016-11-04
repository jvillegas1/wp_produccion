<%@ include file="TS_Common_Libraries.jsp" %>
<nt:news>


    <nt:conditional-include oncondition="${news.detailPreview == 'imagen'}">
        <nt:conditional-include oncondition="${news.imagescount > 0}">
            <nt:image-gallery>
                <div class="infografia">
                   <%-- <div class="contImgGal">--%>
                        <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">                      
                            <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>           
                            <nt:conditional-include oncondition="${imageDescription != ''}">                    
                                <img itemprop="" src="<nt:image-path  width='950' scaletype='2'/>" width='950' alt='<nt:image-description/>' title='<nt:image-description/>' " />
                            </nt:conditional-include>
                            <nt:conditional-include oncondition="${imageDescription == ''}">
                                <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                                <img itemprop="contentURL" src="<nt:image-path  width='950' scaletype='2' />"  width='950' alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}' " />
                            </nt:conditional-include>
                        </div>  
                    <%--</div>   --%>
                </div>
            </nt:image-gallery>
        </nt:conditional-include>
    </nt:conditional-include>
    <nt:conditional-include oncondition="${news.imagescount == 0}">
        <div class="infografia">
            <nt:preview-image>
                <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">             
                    <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                    <nt:conditional-include oncondition="${imageDescription != ''}">    
                        <img itemprop="contentURL" src="<nt:image-path/> " width='950' alt='<nt:image-description/>' title='<nt:image-description/>'>
                        <div class="caption" content='<nt:image-description/>'>
                        </div>
                    </nt:conditional-include>
                    <nt:conditional-include oncondition="${imageDescription == ''}">
                        <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                        <img itemprop="contentURL" src="<nt:image-path />"  width='950' alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}'>
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