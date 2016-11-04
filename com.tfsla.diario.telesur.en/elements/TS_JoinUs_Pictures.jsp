<%@ include file="TS_Common_Libraries.jsp" %>
<%
org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
Boolean isProjectOnline = cms.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE_EN";	
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";
%>

<nt:news>
	<div class="rowInt" itemscope itemtype="http://schema.org/Article">
		<meta itemprop="sameAs url" content="<nt:link/>"> 
		<div class="headers blue">Your Pictures</div>
		<div class="cont">
			<div class="contagend2 topicsNews"> 
			        <nt:news-list section="joinus" onmainpage="section" zone="inpictures" size="6" order="priority desc, user-modification-date desc" state="publicada" searchindex="<%=index%>">  
					<div class="col-mid">
						<div class="cont" itemscope itemtype="http://schema.org/ImageObject">
							<nt:preview-image>								
								<a class="fancybox" href="<nt:image-path width='640' height='360' scaletype='2'/>" alt='${news.titles[news.titleHomeNum]}' title='<h4>${news.titles[news.titleHomeNum]}</h4>${news.subtitle}' >								
									<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
									<nt:conditional-include oncondition="${imageDescription != ''}">
										<meta itemprop="description" content='<nt:image-description/>'>											
										<img src="<nt:image-path width='203' height='133' scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>'>
									</nt:conditional-include>
									<nt:conditional-include oncondition="${imageDescription == ''}">
										<meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
										<img src="<nt:image-path width='203' height='133' scaletype='2'/>" alt='${news.titles[news.titleHomeNum]}' title='${news.titles[news.titleHomeNum]}'>
									</nt:conditional-include>									
									
									<div class="captionMin" itemprop="name headline">
										<h6>${news.titles[news.titleHomeNum]}</h6>
										<nt:edit-buttons hasDelete="true"/>
									</div>							
								</a>
							</nt:preview-image>
						</div>
					</div>  
				</nt:news-list>                              	
			</div>
			<a class="photo" href="/english/posts/post_picture.html">Have a photo to share? Upload it here!</a>
		</div>
	</div>
</nt:news>