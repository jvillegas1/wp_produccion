<%@ include file="TS_Common_Libraries.jsp" %>
<%
/**
* Create a JSP action element
*/
	org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);	
	request.setCharacterEncoding("UTF-8");
	/** Variables de session para mantener la ruta de navegacion del usuario*/
	session.setAttribute("seccion","blogs");
	session.setAttribute("url",cms.getRequestContext().getUri());	
	
	//variables del post
	String display_search = (request.getParameter("display_search") != null ) ? request.getParameter("display_search") : "" ; 
	String filter_autor = (request.getParameter("filter_autor") != null ) ? request.getParameter("filter_autor") : "" ;         
	String buscar_search = (request.getParameter("buscar_search") != null ) ? request.getParameter("buscar_search") : "" ;    	
    	
	int pagina  = ( request.getParameter("pagina") != null ) ? Integer.parseInt(request.getParameter("pagina")) : 1;
	int size = ( request.getParameter("size") != null ) ? Integer.parseInt(request.getParameter("size")) : 4;
	
	/**
	* Orden de Busqueda
	*/
	if ( display_search.equals("LAST") || display_search.equals("null") || display_search.equals("") ) display_search = "priority asc, user-modification-date desc";
	if ( display_search.equals("COME") ) display_search = "most-read";
	if ( display_search.equals("COMP") ) display_search = "most-positive-evaluations";
	
	/**
	*
	* La busqueda viene por Search
	*
	*/
	String q = buscar_search; 
	String query = "";		
	String q_alguna = "";
	
	if ( !q.equals("") ) {
		// Reemplazo caracteres que rompen las búsquedas
		q= q.replaceAll("Ã¡", "á").replaceAll("Ã", "Á").replaceAll("Ã©", "é").replaceAll("Ã", "É").replaceAll("Ã­", "í").replaceAll("Ã", "Í");
		q= q.replaceAll("Ã³", "ó").replaceAll("Ã", "Ó").replaceAll("Ãº", "ú").replaceAll("Ã", "Ú").replaceAll("Ã±", "ñ").replaceAll("Ã", "Ñ");
			
		q= q.replaceAll("\\:","").replaceAll("\\!","").replaceAll("\\¡","").replaceAll("\\?","").replaceAll("\\\"","");
		q= q.replaceAll("\\¿","").replaceAll("\\\'","").replaceAll("\\,","").replaceAll("\\@","");	
		
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
		while (stk.hasMoreTokens()) {
			String palabra = stk.nextToken().trim();
			if ( !palabra.equals("") ) q_alguna = q_alguna + "+" + palabra + "~0.8 ";
		}
	
		query += "OR titulo:( " + q_alguna + ")^1 OR ";
		query += "volanta:( " + q_alguna + ")^1 OR ";
		query += "copete:( " + q_alguna + ")^1 OR ";
		query += "keywords:( " + q_alguna + ")^1 "; 	
		query += ")";
		//##############################################################################################################
	}
			
	Boolean isProjectOnline = cms.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE_EN";	
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";
%>

	<h2 class="noResul" style="display:none" >No results were found...</h2>

	<nt:news-list newstype="bloggers" order="<%=display_search%>" advancedfilter="<%=query %>" author="<%=filter_autor%>" size="<%=size%>" page="<%=pagina%>" zone="normal" onmainpage="section" publication="9" searchindex="<%=index%>">
			<div class="contblog" itemscope itemtype="http://schema.org/Article">
			<meta itemprop="sameAs url" content="<nt:link/>">
			<div class="dest">
				<div class="colblogl">
					<nt:conditional-include oncondition="${news.hideTime == 'false' || news.hideAuthor == 'false'}">
						<div class="topblog">
							<nt:conditional-include oncondition="${news.hideTime == 'false'}">
								<div class="topblogleft"><fmt:setLocale value="en_US"/><fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" /></div>
							</nt:conditional-include>
							<nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
								<div class="topblogright" itemprop="author" itemscope itemtype="http://schema.org/Person">
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
								</div>
							</nt:conditional-include>
						</div>    
					</nt:conditional-include>
					<div class="contentblog">            
						<div class="blogtit" itemprop="name headline">
							<a href="<nt:link/>" class="her" alt='<nt:title value="section"/>' title='<nt:title value="section"/>'><nt:title value="section" /> </a>
							<nt:edit-buttons hasNew="true" hasDelete="true"/>
						</div> 
						<div class="col-forblog">
							<div class="imgblog" itemscope itemtype="http://schema.org/ImageObject">
								<nt:preview-image>												
									<a href="<nt:link/>" class="her">
										<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
										<nt:conditional-include oncondition="${imageDescription != ''}">
											<meta itemprop="description" content='<nt:image-description/>'>	
											<img itemprop="contentURL" src="<nt:image-path width="223" height="223" scaletype='2'/>" width="223" height="223" alt='<nt:image-description/>' title='<nt:image-description/>' >
										</nt:conditional-include>
										<nt:conditional-include oncondition="${imageDescription == ''}">
											<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>	
											<img itemprop="contentURL" src="<nt:image-path width="223" height="223" scaletype='2'/>" width="223" height="223" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleDetailNum]}' >
										</nt:conditional-include>													
									</a>											
								</nt:preview-image>
							</div>
						</div>
						<div class="col-sixblog">
							<div class="contblogint" itemprop='description alternativeHeadline'>
								<nt:body-splitter>									
									<nt:conditional-include onposition="1,2">
										<p><nt:body-paragraph /></p>
									</nt:conditional-include>
								</nt:body-splitter>
							</div>
							<a href="<nt:link/>" alt="Read More" title="Read More" class="readblogmobil">Read More >></a>
							<div class="blogrs">
								<a href="<nt:link/>" alt="Read More" title="Read More" class="readblog">Read More</a>
								<nt:conditional-include oncondition="${news.commentcount > 0}">
									<div class="gblogrs" itemprop="interactionCount">
										<div class="num">${news.commentcount}</div>
										<cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comments" title="Comments" />
									</div>
								</nt:conditional-include>
								
								<cms:include page="TS_Common_AddThis.jsp" >
									<cms:param name="link"><nt:link/></cms:param> 
									<cms:param name="titulo"><nt:title value="section"/></cms:param>       
								</cms:include>
								
							</div>
						</div>
					</div>         
				</div>	
			</div>
		</div>
		<nt:conditional-include onposition="last">
			<c:set var="hayMas" value="false"/>
				
			<nt:conditional-include oncondition="${newslist.size == 4}">	
				<nt:news-list order="<%=display_search%>" advancedfilter="<%=query %>" author="<%=filter_autor%>" size="<%=size%>" page="<%=pagina+1%>">
					<c:set var="hayMas" value="true"/>
				</nt:news-list>
				
				<c:if test="${hayMas == 'true'}" >
					<div id="bloque_<%=pagina+1%>"></div>
					
					<div class="cont" id="paginador" > 
						<a class="btnrepsm" href="javascript:cargarMasNotas('<%=pagina+1%>','<%=size%>','<%=display_search%>','<%=filter_autor%>','<%=buscar_search%>');"><img src="/arte/down-arrow.png" width="24" height="13" alt="" />View more blogs</a>
					</div>	
				</c:if>
			</nt:conditional-include> 			 
		</nt:conditional-include> 
	</nt:news-list>
	<% if (pagina == 1) { %>
		<br>
		<br>
		<hr>
		<span style="color: rgb(255, 253, 253); font-family: &quot;Arimo&quot;,sans-serif; border-radius: 5px; text-align: center; line-height: 15px; margin: 60px; font-style: italic; background-color: rgb(26, 32, 66); padding: 5px; font-size: 12px;"> The opinions expressed in this section do not necessarily represent those of teleSUR </span>
		<br>
		<br>
		<hr>
	<% } %>
<script type="text/javascript">       
	/**
	**  visualizacion del cartel "No se encontraron resultados..."
	*/
	
	if( $(".contblog").length == 0 ) {
		$(".noResul").css('display', 'block');
	}          
</script>