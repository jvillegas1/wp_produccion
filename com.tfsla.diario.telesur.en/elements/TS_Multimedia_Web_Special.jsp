<%@ include file="TS_Common_Libraries.jsp" %>

<%
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 20 );
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
int position = 0;
String categoryPath = "/system/categories/SubSecciones/en/multimedia/webspecial/"; 
%>


<div class="row clear marginchica black">
  <div class="wrapper">
    <div class="itatitulo" style="margin-top:40px">
      <h3>- Web Special -</h3>
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
        <a href="#" id="slideHoRR_prev"></a>
          <ul id="slideHorizontaLL">      
            <nt:news-list order="user-modification-date desc" section="multimedia"  category="<%=categoryPath%>" size="<%=size%>" publication="9">
              <li>
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
                    <a href="<nt:link/>" class="her" title="<nt:title value="section"/> " TARGET="_blank"><h2><nt:title value="section"/></h2></a>
                    <nt:edit-buttons hasNew="true" hasDelete="true"/>
                  </div>
                </div>
              </li>   
            </nt:news-list>  
          </ul>
        <a href="#" id="slideHoRR_next"></a>                  
      </div>
    </div>

    <div class="row clear"> 
                <!--<div class="banners adv970"><a href="#" class="her"><img src="http://exwebserv.telesurtv.net/publicidad/www/delivery/avw.php?zoneid=79&cb=INSERT_RANDOM_NUMBER_HERE&n=a76226c1" alt="" /></a></div>       
                
            </div>  -->     
    </div>
  </div>
</div>
</div>
</div>
<div class="row clear">
                <div class="banners adv970">
                  <cms:include page="../elements/TS_Common_Banners.jsp">
              <cms:param name="template">Multimedia</cms:param>
              <cms:param name="key">Advert-970x90</cms:param>
            </cms:include>
          </div>
        </div>
      </div>
</div> 