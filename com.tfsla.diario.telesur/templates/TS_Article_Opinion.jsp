                 <%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<!doctype html>
<html>
    <head>

    <cms:include page="../elements/TS_Common_Head.jsp" >
        <cms:param name="template">article</cms:param>       
    </cms:include>	

    <nt:comments-init/>	

</head>

<body>

<cms:include page="../elements/TS_Common_Header.jsp" >
    <cms:param name="pageTitle">Nota</cms:param>  
    <cms:param name="pageSeccion"></cms:param>
    <cms:param name="subMenu">no</cms:param>   
    <cms:param name="agenda">si</cms:param>
    <cms:param name="latest">no</cms:param>      
</cms:include>

<nt:news>

    <%--<div class="barratitle" style="margin-top:-15px">
            <div class="wrapper">
                    <div class="row clear">
                            <div class="col">
                                    <div class="titredbar"> Nota </div>
                            </div>
                    </div>
            </div>
    </div>--%>

    <!-- Container -->
    <div id="container">
        <cms:include page="../elements/TS_Common_LiveBox.jsp" />
        <!--iframe vacio-->
        <c:set var="iframefull"><nt:iframe/></c:set>										
        <c:if test="${iframefull == ''}">
            <!--wrapper--> 
            <div class="wrapper">
            
             <div class="sharemob">											
			<cms:include page="../elements/TS_Common_redes_mobile.jsp" >
			<cms:param name="link"><nt:link/></cms:param>
			<cms:param name="titulo"><nt:title value="detail" /></cms:param>
			</cms:include>	
		</div> 

                <!-- side bar -->

             <%--   <cms:include page="../elements/TS_Common_Addthis-Sidebar.jsp">
                    <cms:param name="link"><nt:link/></cms:param>
                    <cms:param name="titulo"><nt:title value="detail" /></cms:param>
                </cms:include> --%>

                <!-- Banner 1 -->
                <div class="row clear marginchica"> 
                    <div class="banners pos0">
                        <cms:include page="../elements/TS_Common_Banners.jsp">
                            <cms:param name="template">WorldPage2</cms:param>
                            <cms:param name="key">Advert-950x90</cms:param>
                        </cms:include>
                    </div>     
                    <div class="bannerMobile">
                        <cms:include page="../elements/TS_Common_Banners.jsp">
                            <cms:param name="template">WorldPage2</cms:param>
                            <cms:param name="key">Advert-468x60-a-mobile</cms:param>
                        </cms:include>
                    </div>
                </div>
                
              


                <div itemscope itemtype="http://schema.org/Article">
                    <meta itemprop='isFamilyFriendly' content='True'/>
                    <meta itemprop='url sameAs' content='<nt:link/>'/>
                    <meta itemprop="interactionCount" content="UserComments:${news.commentcount}"/>

                    <!-- Destacado -->
                    <div class="row clear">

                        <!-- inicio worldtop -->
                        <div class="col-620 cont">				

                            <div class="nworldtop cont">
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

                                <div class="blue">
                                    <a class="her"><h1 itemprop="name headline"><nt:title value="detail"/></h1></a>	
                                    <nt:edit-buttons hasNew="true" hasDelete="true"/>							
                                </div>

                                <%--autor por opinion--%>


                                <div class="capcredit" itemprop="publisher">
                                    <!--<a class="her">
                                            <nt:sources>
                                                    <nt:source-name/><br/>
                                            </nt:sources>
                                    </a>-->
                                </div>
                                <c:set var="idsection"><nt:section-name/></c:set>										
                                <c:if test="${idsection == 'opinion'}">
                                    <nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
                                        <div class="capaut" itemprop="author" itemscope itemtype="http://schema.org/Person">
                                            <nt:authors>
                                                <c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
                                                <c:set var="authorName" scope="page"><nt:author-name/></c:set>
                                                <c:if test="${internalUser != ''}">
                                                    <nt:user username="${internalUser}">
                                                        <meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
                                                        <meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
                                                        <span style="font-size:12px">Por:</span> <span class="itacaput"><a href="<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a></span>									
                                                    </nt:user>
                                                </c:if>	 
                                                <c:if test="${internalUser == '' && authorName != ''}">
                                                    <meta itemprop="name" content="<nt:author-name/>"/>
                                                    <span style="font-size:12px">Por:</span> <span class="itacaput"><a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a></span>
                                                </c:if>
                                                <br/>
                                            </nt:authors>
                                        </div>
                                    </nt:conditional-include>
                                </c:if>

                            </div>

                            <%--fin de autor--%>
                            <div class="vworldtop cont">
                                <div class="bloque-multimedia world-1">
                                    <nt:conditional-include oncondition="${news.detailPreview != 'iframe'}">
                                        <cms:include page="../elements/TS_Article_Multimedia.jsp" />
                                    </nt:conditional-include>
                                    <nt:conditional-include oncondition="${news.detailPreview == 'iframe'}" >
                                        <nt:iframe/>
                                    </nt:conditional-include>
                                </div>

                                <div class="capworldtop">
                                    <div class="caplw">
                                        <nt:conditional-include oncondition="${news.hideTime == 'false'}">
                                            	<c:set var="horaNotaSistema" scope="page"><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${news.lastModificationDate}" /></c:set>
                                                <jsp:useBean id="horaNotaSistema" type="java.lang.String" />
        					<div class="capdate" itemprop="datePublished">Publicado <fmt:setLocale value="es_ES"/> <fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" />   <%  try{ %> <%=CalcularDias(horaNotaSistema)%> <% } catch (Exception e){ %>   <% } %><!--<fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${news.lastModificationDate}" />--></div>
                                       </nt:conditional-include>
                                    </div>
                                   
                            	<div class="barra-redes">   
                                     <cms:include page="../elements/TS_Common_Barra_Comentarios.jsp" >
                                     <cms:param name="link"><nt:link/></cms:param>
                                     </cms:include>                                     
                               	     </div> 
                                    
                                    
                                    
                                    <div class="caprw">
                                        <%--<div class="gblogrs">		   
                                            <div class="num"><span class="fb-comments-count" data-href="http://www.telesurtv.net<nt:link/>"></span></div>
                                            <cms:img src="/arte/globe-red.png" width="27" height="23" alt="Comentarios" title="Comentarios" /> 
                                            <a href="#comsup"  alt="Comentarios" title="Comentarios" class="readblog">+</a>                               									
                                        </div>	--%>						

					
                                        <%-- <cms:include page="../elements/TS_Common_AddThis.jsp" >
                                                <cms:param name="link"><nt:link/></cms:param>
                                                <cms:param name="titulo"><nt:title value="detail" /></cms:param>
                                        </cms:include> --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- fin worldtop -->


                        <!-- inicio widget interno Cxense -->
                        <div class="col-300">
                            <div class="row clear"> 
                                <cms:include page="../elements/TS_Common_interna_bloque.jsp"> </cms:include>
                            </div>
                        </div>
                        <!-- ifin widget interno Cxense -->


                        <!-- inicio colmna izq col-six -->        
                        <div class="col-six">
                            <div class="cont bordercountry">
                                <div class="dest cont">

                                    <nt:conditional-include oncondition="${news.hideCopete == 'false'}">
                                        <div class="subtitle" itemprop="description alternativeHeadline"><nt:sub-title/></div>                                        
                                    </nt:conditional-include>

                                    <div class="txt_newworld" itemprop="articleBody">																	
                                        <nt:body-splitter>
                                            <nt:polls-dynamic-position style="TS-ES/NOTA"> </nt:polls-dynamic-position>			
                                            <c:set var="bodyP" scope="page"><nt:body-paragraph/></c:set>
                                                <%-- Verificar si El parrafo contiene un Iframe, que a su vez sea un Video de Youtube, modifica sus atributos. Coloca que  pertenece a la clase:'vid-youtube', height='100%' y width='100%' --%> 
                                                <%String bodyParagrahp=pageContext.getAttribute("bodyP").toString();
                                                String bodyPa="";
                                                if((bodyParagrahp.contains("<iframe ")) && (bodyParagrahp.contains("youtube"))){ 
                                                        bodyParagrahp=bodyParagrahp.replace("height="," class='vid-youtube' height=");										 	 	
                                                        String[] cortos= bodyParagrahp.split(" ");
                                                        for (int i = 0; i < cortos.length; i++) {
                                                                if (cortos[i].contains( "height=")) {
                                                                        cortos[i]="height='100%'";
                                                                }
                                                        if (cortos[i].contains( "width=")) {
                                                                cortos[i]="width='100%'></iframe></p>";
                                                        }
                                                        bodyPa=bodyPa+" "+ cortos[i];
                                                        }
                                                bodyParagrahp=bodyPa;
                                                } 
                                                %>
                                              
                                                
                                               <% if((bodyParagrahp.contains("<figure ")) && (bodyParagrahp.contains("<img"))){
                                               bodyParagrahp=bodyParagrahp.replace("src="," src='../arte/grey.gif' data-original=");	
                                               }%>
                                                  <%=bodyParagrahp%>								
                                        </nt:body-splitter> 																		
                                    </div>

                                    <nt:conditional-include oncondition="${news.detailPreview != 'iframe'}" >
                                        <nt:iframe/>
                                    </nt:conditional-include>

                                    <%--<div class="valorarNews">
                                        <a title="Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;">
                                            <cms:img src="/arte/simegusta.jpg" alt="Me Gusta" title="Me Gusta" /> <span><nt:news-positive-valorations allowvaloration="true" /></span>
                                        </a> 

                                        <a title="No Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;">
                                            <cms:img src="/arte/nomegusta.jpg" style="top:7px" alt="No Me Gusta" title="No Me Gusta" /> <span><nt:news-negative-valorations allowvaloration="true" /></span>
                                        </a>		              	
                                    </div>--%>

                                    <nt:tags-list separator=",">
                                        <nt:conditional-include onposition="1">
                                            <div class="tagBarNews" itemprop="keywords" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">			              	
                                                <h4>Tags</h4>
                                        </nt:conditional-include>			                    
                                        <a href="/tags/<nt:tags-item/>" alt="<nt:tags-item/>" title="<nt:tags-item/>" itemprop="title"><nt:tags-item/></a>
                                        <nt:conditional-include onposition="last">
                                            </div>						
                                        </nt:conditional-include>
                                    </nt:tags-list>	
                                    
                                    <nt:people-list separator=",">	
                                    <nt:conditional-include onposition="1">				
					<div class="tagBarNews" itemprop="keywords" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">			              	
                                       		<h4>Persona</h4>
                                    	</nt:conditional-include>	
					<a href="/persona/index.html?personId=<nt:people-item-id/>&personName=<nt:people-item/>" alt="<nt:people-item/>" title="<nt:people-item/>" itemprop="title"><nt:people-item/></a>
					<nt:conditional-include onposition="last">
					   </div>	
					</nt:conditional-include>
				    </nt:people-list>
                                   	

                                    <nt:polls-fixed-position style="TS-ES/NOTA"> </nt:polls-fixed-position>	
                                    
								<c:set var="i" value="1"/>
								<nt:files>
								 	<nt:conditional-include onposition="first">
										<div class="filesNews" >			              	
											<h4>Documentos adjuntos</h4>
											<ul>
								 	</nt:conditional-include>
								 			<c:set var="x" value="archivoAdjunto[${i}]/mostrarEnHome[1]" />
								 			<nt:conditional-include oncondition="${news.genericElementValue[x] == 'true' }">
										 		<c:set var="icon"><nt:file-icon/></c:set>								 		
										 		<nt:conditional-include oncondition="${icon == 'PDF'}" >
										 			<li><a href="<nt:file-path/>" alt="<nt:file-title/>" title="<nt:file-title/>" target="_blank"><cms:img src="/arte/pdf.png" alt="PDF" title="PDF" /> <nt:file-title/></a></li>
										 		</nt:conditional-include>	
										 		<nt:conditional-include oncondition="${icon != 'PDF'}" >
										 			<li><a href="<nt:file-path/>" alt="<nt:file-title/>" title="<nt:file-title/>" target="_blank"> <nt:file-title/></a></li>
										 		</nt:conditional-include>
										 	</nt:conditional-include>
										 	<c:set var="i">${i+1}</c:set>
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
                                            <c:set var="idsection"><nt:section-name/></c:set>										
                                            <c:if test="${idsection != 'opinion'}">
                                                <nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
                                                    <div class="capaut" itemprop="author" itemscope itemtype="http://schema.org/Person">
                                                        <nt:authors>
                                                            <c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
                                                            <c:set var="authorName" scope="page"><nt:author-name/></c:set>
                                                            <c:if test="${internalUser != ''}">
                                                                <nt:user username="${internalUser}">
                                                                    <meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
                                                                    <meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
                                                                    Por: <span class="itacaput"><a href="<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a></span>									
                                                                </nt:user>
                                                            </c:if>	 
                                                            <c:if test="${internalUser == '' && authorName != ''}">
                                                                <meta itemprop="name" content="<nt:author-name/>"/>
                                                                Por: <span class="itacaput"><a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a></span>
                                                            </c:if>
                                                            <br/>
                                                        </nt:authors>
                                                    </div>
                                                </nt:conditional-include>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>

                                <div class="separador margensep"></div>
                            </div>																

                            <!-- Slider MOBILE -->
                            <cms:include page="../elements/TS_Article_RelatedStoriesMobile.jsp" />   


                        </div>
                        <!-- fin colmna izq col-six -->

                        <!--COLUMNA DERECHA -->
                        <cms:include page="../elements/TS_Common_RightColumn.jsp" >
                            <cms:param name="template">OpinionPage</cms:param>
                        </cms:include>	
                        <!--FIN COLUMNA DERECHA -->
                    </div>
                    <!-- Fin Destacado -->
                </div>
                <!-- Fin SCHEMAS -->

                <!--sliderlatest video-->
                <div class="row clear desktop">
                    <div class="cont">
                       <cms:include page="../elements/TS_Article_Videos.jsp" /> 
                      <%--   <div class="blue tt-latest">Copa América Centenario</div></br> 				        
                       <cms:include page="../elements/TS-Widget-DataFactory-CopaAmerica.jsp" /> 
                      		<div class="blue tt-latest">EuroCopa 2016</div></br> 				         
                      <cms:include page="../elements/TS-Widget-DataFactory-Eurocopa.jsp" /> 
                    </div> --%>
                </div>
                <!--fin sliderlatest video-->

                <div class="row clear"> 
                    <div class="banners"> 
                        <cms:include page="../elements/TS_Common_Banners.jsp">
                            <cms:param name="template">WorldPage2</cms:param>
                            <cms:param name="key">Advert-728x90-d</cms:param>
                        </cms:include>
                    </div>  
                </div>    


                <!-- Comment -->

                <a name="comsup"> </a>

                <cms:include page="../elements/TS_Article_Comments.jsp" />

                <!-- Banner 2 -->
                <div class="row clear"> 
                    <div class="cont ">
                      <div class="col-mid3 colmar">			
                            <cms:include page="../elements/TS_Common_Banners.jsp">
                                <cms:param name="template">WorldPage2</cms:param>
                                <cms:param name="key">Show-Promotion-460x260-a</cms:param>
                            </cms:include>
                        </div>
                        <div class=" col-mid3">
                            <cms:include page="../elements/TS_Common_Banners.jsp">
                                <cms:param name="template">WorldPage2</cms:param>
                                <cms:param name="key">Show-Promotion-460x260-b</cms:param>
                            </cms:include>
                        </div>
                    </div>
                </div>    

            </div><!--wrapper-->
        </c:if>	<!--Fin if iframe-->
        <c:if test="${iframefull != ''}">
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

        </c:if>
    </div><!--conteiner-->
</nt:news>

<cms:include page="../elements/TS_Common_Footer.jsp" />

</body>
<script type="text/javascript">
<!-- script menu -->
    var menu = 0
    $('#header .btnMobile').click(function () {
        if (menu == 0) {
            $('#nav').slideDown(750);
            menu++
        } else {
            $('#nav').slideUp(750, function () {
                $('#nav').removeAttr('style');
            });
            menu--
        }
    });
</script>
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