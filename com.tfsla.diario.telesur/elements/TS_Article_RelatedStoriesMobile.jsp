<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news>
	<c:set var="i" value="0" scope="page"/>
	<nt:related-news size="10">
		<c:set var="i" value="${i+1}" />			
		<c:if test="${i==1 }">
		<div class="row clear" id="latestMobile">  
			<div class="col">
				<div class="cont conttitle">
					<div class="title blue">Noticias relacionadas</div>
				</div>
				<div class="cont">
					 <div class="flexslider carousel">
					 	<ul class="slides">
		</c:if>
							<li> 
								<nt:preview-image>									
									<a href="<nt:link/>">
										<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
										<nt:conditional-include oncondition="${imageDescription != ''}">
											<img src="<nt:image-path width="420" height="260" scaletype="2" />" alt='<nt:image-description/>' title='<nt:image-description/>'>
										</nt:conditional-include>
										<nt:conditional-include oncondition="${imageDescription == ''}">
											<img src="<nt:image-path width="420" height="260" scaletype="2" />" alt='${news.titles[news.titleHomeNum]}' title='${news.titles[news.titleHomeNum]}'>
										</nt:conditional-include>
									</a>
								</nt:preview-image>
								<nt:conditional-exclude oncondition="${news.imagepreviewset}">
									<a href="<nt:link/>">
										<cms:img src="/arte/sinFoto_420x260.jpg" width="420" height="260" alt="${news.titles[news.titleHomeNum]}" title="${news.titles[news.titleHomeNum]}" />
									</a>
								</nt:conditional-exclude>
								<div class="caption"><a href="<nt:link/>" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><h2><nt:title value="home"/></h2></a></div>
							</li>
	</nt:related-news>
		<c:if test="${i > 0}">						
					        </ul>
					 </div>
				</div>
			</div>  
		</div> 
		</c:if>
</nt:news>