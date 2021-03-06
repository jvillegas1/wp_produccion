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
    String filter_autor = (request.getParameter("filter_autor") != null ) ? request.getParameter("filter_autor") : "" ;
    filter_autor=filter_autor.replaceAll("0", "");
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
    //############################################################################################################## 
%>
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
	<nt:news-list size="100" order="<%=order %>" advancedfilter='<%=query %>' from="<%=published_form %>" author="<%=filter_autor%>" section="<%=section_form %>" category="<%=filter_form %>" state="publicada">
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
	<nt:news-list size="100" order="<%=order %>" tags="<%=query%>" from="<%=published_form %>"  section="<%=section_form %>" category="<%=filter_form %>" state="publicada">
		<% cont++; %>
	</nt:news-list> 
<%
 	}
%>   
<div class="row clear">
	<div class="cont">
		<div class="menusearchtop"></div> <br/>
		<div class="menusearchbot">
			<div class="pagsearch">Página <%=pag %> de <%=cont%> resultados</div>
			<a href="#" class="btnmost" data-order="LAST" >Más recientes</a><a href="#" class="btnmost" data-order="RELE" >Menos recientes</a>
		</div>
	</div>
	
	<script type="text/javascript">
	    $("#textFilter").html($("#filter option:selected").text());
	    $("#textPublished").html($("#published option:selected").text());
	    $("#textSection").html($("#section option:selected").text());
	</script>
</div>

<!-- Search Result -->
<div class="row clear">
	<div class="cont">
		<div class="titlereg">Resultados <%--=q %> -- <%=t %> - <%=query %> -<%--=size %> - <%=query %> - <%=index %> - <%=pag %> - <%=result %> - <%=section_form --%></div>
		<div class="noResultado" style="display:none">
			<h2 class="noResul">No se encontraron resultados...</h2>
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
	
			<nt:news-list order="<%=order %>" size="<%=size%>" advancedfilter='<%=query %>' from="<%=published_form %>" page="<%=pag %>" author="<%=filter_autor%>" category="<%=filter_form %>" state="publicada">
				
				<c:set var="videoscount" scope="page">${news.videoscount}</c:set>
				<jsp:useBean id="videoscount" type="java.lang.String" />               
	
				<li>
					<div class="opi2img" itemscope itemtype="http://schema.org/ImageObject">
					        <a href="${news.link}" class="her" alt='<nt:title value="home"/>'> 
							<nt:preview-image>
								<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
									<nt:conditional-include oncondition="${imageDescription != ''}">
										<meta itemprop="description" content='<nt:image-description/>'>	
										<img itemprop="contentURL" src="<nt:image-path width="135" height="135"  scaletype='2' />" alt='<nt:image-description/>' title='<nt:image-description/>'>
									</nt:conditional-include>
									<nt:conditional-include oncondition="${imageDescription == ''}">
										<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
										<img itemprop="contentURL" src="<nt:image-path width="135" height="135"  scaletype='2'/>" alt='${fn:escapeXml(news.title)}' title='${fn:escapeXml(news.title)}'>
									</nt:conditional-include>					
							</nt:preview-image>
							<nt:conditional-exclude oncondition="${news.imagepreviewset}">
								<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
								<cms:img src="/arte/sinFoto_170x105.jpg" width="135" height="135" alt='${fn:escapeXml(news.title)}' title='${fn:escapeXml(news.title)}' />
							</nt:conditional-exclude>
					        </a>
					</div>
					
					<div class="txtopi2">
						<div class="datesearch">
							<p class="fechasearch" itemprop='datePublished'> <nt:last-modified format="MMMM d, yyyy" /></p>
							<% if(!videoscount.equals("0") && !videoscount.equals("") && !videoscount.equals(" ") && !videoscount.equals(null)){ %><a class="imgsearch2 desktop"><cms:img src="/arte/playvideo.png" width="22" height="16" alt="Esta nota tiene video" title="Esta nota tiene video" /></a> <% } %>
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
								    		<nt:conditional-include oncondition="${variable.equals(0)}"> 
								    		<div class="gblogrs">
							                           	<div class="num"><nt:news-total-comments/></div>
							                           	<cms:img src="/arte/globe-red.png" scaleColor="transparent" width="31" height="27" alt="Comentarios"/>
							                        </div>	
							                        </nt:conditional-include>					    		
									</nt:authors>									
								</p>
							</nt:conditional-include>
						</div>
					
						<div class="titopi">
							<p class="titsearch2" itemprop="name headline"><a href="${news.link}" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><nt:title value="home"/></a></p> 					                
							
						</div>
						<div class="clear"></div>
						
						<nt:edit-buttons hasNew="true" hasDelete="true"/> 
						
						<div class="contopi" itemprop="description alternativeHeadline"><nt:sub-title maxlength="150" fullword="true" endchars="..."/></div>
						
						<!--redes-->
						<div class="sharop">
							<div class="share-rs desktop">
								<cms:include page="TS_Common_AddThis.jsp" >
									<cms:param name="link"><nt:link/></cms:param> 
									<cms:param name="titulo"><nt:title value="section"/></cms:param>       
								</cms:include>
							</div>
						</div>
				
					</div>
				</li>
			</nt:news-list>
			
	               <%
	                 }else{
	               %>      
	
	                <!--/**
	                *
	                * Newslist para Search por Tags
	                *
	                */ -->                
	
			<nt:news-list order="<%=order %>" size="<%=size%>" tags="<%=query%>" from="<%=published_form %>" author="<%=filter_autor%>" page="<%=pag %>" section="<%=section_form %>" category="<%=filter_form %>" state="publicada">
			
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
							<p class="fechasearch" itemprop='datePublished'> <nt:last-modified format="dd/MM/yyyy" type="descriptive" /></p>
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
			</nt:news-list>   
			
	              <%
	                 }
	              %>      
	            	</ul>
	
	
	            <!--/**
	            *
	            * Paginador
	            * 
	            * Muestra paginador
	            *
	            */ -->                 
	
	            <%  cont = cont/size; if(cont % size > 0) cont++;  %>		                     
		</div>
		<% if(cont > 1){ %>
		<div class="paginaSearch"> 			
			<cms:img src="/arte/logo-side.png" width="65" height="14" alt="teleSur" title="teleSur" />
			<ul>
				<% for (int aux = 1; aux <= cont; aux++){ %>
					<li><a href="#" data-nro="<%=aux %>" class="pageId her"><%=aux %></a></li>				
				<% } %> 
				
			</ul>      	
		</div>
		<% } %>  
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
<form name="buscadorFooter" class="formSearchFooter" action="/buscarOpinion.html" method="post" style="display:none"> 
    <input class="mailbot1" type="text" value="<%=search_form %>"   name="search_form" >            
    <input type="hidden" class="campoFooter" name="filter_form" value="<%=filter_form %>" >
    <input type="hidden" class="campoFooter" name="published_form" value="<%=published_form %>" >
    <input type="hidden" class="campoFooter" name="section_form" value="<%=section_form %>" >

    <input type="hidden" class="campoFooter" name="order" value="<%=order %>" id="orderId">
    <input type="hidden" class="campoFooter" name="pag" value="<%=pag %>" id="pageId">
    <input type="hidden" class="campoFooter" name="result" value="<%=cont%>" id="resultId">                    

    <input class="subscribeSearchFooter" type="submit" value="Search" name="submit">
</form>