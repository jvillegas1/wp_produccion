<%@ include file="TS_Common_Libraries.jsp" %>
<% 
String newsPath = request.getParameter( "path" ); 
%> 
<nt:news path="<%=newsPath%>">
    <nt:conditional-include oncondition="${news.imagescount > 0}">

        <h2 class="tit-photo"> Pictures</h2>
        <itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">                          

        <amp-carousel width="400" height="300" layout="responsive" type="slides" autoplay delay="2000">
            <nt:image-gallery>
                <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>          
                <c:set var="imageSource" scope="page"><nt:image-source/></c:set>    
                <nt:conditional-include oncondition="${(imageDescription != '') && (imageSource != '')}">            
                <amp-img src="<nt:image-path/>" width="400" height="300" layout="responsive"></amp-img>       
                </nt:conditional-include>
                <nt:conditional-include oncondition="${(imageDescription != '') && (imageSource == '')}">                   
                <amp-img src="<nt:image-path/>" width="400" height="300" layout="responsive"></amp-img>    
                </nt:conditional-include>
                <nt:conditional-include oncondition="${(imageDescription == '') && (imageSource != '')}">
                <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                <amp-img src="<nt:image-path width='400' height='300'  scaletype='2'/>" width="400" height="300" layout="responsive"></amp-img>    
                </nt:conditional-include>
                <nt:conditional-include oncondition="${(imageDescription == '') && (imageSource == '')}">
                <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                <amp-img src="<nt:image-path/>" width="400" height="300" layout="responsive"></amp-img>    
                </nt:conditional-include>
            </nt:image-gallery>                                                 
        </amp-carousel>
    </nt:conditional-include>
</nt:news>