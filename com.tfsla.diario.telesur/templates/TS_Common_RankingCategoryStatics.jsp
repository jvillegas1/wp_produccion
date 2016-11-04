<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<% 
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String currentUri = cms.getRequestContext().getUri();

String category = (request.getParameter("category") != null ) ? request.getParameter("category") : "" ; 

if (currentUri.indexOf("/news/latinaamerica") > -1 ) category = "/system/categories/SubSecciones/news/latinaamerica/";
if (currentUri.indexOf("/news/world") > -1 ) category = "/system/categories/SubSecciones/news/world/";
if (currentUri.indexOf("/news/sport") > -1 ) category = "/system/categories/SubSecciones/news/sport/";
if (currentUri.indexOf("/news/culture") > -1 ) category = "/system/categories/SubSecciones/news/culture/";

int cont1 = 0; int cont2 = 0; 
boolean isSport = currentUri.equals("/SubSecciones/news/sport/index.html");
int maxNum = isSport ? 4 : 7;
int maxNumNews = isSport ? 20 : 10;


%>
<div class="cont">
		<div class="cont-tab">
			<ul class="idTabs newtabw">
			     	<div class="tabnew">
			        	<li><a href="#Latest" alt="Lo último" title="Lo último">Lo último</a></li>
			                <li><a href="#MostRead" alt="Más leídos" title="Más leídos">Más leídos</a></li>
			               <%--   <li><a href="#MostShared" alt="Más valorados" title="Más valorados">Más valorados</a></li> --%>
			        </div>
			</ul>
		</div>
		<div id="Latest">            
		<div class="slideVerticalNew carousel" >
				<nt:news-list category="<%=category%>" order="user-modification-date desc" from="7d" age="7d"  state="publicada" publication="5">
					<% cont1++; %>
				</nt:news-list>
				<ul <% if (cont1 > maxNum) { %> id="slideVerticalNew" <% } %>>
			            <nt:news-list category="<%=category%>" order="user-modification-date desc" size="<%= maxNumNews %>" from="7d" age="7d" state="publicada" publication="5"> 
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
									<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt="teleSUR" title="teleSUR" scaleType="2" />
								</a>
							</nt:conditional-include>
			                        </div>
			                        <div class="titslidenew"><a href="<nt:link/>" class="her" /><nt:title value="home"/></a></div>
			                        <div class="clear"></div>
			                    </div>    
			                    
			                    
			                </li>
			             </nt:news-list>  
					<% if (cont1 == 0) { %>
						<div class="cont">
							<div class="modnews">
								<a class="titlepopbox">En estos momentos no tenemos notas de "Lo último".</a>
							</div> 	
						</div>  	
					<% } %>        
			      	</ul>
				<% if (cont1 > maxNum) { %>
					<a href="#" id="slide_next"></a>
				<% } %>
			</div>
		</div>
		<div id="MostRead">            
			<div class="slideVerticalNew carousel" >
				<nt:news-list category="<%=category%>" order="most-read" from="7d" age="7d" state="publicada">
					<% cont2++; %>
				</nt:news-list>
				<ul <% if (cont2 > maxNum) { %> id="slideVerticalNew1" <% } %> >
		                    	<nt:news-list category="<%=category%>" order="most-read" size="<%= maxNumNews %>" from="7d" age="7d" state="publicada"> 
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
									<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt="teleSUR" title="teleSUR" scaleType="2" />
								</a>
							</nt:conditional-exclude>
		                                </div>
		                                <div class="titslidenew"><a href="<nt:link/>" class="her" /><nt:title value="home"/></a></div>
		                                <div class="clear"></div>
		                            </div>
		                        </li>
		                    	</nt:news-list> 
		                    	<% if (cont2 == 0) { %>
						<div class="cont">
							<div class="modnews ">
								<a class="titlepopbox">En estos momentos no tenemos notas de "Lo más leídos".</a>
							</div> 	
						</div> 
					<% } %> 
		      		</ul>
				<% if (cont2 > maxNum) { %>
					<a href="#" id="slide_next1"></a>
				<% } %>
			</div>
		</div>
	<%--	<div id="MostShared">            
			<div class="slideVerticalNew carousel" >
				<nt:news-list category="<%=category%>" order="most-positive-evaluations" from="7d" age="7d" state="publicada">
					<% cont3++; %>
				</nt:news-list>
				<ul <% if (cont3 > maxNum) { %> id="slideVerticalNew2" <% } %> >
		                    	<nt:news-list category="<%=category%>" order="most-positive-evaluations" size="<%= maxNumNews %>" from="7d" age="7d" state="publicada"> 
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
									<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt="teleSUR" title="teleSUR" scaleType="2" />
								</a>
							</nt:conditional-exclude>
		                                </div>
		                                <div class="titslidenew"><a href="<nt:link/>" class="her" /><nt:title value="home"/></a></div>
		                                <div class="clear"></div>
		                            </div> 
		                        </li>
		                     	</nt:news-list>  .
		                     	<% if (cont3 == 0) { %>
			                     	<div class="cont">
							<div class="modnews her">
								<a class="titlepopbox">En estos momentos no tenemos notas de "Lo más valorado".</a>
							</div> 	
						</div> 		
					<% } %>
		      		</ul>
				<% if (cont3 > maxNum) { %>
					<a href="#" id="slide_next2"></a>
				<% } %>
			</div>
		</div> --%>
	</div><!-- Fin cont desktop -->