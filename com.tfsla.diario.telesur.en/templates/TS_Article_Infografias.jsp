<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<!doctype html>
<html>
    <head>
    <cms:include page="../elements/TS_Common_Head.jsp" >
        <cms:param name="template">multimediapage</cms:param>
    </cms:include>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<cms:include page="../elements/TS_Common_Header.jsp" >
    <cms:param name="pageTitle">Infografía</cms:param>
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
                    <!-- pan de migas -->
                    <span class="itacaput" itemprop="articleSection">	
                        <a href="/english/section/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>						
                        <nt:categories>
                            <nt:conditional-include onposition="first">
                                <c:set var="id"><nt:category-name/></c:set>
                                    <%
                                        String id = pageContext.getAttribute("id").toString();
                                        id = id.replaceAll("/system/categories", "");
                                    %>	
                                <a href="<%=id%>" class="her" alt="<nt:category-description/>" title="<nt:category-description/>"> > <nt:category-description/></a>									
                            </nt:conditional-include>
                        </nt:categories>								
                    </span>	
                    <!-- fin pan de migas -->
                    <a class="her"><h3 itemprop="name headline"><nt:title value="detail"/></h3></a> 
                    <p>
                    <nt:conditional-include oncondition="${news.hideCopete != 'true'}">
                        <nt:sub-title/> 
                        <meta itemprop="about" content="<nt:video-title/>" />
                    </nt:conditional-include>
                    </p>

                  <%--  <cms:include page="../elements/TS_Common_Addthis-Sidebar-ingles.jsp">
                        <cms:param name="link"><nt:link/></cms:param>
                        <cms:param name="titulo"><nt:title value="detail" /></cms:param>
                    </cms:include> --%>
                    
                    <div class="redesInterna">
	                    <div class="icoGal"></div>
	                        <div class="barra-addthis-contador"  style="margin-left:750px">  
			            <div class="addthis_sharing_toolbox"></div>
				    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55d8a3fe30014e2d" async="async"></script>
			            <script type="text/javascript">var addthis_share = { url_transforms : { shorten: { twitter: 'bitly'} }, shorteners : { bitly : {login:'telesur',apiKey:'R_8925c37a76786f9a5620d8c3f0f9e65c'} }}</script>
				    <script type="text/javascript">var addthis_config = {"data_track_clickback":false};</script>
	                    </div>
                    </div>  

                    <div class="nwpInfografia">
                        <div class="wpredes">
                            <%-- <cms:include page="../elements/TS_Common_AddThis.jsp" >
                                 <cms:param name="link"><nt:link/></cms:param> 
                                 <cms:param name="titulo"><nt:title value="section"/></cms:param>       
                             </cms:include>--%>
                        </div>

                        <nt:edit-buttons hasNew="true" hasDelete="true"/>
                        <div itemscope itemtype="http://schema.org/Article"> 
                            <meta itemprop='isFamilyFriendly' content='True'/>
                            <meta itemprop='url sameAs' content='<nt:link/>'/>
                            <meta itemprop="interactionCount" content="UserComments:${news.commentcount}"/>
                        </div>
                        <!-- Photo Galeries -->
                        <cms:include page="../elements/TS_Article_Photo_Infografias.jsp" />
                    </div>
                    <!-- fin foto galeries -->
                    <!-- inicio valoraciones -->
                    <div class="valorarNews">
                       <%-- <a title="I Like" onclick="makeVoteExterior(this)" style="cursor:pointer;">
                            <cms:img src="/arte/simegusta.jpg" alt="I Like" title="I Like" /> <span><nt:news-positive-valorations allowvaloration="true" /></span>
                        </a> 

                        <a title="I don't Like" onclick="makeVoteExterior(this)" style="cursor:pointer;">
                            <cms:img src="/arte/nomegusta.jpg" style="top:7px" alt="I don't Like" title="I don't Like" /> <span><nt:news-negative-valorations allowvaloration="true" /></span>
                        </a>	--%>		              	
                    </div>     
                    <!-- fin valoraciones -->  
                    <!--Coments-->
                    <div id="container">
		            <div class="wrapper">
		                <cms:include page="../elements/TS_Article_Comments.jsp" />
		            </div>
		     </div>
                    <!--Fin Coments-->
                    <!--Mas Galerias-->

                    <cms:include page="TS_Common_Listado_Multimedia.jsp">					
                        <cms:param name="category">infographics</cms:param>
                        <cms:param name="titulo">Infographics</cms:param>
                    </cms:include>
                </div>
                
                 <div class="sharemob">											
		<cms:include page="../elements/TS_Common_redes_mobile.jsp" >
		<cms:param name="link"><nt:link/></cms:param>
		<cms:param name="titulo"><nt:title value="detail" /></cms:param>
		</cms:include>	
	</div>
        
                
                <div class="banners pos1">
                    <cms:include page="../elements/TS_Common_Banners.jsp">
                        <cms:param name="template">Multimedia</cms:param>
                        <cms:param name="key">Advert-728x90-c</cms:param>
                    </cms:include>
                </div><!-- banners posicion 1 -->
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
        </div>
        
        
       <!-- <div class="valorarNews">
            <a title="Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;">
                <cms:img src="/arte/simegusta.jpg" alt="Me Gusta" title="Me Gusta" /> <span><nt:news-positive-valorations allowvaloration="true" /></span>
            </a> 

            <a title="No Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;">
                <cms:img src="/arte/nomegusta.jpg" style="top:7px" alt="No Me Gusta" title="No Me Gusta" /> <span><nt:news-negative-valorations allowvaloration="true" /></span>
            </a>			              	
        </div>-->
        <div id="container">
            <div class="wrapper">
                <cms:include page="../elements/TS_Article_Comments.jsp" />
            </div>
        </div>
    </c:if><!--Fin iframe Full Scream-->
</nt:news>
<cms:include page="../elements/TS_Common_Footer.jsp" />
<script type="text/javascript">
    function loadMore(size, page) {
        $("#cargando").html('<p class="loading" style="text-align:center;"><img src="/arte/loading2.gif" style=" height:100px; width:100px;"/></p>');
        $("#reload-listado").load('listadoMultimedia.html?size=' + size + '&page=' + page + '&category=infographics&titulo=Infografia', function (response, status, xhr) {
            $('#cargando').html("");
        });

    }
</script>
</body>
</html>