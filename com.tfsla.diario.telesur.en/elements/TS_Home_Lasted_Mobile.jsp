<%@ include file="TS_Common_Libraries.jsp" %>


<c:set var="i" value="0" scope="page"/>
<nt:news-list order="priority asc,user-modification-date desc" onmainpage="home" size="2" zone="ultimas" publication="9">
	<nt:conditional-include onposition="first">
			<div id="scrollHeadMobile">
				<div class="wrap">
					<strong>Breaking:</strong>	
						<ul>
						</nt:conditional-include>
								
								<nt:conditional-include oncondition="${newslist.size < 2}">
										<div class="lastSlideMobile">
										<a href="<nt:link/>">
											<li itemtype="http://schema.org/Article">
												<meta itemprop="sameAs url" content="<nt:link/>"/>
												<meta itemprop="name headline" content="<nt:title value='home'/>"/>
												<nt:title value="home"/>
											</li>
										</a>		
								</nt:conditional-include>	
			<nt:conditional-include onposition="last">				
							</div>
						</ul>																
				</div>
			</div>	
			
	</nt:conditional-include>
</nt:news-list>