<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<%
String destacada = ( request.getParameter("destacada") != null ) ? request.getParameter("destacada") : "";
String category = ( request.getParameter("category") != null ) ? request.getParameter("category") : "";
String titulo = ( request.getParameter("titulo") != null ) ? request.getParameter("titulo") : "teleSur";
String etiqueta = ( request.getParameter("etiqueta") != null ) ? request.getParameter("etiqueta") : "teleSur";
String nombre = ( request.getParameter("nombre") != null ) ? request.getParameter("nombre") : "teleSur";
String imagen = ( request.getParameter("imagen") != null ) ? request.getParameter("imagen") : "";

int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 6);
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
String categoryPath = "/system/categories/SubSecciones/multimedia/"+destacada+"/"; 
String referencia = "/SubSecciones/multimedia/"+category+"/index.html";
String imagenRef = "/arte/"+imagen+".jpg";
%>
<h6><a href="<%= referencia %>" class="med"><%= titulo %></a><cms:img src="<%= imagenRef %>" /></h6>     		    
<div id="contArt"> 
    <nt:news-list order="priority asc,user-modification-date" section="multimedia"  category="<%= categoryPath %>"  size="1">    
         <article class="mmdDst">
            <div  class="wpImgMmd">     
          		  <c:set var="tituloPrincipal" scope="page">
	                    	<nt:title value='section'/>
	                   </c:set>   	
	                    <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
		        		<nt:preview-image>		        		
	                                        <c:set var="imageDescription" scope="page">
	                                        	<nt:image-description/>
	                                        </c:set>
	                                        <nt:conditional-include oncondition="${imageDescription != ''}">
	                                        	<a href="<nt:link/>" title='<c:out value="${tituloPrincipal}"/>'>
	                                            		<img src="<nt:image-path width='306' height='172' scaletype='2'/>" draggable="false" alt="<nt:image-description/>" />
	                                            	</a>
	                                        </nt:conditional-include>
	                                        <nt:conditional-include oncondition="${imageDescription == ''}">
	                                        	<a href="<nt:link/>"  title='<c:out value="${tituloPrincipal}"/>'>
	                                            		<img src="<nt:image-path width='306' height='172' scaletype='2' />" draggable="false" alt='${news.titles[news.titleHomeNum]}'/>
	                                            	</a>
	                                        </nt:conditional-include>
	                            	</nt:preview-image>			                                 
	                        </nt:conditional-include>            
	                        <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
		                        <a href="<nt:link/>" title="<nt:title value='home' />">
		                            <cms:img src="/arte/sinFoto_420x260.jpg" width="100%" height="82" alt="<nt:title value='home'/>"  />
		                        </a>
	                        </nt:conditional-include>
	                </div>
            <div class="overflow"> 
            <small><%= etiqueta %></small>                           
                 	
                <h3 itemprop="name headline">				
                    <a href="
                        <nt:link/>" title="<nt:title value='home' />">
                        <nt:title value='home' />	
                        <nt:edit-buttons hasNew="true" hasDelete="true"/>	
                    </a>
                </h3>
                <h4 itemprop="description alternativeHeadline">
              <nt:sub-title maxlength='270' endchars='...' fullword="true" /><a href="<nt:link/>" title="<nt:title value='home' />"> Leer mas </a>
                </h4>	            
           </div>
           <h8><a class="seeall" href="<%= referencia %>">Ver todos</a></h8>              
        </article>	   
    </nt:news-list>
</div>  
<a class="verTodosMov" href="#">Ver todos</a>