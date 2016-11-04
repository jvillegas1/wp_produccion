<%@ include file="TS_Common_Libraries.jsp" %>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://jwpsrv.com/library/Cs7H6hH+EeWttA4AfQhyIQ.js"></script>
<script src="/system/modules/com.tfsla.diario.telesur/resources/js/audio.js"></script>

<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId: '1441268399520835',
            xfbml: true,
            version: 'v2.3'
        });
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/es_LA/all.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<div id="fb-root"></div>
<script>(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1&version=v2.3&appId=1441268399520835";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

</script>
 
<%
    /**
     * Create a JSP action element
     */
    org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

    /**
     * Variables de session para mantener la ruta de navegacion del usuario
     */
    request.setCharacterEncoding("UTF-8");
    session.setAttribute("seccion", "audio");
    session.setAttribute("url", cms.getRequestContext().getUri());

    //variables del post
    String display_search = (request.getParameter("display_search") != null) ? request.getParameter("display_search") : "";
    String filter_autor = (request.getParameter("filter_autor") != null) ? request.getParameter("filter_autor") : "";
    String buscar_search = (request.getParameter("buscar_search") != null) ? request.getParameter("buscar_search") : "";
    String filter_form = (request.getParameter("filter_form") != null) ? request.getParameter("filter_form") : "best";
    String search_form = (request.getParameter("search_form") != null) ? request.getParameter("search_form") : "";
    String category = request.getParameter("category") != null ? request.getParameter("category") : "best";
  
    

    int pagina = (request.getParameter("pagina") != null) ? Integer.parseInt(request.getParameter("pagina")) : 1;
    int size = (request.getParameter("size") != null) ? Integer.parseInt(request.getParameter("size")) : 6;

    /**
     * Orden de Busqueda
     */
    if (display_search.equals("LAST") || display_search.equals("null") || display_search.equals("")) {
        display_search = "priority desc, user-modification-date desc";
    }
    if (display_search.equals("COME")) {
        display_search = "most-read";
    }
    if (display_search.equals("COMP")) {
        display_search = "most-positive-evaluations";
    }

    /**
     *
     * La busqueda viene por Search
     *
     */
    String q = search_form;
    String query = "";
    String q_alguna = "";

    if (!q.equals("")) {
        // Reemplazo caracteres que rompen las búsquedas
        q = q.replaceAll("Ã¡", "á").replaceAll("Ã", "Á").replaceAll("Ã©", "é").replaceAll("Ã", "É").replaceAll("Ã­", "í").replaceAll("Ã", "Í");
        q = q.replaceAll("Ã³", "ó").replaceAll("Ã", "Ó").replaceAll("Ãº", "ú").replaceAll("Ã", "Ú").replaceAll("Ã±", "ñ").replaceAll("Ã", "Ñ");

        q = q.replaceAll("\\:", "").replaceAll("\\!", "").replaceAll("\\¡", "").replaceAll("\\?", "").replaceAll("\\\"", "");
        q = q.replaceAll("\\¿", "").replaceAll("\\\'", "").replaceAll("\\,", "").replaceAll("\\@", "");

        //##############################################################################################################
        //LÓGICA DE BÚSQUEDA Y PONDERACIÓN DE RESULTADOS                    
        query += "( ";
        query += "titulo:( \"" + q.trim() + "\" )^5 OR ";
        query += "volanta:( \"" + q.trim() + "\" )^5 OR ";
        query += "copete:( \"" + q.trim() + "\" )^5 OR ";
        query += "keywords:(\"" + q.trim() + "\")^4 OR ";
        query += "cuerpo:( \"" + q.trim() + "\"~0.8 )^1 ";

        //condiciones para búsquedas por palabras separadas en titulo, keywords y autor
        StringTokenizer stk = new StringTokenizer(q, " ");
        while (stk.hasMoreTokens()) {
            String palabra = stk.nextToken().trim();
            if (!palabra.equals("")) {
                q_alguna = q_alguna + "+" + palabra + "~0.8 ";
            }
        }

        query += "OR titulo:( " + q_alguna + ")^1 OR ";
        query += "volanta:( " + q_alguna + ")^1 OR ";
        query += "copete:( " + q_alguna + ")^1 OR ";
        query += "keywords:( " + q_alguna + ")^1 ";
        query += ")";
        //##############################################################################################################
    }

    Boolean isProjectOnline = cms.getCmsObject().getRequestContext().currentProject().isOnlineProject();
    String index = "TS_NEWS_ONLINE";
    if (!isProjectOnline) {
        index = "TS_NEWS_OFFLINE";
    }
%>

<div class="row clear">
    <div class="cont2">
        <h2 class="noResul" style="display:none" >No se encontraron resultados en esta categoria...</h2>
        <div class="menusearchbotAudio"></div></br>
        <div class="menusearchbotAudio">
            <div class="pagsearchAudio"> </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#textFilter").html($("#filter option:selected").text());
        $("#textPublished").html($("#published option:selected").text());
        $("#textSection").html($("#section option:selected").text());
    </script>
</div>

<c:set var="i" value="1"/>
<nt:news-list  order="user-modification-date desc" advancedfilter="<%=query%>" section="audio" author="<%=filter_autor%>" size="<%=size%>" page="<%=pagina%>" category="<%=filter_form%>"  >    
    <div class="contblog" itemscope itemtype="http://schema.org/Article">
        <meta itemprop="sameAs url" content="<nt:link/>">
    </div>
    <c:set var="videoscount" scope="page">${news.videoscount}</c:set>
        <jsp:useBean id="videoscount" type="java.lang.String" />               
    <c:set var="i" value="${i+1}" />
    <c:choose>
        <c:when test="${i % 2 == 0}">
            <ul class="list1">
                <li class="list1_img">
                <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
                    <div itemprop="" itemscope itemtype="http://schema.org/ImageObject" style="height:105;">
                        <a href="<nt:link/>" title="<nt:title value='home' />" class="her">
                            <nt:preview-image>
                                <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                <c:set var="image" scope="page"><nt:image-path/></c:set>
                                <nt:conditional-include oncondition="${imageDescription != ''}">
                                    <meta itemprop="description" content='<nt:image-description/>'> 
                                    <img itemprop="contentURL" src="<nt:image-path />" width="341" height="220" alt="<nt:image-description/>" />
                                </nt:conditional-include>
                                <nt:conditional-include oncondition="${imageDescription == ''}">
                                    <meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
                                    <img itemprop="contentURL" src="<nt:image-path  />" width="341" height="220" alt='${news.titles[news.titleHomeNum]}'/>
                                </nt:conditional-include>
                            </nt:preview-image>
                        </a>
                    </div>
                </nt:conditional-include>                                                    
                <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
                    <cms:img src="/arte/sinFoto_420x260.jpg" width="341" height="220" alt="<nt:title value='home'/>"  />
                </nt:conditional-include>
                </li>
                <li class="list1_desc">
                    <a class="her" href="<nt:link/>">
                        <h4 itemprop="name headline"><nt:title value="detail"/></h4>
                    </a>
                    <p class="subtitaudio"><nt:sub-title maxlength='155' endchars='...' /></p>

                <p><nt:conditional-include oncondition="${news.hideTime == 'false' || news.hideAuthor == 'false'}">
                    <div class="titsearch">
                        <nt:conditional-include oncondition="${news.hideTime == 'false'}">
                            <div class="autsearch"><fmt:setLocale value="es_ES"/><fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" /> / </div>
                        </nt:conditional-include>
                        <nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
                            <div class="autsearch" itemprop="author" itemscope itemtype="http://schema.org/Person">
                                <nt:authors>
                                    <c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
                                    <c:if test="${internalUser != ''}">
                                        <nt:user username="${internalUser}">
                                            <meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
                                            <meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
                                            <a href="<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a>                                
                                        </nt:user>
                                    </c:if>  
                                    <c:if test="${internalUser == ''}">
                                        <meta itemprop="name" content="<nt:author-name/>"/>
                                        <a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a>
                                    </c:if>                                     
                                </nt:authors>
                            </div>
                        </nt:conditional-include>

                    </div>    
                </nt:conditional-include>
                </p>
                <div id="redes">
                    <nt:categories>
                        <c:set var="categoriDescription" scope="page"><nt:category-description/></c:set>
                    </nt:categories>
                    <!--identificadores de elementos del listado-->
                    <c:set var="tmp1" value="${news.localpath}"/>
                    <c:set var="tmp2" value="${fn:toLowerCase(tmp1)}" />
                    <c:set var="tmp3" value="${fn:trim(tmp2)}" />
                    <c:set var="tmp4" value="${fn:replace(tmp3,'/', '-')}" />
                    <c:set var="tmp5" value="${fn:replace(tmp4,'noticia_', '')}" />
                    <c:set var="identificador1" value="${fn:substring(tmp5, 12, 27)}" /> 
                    <nt:audio>
                        <ul class="modal">
                            <li class="modaldeslizar"><a class="modal1" id="${identificador1}-share" onClick="openVentana(id);" >Compartir</a></li>
                            <li class="modaldeslizar">  <a href="<nt:audio-path/>" target="_blank" download="teleSUR-Audio.mp3"  class="btn btn-dowloand" role="button" title="Descarga"> Descargar</a></li>
                        </ul>
                        <!--ventana modal para compartir-->
                        <div class="${identificador1}-share" id="ventana">
                            <div class="modalbox form">
                                <h1 class="sharetit">Compartir</h1>
                                <a id="${identificador1}-share" onClick="closeVentana(id);"><div class="close">X</div></a>
                                <cms:include page="TS_Audio_Addthis.jsp" >
                                    <cms:param name="link">${news.link}</cms:param> 
                                    <cms:param name="titulo">${news.titles[news.titleDetailNum]}</cms:param>       
                                </cms:include>
                                <hr>
                                                <script>
                    var playerInstance = jwplayer("audio${identificador1}");
                    playerInstance.setup({
                        file: "<nt:audio-path/>",
                        width: "100%",
                        height: 30
                    });
                   function get_short_url(long_url, login, api_key, func)
			{
			    $.getJSON(
			        "http://api.bitly.com/v3/shorten?callback=?", 
			        { 
			            "format": "json",
			            "apiKey": api_key,
			            "login": login,
			            "longUrl": long_url
			        },
			        function(response)
			        {
			            func(response.data.url);
			        }
			    );
			}

			var login = "telesur";
			var api_key = "R_8925c37a76786f9a5620d8c3f0f9e65c";
			var long_url = "http://www.telesurtv.net${image}";
			
			get_short_url(long_url, login, api_key, function(short_url) {			    
			   document.getElementById('${identificador1}').value = '<iframe frameborder="0" height="180" scrolling="auto" src="http://www.telesurtv.net/seccion/audio/audio/index.html?audio=http://www.telesurtv.net<nt:audio-path/>&imagen='+short_url+'&titulo=${news.titles[news.titleDetailNum]}&category=${categoriDescription}" width="100%"></iframe>';
			});
                </script>
                                <form name="datos">
                                    <input type="text" style="width: 94%;" id="${identificador1}" class="${identificador1}-embed codeEmbed" name="texto" value='<iframe frameborder="0" height="180" scrolling="auto" src="http://www.telesurtv.net/seccion/audio/audio/index.html?audio=http://www.telesurtv.net<nt:audio-path/>&imagen=http://www.telesurtv.net${image}&titulo=${news.titles[news.titleDetailNum]}&category=${categoriDescription}" width="100%"></iframe>'>
                                </form>
                                <input  type="button" class="btn-embed click-embed" value="</> Embed" id="${identificador1}-embed">
                                </br><hr> Previsualización
                                <iframe frameborder="0" height="180" scrolling="auto" src="http://www.telesurtv.net/seccion/audio/audio/index.html?audio=http://www.telesurtv.net<nt:audio-path/>&imagen=http://www.telesurtv.net${image}&titulo=${news.titles[news.titleDetailNum]}&category=${categoriDescription}" width="100%"></iframe>
                            </div>
                        </div>
                </div>
                </li>
                <script>
                    var playerInstance = jwplayer("audio${identificador1}");
                    playerInstance.setup({
                        file: "<nt:audio-path/>",
                        width: "100%",
                        height: 30,
                        events: {
                            onComplete: function () {
                                $(".button-play").empty();
                                $(".button-play").append("<img id='theImg' title='Play' src='/arte/play-ico.png'/>");
                                $('#respuesta-ej5').toggle();
                            }
                        }
                    });
                </script>                                                                                                                       
                </nt:audio>
                <div id="respuesta-ej5" style="display: none;" class="${identificador1}">
                    <div class="repro1">
                        <div id="audio${identificador1}" class="reproductor"></div>
                    </div>
                </div>  
                <p class="no"><a href="#." id="${identificador1}" class="button-play" style="display: block;"><img id="my_image" src="/arte/play.png" title="Play" width="35px" heith="35px" class="img-responsive" alt=""><span></span></a></p>
                <div class="clearfix"> </div>                    
            </ul>
        </c:when>
        <c:otherwise>
            <ul class="list2">
                <%--Asignando valor a variable de post con la imagen para embed--%>               
                <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
                    <div itemprop="" itemscope itemtype="http://schema.org/ImageObject" style="height:105;">                                 
                        <nt:preview-image>
                            <c:set var="imageDescription" scope="page"><nt:image-description/></c:set> 
                            <c:set var="image2" scope="page"><nt:image-path/></c:set>
                        </nt:preview-image>
                    </div>
                </nt:conditional-include>  
                <li class="list1_desc"> 
                    <a class="her" href="<nt:link/>">
                        <h4 itemprop="name headline"><nt:title value="detail"/></h4>
                    </a>
                    <p class="subtitaudio"><nt:sub-title maxlength='155' endchars='...' /></p>

                <p><nt:conditional-include oncondition="${news.hideTime == 'false' || news.hideAuthor == 'false'}">
                    <div class="titfechaut">
                        <nt:conditional-include oncondition="${news.hideTime == 'false'}">
                            <div class="autsearch"><fmt:setLocale value="es_ES"/><fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" /> / </div>
                        </nt:conditional-include>
                        <nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
                            <div class="autsearch" itemprop="author" itemscope itemtype="http://schema.org/Person">
                                <nt:authors>
                                    <c:set var="internalUser" scope="page"> <nt:author-internaluser/></c:set>
                                    <c:if test="${internalUser != ''}">
                                        <nt:user username="${internalUser}">
                                            <meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
                                            <meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
                                            <a href="<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a>                                
                                        </nt:user>
                                    </c:if>  
                                    <c:if test="${internalUser == ''}">
                                        <meta itemprop="name" content="<nt:author-name/>"/>
                                        <a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a>
                                    </c:if>                                     
                                </nt:authors>
                            </div>
                        </nt:conditional-include>
                    </div>    
                </nt:conditional-include>
                </p>    
                <div id="redes2">                          
                    <div class="sharop">
                    </div>
                    <nt:categories>
                        <c:set var="categoriDescription" scope="page"><nt:category-description/></c:set>
                    </nt:categories>
                    <nt:audio>
                        <!--identificadores de elementos en el listado-->
                        <c:set var="tmp1" value="${news.localpath}"/>
                        <c:set var="tmp2" value="${fn:toLowerCase(tmp1)}" />
                        <c:set var="tmp3" value="${fn:trim(tmp2)}" />
                        <c:set var="tmp4" value="${fn:replace(tmp3,'/', '-')}" />
                        <c:set var="tmp5" value="${fn:replace(tmp4,'noticia_', '')}" />
                        <c:set var="identificador2" value="${fn:substring(tmp5, 12, 27)}" />
                        <!--Ventana modal para compartir-->
                        <ul class="modal">
                            <li class="modaldeslizar2"><a class="modal1"  id="${identificador2}-share" onClick="openVentana(id);" >Compartir</a></li>
                            <li class="modaldeslizar2"><a href="<nt:audio-path/>" target="_blank" download="teleSUR-Audio.mp3"  class="btn btn-dowloand btn-dowl2" role="button" title="Descarga"> Descargar</a></li>
                        </ul>
                        <div class="${identificador2}-share" id="ventana">
                            <div class="modalbox form">
                                <h1 class="sharetit">Compartir</h1>

                                <a id="${identificador2}-share" onClick="closeVentana(id);"><div class="close">X</div></a>
                                <cms:include page="TS_Audio_Addthis.jsp" >
                                    <cms:param name="link"><nt:link/></cms:param> 
                                    <cms:param name="titulo"><nt:title value="section"/></cms:param>       
                                </cms:include>
                                                                               <script>
                    var playerInstance = jwplayer("audio${identificador2}");
                    playerInstance.setup({
                        file: "<nt:audio-path/>",
                        width: "100%",
                        height: 30
                    });
                   function get_short_url(long_url, login, api_key, func)
			{
			    $.getJSON(
			        "http://api.bitly.com/v3/shorten?callback=?", 
			        { 
			            "format": "json",
			            "apiKey": api_key,
			            "login": login,
			            "longUrl": long_url
			        },
			        function(response)
			        {
			            func(response.data.url);
			        }
			    );
			}

			var login = "telesur";
			var api_key = "R_8925c37a76786f9a5620d8c3f0f9e65c";
			var long_url = "http://www.telesurtv.net${image}";
			
			get_short_url(long_url, login, api_key, function(short_url) {			    
			   document.getElementById('${identificador2}').value = '<iframe frameborder="0" height="180" scrolling="auto" src="http://www.telesurtv.net/seccion/audio/audio/index.html?audio=http://www.telesurtv.net<nt:audio-path/>&imagen='+short_url+'&titulo=${news.titles[news.titleDetailNum]}&category=${categoriDescription}" width="100%"></iframe>';
			});
                </script>
                                <hr>
                                <form name="datos">
                                    <input type="text" style="width: 94%;" id="${identificador2}" class="${identificador2}-embed codeEmbed" name="texto" value='<iframe frameborder="0" height="180" scrolling="auto" src="http://www.telesurtv.net/seccion/audio/audio/index.html?audio=http://www.telesurtv.net<nt:audio-path/>&imagen=http://www.telesurtv.net${image2}&titulo=${news.titles[news.titleDetailNum]}&category=${categoriDescription}" width="100%"></iframe>'>
                                </form>
                                <input  type="button" class="btn-embed click-embed" value="</> Embed" id="${identificador2}-embed">
                                </br><hr> Previsualización
                                <iframe frameborder="0" height="180" scrolling="auto" src="http://www.telesurtv.net/seccion/audio/audio/index.html?audio=http://www.telesurtv.net<nt:audio-path/>&imagen=http://www.telesurtv.net${image2}&titulo=${news.titles[news.titleDetailNum]}&category=${categoriDescription}" width="100%"></iframe>
                            </div>
                        </div>
                </div>
                </li>
                <script>
                    var playerInstance = jwplayer("audio${identificador2}");
                    playerInstance.setup({
                        file: "<nt:audio-path/>",
                        width: "100%",
                        height: 30,
                        events: {
                            onComplete: function () {
                                // alert("hi!");
                                $(".button-play").empty();
                                $(".button-play").append("<img id='theImg' title='Play' src='/arte/play-ico.png'/>");
                                $('#respuesta').toggle();
                            }
                        }
                    });
                </script>                                                                                                    
                </nt:audio>
                <li class="list1_img">   <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
                    <div itemprop="" itemscope itemtype="http://schema.org/ImageObject" style="height:105;">
                        <a href="<nt:link/>" title="<nt:title value='home' />" class="her">
                            <nt:preview-image>
                                <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                <nt:conditional-include oncondition="${imageDescription != ''}">
                                    <meta itemprop="description" content='<nt:image-description/>'> 
                                    <img itemprop="contentURL" src="<nt:image-path />" width="341" height="220" alt="<nt:image-description/>" />
                                </nt:conditional-include>
                                <nt:conditional-include oncondition="${imageDescription == ''}">
                                    <meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
                                    <img itemprop="contentURL" src="<nt:image-path />" width="341" height="220" alt='${news.titles[news.titleHomeNum]}'/>
                                </nt:conditional-include>
                            </nt:preview-image>
                        </a>
                    </div>
                </nt:conditional-include>                                                    
                <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
                    <cms:img src="/arte/sinFoto_420x260.jpg" width="341" height="220" alt="<nt:title value='home'/>"  />
                </nt:conditional-include></li>
                <div id="respuesta" style="display: none;" class="${identificador2}">
                    <div class="repro">  
                        <div id="audio${identificador2}" class="reproductor"></div>
                    </div>
                </div>
                <p class="no"><a href="#." id="${identificador2}" class="button-play"> <img src="/arte/play.png" title="Play" width="35px" heith="35px" class="img-responsive" alt=""><span></span></a></p>
                <div class="clearfix"> </div>
            </ul>
        </c:otherwise>
    </c:choose>
    <nt:conditional-include onposition="last">
        <c:set var="hayMas" value="false"/>
        <nt:conditional-include oncondition="${ (newslist.size == 6 && newslist.page == 1) || (newslist.size == 6 &&  newslist.page != 1) }">   
            <nt:news-list page="<%=pagina + 1%>" order="user-modification-date desc" advancedfilter="<%=query%>" section="audio" author="<%=filter_autor%>" size="<%=size%>" category="<%=filter_form%>">
                <c:set var="hayMas" value="true"/>
            </nt:news-list>
            <c:if test="${hayMas == 'true'}" >
                <div id="bloque_<%=pagina + 1%>"></div>
                <div class="cont" id="paginador" > 
                    <a class="btnMas1" href="javascript:cargarMasNotas2('<%=pagina + 1%>','<%=size%>', '<%=filter_form%>');">Ver más   </a>
                </div>  
            </c:if>
        </nt:conditional-include>            
    </nt:conditional-include> 
</nt:news-list>
<script type="text/javascript">
    /**
     **  visualizacion del cartel "No se encontraron resultados..."
     */

    if ($(".contblog").length == 0) {
        $(".noResul").css('display', 'block');
    }
</script>