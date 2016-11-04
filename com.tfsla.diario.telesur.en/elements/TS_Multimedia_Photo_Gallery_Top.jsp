<%@ include file="TS_Common_Libraries.jsp" %>
<%
org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
Boolean isProjectOnline = cms.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE_EN";	
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";

String localpath = (request.getParameter("localpath") == null ) ? "" : request.getParameter("localpath") ;

if(localpath.equals("")) {
%>
<nt:news-list order="priority, user-modification-date desc" section="multimedia" category="/SubSecciones/en/multimedia/galleries/" size="1">
	<div class="flexslider carousel gallery clear" id="galeriaDestacada">
		  <ul class="slides">			      		
			<nt:image-gallery>
				<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>			
				<li itemscope itemtype="http://schema.org/ImageObject"> 
					<nt:conditional-include oncondition="${imageDescription != ''}">
						<meta itemprop="description" content='<nt:image-description/>'>	
						<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="860" height="532" />" alt="<nt:image-description/>" />
					</nt:conditional-include>
					<nt:conditional-include oncondition="${imageDescription == ''}">						
						<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
						<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="860" height="532" />" alt='${news.titles[news.titleSectionNum]}' />
					</nt:conditional-include>
					
					<div class="caption">
						<a href="<nt:link/>" class="her" title="${news.titles[news.titleSectionNum]}">
							<h2>${news.titles[news.titleSectionNum]}</h2>
						</a>
						<p><nt:image-description/></p>
					</div>
				</li>
			</nt:image-gallery>
		  </ul>
	</div>
	<div class="flexsliderMobile">
		<div class="flexslider carousel gallery">
			<ul class="slides">
				<nt:image-gallery>
					<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>		
					<li itemscope itemtype="http://schema.org/ImageObject"> 
						<a href="<nt:link/>" class="her" title="${news.titles[news.titleSectionNum]}">
						<nt:conditional-include oncondition="${imageDescription != ''}">
							<meta itemprop="description" content='<nt:image-description/>'>	
							<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="860" height="532" />" alt="<nt:image-description/>" />
						</nt:conditional-include>
						<nt:conditional-include oncondition="${imageDescription == ''}">
							<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
							<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="860" height="532" />" alt='${news.titles[news.titleSectionNum]}' />
						</nt:conditional-include>
						</a>
						<div class="caption">
							<a href="<nt:link/>" class="her" title="${news.titles[news.titleSectionNum]}">
								<h2>${news.titles[news.titleSectionNum]}</h2>
							</a>
							<p><nt:image-description/></p>
						</div>
					</li>
				</nt:image-gallery>
			</ul>
		</div>
	</div>
</nt:news-list>
<%
} else {
%>
<nt:news path="<%=localpath%>">
	<div class="flexslider carousel gallery clear">
		<ul class="slides">
			<nt:image-gallery>
				<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
				<li itemscope itemtype="http://schema.org/ImageObject"> 
					<nt:conditional-include oncondition="${imageDescription != ''}">
						<meta itemprop="description" content='<nt:image-description/>'>	
						<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="860" height="532" />" alt="<nt:image-description/>" />
					</nt:conditional-include>
					<nt:conditional-include oncondition="${imageDescription == ''}">
						<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
						<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="860" height="532" />" alt='${news.titles[news.titleSectionNum]}' />
					</nt:conditional-include>
					
					<div class="caption">
						<a href="<nt:link/>" class="her" title="${news.titles[news.titleSectionNum]}">
							<h2>${news.titles[news.titleSectionNum]}</h2>
						</a>
						<p><nt:image-description/></p>
					</div>
				</li>
			</nt:image-gallery>
		</ul>
	</div>
	<div class="flexsliderMobile ">
		<div class="flexslider carousel gallery">
			<ul class="slides">
				<nt:image-gallery>
					<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
					<li itemscope itemtype="http://schema.org/ImageObject"> 
						<a href="<nt:link/>" class="her" title="${news.titles[news.titleSectionNum]}">
							<nt:conditional-include oncondition="${imageDescription != ''}">
								<meta itemprop="description" content='<nt:image-description/>'>
								<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="860" height="532" />" alt="<nt:image-description/>" />
							</nt:conditional-include>
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
								<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="860" height="532" />" alt='${news.titles[news.titleSectionNum]}' />
							</nt:conditional-include>
						</a>
						<div class="caption">
							<a href="<nt:link/>" class="her" title="${news.titles[news.titleSectionNum]}">
								<h2>${news.titles[news.titleSectionNum]}</h2>
							</a>
							<p><nt:image-description/></p>
						</div>
					</li>
				</nt:image-gallery>
			</ul>
		</div>
	</div>
</nt:news>

<script>
$('.flexslider').flexslider({
	animation: "slide",
	animationLoop: false,
	itemWidth: 870,
	itemHeight: 505,
	itemMargin: 0,
	pausePlay: false,
	start: function(slider){
	  $('body').removeClass('loading');
	}
  });		  
</script>
<%	
}
%>