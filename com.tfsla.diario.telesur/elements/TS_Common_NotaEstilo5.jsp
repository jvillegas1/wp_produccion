<%@ include file="TS_Common_Libraries.jsp" %>

<% 
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String currentUri = cms.getRequestContext().getUri();

String path = (request.getParameter("path") != null ) ? request.getParameter("path") : "" ; 
boolean usuarios = (request.getParameter("usuarios") != null ) ? true : false ; 
%> 

<nt:news path="<%=path %>" >				
	<div class="news" itemscope itemtype="http://schema.org/Article" <% if ( usuarios ) { %> style="padding:3%; width:94%; background-color:#F6F6F6; margin-bottom:10px" <% } %> >	
		<nt:preview-image>
			<div class="min80" itemscope itemtype="http://schema.org/ImageObject" <% if ( usuarios ) { %> style="width:130px;" <% } %> >
				<a href="<nt:link/>" class="her">
					<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
					<nt:conditional-include oncondition="${imageDescription != ''}">
						<meta itemprop="description" content='<nt:image-description/>'>		
						<img itemprop="contentURL" src="<nt:image-path width="80" height="80" scaletype='2'/>" width="80" height="80" alt='<nt:image-description/>' title='<nt:image-description/>'>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${imageDescription == ''}">
						<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
						<img itemprop="contentURL" src="<nt:image-path width="80" height="80" scaletype='2'/>" width="80" height="80" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}' >
					</nt:conditional-include>
				</a>
			</div>
		</nt:preview-image>
		<div class="txt-newslit">
			<div class="new-tit" itemprop="name headline">
				<h4>
					<a href="<nt:link/>" class="new-tit" alt='<nt:title value="section"/>' title='<nt:title value="section"/>'>
						<nt:title value="section"/>
					</a>
				</h4>
			</div>
			<% if ( !usuarios ) { %> 
				<nt:edit-buttons hasNew="true" hasDelete="true"/>
			<% } %>
			<nt:conditional-include oncondition="${news.subtitle != ''}">
			<div class="new-bajada" itemprop="description alternativeHeadline"><nt:sub-title/></div> 
			</nt:conditional-include>
			<nt:conditional-include oncondition="${news.subtitle == ''}">
			<div class="new-bajada" itemprop="description alternativeHeadline">
			<nt:body-splitter>									
									<nt:conditional-include onposition="1">
										<p><nt:body-paragraph /></p>
									</nt:conditional-include>
								</nt:body-splitter>
								</div> 
			</nt:conditional-include>
			
			
			
		</div>
		<% if (currentUri.indexOf("/country/") > -1 ) { %>
			<nt:conditional-include oncondition="${news.hideComments == false}">
				<div class="width15">						
					<div class="gblogrs">
						<div class="num">${news.commentcount}</div>
						<cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comentarios" title="Comentarios" />
					</div>						
				</div> 
			</nt:conditional-include> 
		<% } %>  		
	</div>
</nt:news>