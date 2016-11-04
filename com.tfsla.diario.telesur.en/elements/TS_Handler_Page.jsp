<%@ include file="TS_Common_Libraries.jsp" %>
<% String error = (request.getParameter("error") == null ) ? "" : request.getParameter("error") ; %>
<%
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);

String search_form = ( request.getParameter("search_form") != null ) ? request.getParameter("search_form") : "";

%>


<div class="cintillo"> 
	<h1 class="titError">Broken Link (<%=error%>) </h1> 
	<p class="subtitError">Page not found</p>
</div>
<div class="wrapperError">
	<div class="cont">
		<div class="error">                                

				<div class="izq">
						<img src="http://www.telesurtv.net/arte/logo-side.png">
						<br>
						<p>The page you requested may not be available or have changed URL.
						<br>In case you have typed the URL, verify that it is well written.</p>
						<br>
						<ul>
							<li><a href="mailto:serviciosweb@telesurtv.com?subject='Broken link, page not found'&body=The page was not found">Report a broken link</a></li> <%-- mailto:serviciosweb@telesurtv.com?subject='Broken link, page not found'&body=The page with this URL www.telesurtv.net<%=uri%> was not found --%>
							<br>
							<li>Please try again later</li>
						</ul>
						<br>
						<br>
						<%--<h4>We Recommend:</h4>
						<!-- Cxense content widget: DestacamosErrorPageIngles -->
						<div id="cx_522358b6cc65d51845ac6c740e8c69555e525671" style="display:none"></div>
							<script type="text/javascript">
							    var cX = cX || {}; cX.callQueue = cX.callQueue || [];
							    cX.callQueue.push(['insertWidget', {
							        widgetId: '522358b6cc65d51845ac6c740e8c69555e525671',
							        insertBeforeElementId: 'cx_522358b6cc65d51845ac6c740e8c69555e525671',
							        width: 600, height: 227, renderTemplateUrl: 'auto'
							    }]);
							
							    // Async load of cx.js
							    (function(d,s,e,t){e=d.createElement(s);e.type='text/java'+s;e.async='async';
							    e.src='http'+('https:'===location.protocol?'s://s':'://')+'cdn.cxense.com/cx.js';
							    t=d.getElementsByTagName(s)[0];t.parentNode.insertBefore(e,t);})(document,'script');
							</script> 
						<!-- End of Cxense content widget -->  --%>
				</div>            
						<div class="der"> <!-- /english/search.html -->
							<div class="blueBar" style="background-color:#C11717;margin-top:20px">
								<form name="buscador" class="formSearch1" action="http://www.telesurtv.net/english/search.html" method="post">    	
									<div class="wrapperSearch">
										<div class="rowSearch">
											<div class="cont">
												<div class="contSearch">
								
													<div class="conteselSearch" >
														<div class="filasel" >
															<div class="txtsel">Search:</div>
															<input type="text" name="search_form" value="<%=search_form %>" class="contsearch1"> 
															<input id="subscribe" class="Mobile" type="submit" value="Search" name="submit" style="background-color:#661B1B">
														</div>
													</div>	
													<div class="conteselSearch" >
														<div class="filasel" >
															<div class="desktop">
																<input id="subscribe" type="submit" class="subscribeSearch" value="Search" name="submit" style="background-color:#661B1B">
															</div>
														</div>
													</div>
								
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>               
		</div>            
	</div>
</div>                                                 	