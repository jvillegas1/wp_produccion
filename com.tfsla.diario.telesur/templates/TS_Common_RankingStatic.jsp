<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<% 
String template = (request.getParameter("template") != null ) ? request.getParameter("template") : "" ; 

int contCantNotaAprobada = 0; int contNotaAprobadaMR = 0; int contNotaAprobadaMPE = 0;
int contCantNotaTotal = 0; int contCantNotaTotalMR = 0; int contCantNotaTotalMPE = 0;


CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String currentUri = cms.getRequestContext().getUri();

String seccion = (request.getParameter("seccion") != null ) ? request.getParameter("seccion") : "" ; 


%>



	<div class="cont">
		<div class="cont-tab">
			<ul class="idTabs newtabw">
			     	<div class="tabnew">			        	
			                <li><a href="#MostRead" alt="Más leídos" title="Más leídos">Más leídos</a></li>			                
			                <li><a href="#Latest" alt="Lo último" title="Lo último">Lo último</a></li>
			                 <%--   <li><a href="#MostShared" alt="Recomendados" title="Recomendados">Recomendados</a></li>  --%>
			        </div>
			</ul>
		</div>
		<div id="Latest">            
		<div class="slideVerticalNew carousel">
				<nt:news-list section="<%=seccion%>" order="user-modification-date desc" size="30" from="7d" age="7d"  state="publicada" publication="8"  >
					<c:set var="statecont1" scope="page">${news.state}</c:set> 
					<%
					String estadocont1 = (String) pageContext.getAttribute("statecont1");    
					if(!estadocont1.equalsIgnoreCase("pendienteModeracion") && !estadocont1.equalsIgnoreCase("rechazada")){ 
						contCantNotaAprobada ++; 
					}
					if  (contCantNotaAprobada < 11) contCantNotaTotal ++ ;
					%>
				</nt:news-list>
				<ul <% if (contCantNotaAprobada > 7) { %> id="slideVerticalNew" <% } %> >
			            <nt:news-list section="<%=seccion%>" order="user-modification-date desc" size="<%=contCantNotaTotal %>" from="7d" age="7d" state="publicada" publication="8"> 
			            <c:set var="state" scope="page">${news.state}</c:set> 
					<%
					String estado = (String) pageContext.getAttribute("state");    
					if(!estado.equalsIgnoreCase("pendienteModeracion") && !estado.equalsIgnoreCase("rechazada")){
					%>	
			                <li>
			                    <div class="modnews">
			                        <div class="contimgsli">
			                                 
			                        	<nt:preview-image>									
								<a href="<nt:link/>">
									<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
									<nt:conditional-include oncondition="${imageDescription != ''}">
										<img src="<nt:image-path width="170" height="105" scaletype="2" />" alt='<nt:image-description/>' title='<nt:image-description/>'>
									</nt:conditional-include>
									<nt:conditional-include oncondition="${imageDescription == ''}">
										<img src="<nt:image-path width="170" height="105" scaletype="2" />" alt='${fn:escapeXml(news.title)}' title='${fn:escapeXml(news.title)}'>
									</nt:conditional-include>
								</a>
							</nt:preview-image>
							 
							<nt:conditional-include oncondition="${ news.videoscount > 0 }">
								<nt:video-flash>
									<nt:conditional-include oncondition="${news.homePreview == 'videoFlash' && news.imagepreviewset == 'false' }">
										<img src="<nt:video-thumbnail width="170" height="105" scaletype="2" />" alt='<nt:video-description/>' title='<nt:video-description/>'>
									</nt:conditional-include>
									
									<c:set var="videoPath" scope="page"><nt:video-path /></c:set>
			    						<jsp:useBean id="videoPath" type="java.lang.String" />
									 
									<nt:video path="<%=videoPath%>" >
										<div class="redbox"><nt:video-duration /></div>
									</nt:video>
								</nt:video-flash>
								<nt:video-youtube>
									<nt:conditional-include oncondition="${news.homePreview == 'videoYouTube' && news.imagepreviewset == 'false' }">
										<img src="<nt:video-thumbnail width="170" height="105" scaletype="2" />" alt='<nt:video-description/>' title='<nt:video-description/>'>
									</nt:conditional-include>
								</nt:video-youtube>
							</nt:conditional-include>
							
							<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
								<a href="<nt:link/>">
									<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt="teleSUR" title="teleSUR" />
								</a>
							</nt:conditional-include>
			                        </div>
			                        <div class="titslidenew"><a href="<nt:link/>" class="her" /><nt:title value="home"/></a></div>
			                        <div class="clear"></div>
			                    </div>    
			                    
			                    
			                </li>
			              <%
				      }
				      %>
			             </nt:news-list>  
					<% if (contCantNotaTotal == 0) { %>
						<div class="cont">
							<div class="modnews">
								<a class="titlepopbox">En estos momentos no tenemos notas de "Lo último".</a>
							</div> 	
						</div>  	
					<% } %>        
			      	</ul>
				<% if (contCantNotaAprobada > 7) { %>
					<a href="#" id="slide_next"></a>
				<% } %>
			</div>
		</div>
		<div id="MostRead">            
			<div class="slideVerticalNew carousel">
				<nt:news-list section="<%=seccion%>" order="most-read" from="7d" age="7d" state="publicada" publication="8">
					<c:set var="statecont2" scope="page">${news.state}</c:set> 
					<%
					String statecont2 = (String) pageContext.getAttribute("statecont2");    
					if(!statecont2.equalsIgnoreCase("pendienteModeracion") && !statecont2.equalsIgnoreCase("rechazada")){ 
						contNotaAprobadaMR ++; 
					}
					if  (contNotaAprobadaMR < 11) contCantNotaTotalMR ++ ;
					%>
				</nt:news-list>
				<ul <% if (contNotaAprobadaMR > 7) { %> id="slideVerticalNew1" <% } %> >
		                    	<nt:news-list section="<%=seccion%>" order="most-read" size="<%=contCantNotaTotalMR %>" from="7d" age="7d" state="publicada" publication="8"> 
		                        <c:set var="stateMR" scope="page">${news.state}</c:set> 
					<%
					String estadoMR = (String) pageContext.getAttribute("stateMR");    
					if(!estadoMR.equalsIgnoreCase("pendienteModeracion") && !estadoMR.equalsIgnoreCase("rechazada")){
					%>	
		                        <li>
		                        <div class="modnews">
		                                <div class="contimgsli">
		                                	<nt:preview-image>									
								<a href="<nt:link/>">
									<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
									<nt:conditional-include oncondition="${imageDescription != ''}">
										<img src="<nt:image-path width="170" height="105" scaletype="2" />" alt='<nt:image-description/>' title='<nt:image-description/>'>
									</nt:conditional-include>
									<nt:conditional-include oncondition="${imageDescription == ''}">
										<img src="<nt:image-path width="170" height="105" scaletype="2" />" alt='${fn:escapeXml(news.title)}' title='${fn:escapeXml(news.title)}'>
									</nt:conditional-include>
								</a>
							</nt:preview-image>
							
							<nt:conditional-exclude oncondition="${news.imagepreviewset}">
								<a href="<nt:link/>">
									<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt="teleSUR" title="teleSUR" />
								</a>
							</nt:conditional-exclude>
		                                </div>
		                                <div class="titslidenew"><a href="<nt:link/>" class="her" /><nt:title value="home"/></a></div>
		                                <div class="clear"></div>
		                            </div>
		                        </li>
		                        <% }%>
		                    	</nt:news-list> 
		                    	<% if (contNotaAprobadaMR == 0) { %>
						<div class="cont">
							<div class="modnews ">
								<a class="titlepopbox">En estos momentos no tenemos notas de "Lo más leídos".</a>
							</div> 	
						</div> 
					<% } %> 
		      		</ul>
				<% if (contNotaAprobadaMR > 7) { %>
					<a href="#" id="slide_next1"></a>
				<% } %>
			</div>
		</div>
		<%--<div id="MostShared">            
			<div class="slideVerticalNew carousel">
				<div id="cx_88577ddecedca82fe7cf7b84896b90508c16c2c9" ></div>
			<script type="text/javascript">
			    var cX = cX || {}; cX.callQueue = cX.callQueue || [];
			    cX.callQueue.push(['insertWidget', {
			        widgetId: '88577ddecedca82fe7cf7b84896b90508c16c2c9',
			        insertBeforeElementId: 'cx_88577ddecedca82fe7cf7b84896b90508c16c2c9',
			        width: 379, height: 710, renderTemplateUrl: 'auto'
			    }]);
			
			    // Async load of cx.js
			    (function(d,s,e,t){e=d.createElement(s);e.type='text/java'+s;e.async='async';
			    e.src='http'+('https:'===location.protocol?'s://s':'://')+'cdn.cxense.com/cx.js';
			    t=d.getElementsByTagName(s)[0];t.parentNode.insertBefore(e,t);})(document,'script');
			</script>  
				
				
				
			</div>
		</div>--%>
	</div><!-- Fin cont desktop -->