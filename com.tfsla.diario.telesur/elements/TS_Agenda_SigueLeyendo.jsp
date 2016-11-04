<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news>
	<c:set var="i" value="0" scope="page"/>
	<nt:related-news size="4">	
		<nt:conditional-include oncondition="${newslist.size > 4}">
			<c:set var="i" value="${i+1}" />			
			<c:if test="${i==1 }">
			<!-- mid TOPICS -->
			<div>					
				<div class="head">Sigue Leyendo</div>           
				<div>
			<ul>
			</c:if>				
	
		
						<li style="padding-top: 20px;">
							<div class="hzNote">
								<div class="wpSmallImg">								
									<nt:preview-image>									
										<a href="<nt:link/>">
											<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
											<nt:conditional-include oncondition="${imageDescription != ''}">
												<img src="<nt:image-path width="170" height="105" scaletype="2" />" alt='<nt:image-description/>' title='<nt:image-description/>'>
											</nt:conditional-include>
											<nt:conditional-include oncondition="${imageDescription == ''}">
												<img src="<nt:image-path width="170" height="105" scaletype="2" />" alt='${news.titles[news.titleHomeNum]}' title='${news.titles[news.titleHomeNum]}'>
											</nt:conditional-include>
										</a>
									</nt:preview-image>
									
									<nt:conditional-exclude oncondition="${news.imagepreviewset}">
										<a href="<nt:link/>">
											<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt="${news.titles[news.titleHomeNum]}" title="${news.titles[news.titleHomeNum]}" />
										</a>
									</nt:conditional-exclude>		
								</div>
									<div><a href="<nt:link/>" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><nt:title value="home"/></a></div>
								<div class="clear"></div>
							</div>    
							</li>	
		</nt:conditional-include>
		
		</ul>	
		
		<nt:conditional-include oncondition="${newslist.size <= 4}">
		<c:set var="i" value="${i+1}" />
		<c:if test="${i==1 }">
			<div>					
				<div class="head">Sigue Leyendo</div>   
					<div>       
					<ul>
		</c:if>
						<li style="padding-top: 20px;">
							<div class="hzNote">
								<div class="wpSmallImg">
									<nt:preview-image>									
										<a href="<nt:link/>">
											<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
											<nt:conditional-include oncondition="${imageDescription != ''}">
												<img src="<nt:image-path width="170" height="105" scaletype="2" />" alt='<nt:image-description/>' title='<nt:image-description/>'>
											</nt:conditional-include>
											<nt:conditional-include oncondition="${imageDescription == ''}">
												<img src="<nt:image-path width="170" height="105" scaletype="2" />" alt='${news.titles[news.titleHomeNum]}' title='${news.titles[news.titleHomeNum]}'>
											</nt:conditional-include>
										</a>
									</nt:preview-image>
									
									<nt:conditional-exclude oncondition="${news.imagepreviewset}">
										<a href="<nt:link/>">
											<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt="${news.titles[news.titleHomeNum]}" title="${news.titles[news.titleHomeNum]}" />
										</a>
									</nt:conditional-exclude>
								</div>
									<div><a href="<nt:link/>" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><nt:title value="home"/></a></div>
								<div class="clear"></div>
							</div>
						</li>							
		</nt:conditional-include>
	</nt:related-news>
			<c:if test="${i > 0}">								 
					</ul>			
				</div>
			</div>
			<div class="margensep"></div>
			</c:if>								
</nt:news>	