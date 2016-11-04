<%@ include file="TS_Common_Libraries.jsp" %>
<%
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 5);
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );

String categoryPath = "/system/categories/SubSecciones/multimedia/webspecial/";
%>

<div class="block agenda clear">   
	<div class="wpAgenda">
	    <div class="square">Especiales Web</div>
	    <div class="SdSpecial">
		    <ul class="slides">
		    

		    	<nt:news-list order="user-modification-date" section="multimedia" category="<%=categoryPath%>"  size="<%=size%>" publication="8">
		        	<li>
		        		<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
			        		<nt:preview-image>
			        		
	                                                <c:set var="imageDescription" scope="page"><nt:image-description/>
	                                                </c:set>
		                                        <nt:conditional-include oncondition="${imageDescription != ''}">
		                                        	<a href="<nt:link/>" title="<nt:title value='home' />">
		                                            		<img src="<nt:image-path width='146' height='82' scaletype='2'/>" draggable="false" alt="<nt:image-description/>" />
		                                            	</a>
		                                        </nt:conditional-include>
		                                        <nt:conditional-include oncondition="${imageDescription == ''}">
		                                        	<a href="<nt:link/>" title="<nt:title value='home' />">
		                                            		<img src="<nt:image-path width='146' height='82' scaletype='2' />" draggable="false" alt='${news.titles[news.titleHomeNum]}'/>
		                                            	</a>
		                                        </nt:conditional-include>
	                                    	</nt:preview-image>			                                 
		                        </nt:conditional-include>            
		                        <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
			                        <a href="<nt:link/>" title="<nt:title value='home' />">
			                            <cms:img src="/arte/sinFoto_420x260.jpg" width="100%" height="82" alt="<nt:title value='home'/>"  />
			                        </a>
		                        </nt:conditional-include>
                                    	
		        		<h4>
		        			<a href="<nt:link/>">
		        				<nt:title value="section"/>
		        			</a>
		        		</h4>
		        	</li>
		        </nt:news-list> 		       
		    </ul>
	    </div>
	</div>
</div>