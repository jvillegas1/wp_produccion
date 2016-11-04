<%@ include file="TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE";
%>

<nt:news-list order="user-modification-date desc" publication="8" section="telesur_agenda" size="5" searchindex="<%=index%>">
	<nt:conditional-include onposition="first">
		<div class="wpAgenda first">
			<a href="http://www.telesurtv.net/seccion/telesur_agenda"><div class="square">Historias</div></a>
			<div class="SdHistory">
				<ul class="slides">
	</nt:conditional-include>
	
					<li itemscope itemtype="http://schema.org/Article">
						<meta itemprop="sameAs url" content="<nt:link/>"/>
						
						<nt:preview-image>
							
							<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
			      				
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
							</nt:conditional-include>
							
							<a href="<nt:link/>" title="${imageDescription}" alt="${imageDescription}" itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
								<meta itemprop="description" content='${imageDescription}'>
								<img itemprop="contentURL" src="arte/grey.gif" data-original="<nt:image-path width='146' height='82' scaletype='2'/>" width='146' height='82' alt="${imageDescription}" />
							</a>
							
						</nt:preview-image>
						
						<h4 itemprop="name headline">
							<a href="<nt:link/>" title="<nt:title value='home' />" alt="<nt:title value='home' />"><nt:title value='home' maxlength="58" endchars="..." /></a>
							<nt:edit-buttons hasNew="true" hasDelete="true"/>
						</h4>
					</li>
				
	<nt:conditional-include onposition="last">
				</ul>
			</div>
		</div>
	</nt:conditional-include>
</nt:news-list>