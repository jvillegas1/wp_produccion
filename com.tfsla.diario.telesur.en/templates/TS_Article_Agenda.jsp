<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<!doctype html>
<html>
    <head>
    <cms:include page="../elements/TS_Common_Head.jsp" >
        <cms:param name="template">article</cms:param>
    </cms:include>

</head>
<body>

<cms:include page="../elements/TS_Common_Header.jsp" >
    <cms:param name="pageTitle">teleSUR In Depth</cms:param>
    <cms:param name="pageSeccion">telesur_agenda</cms:param>
    <cms:param name="subMenu">si</cms:param>
    <cms:param name="agenda">si</cms:param>
    <cms:param name="latest">no</cms:param>
</cms:include>

<nt:news>
    <!--Inicio Iframe Full Scream-->
    <c:set var="iframefull"><nt:iframe/></c:set>										
    <c:if test="${iframefull == ''}">
        <div class="barratitle" style="margin-top:-15px">
            <div class="wrapper">
                <div class="bodyNA">
                    <div class="col">
                    </div>
                </div>
            </div>
        </div>
        <!-- Container -->
        <section>
            <cms:include page="../elements/TS_Common_LiveBox.jsp" />
            <div class="wrap notaAgenda">
                <div class="blue">
                    <!-- pan de miga -->
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
                    <!--fin pan de miga -->	
                    <a class="her"><h1 itemprop="name headline"><nt:title value="detail"/></h1></a>	
                    <nt:edit-buttons hasNew="true" hasDelete="true"/>							
                </div>
                <!-- Container -->
                <div id="container">


                    <!--wrapper--> 
                    <div class="wrap notaAgenda">
                        <div itemscope itemtype="http://schema.org/Article">
                            <meta itemprop='isFamilyFriendly' content='True'/>
                            <meta itemprop='url sameAs' content='<nt:link/>'/>
                            <meta itemprop="interactionCount" content="UserComments:${news.commentcount}"/>
                            <!-- Destacado -->
                            <div class="row clear">
                               <%-- <cms:include page="../elements/TS_Common_Addthis-Sidebar-ingles.jsp">
                                    <cms:param name="link"><nt:link/></cms:param>
                                    <cms:param name="titulo"><nt:title value="detail" /></cms:param>
                                </cms:include>--%>
                                <!-- inicio worldtop -->
                                <div>				
                                    <div class="vworldtop cont">
                                        <div class="mediaNota altmax">
                                            <nt:conditional-include oncondition="${news.detailPreview != 'iframe'}">
                                                <cms:include page="../elements/TS_Agenda_Multimedia.jsp" />
                                            </nt:conditional-include>
                                            <nt:conditional-include oncondition="${news.detailPreview == 'iframe'}" >
                                                <nt:iframe/>
                                            </nt:conditional-include>                                          
                                        </div>
                                        <div class="gblogrsAgenda">		 
                                           <%-- <div class="num">${news.commentcount}</div>
                                            <cms:img src="/arte/globe-red.png" width="27" height="23" alt="Comentarios" title="Comentarios" /> 
                                            <a href="#comsup"  alt="Comentarios" title="Comentarios" class="readblog">+</a>    --%>                              									
                                        </div>	
                                        <div class="barra-redes">   
                                     <cms:include page="../elements/TS_Common_Barra_Comentarios.jsp" >
                                     <cms:param name="link"><nt:link/></cms:param>
                                     </cms:include>                                     
                               	     </div> 
                                        
                                        <div class="capworldtop">
                                        </div>
                                    </div>
                                </div>
                                <!-- inicio colmna izq col-six -->        
                                <div class="col-six">
                                    <div class="cont bordercountry">
                                        <div class="bodyNA">
                                            <nt:conditional-include oncondition="${news.hideCopete == 'false'}">
                                                <div class="subtitle" itemprop="description alternativeHeadline"><nt:sub-title/></div>
                                            </nt:conditional-include>
                                            <div class="txt_newworld" itemprop="articleBody">																	
                                                <nt:body-splitter>
                                                    <nt:polls-dynamic-position style="TS-ES/NOTA"> </nt:polls-dynamic-position>			
                                                    <c:set var="bodyP" scope="page"><nt:body-paragraph/></c:set>
                                                        <%-- Verificar si El parrafo contiene un Iframe, que a su vez sea un Video de Youtube, modifica sus atributos. Coloca que  pertenece a la clase:'vid-youtube', height='100%' y width='100%' --%> 
                                                        <%String bodyParagrahp = pageContext.getAttribute("bodyP").toString();
                                                            String bodyPa = "";
                                                            if ((bodyParagrahp.contains("<iframe ")) && (bodyParagrahp.contains("youtube"))) {
                                                                bodyParagrahp = bodyParagrahp.replace("height=", " class='vid-youtube' height=");
                                                                String[] cortos = bodyParagrahp.split(" ");
                                                                for (int i = 0; i < cortos.length; i++) {
                                                                    if (cortos[i].contains("height=")) {
                                                                        cortos[i] = "height='100%'";
                                                                    }
                                                                    if (cortos[i].contains("width=")) {
                                                                        cortos[i] = "width='100%'></iframe></p>";
                                                                    }
                                                                    bodyPa = bodyPa + " " + cortos[i];
                                                                }
                                                                bodyParagrahp = bodyPa;
                                                            }
                                                        %>
                                                        <%=bodyParagrahp%>							
                                                </nt:body-splitter> 																		
                                            </div>
                                            <nt:conditional-include oncondition="${news.detailPreview != 'iframe'}" >
                                                <nt:iframe/>
                                            </nt:conditional-include>
                                            <div class="boxValorar">
                                               <%-- <a title="Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;" class="like">
                                                    <span><nt:news-positive-valorations allowvaloration="true" /></span>
                                                </a> 
                                                <a title="No Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;" class="nolike">
                                                    <span><nt:news-negative-valorations allowvaloration="true" /></span>
                                                </a>	--%>		              	
                                            </div>
                                            <nt:tags-list separator=",">
                                                <nt:conditional-include onposition="1">
                                                    <div class="boxTag" itemprop="keywords" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">			              	
                                                        <h3 class="sbNA">More Information:</h3>
                                                </nt:conditional-include>			                    
                                                <a href="/english/tags/<nt:tags-item/>" alt="<nt:tags-item/>" title="<nt:tags-item/>" itemprop="title"><nt:tags-item/></a>
                                                <nt:conditional-include onposition="last">
                                                    </div>						
                                                </nt:conditional-include>
                                            </nt:tags-list>	
                                            <nt:polls-fixed-position style="TS-ES/NOTA"> </nt:polls-fixed-position>	
                                            <nt:files>
                                                <nt:conditional-include onposition="first">
                                                    <div class="filesNews" >			              	
                                                        <h4>Related documents</h4>
                                                        <ul>
                                                            </nt:conditional-include>
                                                            <c:set var="icon"><nt:file-icon/></c:set>								 		
                                                            <nt:conditional-include oncondition="${icon == 'PDF'}" >
                                                                <li>
                                                                    <a href="<nt:file-path/>" alt="<nt:file-title/>" title="<nt:file-title/>" target="_blank"><cms:img src="/arte/pdf.png" alt="PDF" title="PDF" /> <nt:file-title/></a>
                                                                </li>
                                                            </nt:conditional-include>	
                                                            <nt:conditional-include oncondition="${icon != 'PDF'}" >
                                                                <li>
                                                                    <a href="<nt:file-path/>" alt="<nt:file-title/>" title="<nt:file-title/>" target="_blank"> <nt:file-title/></a>
                                                                </li>
                                                            </nt:conditional-include>
                                                            <nt:conditional-include onposition="last">
                                                        </ul>
                                                    </div>						
                                                </nt:conditional-include>
                                            </nt:files>	
                                            <div class="capworldtop">
                                                <div class="caplw">
                                                    <br>
                                                    <div class="capcredit" itemprop="publisher">
                                                        <a class="her">
                                                            <nt:sources>
                                                                <nt:source-name/><br/>
                                                            </nt:sources>
                                                        </a>
                                                    </div>
                                                    <nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
                                                        <div class="boxAutor" itemprop="author" itemscope itemtype="http://schema.org/Person">
                                                            <nt:authors>
                                                                <c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
                                                                <c:set var="authorName" scope="page"><nt:author-name/></c:set>
                                                                <c:if test="${internalUser != ''}">
                                                                    <nt:user username="${internalUser}">
                                                                        <meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
                                                                        <meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
                                                                        Por <span class="itacaput"><a href="<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a></span>	
                                                                    </nt:user>
                                                                </c:if>	 
                                                                <c:if test="${internalUser == '' && authorName != ''}">
                                                                    <meta itemprop="name" content="<nt:author-name/>"/>
                                                                    by: <span class="itacaput"><a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a></span>
                                                                </c:if>
                                                                <br/>
                                                            </nt:authors>
                                                        </div>
                                                    </nt:conditional-include>
                                                </div>
                                            </div>
                                        </div>
                                    </div>																
                                </div>
                            </div>
                            <!-- Fin Destacado -->
                        </div>
                        <!-- Fin SCHEMAS -->
                    </div><!--wrapper-->
                </div><!--conteiner-->
 
		 <div class="sharemob">											
			<cms:include page="../elements/TS_Common_redes_mobile.jsp" >
			<cms:param name="link"><nt:link/></cms:param>
			<cms:param name="titulo"><nt:title value="detail" /></cms:param>
			</cms:include>	
		 </div>
        

                <!--Inicio Right colum-->   
                <aside>
                    <div class="red">
                        <cms:include page="../elements/TS_Common_Blocks.jsp">
                            <cms:param name="template">Agenda_1</cms:param>
                        </cms:include>
                    </div>
                    <div class="banners pos300x250">
                        <cms:include page="../elements/TS_Common_Banners.jsp">
                            <cms:param name="template">WorldPage2</cms:param>
                            <cms:param name="key">Advert-300x250-a</cms:param>
                        </cms:include>
                    </div>
                    <!--<div class="blue">
                            <div class="head">Recommended</div>-->
                    <cms:include page="../elements/TS_Common_Blocks.jsp">
                        <cms:param name="template">Agenda_2</cms:param>
                    </cms:include>
                    <!--</div>-->
                    <div class="reporAside">
                        <cms:include page="../elements/TS_Common_Blocks.jsp">
                            <cms:param name="template">Agenda_3</cms:param>
                        </cms:include>   	           
                    </div>
                </aside>
                <!--fin Right colum--> 


                <div class="block agenda clear">
                    <cms:include page="../elements/TS_Common_Blocks.jsp">
                        <cms:param name="template">Agenda_4</cms:param>
                    </cms:include> 
                </div>
                <div class="block corres clear">
                    <cms:include page="../elements/TS_Common_Blocks.jsp">
                        <cms:param name="template">Agenda_5</cms:param>
                    </cms:include> 
                </div>
                <div class="banners">
                    <cms:include page="../elements/TS_Common_Banners.jsp">
                        <cms:param name="template">WorldPage2</cms:param>
                        <cms:param name="key">Advert-728x90-a</cms:param>
                    </cms:include>
                </div>
                <div class="block corres vid clear">
                    <cms:include page="../elements/TS_Common_Blocks.jsp">
                        <cms:param name="template">Agenda_6</cms:param>
                    </cms:include> 
                </div>
                <!-- Comment -->
                 <a name="comsup"> </a>
                <cms:include page="../elements/TS_Article_Comments.jsp" />
                <!-- fin Comment -->
            </div>

        </section>
    </c:if><!--Inicio iframe Full Scream-->
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
       <%-- <div class="valorarNews">
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
</body>
</html>