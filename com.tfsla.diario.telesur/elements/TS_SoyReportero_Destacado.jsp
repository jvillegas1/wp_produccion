<%@ include file="TS_Common_Libraries.jsp" %>

<div class="cont" itemscope itemtype="http://schema.org/Article">
	<nt:news-list section="imreporter" order="priority desc,user-modification-date desc" onmainpage="section" zone="destacada" size="1" >   
		<meta itemprop="sameAs url" content="<nt:link/>">                     
		<div class="blue">
		    <a href="<nt:link />" class="her">
		        <h1 itemprop="name headline"><nt:title value='section' /></h1>
		        <nt:edit-buttons hasNew="true" hasDelete="true"/>
		    </a>
		</div>

		<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
			<nt:conditional-include oncondition="${news.imagescount > 0}">
				<div class="img-destnew npc" itemscope itemtype="http://schema.org/ImageObject">    
					<a href="<nt:link/>" title="<nt:title value='section' />" class="her">
						<nt:preview-image>
							<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
							<nt:conditional-include oncondition="${imageDescription != ''}">
								<meta itemprop="description" content='<nt:image-description/>'> 
								<img itemprop="contentURL" src="<nt:image-path width='541' height='305'  scaletype='2'/>" alt="<nt:image-description/>" title="<nt:image-description/>" width="541" height="305" />
							</nt:conditional-include>
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
								<img itemprop="contentURL" src="<nt:image-path width='541' height='305'  scaletype='2'/>" alt="${fn:escapeXml(news.titles["section"])}" title="${fn:escapeXml(news.titles["section"])}" width="541" height="305" />
							</nt:conditional-include>
						</nt:preview-image>
					</a>
				</div>
			</nt:conditional-include>
			<nt:conditional-include oncondition="${news.videoscount > 0 && news.imagescount == 0}">
				<div class="img-destnew npc" itemscope itemtype="http://schema.org/VideoObject">
					<nt:video-embedded>
						<nt:conditional-include onposition="1">
							<meta itemprop="name" content='<nt:video-title/>' />    
							<nt:video-code />
						</nt:conditional-include>            
					</nt:video-embedded>
				</div>
			</nt:conditional-include>
		</nt:conditional-include>
		
		<nt:conditional-include oncondition="${news.homePreview == 'videoEmbedded'}">
			<div class="img-destnew npc" itemscope itemtype="http://schema.org/VideoObject">
				<nt:video-embedded>
					<nt:conditional-include onposition="1">
						<meta itemprop="name" content='<nt:video-title/>' />    
						<nt:video-code />
					</nt:conditional-include>           
				</nt:video-embedded>
			</div>
		</nt:conditional-include>
                            
		<nt:conditional-include oncondition="${news.homePreview == 'videoYouTube'}">
			<div class="img-destnew npc" itemscope itemtype="http://schema.org/VideoObject">    
				<c:set var="y" value="0" />
				<nt:video-youtube>
					<c:set var="y" value="${y+1}" />
					<c:set var="videoHomeY"><nt:generic-news-value element='videoFlash[${y}]/mostrarEnHome'/></c:set>	
					<nt:conditional-include oncondition="${videoHomeY == 'true'}">
						<meta itemprop="name" content='<nt:video-title/>' />
						<meta itemprop="publisher" content="<nt:video-publisher/>" />
						<meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
						<meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
						<iframe width="100%" src="//www.youtube.com/embed/<nt:video-youtubeid/>" frameborder="0" allowfullscreen></iframe>
					</nt:conditional-include>
				</nt:video-youtube>
			</div>
		</nt:conditional-include>
            
		<nt:conditional-include oncondition="${news.homePreview == 'iframe'}">
			<div class="img-destnew npc">
				<nt:iframe/>
			</div>
		</nt:conditional-include>                  
            
		<nt:conditional-include oncondition="${news.homePreview == 'videoFlash'}">
			<div class="img-destnew npc" itemscope itemtype="http://schema.org/VideoObject">
				<c:set var="videopath" value=""/>
				<nt:video-flash>    
					<nt:conditional-include onposition="1">
						<c:set var="videopath">${videopath}<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
					</nt:conditional-include>
					<nt:conditional-exclude onposition="1">
						<c:set var="videopath">${videopath};<nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
					</nt:conditional-exclude>
					<nt:conditional-include onposition="last">
						<meta itemprop="name" content='<nt:video-title/>' />
						<meta itemprop="publisher" content="<nt:video-publisher/>" />
						<meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
						<meta itemprop="contentURL" content="<nt:video-path/>" />
						<meta itemprop="keywords" content="<nt:video-tags/>" /> 
						<meta itemprop="duration" content="<nt:video-duration/>" />
						<meta itemprop="bitrate" content="<nt:video-bitrate/>" />
						<cms:include page="TS_Common_VideoFlash.jsp">
							<cms:param name="video">${videopath}</cms:param>
							<cms:param name="width" value="100%"/>
							<cms:param name="height" value="100%"/>
						</cms:include>
					</nt:conditional-include>                           
				</nt:video-flash>  
			</div>            
		</nt:conditional-include>
		
		<div itemprop='description alternativeHeadline'>
        		<p><nt:sub-title/></p>  
		</div>      
        
        	<div class="cont">
                        <div class="reportbar">
				<nt:authors>
					<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
					<jsp:useBean id="internalUser" type="java.lang.String" />
					
					<nt:user username="${internalUser}">
						<div class="inforepo">
							<div class="imgrepo">
							
								<nt:conditional-include oncondition="${ntuser.infoextra['USER_MOSTRAR_NOMBRE'] == 'TRUE' || empty ntuser.infoextra['USER_MOSTRAR_NOMBRE']}">
									<c:set var="usuario" scope="page"> <nt:user-firstname/> <nt:user-lastname/> </c:set>
								</nt:conditional-include>
								
								<nt:conditional-include oncondition="${ntuser.infoextra['USER_MOSTRAR_APODO'] == 'TRUE'}">
									<c:set var="usuario" scope="page"> <nt:user-nickname/> </c:set>
								</nt:conditional-include>
							
								<a href="<nt:user-link-friendly />" class="her">
									<nt:conditional-include oncondition="${ntuser.infoextra['USER_PICTURE'] != null && ntuser.infoextra['USER_PICTURE'] != ' '}">
									  	<img src="<nt:user-image width='59' height='59' scaletype='2' />" width="59" height="59" alt='${usuario}' title='${usuario}' /> 
									</nt:conditional-include>
									<nt:conditional-include oncondition="${ntuser.infoextra['USER_PICTURE'] == null}">
										<cms:img src="/arte/perfil_user.jpg" width="59" height="59" alt="${usuario}' title='${usuario}" />   
									</nt:conditional-include> 
								</a>
							</div>						
							<div class="autrepo" itemprop="author" itemscope itemtype="http://schema.org/Person">
								<meta itemprop="name" content="${usuario}"/>
								<meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
								<a href="<nt:user-link-friendly />" class="her" alt="${usuario}" title="${usuario}"> ${usuario} </a>
							</div>
							<nt:conditional-include oncondition="${ntuser.infoextra['USER_COUNTRY'] != null && ntuser.infoextra['USER_COUNTRY'] != ''}">
								<div class="cityrepo">
									<c:set var="desCateg" scope="page">
		           							<cms:property name="Title" file="${ntuser.infoextra['USER_COUNTRY']}" />
		           						</c:set>
									${desCateg}
								</div>
							</nt:conditional-include>
						</div>
					</nt:user>
				</nt:authors>
				<div class="sharepo">
					<div class="blogrs">
						<div class="fbreport desktop">
							<cms:include page="TS_Common_AddThis.jsp" >
								<cms:param name="link"><nt:link/></cms:param> 
								<cms:param name="titulo"><nt:title value="section"/></cms:param>       
							</cms:include>							
						</div>
						<nt:conditional-include oncondition="${news.commentcount > 0}"> 
						<div class="gblogrs desktop">
							<div class="num desktop">${news.commentcount}</div>
							<cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comentarios" title="Comentarios" />
						</div>
						</nt:conditional-include>	
						<nt:conditional-include oncondition="${news.commentcount == 0}"> 
							<div class="gblogrs desktop">&nbsp;&nbsp;</div>								
						</nt:conditional-include>
						<div class="repoarrow">
							<div class="img">
								<cms:img src="/arte/down-arrow2.png" width="20" height="11" alt="Valoraciones Negativas" title="Valoraciones Negativas" />
							</div>
							<div class="txt"><nt:news-negative-valorations/></div>
						</div>
						<div class="repoarrow">
							<div class="img">
								<cms:img src="/arte/up-arrow.png" width="20" height="11" alt="Valoraciones Positivas" title="Valoraciones Positivas" />
							</div>
							<div class="txt"><nt:news-positive-valorations/></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nt:news-list>	
</div>

  