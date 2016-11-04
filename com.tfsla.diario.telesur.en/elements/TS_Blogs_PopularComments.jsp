<%@ include file="TS_Common_Libraries.jsp" %>
<%
  /**
  * Blog Page - More Commented
  *
  */
  int cont = 0;
  org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
  Boolean isProjectOnline = cms.getCmsObject().getRequestContext().currentProject().isOnlineProject();
  String index = "TS_NEWS_ONLINE_EN";	
  if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";
%>
<nt:news-list newstype="bloggers" order="most-commented, priority asc, user-modification-date desc" onmainpage="section" zone="normal" from="7d" age="7d"  searchindex="<%=index%>">
	<% cont++; %>
</nt:news-list>

<div class="headers bluegar">Popular Comments</div>
<% if (cont > 0) { %>	
	<div class="cont">
		<ul>
			<nt:news-list newstype="bloggers" order="most-commented, priority asc, user-modification-date desc" onmainpage="section" from="7d" age="7d" zone="normal" size="3" searchindex="<%=index%>">
				<li >
					<div class="popbox">
						<div class="titlepopbox">
							<a href="<nt:link />" class="her" alt="<nt:title value="home" />" title="<nt:title value="home" />">
								<nt:title value="home" />
							</a>
						</div>
						<nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
							<div class="autorpopbox">							
								<nt:authors>
									<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
									<c:if test="${internalUser != ''}">
										<nt:user username="${internalUser}">
											<a href="/english<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a>									
										</nt:user>
									</c:if>	 
									<c:if test="${internalUser == ''}">
							    			<a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a>
							    		</c:if>							    		
								</nt:authors>																						
							</div>
						</nt:conditional-include>
					</div>
				</li>
			</nt:news-list>
		</ul>
	</div>
<% } else { %>
	<div class="cont">
		<div class="modnews">
			<div class="titlepopbox">No notes with popular comments</div>
		</div>
	</div>
<% } %>