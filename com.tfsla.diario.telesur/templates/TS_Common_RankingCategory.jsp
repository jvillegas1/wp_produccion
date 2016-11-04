<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<% 
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String currentUri = cms.getRequestContext().getUri();

String category = (request.getParameter("category") != null ) ? request.getParameter("category") : "" ; 
String category2 = ""; 


if ( category.compareTo("/news/latinaamerica") == 0 ){ category2 = "/system/categories/SubSecciones/news/latinaamerica/";}
if ( category.compareTo("/news/world") == 0 ){ category2 = "/system/categories/SubSecciones/news/world/";}
if ( category.compareTo("/news/sport") == 0 ){ category2 = "/system/categories/SubSecciones/news/sport/";}
if ( category.compareTo("/news/culture") == 0 ){ category2 = "/system/categories/SubSecciones/news/culture/";}
if ( category.compareTo("/news/tecnologia") == 0 ){ category2 = "/system/categories/SubSecciones/news/tecnologia/";}


int cont1 = 0; int cont2 = 0; int cont3 = 0; 
boolean isSport = category2.equals("/system/categories/SubSecciones/news/sport/");
int maxNum = isSport ? 5 : 7;
int maxNumNews = isSport ? 5 : 7;


%>

<div class="cont">
		<div class="cont-tab">
			<ul class="idTabs newtabw">
			     	<div class="tabnew">
			        	<li><a href="#Latest" alt="Lo último" title="Lo último">Lo último</a></li>
			                <li><a href="#MostRead" alt="Más leídos" title="Más leídos">Más leídos</a></li>
			             <%--   <li><a href="#MostShared" alt="Recomendados" title="Recomendados">Recomendados</a></li> --%> 
			        </div>
			</ul>
		</div>
		<div id="Latest">            
		<div class="slideVerticalNew carousel" >
				<nt:news-list category="<%=category2%>" order="user-modification-date desc" from="7d" age="7d" size="5" state="publicada" publication="8">
					<% cont1++; %>
				</nt:news-list>
				
				<ul <% if (cont1 > maxNum) { %> id="slideVerticalNew" <% } %>>
			            <nt:news-list category="<%=category2%>" order="user-modification-date desc" size="<%= maxNumNews %>" from="7d" age="7d" state="publicada" publication="8"> 
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
				<nt:news-list category="<%=category2%>" order="most-read" from="7d" age="7d" state="publicada" publication="8">
					<% cont2++; %>
				</nt:news-list>
				<ul <% if (cont2 > maxNum) { %> id="slideVerticalNew1" <% } %> >
		                    	<nt:news-list category="<%=category2%>" order="most-read" size="<%= maxNumNews %>" from="7d" age="7d" state="publicada" publication="8"> 
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
		<%--<div id="MostShared">            
			<div class="slideVerticalNew carousel" >
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
				
				
				<%--<nt:news-list category="<%=category%>" order="most-positive-evaluations" from="7d" age="7d" state="publicada" publication="8">
					<% cont3++; %>
				</nt:news-list>
				<ul <% if (cont3 > maxNum) { %> id="slideVerticalNew2" <% } %> >
		                    	<nt:news-list category="<%=category%>" order="most-recommended" size="<%= maxNumNews %>" from="7d" age="7d" state="publicada" publication="8"> 
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
		</div>--%>
	</div><!-- Fin cont desktop -->