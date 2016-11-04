<%@ include file="TS_Common_Libraries.jsp" %>

<c:set var="i" value="0" scope="page"/>
<nt:news-list order="priority asc,user-modification-date desc" onmainpage="home" size="2" zone="ultimas">
	<nt:conditional-include onposition="first">
			<div id="scrollHead">
				<div class="wrap">
					<strong>último Minuto:</strong>	
					
						<ul>
						</nt:conditional-include>
								
									<nt:conditional-include oncondition="${newslist.size < 2}">
										<div class="lastSlide">
									
											<li itemtype="http://schema.org/Article">
												<meta itemprop="sameAs url" content="<nt:link/>"/>
												<meta itemprop="name headline" content="<nt:title value='home'/>"/>
												<nt:title value="home"/>
											</li>
											
								</nt:conditional-include>
								
								
								<nt:conditional-include oncondition="${newslist.size >= 2}">
									<c:set var="i" value="${i+1}" />			
									<c:if test="${i==1 }">
										<div class="marquee">	
										</c:if>				
											
											<li itemtype="http://schema.org/Article">
												<meta itemprop="sameAs url" content="<nt:link/>"/>
												<meta itemprop="name headline" content="<nt:title value='home'/>"/>
												<nt:title value="home"/>
											</li>	
											
								</nt:conditional-include>
			<nt:conditional-include onposition="last">				
							</div>
						</ul>																
				</div>
			</div>	
			
	</nt:conditional-include>
</nt:news-list>