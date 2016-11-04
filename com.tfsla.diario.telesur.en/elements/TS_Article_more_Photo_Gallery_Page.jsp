<%@ include file="TS_Common_Libraries.jsp" %>
<%
org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);	
request.setCharacterEncoding("UTF-8");
session.setAttribute("seccion","multimedia");
session.setAttribute("url",cms.getRequestContext().getUri());
String category = request.getParameter("category");  
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 6);
int pagina = ( request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1 );
int position = 0;
String categoryPath = "/SubSecciones/en/multimedia/galleries/"; 
%>
<div class="row clear">  
	<div class="col">
		<div class="rowInt">
		<div id="contArt">				
	  <nt:news-list order="user-modification-date desc" section="multimedia" page="<%=pagina%>" category="<%=categoryPath%>" size="<%=size%>" publication="9">	 
	       <article>
	            <div class="wpSmallImg" >                
	                <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
			    <div itemprop="" itemscope itemtype="http://schema.org/ImageObject" style="height:105;">
			        <a href="<nt:link/>" title="<nt:title value='home' />" class="her" TARGET="_blank">
			            <nt:preview-image>
			                    <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
			                <nt:conditional-include oncondition="${imageDescription != ''}">
			                    <meta itemprop="description" content='<nt:image-description/>'> 
			                    <img itemprop="contentURL" src="<nt:image-path width='146' height='82' scaletype='2'/>" alt="<nt:image-description/>" />
			                </nt:conditional-include>
			                <nt:conditional-include oncondition="${imageDescription == ''}">
			                    <meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
			                    <img itemprop="contentURL" src="<nt:image-path width='146' height='82' scaletype='2' />" alt='${news.titles[news.titleHomeNum]}'/>
			                </nt:conditional-include>
			            </nt:preview-image>
			        </a>
			    </div>
			</nt:conditional-include>                                                    
			<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
			   <cms:img src="/arte/sinFoto_420x260.jpg" width="126" height="82" alt="<nt:title value='home'/>"  />
			</nt:conditional-include>
	           </div>
	            <div class="overflow">
	                <a class="her" href="<nt:link/>"><h4 itemprop="name headline"><nt:title value="detail"/></h4></a>
	            </div>
	        </article>
	        <nt:conditional-include onposition="last">
				<c:set var="hayMas" value="false"/>					
						<nt:conditional-include oncondition="${newslist.size == 6}">						
							<nt:news-list section="multimedia" size="<%=size%>" page="<%=pagina+1%>" category="<%=categoryPath%>">						
								<c:set var="hayMas" value="true"/>								
							</nt:news-list>							
							<c:if test="${hayMas == 'true'}" >
							<div id="bloque_<%=pagina+1%>"></div>									
								<div class="contArt" id="paginador" > 
									<a class="btnVermas clear" href="javascript:cargarMasNotas('<%=pagina+1%>','<%=size%>');">Watch More</a>
								</div>								
							</c:if>	
						</nt:conditional-include> 
		</nt:conditional-include> 
	    </nt:news-list>
	    </div>
	    </div>
	</div>
</div>  
	    