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

      
    //############################################################################################################## 
%>

<!--Photos-->
<div class="blue tt-latest" id="noResultadoTitle">Imágenes <%=q%></div>   
  <div class="carruselPhotosSearch carousel altmax">
    <ul class="slides">
    	<% if( !t.equals("") ) { %>
      	     
      	      	<nt:image-list order="user-modification-date desc" tags="<%=t%>" publication="8">
    	<li>
          	<a class="fancybox" href="<nt:image-path width='640' height='360' scaletype='2'/>" title="<nt:image-description/>">
            	<img src="<nt:image-path width="170" height="105" scaletype="2" />" alt="<nt:image-description/>" />
            </a>
          </li>
        </nt:image-list>
      <% } else { %>
      	<nt:image-list order="user-modification-date desc" filter="<%=q%>" publication="8">
        	<li>
          	<a class="fancybox" href="<nt:image-path width='640' height='360' scaletype='2'/>" title="<nt:image-description/>">
            	<img src="<nt:image-path width="170" height="105" scaletype="2" />" alt="<nt:image-description/>" />
            </a>
          </li>
        </nt:image-list>
      <% } %>
    </ul>
  </div>
</div>
<!--fin Photos-->
<script type="text/javascript">
	$(window).load(function(){
  		$('.carruselPhotosSearch').flexslider({
    			animation: "slide",
      			animationLoop: false,
      			itemWidth: 170,
      			itemMargin: 5,
      			pausePlay: true,
      			start: function(slider){
				$('.carruselPhotosSearch').removeClass('altmax');
			}
  		});
	});
</script>