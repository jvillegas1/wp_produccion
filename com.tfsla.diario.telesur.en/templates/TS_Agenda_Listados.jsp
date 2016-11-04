<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
	int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size"))+6 : 12);
	int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
%>
<div id="contArt"> 
    <nt:news-list order="user-modification-date DESC" page="<%=pagina%>" section="telesur_agenda"   size="<%= size %>"> 
    
         <article>
 <div class="wpSmallImg">        	
	                    <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
		        		<nt:preview-image>		        		
	                                        <c:set var="imageDescription" scope="page">
	                                        	<nt:image-description/>
	                                        </c:set>
	                                        <nt:conditional-include oncondition="${imageDescription != ''}">
	                                      	 <a href="<nt:link/>" title='<c:out value="${tituloPrincipal}"/>'>
	                                            		<img src="<nt:image-path width='146' height='82' scaletype='2'/>" draggable="false" alt="<nt:image-description/>" />
	                                            	</a>
	                                        </nt:conditional-include>
	                                        <nt:conditional-include oncondition="${imageDescription == ''}">
	                                        	  <a href="<nt:link/>" title='<c:out value="${tituloPrincipal}"/>'>
	                                            		<img src="<nt:image-path width='146' height='82' scaletype='2' />" draggable="false" alt='${news.titles[news.titleHomeNum]}'/>
	                                            	</a>
	                                        </nt:conditional-include>
	                            	</nt:preview-image>			                                 
	                        </nt:conditional-include>            
	                        <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
		                         <a href="<nt:link/>" title='<c:out value="${tituloPrincipal}"/>'>
		                            <cms:img src="/arte/sinFoto_420x260.jpg" width="100%" height="82" alt="<nt:title value='home'/>"  />
		                        </a>
	                        </nt:conditional-include>
	                </div>
	              
	       <div class="overflow">                             
                	                                	
                	<h4>
                    	<a href="<nt:link/>" title="<nt:title value='section' />" /><nt:title value="section"/></a>
                		</h4>
              </div>   
	        </article>	        				               
	</nt:news-list>                   
</div>
<div id="cargando"></div>
<div class="btnVermas clear">
	<a href="javascript:loadMore('<%= size%>', '<%=pagina%>');" id="ver-mas-agenda"  style="padding: 10px 15px;">See more</a>
</div>