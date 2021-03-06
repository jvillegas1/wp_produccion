<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<% 
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String currentUri = cms.getRequestContext().getUri();

String category = (request.getParameter("category") != null ) ? request.getParameter("category") : "" ; 
String category2 = ""; 


if ( category.compareTo("/news/latinaamerica") == 0 ){ category2 = "/system/categories/SubSecciones/en/news/latinaamerica/";}
if ( category.compareTo("/news/world") == 0 ){ category2 = "/system/categories/SubSecciones/en/news/world/";}
if ( category.compareTo("/news/sport") == 0 ){ category2 = "/system/categories/SubSecciones/en/news/sport/";}
if ( category.compareTo("/news/culture") == 0 ){ category2 = "/system/categories/SubSecciones/en/news/culture/";}
if ( category.compareTo("/news/technology") == 0 ){ category2 = "/system/categories/SubSecciones/en//news/technology/";}


int cont1 = 0; int cont2 = 0; 

%>

<div class="cont">
		<div class="cont-tab">
			<ul class="idTabs newtabw">
			     	<div class="tabnew">
			        	<li><a href="#Latest" alt="Latest" title="Latest">Latest</a></li>
			                <li><a href="#MostRead" alt="Most read" title="Most read">Most read</a></li>
			               <%--    <li><a href="#MostShared" alt="Recommended" title="Recommended">Recommended</a></li> --%>
			        </div>
			</ul>
		</div>
		<div id="Latest">            
		<div class="slideVerticalNew carousel">
				<nt:news-list category="<%=category2%>" order="user-modification-date desc" from="7d" age="7d"  publication="9">
					<% cont1++; %>
				</nt:news-list>
				<ul <% if (cont1 > 7) { %> id="slideVerticalNew" <% } %> >
			            <nt:news-list category="<%=category2%>" order="user-modification-date desc" size="10" from="7d" age="7d" publication="9"> 
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
								<a class="titlepopbox">At the moment there are no notes of "Latest". </a>
							</div> 	
						</div>  	
					<% } %>        
			      	</ul>
				<% if (cont1 > 7) { %>
					<a href="#" id="slide_next"></a>
				<% } %>
			</div>
		</div>
		<div id="MostRead">            
			<div class="slideVerticalNew carousel">
				<nt:news-list category="<%=category2%>" order="most-read" from="7d" age="7d" publication="9" >
					<% cont2++; %>
				</nt:news-list>
				<ul <% if (cont2 > 7) { %> id="slideVerticalNew1" <% } %> >
		                    	<nt:news-list category="<%=category2%>" order="most-read" size="10" from="7d" age="7d" publication="9" > 
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
								<a class="titlepopbox">At the moment there are no notes of "Most Read". </a>
							</div> 	
						</div> 
					<% } %> 
		      		</ul>
				<% if (cont2 > 7) { %>
					<a href="#" id="slide_next1"></a>
				<% } %>
			</div>
		</div>
		<%--<div id="MostShared">            
			<div class="slideVerticalNew carousel">
				<div id="cx_1a059cf9aa76d8def42fe608a3e5b204f989505f" style="display:none"></div>
				<script type="text/javascript">
				    var cX = cX || {}; cX.callQueue = cX.callQueue || [];
				    cX.callQueue.push(['insertWidget', {
				        widgetId: '1a059cf9aa76d8def42fe608a3e5b204f989505f',
				        insertBeforeElementId: 'cx_1a059cf9aa76d8def42fe608a3e5b204f989505f',
				        width: 384, height: 612, renderTemplateUrl: 'auto'
				    }]);
				
				    // Async load of cx.js
				    (function(d,s,e,t){e=d.createElement(s);e.type='text/java'+s;e.async='async';
				    e.src='http'+('https:'===location.protocol?'s://s':'://')+'cdn.cxense.com/cx.js';
				    t=d.getElementsByTagName(s)[0];t.parentNode.insertBefore(e,t);})(document,'script');
				</script>
			</div>
		</div> --%>
	</div><!-- Fin cont desktop -->