<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
    <head>
    <cms:include page="../elements/TS_Common_Head.jsp" >
        <cms:param name="template">article</cms:param>
    </cms:include>



    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $('#sidebar').stickyMojo({footerID: '#espFotos', contentID: '.content'});
            $('.ancla').click(function () {
                var link = $(this);
                var anchor = link.attr('href');
                $('html, body').stop().animate({
                    scrollTop: jQuery(anchor).offset().top
                }, 2000);
                return false;
            });
        });
    </script>

</head>
<body>
<cms:include page="../elements/TS_Common_Header.jsp" >
    <cms:param name="pageTitle">Article</cms:param>
    <cms:param name="pageSeccion">enProfundida</cms:param>
    <cms:param name="subMenu">si</cms:param>
    <cms:param name="agenda">si</cms:param>
    <cms:param name="latest">no</cms:param>
</cms:include>
<nt:news>
    <!--Inicio Iframe Full Scream-->
    <c:set var="iframefull"><nt:iframe/></c:set>                                        
    <c:if test="${iframefull == ''}">
        <!-- Container -->
        <section  style="padding: 0;">
            <cms:include page="../elements/TS_Common_LiveBox.jsp" />

            <div>
                <!--wrapper--> 

                <div itemscope itemtype="http://schema.org/Article">
                    <meta itemprop='isFamilyFriendly' content='True'/>
                    <meta itemprop='url sameAs' content='<nt:link/>'/>
                    <meta itemprop="interactionCount" content="UserComments:${news.commentcount}"/>
                    <!-- Destacado -->
                    <div class="row clear">
                        <!-- inicio worldtop -->
                        <cms:include page="../elements/TS_Common_Addthis-Sidebar-ingles.jsp">
                            <cms:param name="link"><nt:link/></cms:param>
                            <cms:param name="titulo"><nt:title value="detail" /></cms:param>
                        </cms:include>
                        <div>               

                            <nt:conditional-include oncondition="${news.detailPreview != 'iframe'}">
                                <cms:include page="../elements/TS_FullScream_Multimedia.jsp" />
                            </nt:conditional-include>
                            <nt:conditional-include oncondition="${news.detailPreview == 'iframe'}" >
                                <nt:iframe/>
                            </nt:conditional-include>

                            <div class="contentScroll cd-articles">
                                <nt:conditional-include oncondition="${news.imagescount > 0}">
                                    <div class="anclaFotoFull" id="sidebar"> 
                                        <a href="#" class="iraFotosFull" alt="Fotos"><img src="/arte/ico-fotos.png" alt="Fotos">Photos</a>
                                        <a href="#" class="iraVideos"><img src="/arte/ico-videos.png" alt="Videos">Videos</a>
                                        <a href="#" class="iraRelacionada" alt="Sigue Leyendo"><img src="/export/sites/telesur/arte/IconosRel.jpg_1881634313.jpg" alt="Fotos">Related Stories</a>
                                    </div>
                                </nt:conditional-include>
                                <div class="cont bordercountry">
                                    <div class="bodyNA">
                                        <nt:edit-buttons hasNew="true" hasDelete="true"/>                         
                                        <nt:conditional-include oncondition="${news.hideCopete == 'false'}">
                                            <div class="subtitle paragraph" itemprop="description alternativeHeadline"><nt:sub-title/></div>
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
                                        <c:set var="tag" value="${news.tags}"/>


                                    </div>
                                </div>
                                <aside class="cd-read-more">
                                    <ul id="scroll"></ul>     
                                </aside><!-- .cd-read-more --> 


                            </div>                                                              

                        </div>
                    </div>

                    <div class="sharemob">                                          
                        <cms:include page="../elements/TS_Common_redes_mobile.jsp" >
                            <cms:param name="link"><nt:link/></cms:param>
                            <cms:param name="titulo"><nt:title value="detail" /></cms:param>
                        </cms:include>  
                    </div>
                </div> <!--wrapper-->
            </div><!--conteiner-->


            <!-- Start Photo Galery -->
            <div class="wrap multimedia wrapMulti">
                <div class="boxMmd int"> 
                    <cms:include page="../elements/TS_Article_NotaLong_Page_Photo.jsp" />
                </div>
            </div>
            <!-- End Photo Galery -->


            <!--Start de Video Galery-->
            <cms:include page="../elements/TS_Article_Notalong_Videos.jsp">
                <cms:param name="keiwords">${tag}</cms:param>
            </cms:include>  
            <!--End Video Galery-->


            <!--Start Related Stories-->   
            <cms:include page="../elements/TS_Article_Long_SigueLeyendo.jsp" />
            <!--End  Related Stories-->   

            <!--Start More Information-->
            <div class="boxEnterate"> 
                <nt:tags-list separator=",">
                    <nt:conditional-include onposition="1">
                        <div class="boxTag" itemprop="keywords" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">                          
                            <h3 class="sbNA">More Information:</h3></br>
                    </nt:conditional-include>   

                    <a href="/tags/<nt:tags-item/>" alt="<nt:tags-item/>" title="<nt:tags-item/>" itemprop="title"><nt:tags-item/></a>
                    <nt:conditional-include onposition="last">
                        </div>                      
                    </nt:conditional-include>
                </nt:tags-list> 
                <nt:polls-fixed-position style="TS-ES/NOTA"> </nt:polls-fixed-position> 
                <nt:files>
                    <nt:conditional-include onposition="first">
                        <div class="filesNews" >                            
                            <h4>Attachments</h4>
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
                                            by <span class="itacaput"><a href="<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a></span>   
                                        </nt:user>
                                    </c:if>  
                                    <c:if test="${internalUser == '' && authorName != ''}">
                                        <meta itemprop="name" content="<nt:author-name/>"/>
                                        by <span class="itacaput"><a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a></span>
                                    </c:if>
                                    <br/>
                                </nt:authors>
                            </div>
                        </nt:conditional-include>
                    </div></div>   

            </div>  
            <!--End More Information-->
            <!--Star Coment-->
            <div id="container">
                <div class="wrapper">
                    <cms:include page="../elements/TS_Article_Comments.jsp" />
                </div>
            </div>
            <!--End Coment-->

        </section>


    </c:if><!--Start iframe Full Scream-->
    <c:if test="${iframefull != ''}">
    </c:if><!--End iframe Full Scream-->
</nt:news>
<script>
    jQuery(document).ready(function ($) {

        var itemsTit = [];
        $("h2").each(function (i) {
            var titulo = $(this).text();
            itemsTit.push("<li> <a href='#'> <em>" + titulo + " </em><svg x='0px' y='0px' width='36px' height='36px' viewBox='0 0 36 36'><circle fill='none' stroke-width='2' cx='18' cy='18' r='16' stroke-dasharray='100 100' stroke-dashoffset='100' transform='rotate(-90 18 18)'></circle></svg></a></li>");

        });

        $.each(itemsTit, function (i, l) {
            $("#scroll").append(itemsTit[i])
        });
    });

</script>
<script>
    $(window).load(function () {
        //scrollTop Especial Fotos
        $('.iraFotosFull').click(function () {
            $('html, body').animate({scrollTop: $("#espFotos").offset().top - 130}, 2000);
        });
        //scrollTop Especial sigue leyendo
        $('.iraRelacionada').click(function () {
            $('html, body').animate({scrollTop: $("#espRelacionada").offset().top - 140}, 2000);
        });

    });
</script>
<!--<script src="/system/modules/com.tfsla.diario.telesur/resources/js/modernizr.js"></script>-->
<!--<script src="/system/modules/com.tfsla.diario.telesur/resources/js/custom.js"></script> -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script> 
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/system/modules/com.tfsla.diario.telesur/resources/js/stickyMojo.js"></script>
<script src="http://jwpsrv.com/library/Cs7H6hH+EeWttA4AfQhyIQ.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/system/modules/com.tfsla.diario.telesur/resources/js/jquery.visible.js"></script>
<script type="text/javascript" src="/system/modules/com.tfsla.diario.telesur/resources/js/scrolltoplay.js"></script>
<script src="/system/modules/com.tfsla.diario.telesur/resources/js/jquery-2.1.4.js"></script>
<script src="/system/modules/com.tfsla.diario.telesur/resources/js/main.js"></script> 
</body>
<cms:include page="../elements/TS_Common_Footer.jsp" />
</html>