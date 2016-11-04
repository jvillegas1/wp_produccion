<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news>
<% String width = "600" ;
String height = "340" ;
 int contadorVideo = 0;
 %>
 
	<div class="cont-tabs">
		<ul class="idTabs"> 
			<nt:conditional-include oncondition="${news.detailPreview == 'imagen'}">
				<nt:conditional-include oncondition="${news.imagescount > 1 || (news.imagescount == 1 && news.videoscount > 0)}">
					<li class="fotos"><a href="#fotos" alt="Fotos" title="Fotos" onclick="StopVideos();">FOTOS</a></li>
				</nt:conditional-include>
				<nt:conditional-include oncondition="${news.videoscount > 1 || (news.videoscount > 0 && news.imagescount > 0)}">
					<li class="videos"><a href="#videos" alt="Videos" title="Videos">VIDEOS</a></li> 
				</nt:conditional-include>
			</nt:conditional-include>
			
			
			<nt:conditional-include oncondition="${news.detailPreview != 'imagen'}">
				<nt:conditional-include oncondition="${news.videoscount > 1 || (news.videoscount == 1 && news.imagescount > 0)}">
					<li class="videos"><a href="#videos" alt="Videos" title="Videos">VIDEOS</a></li>
				</nt:conditional-include>
				<nt:conditional-include oncondition="${news.imagescount > 1 || (news.imagescount > 0 && news.videoscount > 0)}">
					<li class="fotos"><a href="#fotos" alt="Fotos" title="Fotos" onclick="StopVideos();">FOTOS</a></li>
				</nt:conditional-include>
			</nt:conditional-include> 				 
		</ul>                     
	</div><!--tags-nota-int-->	

	<nt:conditional-include oncondition="${news.detailPreview == 'imagen'}">
		<nt:conditional-include oncondition="${news.imagescount > 0}">
			<div id="fotos">
				<ul class="slides">
						<nt:image-gallery>
							<li itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">							
								<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>			
                               					<c:set var="imageSource" scope="page"><nt:image-source/></c:set>    
								<nt:conditional-include oncondition="${(imageDescription != '') && (imageSource != '')}">					
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title="<nt:image-description/> | Foto: <nt:image-source/>" width="<%=width %>" height="<%=height %>" />
									<div class="caption" content='<nt:image-description/>'><h2><nt:image-description/> | Foto: <nt:image-source/></h2></div>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${(imageDescription != '') && (imageSource == '')}">					
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' width="<%=width %>" height="<%=height %>" />
									<div class="caption" content='<nt:image-description/>'><h2><nt:image-description/></h2></div>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${(imageDescription == '') && (imageSource != '')}">
									<meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='${news.titles[news.titleDetailNum]}' title="${news.titles[news.titleDetailNum]} | Foto: <nt:image-source/>" width="<%=width %>" height="<%=height %>" />
									<div class="caption" content='<nt:image-description/>'><h2><nt:image-description/> | Foto: <nt:image-source/></h2></div>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${(imageDescription == '') && (imageSource == '')}">
									<meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}' width="<%=width %>" height="<%=height %>" />
								</nt:conditional-include>
							</li>	
						</nt:image-gallery>													
					</ul>
			</div>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.videoscount > 0}">
			<div id="videos">
				<ul class="slides">
            				        <c:set var="videopath" value="" />          					                    					
    						<nt:video-flash>
    							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
    								<c:set var="videopath"><nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
    								<meta itemprop="name" content='<nt:video-title/>' />
    								<meta itemprop="publisher" content="<nt:video-publisher/>" />
		  						<meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
								<meta itemprop="contentURL" content="<nt:video-path/>" />
								<meta itemprop="keywords" content="<nt:video-tags/>" />	
								<meta itemprop="duration" content="<nt:video-duration/>" />
								<meta itemprop="bitrate" content="<nt:video-bitrate/>" />						
								<cms:include page="TS_Common_VideoFlash.jsp">
									<cms:param name="video">${videopath}</cms:param>
									<cms:param name="imagen"><nt:video-thumbnail/></cms:param>
									<cms:param name="titulo"><nt:video-title/></cms:param>
									<cms:param name="width" value="100%"/>
									<cms:param name="height" value="<%=height %>"/>
								</cms:include>
							</li>
						</nt:video-flash>
					
						<nt:video-youtube>
							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								<meta itemprop="name" content='<nt:video-title/>' />
								<meta itemprop="publisher" content="<nt:video-publisher/>" />
								<meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
								<meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
				                      		<iframe id="player<%=contadorVideo%>" class="iframeYT" width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>?enablejsapi=1&version=3&playerapiid=player<%=contadorVideo%>" frameborder="0" allowfullscreen> </iframe>
                                        			<% contadorVideo++; %>
			                		</li>
			                	</nt:video-youtube>
					
						<nt:video-embedded>
							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								<meta itemprop="name" content='<nt:video-title/>' />
								<nt:video-code />      
							</li>
						</nt:video-embedded>							
            				
            			</ul>
                    	</div>	
		</nt:conditional-include> 
	</nt:conditional-include>
	
	<nt:conditional-include oncondition="${news.detailPreview != 'imagen'}">
		<nt:conditional-include oncondition="${news.videoscount > 0}">
		<div id="videos">
			<ul class="slides">
                    			<nt:conditional-include oncondition="${news.detailPreview == 'videoFlash'}">
                    				<c:set var="videopath" value="" />          					                    					
    						<nt:video-flash>
    							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
    								<c:set var="videopath"><nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
    								<meta itemprop="name" content='<nt:video-title/>' />
    								<meta itemprop="publisher" content="<nt:video-publisher/>" />
		  						<meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
								<meta itemprop="contentURL" content="<nt:video-path/>" />							
								<meta itemprop="keywords" content="<nt:video-tags/>" />	
								<meta itemprop="duration" content="<nt:video-duration/>" />
								<meta itemprop="bitrate" content="<nt:video-bitrate/>" />
								<cms:include page="TS_Common_VideoFlash.jsp">
									<cms:param name="video">${videopath}</cms:param>
									<cms:param name="imagen"><nt:video-thumbnail/></cms:param>
									<cms:param name="titulo"><nt:video-title/></cms:param>
									<cms:param name="width" value="100%"/>
									<cms:param name="height" value="<%=height %>"/>
								</cms:include>
							</li>
						</nt:video-flash>
				        	
						<nt:video-youtube>
							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								<meta itemprop="name" content='<nt:video-title/>' />
								<meta itemprop="publisher" content="<nt:video-publisher/>" />
								<meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
								<meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
				                      		<iframe id="player<%=contadorVideo%>" class="iframeYT" width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>?enablejsapi=1&version=3&playerapiid=player<%=contadorVideo%>" frameborder="0" allowfullscreen> </iframe>
                                         			<% contadorVideo++; %>
			                		</li>
			                	</nt:video-youtube>
					
					       <nt:video-embedded>
							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								<meta itemprop="name" content='<nt:video-title/>' />
								<nt:video-code />       
							</li>
						</nt:video-embedded>		
				        </nt:conditional-include>
				        <nt:conditional-include oncondition="${news.detailPreview == 'videoYouTube'}">					       					        	
						<nt:video-youtube>
							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								<meta itemprop="name" content='<nt:video-title/>' />
								<meta itemprop="publisher" content="<nt:video-publisher/>" />
								<meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
								<meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
				                      		<iframe id="player<%=contadorVideo%>" class="iframeYT" width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>?enablejsapi=1&version=3&playerapiid=player<%=contadorVideo%>" frameborder="0" allowfullscreen> </iframe>
                                        			<% contadorVideo++; %>
			                		</li>
			                	</nt:video-youtube>
				                
                    				<c:set var="videopath" value="" />          					                    					
    						<nt:video-flash>
    							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
    								<c:set var="videopath"><nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
    								<meta itemprop="name" content='<nt:video-title/>' />
    								<meta itemprop="publisher" content="<nt:video-publisher/>" />
		  						<meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
								<meta itemprop="contentURL" content="<nt:video-path/>" />
								<meta itemprop="keywords" content="<nt:video-tags/>" />	
								<meta itemprop="duration" content="<nt:video-duration/>" />
								<meta itemprop="bitrate" content="<nt:video-bitrate/>" />							
								<cms:include page="TS_Common_VideoFlash.jsp">
									<cms:param name="video">${videopath}</cms:param>
									<cms:param name="imagen"><nt:video-thumbnail/></cms:param>
									<cms:param name="titulo"><nt:video-title/></cms:param>
									<cms:param name="width" value="100%"/>
									<cms:param name="height" value="<%=height %>"/>
								</cms:include>
							</li>
						</nt:video-flash>
					
					        <nt:video-embedded>
							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								<meta itemprop="name" content='<nt:video-title/>' />
								<nt:video-code />         
							</li>
						</nt:video-embedded>		
				        </nt:conditional-include>
				        <nt:conditional-include oncondition="${news.detailPreview == 'videoEmbedded'}">						        						
					        <nt:video-embedded>
							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								<meta itemprop="name" content="<nt:video-title/>" />
								<nt:video-code />        
							</li>
						</nt:video-embedded>	
					        				       					        	
						<c:set var="videopath" value="" />          					                    					
    						<nt:video-flash>
    							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
    								<c:set var="videopath"><nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
    								<meta itemprop="name" content='<nt:video-title/>' />
    								<meta itemprop="publisher" content="<nt:video-publisher/>" />
		  						<meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
								<meta itemprop="contentURL" content="<nt:video-path/>" />
								<meta itemprop="keywords" content="<nt:video-tags/>" />		
								<meta itemprop="duration" content="<nt:video-duration/>" />
								<meta itemprop="bitrate" content="<nt:video-bitrate/>" />						
								<cms:include page="TS_Common_VideoFlash.jsp">
									<cms:param name="video">${videopath}</cms:param>
									<cms:param name="imagen"><nt:video-thumbnail/></cms:param>
									<cms:param name="titulo"><nt:video-title/></cms:param>
									<cms:param name="width" value="100%"/>
									<cms:param name="height" value="<%=height %>"/>
								</cms:include>
							</li>
						</nt:video-flash>
				        	
						<nt:video-youtube>
							<li itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
								<meta itemprop="name" content='<nt:video-title/>' />
								<meta itemprop="publisher" content="<nt:video-publisher/>" />
								<meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
								<meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
				                      		<iframe id="player<%=contadorVideo%>" class="iframeYT" width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>?enablejsapi=1&version=3&playerapiid=player<%=contadorVideo%>" frameborder="0" allowfullscreen> </iframe>
                                        			<% contadorVideo++; %>
			                		</li>
			                	</nt:video-youtube>
				        </nt:conditional-include>				        					        
		        	</ul>
	        </div>
	        </nt:conditional-include>
	        <nt:conditional-include oncondition="${news.imagescount > 0}">
		        <div id="fotos">
				<ul class="slides">                
						<nt:image-gallery>
							<li itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">																					
								<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>			
                               					<c:set var="imageSource" scope="page"><nt:image-source/></c:set>    
								<nt:conditional-include oncondition="${(imageDescription != '') && (imageSource != '')}">					
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title="<nt:image-description/> | Foto: <nt:image-source/>" width="<%=width %>" height="<%=height %>" />
									<div class="caption" content='<nt:image-description/>'><h2><nt:image-description/> | Foto: <nt:image-source/></h2></div>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${(imageDescription != '') && (imageSource == '')}">					
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' width="<%=width %>" height="<%=height %>" />
									<div class="caption" content='<nt:image-description/>'><h2><nt:image-description/></h2></div>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${(imageDescription == '') && (imageSource != '')}">
									<meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='${news.titles[news.titleDetailNum]}' title="${news.titles[news.titleDetailNum]} | Foto: <nt:image-source/>" width="<%=width %>" height="<%=height %>" />
									<div class="caption" content='<nt:image-description/>'><h2><nt:image-description/> | Foto: <nt:image-source/></h2></div>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${(imageDescription == '') && (imageSource == '')}">
									<meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}' width="<%=width %>" height="<%=height %>" />
								</nt:conditional-include>
							</li>
						</nt:image-gallery>
				</ul>
			</div>
	        </nt:conditional-include>
        </nt:conditional-include>
        
        <nt:conditional-include oncondition="${news.imagescount == 0 && news.videoscount == 0}">
		<div id="fotos">
			<ul class="slides">
			        	<nt:preview-image>
			        		<li itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">				
							<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>			
                               					<c:set var="imageSource" scope="page"><nt:image-source/></c:set>    
								<nt:conditional-include oncondition="${(imageDescription != '') && (imageSource != '')}">					
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title="<nt:image-description/> | Foto: <nt:image-source/>" width="<%=width %>" height="<%=height %>" />
									<div class="caption" content='<nt:image-description/>'><h2><nt:image-description/> | Foto: <nt:image-source/></h2></div>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${(imageDescription != '') && (imageSource == '')}">					
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' width="<%=width %>" height="<%=height %>" />
									<div class="caption" content='<nt:image-description/>'><h2><nt:image-description/></h2></div>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${(imageDescription == '') && (imageSource != '')}">
									<meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='${news.titles[news.titleDetailNum]}' title="${news.titles[news.titleDetailNum]} | Foto: <nt:image-source/>" width="<%=width %>" height="<%=height %>" />
									<div class="caption" content='<nt:image-description/>'><h2><nt:image-description/> | Foto: <nt:image-source/></h2></div>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${(imageDescription == '') && (imageSource == '')}">
									<meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
									<img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}' width="<%=width %>" height="<%=height %>" />
								</nt:conditional-include>	
						</li>
					</nt:preview-image> 
			</ul>
		</div>
        </nt:conditional-include>
</nt:news>
<script type="text/javascript">
	$(window).load(function(){
		//error
		$('.prev, .next').removeAttr('style');
	});
	
	function StopVideos(){
		var YTid;
		$(".iframeYT").each(function() {
			YTid = $(this).attr("id");		
			$('#'+YTid)[0].contentWindow.postMessage('{"event":"command","func":"' + 'stopVideo' + '","args":""}', '*');
			//YTid.stopVideo();
		});
		<%--jwplayer().stop();--%>
	}
	
	$(document).ready( function() {
		$("body").on( "click", ".flex-next,.flex-prev", function() {
			StopVideos();
		});
	});
</script>
