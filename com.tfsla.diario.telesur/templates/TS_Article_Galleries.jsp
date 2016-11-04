<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<!doctype html>
<html>
    <head>
    <cms:include page="../elements/TS_Common_Head.jsp" >
        <cms:param name="template">multimediapage</cms:param>
    </cms:include>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script defer src="<cms:link>../resources/js/jquery.flexslider.js</cms:link>"></script>
    <script src="<cms:link>../resources/js/function.js</cms:link>"></script>
    <script src="<cms:link>../resources/js/tabs.min.jquery.js</cms:link>"></script>
    <script type="text/javascript">
        function cargarMasNotas(_pagina, _size) {

            div = "#bloque_" + _pagina;
            paginador = "#paginador";

            jQuery(paginador).hide();

            $.post("/system/modules/com.tfsla.diario.telesur/elements/TS_Article_more_Photo_Gallery_Page.jsp",
                    {pagina: _pagina, size: _size}, function (data) {
                $(div).html(data);

            });
        }
    </script>
</head>
<body>
<cms:include page="../elements/TS_Common_Header.jsp" >
    <cms:param name="pageTitle">Galerías</cms:param>
    <cms:param name="pageSeccion">multimedia</cms:param>
    <cms:param name="subMenu">si</cms:param>
    <cms:param name="agenda">si</cms:param>
    <cms:param name="latest">no</cms:param>
</cms:include>
<nt:news>
    <c:set var="iframefull"><nt:iframe/></c:set>										
    <c:if test="${iframefull == ''}">
        <section>
            <div class="wrap multimedia">
                <div class="boxMmd int">
                    <!-- pan de miga -->
                    <span class="itacaput" itemprop="articleSection">	
                        <a href="/seccion/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>						
                        <nt:categories>
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
                    <!--fin pan de miga -->	
                    <a class="her"><h3 itemprop="name headline"><nt:title value="detail"/></h3></a> 
                    <div class="subtitle" itemprop="description alternativeHeadline" style="margin: 8px;"> 
                    <nt:conditional-include oncondition="${news.hideCopete != 'true'}">
                      ${news.subtitle}
                        <meta itemprop="about" content="<nt:video-title/>" />
                    </nt:conditional-include>
                    </div>
                  <div class="txt_newworld" itemprop="articleBody" style="margin: 8px;">	
                  ${news.body}  
                    </div>


                  <%--  <cms:include page="../elements/TS_Common_Addthis-Sidebar.jsp">
                        <cms:param name="link"><nt:link/></cms:param>
                        <cms:param name="titulo"><nt:title value="detail" /></cms:param>
                    </cms:include>  --%>

				<div class="sharemob">											
				<cms:include page="../elements/TS_Common_redes_mobile.jsp" >
				<cms:param name="link"><nt:link/></cms:param>
				<cms:param name="titulo"><nt:title value="detail" /></cms:param>
				</cms:include>	
				</div>

                    <div class="redesInterna">
                        <div class="icoGal"><img src="/arte/mmd-galeria-interna.jpg" alt="galeria"><span><small>${news.imagescount} </small></div>
                        <div class="wpredes">
                            <%--     <cms:include page="../elements/TS_Common_AddThis.jsp" >
                                     <cms:param name="link"><nt:link/></cms:param> 
                                     <cms:param name="titulo"><nt:title value="section"/></cms:param>       
                                 </cms:include> --%>
                                <div class="barra-addthis-contador">  
		            <div class="addthis_sharing_toolbox"></div>
		            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55aa85125863dd2c" async="async"></script>
		            <script type="text/javascript">var addthis_share = { url_transforms : { shorten: { twitter: 'bitly'} }, shorteners : { bitly : {login:'telesur',apiKey:'R_8925c37a76786f9a5620d8c3f0f9e65c'} }}</script>
			    <script type="text/javascript">var addthis_config = {"data_track_clickback":false};</script>
                              </div>   
                                 
                        </div>
                    </div>
                    <nt:edit-buttons hasNew="true" hasDelete="true"/>
                    <div itemscope itemtype="http://schema.org/Article"> 
                        <meta itemprop='isFamilyFriendly' content='True'/>
                        <meta itemprop='url sameAs' content='<nt:link/>'/>
                        <meta itemprop="interactionCount" content="UserComments:${news.commentcount}"/>
                        <!-- Photo Galeries -->
                        <cms:include page="../elements/TS_Article_Photo_Gallery.jsp" />
                    </div>
               


		<!-- banners posicion 1 -->
                    <div class="banners">
                        <cms:include page="../elements/TS_Common_Banners.jsp">
                            <cms:param name="template">Multimedia</cms:param>
                            <cms:param name="key">Advert-728x90-c</cms:param>
                        </cms:include>
                    </div>
                </div>
                <!--Mas Galerias-->
                <h6>Galerías <img src="/arte/i-imgs.jpg" alt="galerias telesur"></h6>
                <cms:include page="../elements/TS_Article_more_Photo_Gallery_Page.jsp" /> 
            </div>        

            </div>
            <%-- Comentarios --%>
            <div class="row clear wrap multimedia">
                <cms:include page="../elements/TS_Article_Comments.jsp" />
            </div>                
            
        </section>
    </c:if>
    <!--Inicio iframe Full Scream-->
    <c:if test="${iframefull != ''}">
        <div id="container">
            <div class="wrapperFull">
                <div class="btn-edit">
                    <nt:edit-buttons hasNew="true" hasDelete="true"/>
                </div>
                <nt:conditional-include oncondition="${news.detailPreview != 'iframe'}" >
                    <div class="Iframe-Container">
                        <iframe width="100%" height="360" src="<nt:iframe/>" frameborder="0"></iframe>
                    </div>	
                </nt:conditional-include>
            </div>	
        
           <%--<div class="valorarNews">
                <a title="Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;">
                    <cms:img src="/arte/simegusta.jpg" alt="Me Gusta" title="Me Gusta" /> <span><nt:news-positive-valorations allowvaloration="true" /></span>
                </a> 

                <a title="No Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;">
                    <cms:img src="/arte/nomegusta.jpg" style="top:7px" alt="No Me Gusta" title="No Me Gusta" /> <span><nt:news-negative-valorations allowvaloration="true" /></span>
                </a>			              	
            </div>--%>
             <div id="container">
             	 <div class="wrapper">
            		<cms:include page="../elements/TS_Article_Comments.jsp" />
            	</div>
            </div>
    </c:if><!--Fin iframe Full Scream-->
</nt:news>
<cms:include page="../elements/TS_Common_Footer.jsp" />
<script>
    $(window).load(function () {
        //Destacamos
        $('.destacamos, .SdHistory, .SdSpecial').flexslider({
            animation: "slide",
            animationLoop: false,
            itemWidth: 146,
            itemMargin: 4,
            pausePlay: true,
            start: function (slider) {
                $('body').removeClass('loading');
            }
        });
    });
</script>
<script>
    $('.ocultaVM').css('display', 'none');
    $('div.btnVermas').click(function () {
        $('.ocultaVM').css('display', 'none');
    });
    $('div.btnVermas').click(function () {
        $('.ocultaVM').fadeIn('fast');
    });
</script>  
</body>
</html>