<%
    /**
    * Search Result
    * Muestra de Resultados de opciones selecciondas en Search y Shearch by tags 
    * Seleccion de Orden Most Relevat ( Prioridad ) y Most Recent ( Ultimos )
    *
    */
%>
<%@ include file="TS_Common_Libraries.jsp" %>

<%
/**
* Create a JSP action element
*/

org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

request.setCharacterEncoding("UTF-8");

    /**
    * Asigna y valida elemntos que ingresan por post o get
    */

    //si viene t es navegacion por tags
    String t    = ( request.getParameter("t") != null ) ? request.getParameter("t") : "";

    //variables del post
    String search_form = ( request.getParameter("search_form") != null ) ? request.getParameter("search_form") : "";
    String filter_form = ( request.getParameter("filter_form") != null ) ? request.getParameter("filter_form") : "";
    String published_form = ( request.getParameter("published_form") != null ) ? request.getParameter("published_form") : "";
    String section_form = ( request.getParameter("section_form") != null ) ? request.getParameter("section_form") : "";
    String submit = ( request.getParameter("submit") != null ) ? request.getParameter("submit") : "";

    String order    = ( request.getParameter("order") != null ) ? request.getParameter("order") : "LAST";
    int pag     = ( request.getParameter("pag") != null ) ? Integer.parseInt(request.getParameter("pag")) : 1;
    int size    = ( request.getParameter("size") != null ) ? Integer.parseInt(request.getParameter("size")) : 10;

    /**
    * Orden de Busqueda
    */
    if ( order.equals("LAST") ) order = "user-modification-date desc";
    if ( order.equals("RELE") ) order = "user-modification-date asc";
    if ( order.equals("null") ) order = "user-modification-date";

    /**
    *
    * Verifica si la busqueda es por Search o Search por tags
    * Y asigna parametros para aplicar en los newslist correspondientes
    *
    */

      String q = search_form; 
      String query = "";

	// Reemplazo caracteres que rompen las búsquedas
	// Busqueda NORMAL
	q= q.replaceAll("Ã¡", "á").replaceAll("Ã", "Á").replaceAll("Ã©", "é").replaceAll("Ã", "É").replaceAll("Ã­", "í").replaceAll("Ã", "Í");
	q= q.replaceAll("Ã³", "ó").replaceAll("Ã", "Ó").replaceAll("Ãº", "ú").replaceAll("Ã", "Ú").replaceAll("Ã±", "ñ").replaceAll("Ã", "Ñ");
		
	q= q.replaceAll("\\:","").replaceAll("\\!","").replaceAll("\\¡","").replaceAll("\\?","").replaceAll("\\\"","");
	q= q.replaceAll("\\¿","").replaceAll("\\\'","").replaceAll("\\,","").replaceAll("\\@","");
	
	
	// Busqueda por TAGS
	t= t.replaceAll("Ã¡", "á").replaceAll("Ã", "Á").replaceAll("Ã©", "é").replaceAll("Ã", "É").replaceAll("Ã­", "í").replaceAll("Ã", "Í");
	t= t.replaceAll("Ã³", "ó").replaceAll("Ã", "Ó").replaceAll("Ãº", "ú").replaceAll("Ã", "Ú").replaceAll("Ã±", "ñ").replaceAll("Ã", "Ñ");
		
	t= t.replaceAll("\\:","").replaceAll("\\!","").replaceAll("\\¡","").replaceAll("\\?","").replaceAll("\\\"","");
	t= t.replaceAll("\\¿","").replaceAll("\\\'","").replaceAll("\\,","").replaceAll("\\@","");

         if (t.equals("") || !q.equals("")){
            // Online-Offline
            String q_alguna = "";
            
            //##############################################################################################################
            //LÓGICA DE BÚSQUEDA Y PONDERACIÓN DE RESULTADOS

            query += "( ";
            query += "titulo:( \"" + q.trim() + "\" )^5 OR ";
            query += "volanta:( \"" + q.trim() + "\" )^5 OR ";
            query += "copete:( \"" + q.trim() + "\" )^5 OR ";
            query += "keywords:(\"" + q.trim() + "\")^4 OR ";
            query += "cuerpo:( \"" + q.trim()+"\"~0.8 )^1 ";
             
            //condiciones para búsquedas por palabras separadas en titulo, keywords y autor
            StringTokenizer stk = new StringTokenizer(q, " ");
            int aux=0;
            while (stk.hasMoreTokens()) {
                String palabra = stk.nextToken().trim();
                if ( !palabra.equals("") )
                    if ( !q_alguna.equals("") )
                        q_alguna = q_alguna + "+" + palabra + "~0.8 ";
                      else
                        q_alguna = palabra + "~0.8 ";

                aux++;
            }
            if(aux>1)
            {
                query += "OR titulo:( " + q_alguna + ")^1 OR ";
                query += "volanta:( " + q_alguna + ")^1 OR ";
                query += "copete:( " + q_alguna + ")^1 OR ";
                query += "keywords:( " + q_alguna + ")^1 "; 
            }

            query += ")";
        }
        else
        {
                /**
                * Search por Tags
                */    

                query = "keywords:(\"" + t.trim().replace("-"," ") + "\")"; 
        }
	query += " AND NOT categoria :(/system/categories/SubSecciones/avances/)";
	query += " AND NOT seccion:( shows)";
    //############################################################################################################## 
%>
<!--Search Advaced Result -->

<% if("Advanced Search".equals(submit)){%>

<!--search result advaced -->
<!--inicio search advanced -->
        <link rel="stylesheet" href="/system/modules/com.tfsla.diario.telesur/resources/css/xcs.css" media="screen" />

        <!--<div class="well">
            <input type="text" id="parameter">
            <input type="button" id="buscar" value="Buscar">
        </div>-->
	
    <div class="headers red">Advanced Search Results </div>
	<div id="first-container">
		<div class="simple-pagination-page-x-of-x"></div>
		<div class="simple-pagination-showing-x-of-x"></div>
		<table>
			<tbody></tbody>
		</table>
		<div class="paginaSearch"> <br>
			<div class="my-navigation">
				<div class="simple-pagination-first"></div>
				<div class="simple-pagination-previous"></div>
				<div class="simple-pagination-page-numbers"></div>
				<div class="simple-pagination-next"></div>
				<div class="simple-pagination-last"></div>
			</div>
			<div class="simple-pagination-page-x-of-x"></div>
			<div class="simple-pagination-showing-x-of-x"></div>
		</div>
	</div>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="/system/modules/com.tfsla.diario.telesur/resources/js/jquery-simple-pagination-plugin.js"></script>
        <script>
        </script>

        <script>
            $(document).ready(function () {

            

                    var texto = "";
                    var tag = $("#parameter").val();
                    $("table tbody").text("Cargando...");
                    console.log("Buscando");
                    $.ajax({
                        // type: 'GET',
                        url: 'http://sitesearch.cxense.com/api/search/9222352440756601878?p_aq=query%28%22' + tag + '%22%29%20and%20not%20filter%28category0:%22shows%22%29%29%20or%20not%20filter%28category0:%22avances%22%29%29&p_c=50&p_rs=fl:[title,url,tls-section,section,description,category0,dominantimage]&media=json',
                        jsonp: 'p_callback',
                        dataType: 'jsonp',
                        success: function (datos) {
                            console.debug(datos);
                            var texto = "";
                            console.debug(texto);
                            $.each(datos.matches, function (i, item) {

                                if (i < 0) {
                                    texto += "<tr  style='display: table-row;'><td><p>" + "No se encontraron resultados" + "</p>";
                                } else {
                                    texto += "<tr><td>" + "" + "</p>";
                                }

                                texto += "<div class='ressearch'>";
                                texto += "<ul>";
                                texto += "<li>";
                                texto += "<div class='imgsearch'>";
                                texto += "<a href='" + item.document.fields.url + "'>" + "<img src='" + item.document.fields.dominantimage + "' />" + "</a>";
                                texto += "</div>";//fin imgsearch
                                texto += "<div class='txtsearch1'";
                                texto += "<div class='titsearch'>";
                                texto += "<a href='" + item.document.fields.url + "'>" + "<p class='titsearch2'>" + item.document.fields.title + "</p>" + "</a>";
                                texto += "</div>";
                                texto += "<div class='contsearch'>" + item.document.fields.description + "</div>";
                                texto += "</div>";//fin de txtsearch
                                texto += "</li>";
                                texto += "</ul>";
                                texto += "</div>";//fin ressearch
                              
                                texto += "</td></tr>";
                            });
		              $("table tbody").html("");
		              
                            $("table tbody").append(texto);

                            $('#first-container').simplePagination({
                                items_per_page: 5,
				number_of_visible_page_numbers: 10,
				first_content: '<img src="/arte/logo-side.png?__scale=w:65,h:14" width="65" height="14" title="teleSur" alt="teleSur">',
				use_previous: false,
				use_next: false,
				use_last: false,
				use_page_x_of_x: false,
				use_showing_x_of_x: false,
				items_per_page_content: false,
				use_specific_page_list: false,
				use_items_per_page: false
                            });


                        },
                        error: function (e) {
                            console.log('Error: ' + JSON.stringify(e, null, 4));
                        }

                    });
return false;
              

            });
        </script>
        
<!--fin search advanced-->
    

<% } else {%>

<!--Fin Search Advaced Result -->


<% 
	int cont=0;
	if(t.equals("") || !q.equals("")){
%>
	<!--/**
        *
        * Paginador
        * 
        * Obtiene cantidad paginas
        *
        */ -->  
	<nt:news-list size="200" order="<%=order %>" advancedfilter='<%=query %>' from="<%=published_form %>" section="<%=section_form %>" category="<%=filter_form %>" state="publicada" publication="9">
		<% cont++; %>
	</nt:news-list> 
<% 	
	} else { 
%> 
	<!--/**
        *
        * Paginador
        * 
        * Obtiene cantidad paginas
        *
        */ --> 
	<nt:news-list size="200" order="<%=order %>" tags="<%=query%>" from="<%=published_form %>" section="<%=section_form %>" category="<%=filter_form %>" state="publicada" publication="9">
		<% cont++; %>
	</nt:news-list> 
<%
 	}
%>   
<div class="row clear">
		
	<script type="text/javascript">
	    $("#textFilter").html($("#filter option:selected").text());
	    $("#textPublished").html($("#published option:selected").text());
	    $("#textSection").html($("#section option:selected").text());
	</script>
</div>

<!-- Search Result -->
<div class="row clear">
	<div class="contS">
	<% if(pag == 1 ){ %>	
		<div class="titlereg">Search Results <%--=q %> -- <%=t %> - <%=query %> -<%--=size %> - <%=query %> - <%=index %> - <%=pag %> - <%=result %> - <%=section_form --%></div>
	<% 	} %>	
		<div class="noResultado" style="display:none">
			<h2 class="noResul">No matches found...</h2>
			<div class="pieblog" style="border-top:0"></div>
		</div>
		<div class="ressearch" itemscope itemtype="http://schema.org/Article">
			<ul>
	
			<%
			if(t.equals("") || !q.equals("")){
			%>
			
			<!--/**
			*
			* Newslist para Search
			*
			*/ --> 
	
			<nt:news-list order="<%=order %>" size="<%=size%>" advancedfilter='<%=query %>' from="<%=published_form %>" page="<%=pag %>" section="<%=section_form %>" category="<%=filter_form %>" state="publicada" publication="9">
				
				<c:set var="videoscount" scope="page">${news.videoscount}</c:set>
				<jsp:useBean id="videoscount" type="java.lang.String" />               
	
				<li>
					<div class="imgsearch" itemscope itemtype="http://schema.org/ImageObject">
					        <a href="${news.link}" class="her" alt='<nt:title value="home"/>'> 
							<nt:preview-image>
								<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
									<nt:conditional-include oncondition="${imageDescription != ''}">
										<meta itemprop="description" content='<nt:image-description/>'>	
										<img itemprop="contentURL" src="<nt:image-path width="170" height="105" scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>'>
									</nt:conditional-include>
									<nt:conditional-include oncondition="${imageDescription == ''}">
										<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
										<img itemprop="contentURL" src="<nt:image-path width="170" height="105" scaletype='2'/>" alt='${fn:escapeXml(news.title)}' title='${fn:escapeXml(news.title)}'>
									</nt:conditional-include>					
							</nt:preview-image>
							<nt:conditional-exclude oncondition="${news.imagepreviewset}">
								<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
								<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt='${fn:escapeXml(news.title)}' title='${fn:escapeXml(news.title)}' />
							</nt:conditional-exclude>
					        </a>
					</div>
					
					<div class="txtsearch1">
						<div class="datesearch">
							<p class="fechasearch" itemprop='datePublished'> <nt:last-modified format="MMMM d, yyyy" /></p>
							<% if(!videoscount.equals("0") && !videoscount.equals("") && !videoscount.equals(" ") && !videoscount.equals(null)){ %><a class="imgsearch2 desktop"><cms:img src="/arte/playvideo.png" width="22" height="16" alt="Esta nota tiene video" title="Esta nota tiene video" /></a> <% } %>
						</div>
					
						<div class="titsearch">
							<p class="titsearch2" itemprop="name headline"><a href="${news.link}" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><nt:title value="home"/></a></p> 					                
							<nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
								<p class="autsearch" itemprop="author" itemscope itemtype="http://schema.org/Person">									
									<nt:authors>
										<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
										<c:if test="${internalUser != ''}">
											<nt:user username="${internalUser}">
												<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
												<meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
												<a href="/english<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a>								
											</nt:user>
										</c:if>	 
										<c:if test="${internalUser == ''}">
											<meta itemprop="name" content="<nt:author-name/>"/>
								    			<a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a>
								    		</c:if>							    		
									</nt:authors>									
								</p>
							</nt:conditional-include>
						</div>
						<div class="clear"></div>
						
						<nt:edit-buttons hasNew="true" hasDelete="true"/> 
						
						<div class="contsearch" itemprop="description alternativeHeadline"><nt:sub-title maxlength="150" fullword="true" endchars="..."/></div>
					</div>
				</li>
				<nt:conditional-include onposition="last">
				        <c:set var="hayMas" value="false"/>
				         <nt:conditional-include oncondition="${ (newslist.size == 10 && newslist.page == 1) || (newslist.size == 10 &&  newslist.page != 1) }">  
						<nt:news-list order="<%=order %>" size="<%=size%>" advancedfilter='<%=query %>' from="<%=published_form %>" page="<%=pag %>" section="<%=section_form %>" category="<%=filter_form %>" state="publicada" publication="9">

				                <c:set var="hayMas" value="true"/>
				         </nt:news-list>	   
					            <c:if test="${hayMas == 'true'}" >
					                <div id="bloque_<%=pag + 1%>"></div>
					           
					                <div class="contS" id="paginador" > 
					                    <a class="btnMas1" href="javascript:cargarMasNotas2('<%=pag + 1%>', '<%=size%>', '<%=q%>');">See more  </a>
					                </div>  
					            </c:if>
				        </nt:conditional-include>            
				   </nt:conditional-include>
			</nt:news-list>   
			
	               <%
	                 }else{
	               %>      
	
	                <!--/**
	                *
	                * Newslist para Search por Tags
	                *
	                */ -->                
	
			<nt:news-list order="<%=order %>" size="<%=size%>" tags="<%=query%>" from="<%=published_form %>" page="<%=pag %>" section="<%=section_form %>" category="<%=filter_form %>" state="publicada" publication="9"> 
			
				<c:set var="videoscount2" scope="page">${news.videoscount}</c:set>
				<jsp:useBean id="videoscount2" type="java.lang.String" />
						
				<li>
					<div class="imgsearch" itemscope itemtype="http://schema.org/ImageObject">
					        <a href="${news.link}" class="her" alt='<nt:title value="home"/>'> 
							<nt:preview-image>
								<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
									<nt:conditional-include oncondition="${imageDescription != ''}">
										<meta itemprop="description" content='<nt:image-description/>'>	
										<img itemprop="contentURL" src="<nt:image-path width="170" height="105" scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>'>
									</nt:conditional-include>
									<nt:conditional-include oncondition="${imageDescription == ''}">
										<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
										<img itemprop="contentURL" src="<nt:image-path width="170" height="105" scaletype='2'/>" alt='${fn:escapeXml(news.title)}' title='${fn:escapeXml(news.title)}'>
									</nt:conditional-include>					
							</nt:preview-image>
							<nt:conditional-exclude oncondition="${news.imagepreviewset}">
								<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
								<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt='${fn:escapeXml(news.title)}' title='${fn:escapeXml(news.title)}' />
							</nt:conditional-exclude>
					        </a>
					</div>
					
					<div class="txtsearch1">
						<div class="datesearch">
							<p class="fechasearch" itemprop='datePublished'> <nt:last-modified format="MMMM d, yyyy" /></p>
							<% if(!videoscount2.equals("0") && !videoscount2.equals("") && !videoscount2.equals(" ") && !videoscount2.equals(null)){ %><a class="imgsearch2 desktop"><cms:img src="/arte/playvideo.png" width="22" height="16" alt="Esta nota tiene video" title="Esta nota tiene video" /></a> <% } %>
						</div>
					
						<div class="titsearch">
							<p class="titsearch2" itemprop="name headline"><a href="${news.link}" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><nt:title value="home"/></a></p> 					                
							<nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
								<p class="autsearch" itemprop="author" itemscope itemtype="http://schema.org/Person">									
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
								</p>
							</nt:conditional-include>
						</div>
						<div class="clear"></div>
						
						<nt:edit-buttons hasNew="true" hasDelete="true"/> 
						
						<div class="contsearch" itemprop="description alternativeHeadline"><nt:sub-title maxlength="150" fullword="true" endchars="..."/></div>
					</div>
				</li>
				<nt:conditional-include onposition="last">
				        <c:set var="hayMas" value="false"/>
				        <nt:conditional-include oncondition="${ (newslist.size == 10 && newslist.page == 1) || (newslist.size == 10 &&  newslist.page != 1) }">   
					<nt:news-list order="<%=order %>" size="<%=size%>" tags="<%=query%>" from="<%=published_form %>" page="<%=pag %>" section="<%=section_form %>" category="<%=filter_form %>" state="publicada" publication="9">
				                <c:set var="hayMas" value="true"/>
				            </nt:news-list>
				            <c:if test="${hayMas == 'true'}" >
				                <div id="bloque_<%=pag + 1%>"></div>
				                <div class="contS" id="paginador" > 
				                    <a class="btnMas1" href="javascript:cargarMasNotas2('<%=pag + 1%>', '<%=size%>', '<%=t%>');">See more  </a>
				                </div>  
				            </c:if>
				        </nt:conditional-include>            
			    	</nt:conditional-include>
			</nt:news-list>   
			
	              <%
	                 }
	              %>      
	            	</ul>	
	
	        	                     
		</div>
		  
	</div>
</div>

<script type="text/javascript">
    /**
    **  Function paginador
    **  Function orden list
    */        
     $( document ).ready(function() {
         $(".pageId").click(function(event) {
            $("#pageId").val($(this).data("nro"));
            $(".subscribeSearchFooter").click();
            event.preventDefault();
         });
         $(".btnmost").click(function(event) {
            $("#orderId").val($(this).data("order"));
            $(".subscribeSearchFooter").click();
            event.preventDefault();
         });
                          
     });    


                 
    /**
    **  visualizacion del cartel "No se encontraron resultados..."
    */

     if( $(".ressearch ul li").length == 0 )
     {
        $(".noResultado").css('display', 'block');
        $(".menusearchbot").css('display', 'none');
     }          
</script>

<%

    /**
    **  Form sin visualzacion para paginador
    */

%>
<form name="buscadorFooter" class="formSearchFooter" action="" method="post" style="display:none"> 
    <input class="mailbot1" type="text" value="<%=search_form %>"   name="search_form" >            
    <input type="hidden" class="campoFooter" name="filter_form" value="<%=filter_form %>" >
    <input type="hidden" class="campoFooter" name="published_form" value="<%=published_form %>" >
    <input type="hidden" class="campoFooter" name="section_form" value="<%=section_form %>" >

    <input type="hidden" class="campoFooter" name="order" value="<%=order %>" id="orderId">
    <input type="hidden" class="campoFooter" name="pag" value="<%=pag %>" id="pageId">
    <input type="hidden" class="campoFooter" name="result" value="<%=cont%>" id="resultId">                    

    <input class="subscribeSearchFooter" type="submit" value="Search" name="submit">
</form>
 <% }%>