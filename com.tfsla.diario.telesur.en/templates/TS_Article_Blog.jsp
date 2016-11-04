<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
	/**
	* Blog Page
	*
	*/
	org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
	
	request.setCharacterEncoding("UTF-8");
	session.setAttribute("seccion","blogs");
	session.setAttribute("url",cms.getRequestContext().getUri());
%>

<!doctype html>
<html>	
<head>
	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">article</cms:param>
	</cms:include>

	<nt:comments-init/>		

</head>

<body>
	
	<!-- Header -->
	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">Blogs</cms:param>  
		<cms:param name="pageSeccion"></cms:param>
		<cms:param name="subMenu">no</cms:param>   
		<cms:param name="agenda">no</cms:param>
		<cms:param name="latest">no</cms:param> 
	</cms:include>	
<nt:news>
	
	<div class="row clear ">
		<div class="bannerMobile fondobl">
			<cms:include page="../elements/TS_Common_Banners.jsp">
				<cms:param name="template">BlogPage</cms:param>
				<cms:param name="key">Advert-468x60-a-mobile</cms:param>
			</cms:include>
		</div>
	</div>		
	<div itemscope itemtype="http://schema.org/Article">
		<meta itemprop='isFamilyFriendly' content='True'/>
		<meta itemprop='url' content='<nt:link/>'/>
		<meta itemprop="interactionCount" content="UserComments:${news.commentcount}"/>	
	
		<div class="wrapper"><!--wrapper--> 
		
		<!-- side bar -->
	
			<!-- Banner 1 -->
			<div class="row clear marginchica">
		    		<div class="banners pos0">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">BlogPage</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>
				</div>       
			</div>		
			<div class="row clear"> 
				<div class="col-six"> 	    
					<div class="contblog">
						<div class="dest"> 
							<div class="colblogl">														
								<div class="topblog">
									<nt:conditional-include oncondition="${news.hideTime == 'false'}">
										<div class="topblogleft" itemprop="datePublished"><fmt:setLocale value="en_US"/><fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" /></div>
									</nt:conditional-include>
									
									<nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
										<div class="topblogright2" itemprop="author" itemscope itemtype="http://schema.org/Person">
											<nt:authors>
												<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
												<c:set var="authorName" scope="page"><nt:author-name/></c:set>
												<c:if test="${internalUser != ''}">
													<nt:user username="${internalUser}">
														<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
														<meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
														<a href="/english<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>">| <nt:user-firstname/> <nt:user-lastname/></a>								
													</nt:user>
												</c:if>	 
												<c:if test="${internalUser == '' && authorName != ''}">
													<meta itemprop="name" content="<nt:author-name/>"/>
										    			<a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>">| <nt:author-name/></a>
										    		</c:if>							    		
											</nt:authors>
										</div>
									</nt:conditional-include>									
									 <div class="sharop1">
									 <div class="addthis_sharing_toolbox"></div>									
									   <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55d8a3fe30014e2d" async="async"></script>																		
								            <script type="text/javascript">var addthis_share = { url_transforms : { shorten: { twitter: 'bitly'} }, shorteners : { bitly : {login:'telesur',apiKey:'R_8925c37a76786f9a5620d8c3f0f9e65c'} }}</script>
									    <script type="text/javascript">var addthis_config = {"data_track_clickback":false};</script>																						
									
									</div> 
								</div>
															
								<div class="contentblog">
									
									<div class="itacaput" style="margin-bottom:5px;" itemprop="articleSection">	
										<a href="/english/section/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>						
										<nt:categories>
											<nt:conditional-include onposition="first">
												<c:set var="id"><nt:category-name/></c:set>
												<% 	
												String id =  pageContext.getAttribute("id").toString();
												id = id.replaceAll("/system/categories","");
												%>	
												<a href="<%=id%>" class="her" alt="<nt:category-description/>" title="<nt:category-description/>">> <nt:category-description/></a>									
											</nt:conditional-include>
										</nt:categories>																
									</div>	
																										
									<div class="blogtit" itemprop="name headline"> 
										<nt:title value="detail" /> 
										<nt:edit-buttons hasNew="true" hasDelete="true"/>
									</div>
									
									<nt:conditional-include oncondition="${news.hideComments == 'false'}">
										<div class="gblogrs1">
											<div class="gblogrs">
												<a href="#comsup"> <div class="num"><span class="fb-comments-count" data-href="http://www.telesurtv.net<nt:link/>"></span></div>
												<cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comments" title="Comments"/> 
												</a>
											</div>
										</div>
									</nt:conditional-include>
																	
									
									<div class="txt_newworld" itemprop="articleBody"> 																												
										<nt:body-splitter>											
											<nt:conditional-include onposition="2">										
												<nt:preview-image>
													<div class="qnewworld" itemscope itemtype="http://schema.org/ImageObject">												
														<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                                        							<c:set var="imageSource" scope="page"><nt:image-source/></c:set>  
                                                       								<nt:conditional-include oncondition="${(imageDescription != '') && (imageSource != '')}">
                                                            								<meta itemprop="description" content='<nt:image-description/>'>    
                                                            								<img itemprop="contentURL" src="<nt:image-path width="178" height="178" scaletype='2'/>" width="178" height="178" alt='<nt:image-description/>' title='<nt:image-description/> | Photo: <nt:image-source/>' >
                                                        							</nt:conditional-include>
                                                        							<nt:conditional-include oncondition="${(imageDescription == '') && (imageSource != '')}">
                                                            								<meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>    
                                                            								<img itemprop="contentURL" src="<nt:image-path width="178" height="178" scaletype='2'/>" width="178" height="178" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]} | Photo: <nt:image-source/>' >
                                                        							</nt:conditional-include>    
                                                        							<nt:conditional-include oncondition="${(imageDescription != '') && (imageSource == '')}">
                                                            								<meta itemprop="description" content='<nt:image-description/>'>    
                                                            								<img itemprop="contentURL" src="<nt:image-path width="178" height="178" scaletype='2'/>" width="178" height="178" alt='<nt:image-description/>' title='<nt:image-description/>' >
                                                        							</nt:conditional-include>
                                                        							<nt:conditional-include oncondition="${(imageDescription == '') && (imageSource == '')}">
                                                            								<meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>    
                                                            								<img itemprop="contentURL" src="<nt:image-path width="178" height="178" scaletype='2'/>" width="178" height="178" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}' >
                                                        							</nt:conditional-include>
                                                        						</div>
												</nt:preview-image>										
											</nt:conditional-include>
											
											<nt:polls-dynamic-position style="TS-EN/NOTA"> </nt:polls-dynamic-position>		
												<c:set var="bodyP" scope="page"><nt:body-paragraph/></c:set>
												<%-- Verificar si El parrafo contiene un Iframe, que a su vez sea un Video de Youtube, modifica sus atributos. Coloca que  pertenece a la clase:'vid-youtube', height='100%' y width='100%' --%> 
												<%String bodyParagrahp=pageContext.getAttribute("bodyP").toString();
												String bodyPa="";
												if((bodyParagrahp.contains("<iframe ")) && (bodyParagrahp.contains("youtube"))){ 
													bodyParagrahp=bodyParagrahp.replace("height="," class='vid-youtube' height=");										 	 	
													String[] cortos= bodyParagrahp.split(" ");
       													for (int i = 0; i < cortos.length; i++) {
          				   									if (cortos[i].contains( "height=")) {
          				  										cortos[i]="height='100%'";
           						 							}
           						  						if (cortos[i].contains( "width=")) {
           				 									cortos[i]="width='100%'></iframe></p>";
            												}
            							   					bodyPa=bodyPa+" "+ cortos[i];
           												}
           											bodyParagrahp=bodyPa;
           											} 
												%>
											<%=bodyParagrahp%>							
										</nt:body-splitter>										
									</div>
																	
									<nt:iframe/>								
													
									<nt:tags-list separator=",">
										<nt:conditional-include onposition="1">
											<div class="tagBarNews" itemprop="keywords" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">                            
											<h4>Tags</h4>
										</nt:conditional-include>                               
										<a href="/english/tags/<nt:tags-item/>" alt="<nt:tags-item/>" title="<nt:tags-item/>" itemprop="title">
											<nt:tags-item/>
										</a>
										<nt:conditional-include onposition="last">
											</div>                      
										</nt:conditional-include>
									</nt:tags-list> 
									<div class="separador margensep"></div>
									<nt:polls-fixed-position style="TS-EN/NOTA"> </nt:polls-fixed-position>
									
									<nt:files>
									 	<nt:conditional-include onposition="first">
											<div class="filesNews" >			              	
												<h4>Attachments</h4>
												<ul>
									 	</nt:conditional-include>
											 		<c:set var="icon"><nt:file-icon/></c:set>								 		
											 		<nt:conditional-include oncondition="${icon == 'PDF'}" >
											 			<li><a href="<nt:file-path/>" alt="<nt:file-title/>" title="<nt:file-title/>" target="_blank"><cms:img src="/arte/pdf.png" alt="PDF" title="PDF" /> <nt:file-title/></a></li>
											 		</nt:conditional-include>	
											 		<nt:conditional-include oncondition="${icon != 'PDF'}" >
											 			<li><a href="<nt:file-path/>" alt="<nt:file-title/>" title="<nt:file-title/>" target="_blank"> <nt:file-title/></a></li>
											 		</nt:conditional-include>
									 	<nt:conditional-include onposition="last">
									 			</ul>
							                		</div>						
										</nt:conditional-include>
									</nt:files>
								</div>							
							</div>
						</div>    
		  			</div>
		  		</div>	
		  		
		  		 <div class="sharemob">											
					<cms:include page="../elements/TS_Common_redes_mobile.jsp" >
					<cms:param name="link"><nt:link/></cms:param>
					<cms:param name="titulo"><nt:title value="detail" /></cms:param>
					</cms:include>	
				</div>
        
		  		
				<cms:include page="../elements/TS_Common_RightColumn.jsp" >
				 	<cms:param name="template">BlogPage</cms:param>
				</cms:include>									
			  		
			
				
				<cms:include page="../elements/TS_Article_Comments.jsp" />
				
			  	<a name="comsup"> </a>	
		    
				<div class="row clear">
					
					<div class="banners">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">BlogPage</cms:param>
							<cms:param name="key">Advert-728x90-a</cms:param>
						</cms:include>       
					</div>					
					
					<div class="row clear mobilshow">
						<div class="col-mid2">
							<div class="cont">
								<cms:include page="../elements/TS_Common_Banners.jsp">
									<cms:param name="template">BlogPage</cms:param>
									<cms:param name="key">Show-Promotion-220x145-e</cms:param>
								</cms:include>
							</div>
						</div>
						<div class="col-mid2">
							<div class="cont">
								<cms:include page="../elements/TS_Common_Banners.jsp">
									<cms:param name="template">BlogPage</cms:param>
									<cms:param name="key">Show-Promotion-220x145-f</cms:param>
								</cms:include>
							</div>
						</div>
					</div>
			    	</div>
				   
				<div class="row clear promotions">
					<div class="col-qua">	
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">BlogPage</cms:param>
								<cms:param name="key">Show-Promotion-220x145-a</cms:param>
							</cms:include>
						</div>
					</div> 
					
					<div class="col-qua">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">BlogPage</cms:param>
								<cms:param name="key">Show-Promotion-220x145-b</cms:param>
							</cms:include>
						</div>
					</div>
					
					<div class="col-qua">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">BlogPage</cms:param>
								<cms:param name="key">Show-Promotion-220x145-c</cms:param>
							</cms:include>
						</div>
					</div>
					
					<div class="col-qua">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">BlogPage</cms:param>
								<cms:param name="key">Show-Promotion-220x145-d</cms:param>
							</cms:include>
						</div>
					</div> 
				</div>			
			</div>
		</div>
	</div>		
	
</nt:news>

<cms:include page="../elements/TS_Common_Footer.jsp" />  
	
</body>
<script type="text/javascript">
<!-- script menu -->
var menu = 0
$('#header .btnMobile').click(function(){
	if(menu == 0){
		$('#nav').slideDown(750);	
		menu++
	}else{			
		$('#nav').slideUp( 750, function() {
			$('#nav').removeAttr('style');
		  });
		menu--
	}
});
</script>
</html>