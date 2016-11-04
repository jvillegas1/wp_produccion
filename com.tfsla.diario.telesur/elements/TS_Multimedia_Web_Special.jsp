<%@ include file="TS_Common_Libraries.jsp" %>

<%
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 20);
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
int position = 0;
String categoryPath = "/system/categories/SubSecciones/multimedia/webspecial/";
%>

<div class="row clear marginchica black">
    <div class="wrapper">
        <div class="itatitulo" style="margin-top:40px">
            <h3>- Especiales -</h3>
        </div>
    </div>
</div>
<div class="row clear gray">
    <div class="wrapper">
        <!--Web Special Destacada-->
        <cms:include page="../elements/TS_Multimedia_Web_Special_Destacada.jsp" />
    </div>
    <div class="wrapper"> <!--Slider WEb SpecialPequeño -->  
        <div class="cont">
            <div class="slideHor carousel noBorder">
                <a href="#" id="slideHoRR_prev" class="active"></a>
                    <ul id="slideHorizontaLL" class="" style="list-style: none; position: relative; padding: 0px; overflow: hidden; width: 894px; height: 150px;">
                        <nt:news-list order="priority asc,user-modification-date" section="multimedia"  category="<%=categoryPath%>"  size="20">      
                            <li class="slide-node slide-node-0" style="position: absolute; margin: 0px; width: 170px; overflow: hidden; top: 0px; left: 0px; display: block;">
                                <div class="row clear desktop" >
                                    <div class="">
                                        <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
                                            <div itemprop="" itemscope itemtype="http://schema.org/ImageObject" style="height:105;">
                                                <a href="<nt:link/>" title="<nt:title value='home' />" class="her">
                                                    <nt:preview-image>
                                                            <c:set var="imageDescription" scope="page"><nt:image-description/>
                                                            </c:set>
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
                                            <a href="<nt:link/>" class="her" title="<nt:title value="section"/> " TARGET="_blank"><h2><nt:title value="section"/></h2>
                                            </a>
                                            <nt:edit-buttons hasNew="true" hasDelete="true"/>
                                        </div>
                                    </div> 
                                </div>  
                            </li>   
                        </nt:news-list>                                                
                    </ul>
                <a href="#" id="slideHoRR_next" class="active"></a>                  
            </div>
        </div>
        <div class="row clear"> 
            <div class="banners adv970">
                <a href="#" class="her"><img src="http://exwebserv.telesurtv.net/publicidad/www/delivery/avw.php?zoneid=1&cb=INSERT_RANDOM_NUMBER_HERE&n=a10543b9" alt="" /></a>
            </div>       
        </div>
    </div>
</div>
<!-- Slider Especiales Web Mobile -->
<div class="row clear" id="latestMobile">  
    <div class="col">
        <div class="cont conttitle">
            <div class="title blue">Especiales</div>
        </div>
        <div class="cont">
            <div class="flexslider carousel">
                <ul class="slides conttitle">
                    <nt:news-list order="priority asc,user-modification-date" section="multimedia"  category="<%=categoryPath%>"  size="20">      
                        <li class="slide-node slide-node-0" style="position: absolute; margin: 0px; width: 170px; overflow: hidden; top: 0px; left: 0px; display: block;">
                            <div class="row clear desktop" >
                                <div class="">
                                    <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
                                        <div itemprop="" itemscope itemtype="http://schema.org/ImageObject" style="height:400;">
                                            <a href="<nt:link/>" title="<nt:title value='home' />" class="her">
                                                <nt:preview-image>
                                                    <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                                    <nt:conditional-include oncondition="${imageDescription != ''}">
                                                        <meta itemprop="description" content='<nt:image-description/>'> 
                                                        <img itemprop="contentURL" src="<nt:image-path width='600' height='400' scaletype='2'/>" alt="<nt:image-description/>" />
                                                    </nt:conditional-include>
                                                    <nt:conditional-include oncondition="${imageDescription == ''}">
                                                        <meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
                                                        <img itemprop="contentURL" src="<nt:image-path width='600' height='400' scaletype='2' />" alt='${news.titles[news.titleHomeNum]}'/>
                                                    </nt:conditional-include>
                                                </nt:preview-image>
                                            </a>
                                        </div>
                                    </nt:conditional-include>                                                    
                                    <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
                                        <cms:img src="/arte/sinFoto_420x260.jpg" width="100%" height="400" alt="<nt:title value='home'/>"  />
                                    </nt:conditional-include>
                                    <div class="caption">
                                        <a href="<nt:link/>" class="her" title="<nt:title value="section"/> " TARGET="_blank"><h2><nt:title value="section"/></h2>
                                        </a>
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
</div>    