<%@ include file="TS_Common_Libraries.jsp" %>

<%
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 20 );
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
int position = 0;
String categoryPath = "/system/categories/SubSecciones/en/multimedia/infographics/"; 
%>
                 
<!-- Slider infographic -->
<div class="row clear" id="latestMobile">
</div>
<div class="row clear">
    <div class="bannerMobile">
        <cms:include page="TS_Common_Banners.jsp">
            <cms:param name="template">Multimedia</cms:param>
            <cms:param name="key">Show-Promotion-468x60-mobile</cms:param>
        </cms:include>
    </div>
</div>

<div class="row clear">    
    <div class="cont desktop">
        <div class="infotitbar">
            <div class="itatitulo">
                <h3>- Infographic  -</h3>
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
            <div class="title blue">Infographic</div>
        </div>
        <div class="flexslider carousel">
            <ul class="slides conttitle">

              <li>
                    <a href="" class="her" TARGET="_blank"><img  class="" src="" alt="" /></a>
                    <a href="#" class="her"> </a>
                <div class="caption">
                    <a href="" class="" her""> <h2> </h2></a>
                </div>
             </li>    
                      
            </ul>  
        </div>



    </div>
</div>
<!--Latest Videos-->
<div class="row clear desktop">
    <div class="cont">
        <div class="blue tt-latest">Latest Infographic</div>
                                                    <!--<iframe src="" height="200" width="100%"></iframe>
                                                                <!--Carrousel pequeño-->
            <div class="row clear"> 
                <div class="cont">
                    <div id="slideHorizontaL" class="slideHor carousel latestmul">
                        <a href="#" id="slideHoRR_prev"></a>
                        <a href="#" id="slideHoRR_next"></a>
                        <div class="flex-viewport" style="overflow: hidden; position: relative;">
                            <ul class="slides " style="width: 4400%; -webkit-transition: 0.6s; transition: 0.6s; -webkit-transform: translate3d(-3103px, 0px, 0px); transform: translate3d(-3103px, 0px, 0px);">
                                <nt:news-list order="user-modification-date desc" section="multimedia"  category="<%=categoryPath%>" size="<%=size%>" publication="20">
                                    <li style="width: 170px; float: left; display: block;"> 
                                          <div class="row clear desktop" itemscope itemtype="http://schema.org/Article">
                                                                        
                                                                                   
                                                <div class="">


                                                    <div class="" itemscope itemtype="http://schema.org/ImageObject">
                                                        <a href="<nt:link/>" class="her" TARGET="_blank">
                                                            <nt:preview-image>
                                                                    <nt:conditional-include oncondition="${news.imagepreviewset == 'true'}">
                                                                    <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                                                <nt:conditional-include oncondition="${imageDescription != ''}">
                                                                    <meta itemprop="description" content='<nt:image-description/>'> 
                                                                    <img itemprop="contentURL" src="<nt:image-path scaletype="2" width="170" height="105" />" width="170" height="105" alt="<nt:image-description/>" title="<nt:image-description/>">
                                                                </nt:conditional-include>
                                                                <nt:conditional-include oncondition="${imageDescription == ''}">
                                                                    <meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
                                                                    <img itemprop="contentURL" src="<nt:image-path scaletype="2" width="170" height="105" />" width="170" height="105" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}' />
                                                                </nt:conditional-include>
                                                                </nt:conditional-include>
                                                            </nt:preview-image>
                                                            <nt:conditional-exclude oncondition="${news.imagepreviewset}">
                                                                <meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
                                                                <cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}'/>
                                                            </nt:conditional-exclude>
                                                        </a> 
                                                    </div>
                                                </div>




                                                <div class="caption" itemprop="name headline">
                                                    <a href="<nt:link/>" class="her" title="<nt:title value="section"/>" TARGET="_blank"><h2><nt:title value="section"/></h2></a>
                                                    <nt:edit-buttons hasNew="true" hasDelete="true"/>
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


