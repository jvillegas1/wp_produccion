<%@ include file="TS_Common_Libraries.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<nt:news>
    <% String width = "789";
        String height = "440";
    %>
    <nt:conditional-include oncondition="${news.sectionname == 'imreporter'}">
        <%
            width = "540";
            height = "304";
        %>
    </nt:conditional-include>
    <nt:conditional-include oncondition="${news.detailPreview == 'imagen'}">
        <nt:conditional-include oncondition="${news.imagescount > 0}">
            <nt:image-gallery>
                <div class="wpGaleria">
                    <div class="contImgGal">
                        <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">                      
                            <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>           
                            <nt:conditional-include oncondition="${imageDescription != ''}">                    
                                <img itemprop="" src="<nt:image-path />" alt='<nt:image-description/>' title='<nt:image-description/>' " />
                            </nt:conditional-include>
                            <nt:conditional-include oncondition="${imageDescription == ''}">
                                <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                                <img itemprop="contentURL" src="<nt:image-path />" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}' " />
                            </nt:conditional-include>
                        </div> 

                    </div>   
                    <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">                      
                        <c:set var="imageSource" scope="page"><nt:image-source /></c:set>           
                        <nt:conditional-include oncondition="${imageSource != ''}">    
                            <div class="infoGal overflow">
                                <nt:image-description/>
                                <span>Foto:<nt:image-source /></span>
                            </div>
                        </nt:conditional-include>
                        <nt:conditional-include oncondition="${imageSource == ''}">    
                            <div class="infoGal overflow">
                                <nt:image-description/>
                                <span><nt:image-source /></span>
                            </div>
                        </nt:conditional-include>
                    </div>
                </div>
            </nt:image-gallery>
        </nt:conditional-include>
    </nt:conditional-include>
    <nt:conditional-include oncondition="${news.imagescount == 0 && news.videoscount == 0}">
        <div class="wpGaleria">
            <nt:preview-image>
                <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">             
                    <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                    <nt:conditional-include oncondition="${imageDescription != ''}">    
                        <img itemprop="contentURL" src="<nt:image-path /> " alt='<nt:image-description/>' title='<nt:image-description/>'>
                        <div class="caption" content='<nt:image-description/>'>
                        </div>
                    </nt:conditional-include>
                    <nt:conditional-include oncondition="${imageDescription == ''}">
                        <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                        <img itemprop="contentURL" src="<nt:image-path />" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}'>
                    </nt:conditional-include>   
                </div>
            </nt:preview-image> 
        </div>
        </div>
    </nt:conditional-include>
    <!--Fecha--> 
    <div class="fechaGaleria">
        <nt:conditional-include oncondition="${news.hideTime == 'false'}">
            <c:set var="horaNotaSistema" scope="page">
                <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${news.lastModificationDate}" />
            </c:set>
            <jsp:useBean id="horaNotaSistema" type="java.lang.String" />

            <div class="capdate" itemprop="datePublished">Publicado 
                <fmt:setLocale value="es_ES"/> 

                <fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" /> 
                <%  try {%> <%=CalcularDias(horaNotaSistema)%> <% } catch (Exception e) { %>   <% }%><!--<fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${news.lastModificationDate}" />--></div>
        </nt:conditional-include>
    </div>
    <!--fin fecha-->

    <!-- inicio valoraciones -->
    <%--<div class="valorarNews">
        <a title="Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;">
            <cms:img src="/arte/simegusta.jpg" alt="Me Gusta" title="Me Gusta" /> <span><nt:news-positive-valorations allowvaloration="true" /></span>
        </a> 

        <a title="No Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;">
            <cms:img src="/arte/nomegusta.jpg" style="top:7px" alt="No Me Gusta" title="No Me Gusta" /> <span><nt:news-negative-valorations allowvaloration="true" /></span>
        </a>			              	
    </div>--%>

    <!-- fin valoraciones -->    
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
                        Por <span class="itacaput"><a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a></span>
                    </c:if>
                    <br/>
                </nt:authors>
            </div>
        </nt:conditional-include>

    </div>
</nt:news>
<script type="text/javascript">
    $(window).load(function () {
        //error
        $('.prev, .next').removeAttr('style');
    })
</script>
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
                salida = "(Hace " + String.valueOf(horas) + " horas " + String.valueOf(minuto) + " minutos)";
            } else {
                if ((horasTranscurridas < 2) && (horasTranscurridas != 0)) {
                    salida = "(Hace " + String.valueOf(horas) + " hora " + String.valueOf(minuto) + " minutos)";
                } else {
                    if ((minTranscurridos > 1) || (minTranscurridos == 0)) {
                        salida = "(Hace " + String.valueOf(minuto) + " minutos)";
                    } else {
                        salida = "(Hace " + String.valueOf(minuto) + " minuto)";
                    }

                }
            }
        }

        return salida;
    }
%>