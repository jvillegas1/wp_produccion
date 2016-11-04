<%@ include file="TS_Common_Libraries.jsp" %>


<%
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 5 );
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
int position = 0;
String categoryPath = "/system/categories/SubSecciones/en/multimedia/destacadawebspecial/"; 
%>

<div class="row clear"> 
	<div class="col-mid"> </div>
	<div class="col-mid">
	<!--   <div class="btn-infographic" style="bottom:0"><a class="readblog" alt="" href="#">See more web specials</a></div>-->
	</div>

	<nt:news-list order="priority asc,user-modification-date" section="multimedia"  category="<%=categoryPath%>"  size="1" publication="9">
		<div class="col-3qua1">
			<div class="cont">
				<div class="webSpecialPlayer">
					<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
						<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject" style="height:399;">
							<a href="<nt:link/>" title="<nt:title value='home' />" class="her" TARGET="_blank">
								<nt:preview-image>
										<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
									<nt:conditional-include oncondition="${imageDescription != ''}">
										<meta itemprop="description" content='<nt:image-description/>'>	
										<img itemprop="contentURL" src="<nt:image-path width='640' height='364' scaletype='2'/>" alt="<nt:image-description/>" />
									</nt:conditional-include>
										<nt:conditional-include oncondition="${imageDescription == ''}">
											<meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
											<img itemprop="contentURL" src="<nt:image-path width='640' height='364' scaletype='2' />" alt='${news.titles[news.titleHomeNum]}'/>
										</nt:conditional-include>
								</nt:preview-image>
							</a>
						</div>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.homePreview == 'videoYouTube'}">
						<nt:video-youtube>
							<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								<meta itemprop="name" content="<nt:video-title/>" />
								<meta itemprop="publisher" content="<nt:video-publisher/>" />
								<meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
								<meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" /> 			
							</div>
							<iframe width="100%" height="399" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen></iframe>
						</nt:video-youtube>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.homePreview == 'iframe'}">
						<nt:iframe/>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.homePreview == 'videoEmbedded'}">
						<nt:video-embedded>
								<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
									<meta itemprop="name" content='<nt:video-title/>' />
								</div>
							<nt:video-code/>
						</nt:video-embedded>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.homePreview == 'videoFlash'}">
						<c:set var="videopath" value=""/>
						<nt:video-flash>	
							<div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								<meta itemprop="name" content="<nt:video-title/>" />
								<meta itemprop="publisher" content="<nt:video-publisher/>" />
								<meta itemprop="thumbnailUrl" content="<nt:video-thumbnail />" />
								<meta itemprop="contentURL" content="<nt:video-path/>" />
								<meta itemprop="keywords" content="<nt:video-tags/>" />	
								<nt:conditional-include onposition="1">
									<c:set var="videopath">${videopath}<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
								</nt:conditional-include>
								<nt:conditional-exclude onposition="1">
									<c:set var="videopath">${videopath};<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
								</nt:conditional-exclude>
								<nt:conditional-include onposition="last">
									<cms:include page="TS_Common_VideoFlash.jsp">
										<cms:param name="video">${videopath}</cms:param>
										<cms:param name="width" value="100%"/>
										<cms:param name="height" value="399"/>
									</cms:include>
								</nt:conditional-include>	
							</div>						
						</nt:video-flash>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
						<cms:img src="/arte/sinFoto_420x260.jpg" width="100%" height="399" alt="<nt:title value='home'/>"  />
					</nt:conditional-include>
				</div>
			</div> <!--Fin Cont-->
		</div>
		<div class="col-qua1">
			<div class="cont">
				<div class="aside-webSpecial">
					<div class="title-webSpecial" itemscope itemtype="http://schema.org/Article">
						<span>
						<meta itemprop="sameAs url" content="<nt:link/>"/>
							<a href="<nt:link/>" title="<nt:title value='home' />" class="title-webSpecial" TARGET="_blank">
								<h2 itemprop="name headline"><nt:title value='home' /></h2>
								<nt:edit-buttons hasNew="true" hasDelete="true"/>
							</a>
						</span>
					</div>	
					<!--redes-->
					<div class="time-webSpecial desktop">
						<div class="telesur">TeleSUR</div>
							<div class="exclusive"><a href="#" class="readblog" alt="">Exclusiva</a></div>
						<div class="tiempo"></div>
					</div>
					<div class="redes-webSpecial desktop">
						<cms:include page="TS_Common_AddThis.jsp" >
							<cms:param name="link"><nt:link/></cms:param> 
							<cms:param name="titulo"><nt:title value="section"/></cms:param>       
						</cms:include>
						<div class="gblogrs">
							<div class="num"></div>
						<!--  <img width="31" height="27" alt="" src="">-->
						</div>
						<div class="fbblogrs">
						</div>
						<div class="fbblogrs rojo sharblogrs">
							<div class="sharblogrs">
								<a href="#" alt=""><img src="" alt=""></a> 
							</div>
						</div>
					</div>

					<div class="texto-webSpecial">
						<div class="txtno" itemprop="about description alternativeHeadline" >
							<nt:conditional-include oncondition="${news.hideCopete != 'true'}">
								<nt:sub-title/> 
								<meta itemprop="about" content="<nt:video-title/>" />
							</nt:conditional-include>
								<a class="blue bold" href="<nt:link/>" title="Full Story" TARGET="_blank"> Full Story</a>
						</div>				
					</div>
				</div><!--Fin aside-webSpecial-->
			</div>
		</div><!--Fin Col-qua1-->
	</nt:news-list>     