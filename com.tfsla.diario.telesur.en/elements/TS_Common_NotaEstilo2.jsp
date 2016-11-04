<%@ include file="TS_Common_Libraries.jsp" %>


<% String path = (request.getParameter("path") != null ) ? request.getParameter("path") : "" ; %>	

<nt:news path="<%=path%>">
	<div class="news lineanews" itemscope itemtype="http://schema.org/Article">
		
		<nt:preview-image>
			<div class="minnews" itemscope itemtype="http://schema.org/ImageObject">
				<a href="<nt:link/>" class="her">
					<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
					<nt:conditional-include oncondition="${imageDescription != ''}">
						<meta itemprop="contentURL" itemprop="description" content='<nt:image-description/>'>	
						<img src="<nt:image-path width='268' height='139' scaletype='2'/>" width="268" height="139" alt='<nt:image-description/>' title='<nt:image-description/>' >
					</nt:conditional-include>
					<nt:conditional-include oncondition="${imageDescription == ''}">
						<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
						<img itemprop="contentURL" src="<nt:image-path width='268' height='139' scaletype='2'/>" width="268" height="139" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}' >
					</nt:conditional-include>
				</a>
			</div>
		</nt:preview-image>
		
		<div class="txt-news">
			<div class="new-tit" itemprop="name headline"><h3><a href="<nt:link/>" class="new-tit" alt='<nt:title value="section" />' title='<nt:title value="section" />'><nt:title value="section"/></a></h3></div>
			<nt:edit-buttons hasNew="true" hasDelete="true"/>
			<nt:conditional-include oncondition="${news.hideCopete == 'false'}">
				<div class="new-bajada" itemprop="description alternativeHeadline"><nt:sub-title/></div>	
			</nt:conditional-include>	   
			<div class="new-link">
				<ul class="arrow">								
					<nt:related-news onmainpage="home" size="3" publication="9">			
				         <c:set var="i" value="${i+1}" />			
                       			<c:if test="${i> 0 and i<= 3 }">					
					<li><a class="new-arrow blue" href="<nt:link/>" alt='<nt:title />' title='<nt:title />'> <nt:title /> </a></li>  					
					</c:if> 
					</nt:related-news>    												
				</ul>
			</div>			                      
		</div>
	</div> 
</nt:news>