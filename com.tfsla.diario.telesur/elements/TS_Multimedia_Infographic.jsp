<%@ include file="TS_Common_Libraries.jsp" %>


<%
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 20 );
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
int position = 0;
String categoryPath = "/system/categories/SubSecciones/multimedia/infographics/"; 
%>

              
<!-- Slider infographic -->
<div class="row clear" id="latestMobile">
</div>
<div class="row clear">
   <!-- <div class="bannerMobile">
        <cms:include page="TS_Common_Banners.jsp">
            <cms:param name="template">Multimedia</cms:param>
            <cms:param name="key">Show-Promotion-468x60-mobile</cms:param>
        </cms:include>
    </div>-->
</div>

<div class="row clear">    
    <div class="cont desktop">
        <div class="infotitbar">
            <div class="itatitulo">
                <h3>- Infografías  -</h3>
            </div>  
              
            <div class="col-mid"> </div>
            <div class="col-mid">                                         
                <div class="btn-infographic">
                    <!--<a class="readblog" alt="See more infographics" title="See more infographics" href="/SubSecciones/multimedia/infographics/index.html">See more infographics</a>-->
                </div>
            </div>
        </div>
        <div class="col-mid">

         <cms:include page="../elements/TS_Multimedia_Infografic_Destacada.jsp" />

        </div>
        <div class="col-mid">
            <div class="cont">
                <!-- <a href="<x:out select="$urlexternaAfondo" />" class="her" TARGET="_blank"><img src="http://192.168.3.58/multimedia/imagenes/imagenespecial/<x:out select="$imagencintillo" /> " TARGET="_blank" alt="" /></a>-->




                <cms:include page="TS_Common_Banners.jsp">
                    <cms:param name="template">Multimedia</cms:param>
                    <cms:param name="key">Show-Promotion-460x260-a</cms:param>
                </cms:include>
            </div>
        </div>
    </div>
</div>  


<!-- Slider infographic Mobile-->


<div class="row clear" id="latestMobile">
    <div class="col">
        <div class="cont conttitle">
        <div class="title blue">Infografías</div>
        </div>
        <div class="flexslider carousel">
            <ul class="slides conttitle">
                <nt:news-list order="priority asc,user-modification-date" section="multimedia"  category="<%=categoryPath%>"  size="20">
                    <li style="width: 170px; float: left; display: block;"> 
                        <div class="row clear desktop" >
                            <div class="">
                                <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
                                    <div itemprop="" itemscope itemtype="http://schema.org/ImageObject" style="height:105;">
                                        <a href="<nt:link/>" title="<nt:title value='home' />" class="her" TARGET="_blank">
                                            <nt:preview-image>
                                                <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                                <nt:conditional-include oncondition="${imageDescription != ''}">
                                                    <meta itemprop="description" content='<nt:image-description/>'> 
                                                    <img itemprop="contentURL" src="<nt:image-path width='170' height='105' scaletype='2'/>" alt="<nt:image-description/>" />
                                                </nt:conditional-include>
                                                <nt:conditional-include oncondition="${imageDescription == ''}">
                                                    <meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
                                                    <img itemprop="contentURL" src="<nt:image-path width='170' height='105' scaletype='2' />" alt='${news.titles[news.titleHomeNum]}'/>
                                                </nt:conditional-include>
                                            </nt:preview-image>
                                        </a>
                                    </div>
                                </nt:conditional-include>                                                    
                                <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
                                    <cms:img src="/arte/sinFoto_420x260.jpg" width="100%" height="105" alt="<nt:title value='home'/>"  />
                                </nt:conditional-include>
                                <div class="caption">
                                    <a href="<nt:link/>" class="her" title="<nt:title value="section"/> " TARGET="_blank"><h2><nt:title value="section"/></h2></a>
                                    <nt:edit-buttons hasNew="true" hasDelete="true"/>
                                </div>
                            </div> 
                        </div>  
                    </li>  
                </nt:news-list>   
            </ul>  
        </div>
    </div>
</div>

<!--Slider Pequeno Ultimas Infografias-->

<div class="row clear desktop">
    
        <div class="cont">
            <div class="blue tt-latest">Últimas Infografías</div>
            <div class="row clear"> 
                <div class="cont">
                    <div id="slideHorizontaL" class="slideHor carousel latestmul">
                    <a href="#" id="slideHoRR_prev"></a>
                    <a href="#" id="slideHoRR_next"></a>
                        <div class="flex-viewport" style="overflow: hidden; position: relative;">
                            <ul class="slides " style="width: 3400%; -webkit-transition: 0s; transition: 0s; -webkit-transform: translate3d(-716px, 0px, 0px); transform: translate3d(-716px, 0px, 0px);">
                                <nt:news-list order="priority asc,user-modification-date" section="multimedia"  category="<%=categoryPath%>"  size="20">
                                    <li style="width: 170px; float: left; display: block;"> 
                                        <div class="row clear desktop" >
                                            <div class="">
                                                <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
                                                <div itemprop="" itemscope itemtype="http://schema.org/ImageObject" style="height:105;">
                                                    <a href="<nt:link/>" title="<nt:title value='home' />" class="her" TARGET="_blank">
                                                        <nt:preview-image>
                                                                <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                                            <nt:conditional-include oncondition="${imageDescription != ''}">
                                                                <meta itemprop="description" content='<nt:image-description/>'> 
                                                                <img itemprop="contentURL" src="<nt:image-path width='170' height='105' scaletype='2'/>" alt="<nt:image-description/>" />
                                                            </nt:conditional-include>
                                                            <nt:conditional-include oncondition="${imageDescription == ''}">
                                                                <meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
                                                                <img itemprop="contentURL" src="<nt:image-path width='170' height='105' scaletype='2' />" alt='${news.titles[news.titleHomeNum]}'/>
                                                            </nt:conditional-include>
                                                        </nt:preview-image>
                                                    </a>
                                                </div>
                                                </nt:conditional-include>                                                    
                                                <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
                                                   <cms:img src="/arte/sinFoto_420x260.jpg" width="100%" height="105" alt="<nt:title value='home'/>"  />
                                                </nt:conditional-include>
                                                <div class="caption">
                                                    <a href="<nt:link/>" class="her" title="<nt:title value="section"/> " TARGET="_blank"><h2><nt:title value="section"/></h2></a>
                                                    <nt:edit-buttons hasNew="true" hasDelete="true"/>
                                                </div>
                                            </div> 
                                        </div>  
                                    </li>  
                                </nt:news-list>   
                            </ul>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
</div> 

