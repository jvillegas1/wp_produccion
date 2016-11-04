<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
	/**
	* Soy Reportero Page
	*
	*/
%>

<!doctype html>
<html>	
<head>
	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">soyreporteropage</cms:param>
	</cms:include>		

<nt:comments-init/>	

</head>

<body>

	<!-- Header -->
	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">You're the Reporter</cms:param>  
		<cms:param name="pageSeccion">reporter</cms:param>
		<cms:param name="subMenu">si</cms:param>   
		<cms:param name="agenda">no</cms:param>
		<cms:param name="latest">no</cms:param> 
	</cms:include>
	
<nt:news>	

	<!-- Container -->
	<div id="container">
	<cms:include page="../elements/TS_Common_LiveBox.jsp" />
		<div class="wrapper" itemscope itemtype="http://schema.org/Article">
    			<meta itemprop='isFamilyFriendly' content='True'/>
			<meta itemprop='url' content='<nt:link/>'/>
			<meta itemprop="interactionCount" content="UserComments:${news.commentcount}"/>
			
    			<div class="row clear marginchica">
			  	<div class="banners adv970">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">SoyReporteroPage</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>					     
			  	</div>
			  	
			</div>
    
			<!-- Destacado -->
			<div class="row clear">       
				<!-- inicio colmna izq col-six -->
				<div class="col-six">
					<div class="cont">
						<span class="itacaput" itemprop="articleSection">	
							<a href="/english/section/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>					
							<nt:categories>
								<nt:conditional-include onposition="first">
									<c:set var="id"><nt:category-name/></c:set>
									<% 	
									String id =  pageContext.getAttribute("id").toString();
									id = id.replaceAll("/system/categories","");
									%>	
									<a href="<%=id%>" class="her" alt="<nt:category-description/>" title="<nt:category-description/>"><nt:category-description/></a>									
								</nt:conditional-include>
							</nt:categories>								
						</span>							
						<div class="blue w80"> 
							<a class="her"><h1 itemprop="name headline"><nt:title value="detail" /></h1></a> 
							<nt:edit-buttons hasNew="true" hasDelete="true"/>
						</div>
						
						<nt:conditional-include oncondition="${news.hideComments == 'false'}">
							<div class="w20">
								<div class="gblogrs">
									<div class="num">${news.commentcount}</div>
									<cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comments" title="Comments" />
								</div>
							</div>
                   				</nt:conditional-include>
                   				
						<div class="clear"></div>
						<div class="bloque-multimedia repor">
							<cms:include page="../elements/TS_Article_Multimedia.jsp" />
						</div>                                              
                				 
						<div class="capworldtop">
							<div class="caplw">
								<div class="capcredit" itemprop="publisher"> 
									<a class="her">
										<nt:sources>
											<nt:source-name/><br/>
										</nt:sources>
									</a> 
								</div>
								<nt:conditional-include oncondition="${news.hideTime == 'false'}">
									<div class="capdate" itemprop="datePublished">Published <fmt:setLocale value="en_US"/> <nt:last-modified format="d MMMM yyyy"/> </div>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
									<div class="capaut" itemprop="author" itemscope itemtype="http://schema.org/Person">
										<nt:authors>
											<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
											<c:set var="authorName" scope="page"><nt:author-name/></c:set>
											<c:if test="${internalUser != ''}">
												<nt:user username="${internalUser}">
													<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
													<meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
													by <span class="itacaput"><a href="/english<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a></span>									
												</nt:user>
											</c:if>	 
											<c:if test="${internalUser == '' && authorName != ''}">
												<meta itemprop="name" content="<nt:author-name/>"/>
									    			by <span class="itacaput"><a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a></span>
									    		</c:if>
									    		<br/>
										</nt:authors>
									</div>
								</nt:conditional-include>
							</div>
							<div class="caprw">
								<cms:include page="../elements/TS_Common_AddThis.jsp" >
									<cms:param name="link"><nt:link/></cms:param>
									<cms:param name="titulo"><nt:title value="detail" /></cms:param>
								</cms:include>
							</div>
						</div>
					
						<nt:conditional-include oncondition="${news.hideCopete == 'false'}">
							<div class="subtitle" itemprop="description alternativeHeadline"><nt:sub-title/></div>
						</nt:conditional-include>
						
						<div class="txt_newworld" itemprop="articleBody">																	
							<nt:body-splitter>	
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
						
          					<%--<div class="valorarNews">
					              	<a title="I Like" onclick="makeVoteExterior(this)" style="cursor:pointer;">
					              		<cms:img src="/arte/simegusta.jpg" alt="I Like" title="I Like" /> <span><nt:news-positive-valorations allowvaloration="true" /></span>
					              	</a> 
				              	
					              	<a title="I don't Like" onclick="makeVoteExterior(this)" style="cursor:pointer;">
					              		<cms:img src="/arte/nomegusta.jpg" style="top:7px" alt="I don't Like" title="I don't Like" /> <span><nt:news-negative-valorations allowvaloration="true" /></span>
					              	</a>			              	
				              	</div>--%>
       						<nt:tags-list separator=",">
				              		<nt:conditional-include onposition="1">
						              	<div class="tagBarNews" itemprop="keywords" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">			              	
						                    <h4>Tags</h4>
						        </nt:conditional-include>			                    
				                    			<a href="/english/tags/<nt:tags-item/>" alt="<nt:tags-item/>" title="<nt:tags-item/>" itemprop="title"><nt:tags-item/></a>
							<nt:conditional-include onposition="last">
				                		</div>						
							</nt:conditional-include>
						</nt:tags-list>
						
						<nt:polls-fixed-position style="TS-EN/NOTA"> </nt:polls-fixed-position>
					</div>
        				<div class="separador margensep"></div>
        				
        				
        				<div class="sharemob">											
						<cms:include page="../elements/TS_Common_redes_mobile.jsp" >
						<cms:param name="link"><nt:link/></cms:param>
						<cms:param name="titulo"><nt:title value="detail" /></cms:param>
						</cms:include>	
					</div>
        
					<div class="row clear"> 
						<div class="bannerMobile"> 
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">SoyReporteroPage</cms:param>
								<cms:param name="key">Advert-468x60-c-mobile</cms:param>
							</cms:include>
					  	</div>  
					</div> 
				</div>
				<!-- fin colmna izq col-six -->
           				
				<!--COLUMNA DERECHA -->
				<cms:include page="../elements/TS_Common_RightColumn.jsp" >
				 	<cms:param name="template">SoyReporteroPage</cms:param>
				</cms:include>	
				
				<cms:include page="../elements/TS_Article_RelatedStoriesMobile.jsp" />
				
				<!--sliderlatest video-->
				<div class="row clear desktop">
					<div class="cont">
						<cms:include page="../elements/TS_Article_Videos.jsp" />
					</div>
				</div>
				<!--fin sliderlatest video-->
      
				<div class="separador margensep clear"></div>
				
				<div class="row clear"> 
					<div class="banners"> 
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">SoyReporteroPage</cms:param>
							<cms:param name="key">Advert-728x90-d</cms:param>
						</cms:include>
				  	</div>  
				</div> 
				
				<div class="separador margensep"></div>

				<cms:include page="../elements/TS_Article_Comments.jsp" />

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