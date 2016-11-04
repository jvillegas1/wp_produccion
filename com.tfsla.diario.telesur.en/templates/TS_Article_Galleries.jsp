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
    <script type="text/javascript">
        function cargarMasNotas(_pagina, _size) {

            div = "#bloque_" + _pagina;
            paginador = "#paginador";

            jQuery(paginador).hide();

            $.post("/system/modules/com.tfsla.diario.telesur.en/elements/TS_Article_more_Photo_Gallery_Page.jsp",
                    {pagina: _pagina, size: _size}, function (data) {
                $(div).html(data);

            });
        }
    </script>
</head>
<body>
<cms:include page="../elements/TS_Common_Header.jsp" >
    <cms:param name="pageTitle">Galerias</cms:param>
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

                 <%--   <cms:include page="../elements/TS_Common_Addthis-Sidebar-ingles.jsp">
                        <cms:param name="link"><nt:link/></cms:param>
                        <cms:param name="titulo"><nt:title value="detail" /></cms:param>
                    </cms:include> --%>

                    <div class="redesInterna">
                        <div class="icoGal"><img src="/arte/mmd-galeria-interna.jpg" alt="galeria"><span><small>${news.imagescount} </small></div>
                        <div class="wpredes">
                         <div class="barra-addthis-contador"  style="margin-left:500px">  
		            <div class="addthis_sharing_toolbox"></div>
			    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55d89d9e86045509" async="async"></script>
		            <script type="text/javascript">var addthis_share = { url_transforms : { shorten: { twitter: 'bitly'} }, shorteners : { bitly : {login:'telesur',apiKey:'R_8925c37a76786f9a5620d8c3f0f9e65c'} }}</script>
			    <script type="text/javascript">var addthis_config = {"data_track_clickback":false};</script>
                              </div>   
                            <%--<cms:include page="../elements/TS_Common_AddThis.jsp" >
                                <cms:param name="link"><nt:link/></cms:param> 
                                <cms:param name="titulo"><nt:title value="section"/></cms:param>       
                            </cms:include> --%>
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
                    <!-- inicio Fecha -->
                      
<div class="fechaGaleria">
	<nt:conditional-include oncondition="${news.hideTime == 'false'}">
	    <c:set var="horaNotaSistema" scope="page">
		<fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${news.lastModificationDate}" />
	   </c:set>
		<jsp:useBean id="horaNotaSistema" type="java.lang.String" />
	    <div class="capdate" itemprop="datePublished">Published 
<fmt:setLocale value="en_US"/> <nt:last-modified format="d MMMM yyyy"/> <%  try {%> <%=CalcularDias(horaNotaSistema)%> <% } catch (Exception e) {
		                                    } %>
</div>
	</nt:conditional-include>
</div>                  
                                        

                    <!-- Fin Fecha -->
                    <!-- inicio valoraciones -->
                    <div class="valorarNews">
                     <%--   <a title="I Like" onclick="makeVoteExterior(this)" style="cursor:pointer;">
                            <cms:img src="/arte/simegusta.jpg" alt="I Like" title="I Like" /> <span><nt:news-positive-valorations allowvaloration="true" /></span>
                        </a> 

                        <a title="I don't Like" onclick="makeVoteExterior(this)" style="cursor:pointer;">
                            <cms:img src="/arte/nomegusta.jpg" style="top:7px" alt="I don't Like" title="I don't Like" /> <span><nt:news-negative-valorations allowvaloration="true" /></span>
                        </a>	--%>		              	
                    </div>     
                    <!-- fin valoraciones -->
                    
                   <!-- banners posicion 1 -->   
                    <div class="banners">
                        <cms:include page="../elements/TS_Common_Banners.jsp">
                            <cms:param name="template">Multimedia</cms:param>
                            <cms:param name="key">Advert-728x90-c</cms:param>
                        </cms:include>
                    </div>
                </div>
                
                 <div class="sharemob">											
			<cms:include page="../elements/TS_Common_redes_mobile.jsp" >
			<cms:param name="link"><nt:link/></cms:param>
			<cms:param name="titulo"><nt:title value="detail" /></cms:param>
			</cms:include>	
		</div>
        
                
                <!--Mas Galerias-->
                <h6>Galleries <img src="/arte/i-imgs.jpg" alt="galerias telesur"></h6>
                <cms:include page="../elements/TS_Article_more_Photo_Gallery_Page.jsp" /> 
            </div>                                                      
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

<%!
    public String CalcularDias(String fechaNota) {
        Date dateNow = new Date();
        SimpleDateFormat dateformatddMMyyyy = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String date_to_string = dateformatddMMyyyy.format(dateNow);

        String fechaInicial = fechaNota;
        String fechaFinal = date_to_string;

        java.util.GregorianCalendar jCal = new java.util.GregorianCalendar();
        java.util.GregorianCalendar jCal2 = new java.util.GregorianCalendar();
        jCal.set(Integer.parseInt(fechaInicial.substring(6, 10)), Integer.parseInt(fechaInicial.substring(3, 5)) - 1, Integer.parseInt(fechaInicial.substring(0, 2)), Integer.parseInt(fechaInicial.substring(11, 13)), Integer.parseInt(fechaInicial.substring(14, 16)), Integer.parseInt(fechaInicial.substring(17, 19)));
        jCal2.set(Integer.parseInt(fechaFinal.substring(6, 10)), Integer.parseInt(fechaFinal.substring(3, 5)) - 1, Integer.parseInt(fechaFinal.substring(0, 2)), Integer.parseInt(fechaFinal.substring(11, 13)), Integer.parseInt(fechaFinal.substring(14, 16)), Integer.parseInt(fechaFinal.substring(17, 19)));

        long diferencia = jCal2.getTime().getTime() - jCal.getTime().getTime();
        double minutos = diferencia / (1000 * 60);
        long horas = (long) (minutos / 60);
        long minuto = (long) (minutos % 60);
        long segundos = (long) diferencia % 1000;
        long dias = horas / 24;

        String[] mesesAnio = new String[12];
        mesesAnio[0] = "31";

        if (jCal.isLeapYear(jCal.YEAR)) {
            mesesAnio[1] = "29";
        } else {
            mesesAnio[1] = "28";
        }
        mesesAnio[2] = "31";
        mesesAnio[3] = "30";
        mesesAnio[4] = "31";
        mesesAnio[5] = "30";
        mesesAnio[6] = "31";
        mesesAnio[7] = "31";
        mesesAnio[8] = "30";
        mesesAnio[9] = "31";
        mesesAnio[10] = "30";
        mesesAnio[11] = "31";
        int diasRestantes = (int) dias;
        int totalMeses = 0;
        int mesActual = jCal.MONTH;
        for (int i = 0; i <= 11; i++) {
            if ((mesActual + 1) >= 12) {
                mesActual = i;
            }
            if ((diasRestantes - Integer.parseInt(mesesAnio[mesActual])) >= 0) {
                totalMeses++;
                diasRestantes = diasRestantes - Integer.parseInt(mesesAnio[mesActual]);
                mesActual++;
            } else {
                break;
            }
        }
        horas = horas % 24;
        String salida = "";

        int diaEntero = Integer.parseInt(String.valueOf(diasRestantes));
        int horasTranscurridas = Integer.parseInt(String.valueOf(horas));
        int minTranscurridos = Integer.parseInt(String.valueOf(minuto));
        System.out.println(diaEntero);

        if (diaEntero > 0) {

            salida = "";

        } else {

            if (horasTranscurridas > 1) {
                salida = "(" + String.valueOf(horas) + " hours " + String.valueOf(minuto) + " minutes ago)";
            } else {
                if ((horasTranscurridas < 2) && (horasTranscurridas != 0)) {
                    salida = "(" + String.valueOf(horas) + " hours " + String.valueOf(minuto) + " minutes ago)";
                } else {
                    if ((minTranscurridos > 1) || (minTranscurridos == 0)) {
                        salida = "(" + String.valueOf(minuto) + " minutes ago)";
                    } else {
                        salida = "(" + String.valueOf(minuto) + " minute ago)";
                    }

                }
            }
        }

        return salida;
    }
%>