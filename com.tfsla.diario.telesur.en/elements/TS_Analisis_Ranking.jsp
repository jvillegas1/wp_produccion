<%@ include file="TS_Common_Libraries.jsp" %>
<% int cont1 = 0; int cont2 = 0; int cont3 = 0; %>

<%
	try{
	%>
		<c:import url="http://www.telesurtv.net/_static_rankings/static_rankingCategory_analysis.html"/>
	<%
	}
	catch (Exception e){
		out.print("Loading...");
	}
%>

<%--
<div class="cont">
	<div class="cont-tab">
		<ul class="idTabs newtabw">
		     	<div class="tabnew">		
		     	        <li><a href="#MostRead" alt="Most Read" title="Most Read">Most read</a></li>	
		                <li><a href="#Latest" alt="Latest" title="Latest">Latest</a></li>		                
		                <li><a href="#MostShared" alt="Recommended" title="Recommended">Recommended</a></li>		                
		        </div>
		</ul>
	</div>
	<div id="MostRead">            
	<div class="slideVerticalNew carousel">
			<nt:news-list  section="analysis" order="most-read"  from="7d" age="7d">
				<% cont1++; %>
			</nt:news-list>
			<ul <% if (cont1 > 5) { %> id="slideVerticalBlog1" <% } %> >
		            <nt:news-list section="analysis" order="most-read"  from="7d" age="7d">
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
							
							<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
								<a href="<nt:link/>">
									<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt="teleSUR" title="teleSUR" scaleType="2"/>
								</a>
							</nt:conditional-include>
					        </div>
					        <div class="titslidenew"><a href="<nt:link/>" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>' /><nt:title value="home"  maxlength="45" fullword="true" endchars="..."/></a></div>
					        <div class="autslidenew">						       
					        </div>
					        <nt:conditional-include oncondition="${news.commentcount > 0}"> 
							<div class="gblogrs">
								<div class="num">${news.commentcount}</div>
								<cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comments" title="Comments" />
							</div>	
						</nt:conditional-include>
						<nt:conditional-include oncondition="${news.commentcount == 0}"> 
							<div class="gblogrs"></div>	
						</nt:conditional-include>
						
							<cms:include page="TS_Common_AddThis.jsp" >
								<cms:param name="link"><nt:link/></cms:param> 
								<cms:param name="titulo"><nt:title value="home"/></cms:param>       
							</cms:include>						
						
						<nt:conditional-include oncondition="${news.hideComments == 'true'}">
							<div style="float:left;margin-left:5%">
								<cms:include page="TS_Common_AddThis.jsp" >
									<cms:param name="link"><nt:link/></cms:param> 
									<cms:param name="titulo"><nt:title value="home"/></cms:param>       
								</cms:include>
							</div>
						</nt:conditional-include>
					        <div class="clear"></div>
					    </div>    		                   		                    
					</li>
		             </nt:news-list>
				<% if (cont1 == 0) { %>
					<div class="cont">
						<div class="modnews">
							<a class="titlepopbox">At the moment there are no notes of " Most Read".</a>
						</div> 	
					</div>  	
				<% } %>      
		      	</ul>
		      	<% if (cont1 > 5) { %>
				<a href="#" id="slide_next1"></a>
			<% } %>
		</div>
	</div>
	<div id="Latest">            
		<div class="slideVerticalNew carousel">
		<nt:news-list  order="user-modification-date desc" section="analysis" from="7d" age="7d"  >			
				<% cont2++; %>
			</nt:news-list>
			<ul <% if (cont2 > 5) { %> id="slideVerticalBlog2" <% } %> >
	                    	<nt:news-list  order="user-modification-date desc" section="analysis" from="7d" age="7d"  >
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
									<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt="teleSUR" title="teleSUR" scaleType="2"/>
								</a>
							</nt:conditional-exclude>
		                                </div>
		                                <div class="titslidenew"><a href="<nt:link/>" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>' /><nt:title value="home"  maxlength="45" fullword="true" endchars="..."/></a></div> 
					        <div class="autslidenew">						        
					        </div>
					        <nt:conditional-include oncondition="${news.commentcount > 0}"> 
							<div class="gblogrs">
								<div class="num">${news.commentcount}</div>
								<cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comments" title="Comments" />
							</div>	
						</nt:conditional-include>
						<nt:conditional-include oncondition="${news.commentcount == 0}"> 
							<div class="gblogrs"></div>	
						</nt:conditional-include>
							<cms:include page="TS_Common_AddThis.jsp" >
								<cms:param name="link"><nt:link/></cms:param> 
								<cms:param name="titulo"><nt:title value="home"/></cms:param>       
							</cms:include>												
						<nt:conditional-include oncondition="${news.hideComments == 'true'}">
							<div style="float:left;margin-left:5%">
								<cms:include page="TS_Common_AddThis.jsp" >
									<cms:param name="link"><nt:link/></cms:param> 
									<cms:param name="titulo"><nt:title value="home"/></cms:param>       
								</cms:include>
							</div>
						</nt:conditional-include>
		                                <div class="clear"></div>
		                            </div>
		                        </li>
	                    	</nt:news-list> 
	                    	<% if (cont2 == 0) { %>
					<div class="cont">
						<div class="modnews ">
							<a class="titlepopbox">At the moment there are no notes of "Latest".</a>
						</div> 	
					</div> 
				<% } %> 
	      		</ul>
			<% if (cont2 > 5) { %>
				<a href="#" id="slide_next2"></a>
			<% } %>
		</div>
	</div>
	<div id="MostShared">            
		<div class="slideVerticalNew carousel">
			<div id="cx_1b73051caeff6cdd1a6014c56d2b8cf4644e2f12" style="display:none"></div>
			<script type="text/javascript">
			    var cX = cX || {}; cX.callQueue = cX.callQueue || [];
			    cX.callQueue.push(['insertWidget', {
			        widgetId: '1b73051caeff6cdd1a6014c56d2b8cf4644e2f12',
			        insertBeforeElementId: 'cx_1b73051caeff6cdd1a6014c56d2b8cf4644e2f12',
			        width: 384, height: 612, renderTemplateUrl: 'auto'
			    }]);
			
			    // Async load of cx.js
			    (function(d,s,e,t){e=d.createElement(s);e.type='text/java'+s;e.async='async';
			    e.src='http'+('https:'===location.protocol?'s://s':'://')+'cdn.cxense.com/cx.js';
			    t=d.getElementsByTagName(s)[0];t.parentNode.insertBefore(e,t);})(document,'script');
			</script>
							
			<%--<nt:news-list order="most-positive-evaluations" section="analysis" from="7d" age="7d">
				<% cont3++; %>
			</nt:news-list>
			<ul <% if (cont3 > 5) { %> id="slideVerticalBlog3" <% } %> >
	                    	<nt:news-list order="most-positive-evaluations" section="analysis" size="10" from="7d" age="7d" > 
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
									<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt="teleSUR" title="teleSUR" scaleType="2"/>
								</a>
							</nt:conditional-exclude>
		                                </div>
		                                <div class="titslidenew"><a href="<nt:link/>" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>' /><nt:title value="home"  maxlength="45" fullword="true" endchars="..."/></a></div>
					        <div class="autslidenew">						        
					        </div>
					       
					        <nt:conditional-include oncondition="${news.commentcount > 0}"> 
							<div class="gblogrs">
								<div class="num">${news.commentcount}</div>
								<cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comments" title="Comments" />
							</div>	
						</nt:conditional-include>
						<nt:conditional-include oncondition="${news.commentcount == 0}"> 
							<div class="gblogrs"></div>	
						</nt:conditional-include>
							<cms:include page="TS_Common_AddThis.jsp" >
								<cms:param name="link"><nt:link/></cms:param> 
								<cms:param name="titulo"><nt:title value="home"/></cms:param>       
							</cms:include>
												
						
						<nt:conditional-include oncondition="${news.hideComments == 'true'}">
							<div style="float:left;margin-left:5%">
								<cms:include page="TS_Common_AddThis.jsp" >
									<cms:param name="link"><nt:link/></cms:param> 
									<cms:param name="titulo"><nt:title value="home"/></cms:param>       
								</cms:include>
							</div>
						</nt:conditional-include>
		                                <div class="clear"></div>
		                            </div> 
		                        </li>
	                     	</nt:news-list>  
	                     	<% if (cont3 == 0) { %>
		                     	<div class="cont">
						<div class="modnews her">
							<a class="titlepopbox">At the moment there are no notes of "Most shared".</a>
						</div> 	
					</div> 		
				<% } %>
	      		</ul>
			<% if (cont3 > 5) { %>
				<a href="#" id="slide_next3"></a>
			<% } %> 
		</div>
	</div>
</div><!-- Fin cont desktop -->--%>