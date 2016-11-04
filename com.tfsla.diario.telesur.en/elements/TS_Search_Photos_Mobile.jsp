<%@ include file="TS_Common_Libraries.jsp" %>
<%

	org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
	
	//si viene t es navegacion por tags
	String t    = ( request.getParameter("t") != null ) ? request.getParameter("t") : "";
	
	//variables del post
	String search_form = ( request.getParameter("search_form") != null ) ? request.getParameter("search_form") : "";
	
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


%>
<!-- Slider  photos mobile--> 
<div class="col" id="noResultadoMobile">
	<div class="cont conttitle">
		<div class="title blue">Pictures</div>
	</div>
	<div class="cont">
		<div class="flexslider carousel">
			<ul class="slides noResultadoMobile">
				<% if( !t.equals("") ) { %>
					<nt:image-list order="user-modification-date desc" tags="<%=t%>" publication="9">
						<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
						<li>	
							<img src="<nt:image-path width="420" height="260" scaletype="2" />" alt="<nt:image-description/>" title='<nt:image-description/>'/>
							<nt:conditional-include oncondition="${imageDescription != ''}">
								<div class="caption"><h2><nt:image-description/></h2></div>
							</nt:conditional-include>
						</li>  
					</nt:image-list>
				<% } else { %>
					<nt:image-list order="user-modification-date desc" filter="<%=q%>" publication="9">
						<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
					        <li>
							<img src="<nt:image-path width="420" height="260" scaletype="2" />" alt="<nt:image-description/>" title='<nt:image-description/>'/>
							<nt:conditional-include oncondition="${imageDescription != ''}">
								<div class="caption"><h2><nt:image-description/></h2></div>
							</nt:conditional-include>
						</li> 
					</nt:image-list>	 
				<% } %>	
			</ul>  
		</div>
	</div>
</div>  
<!-- FIN  photos mobile -->

<script type="text/javascript">          
    /**
    **  visualizacion del slider
    */       
     
     if( $(".noResultadoMobile li").length == 0 )
     {
        $("#noResultadoMobile").css('display', 'none');
     }          
</script>