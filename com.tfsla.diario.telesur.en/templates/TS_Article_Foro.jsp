<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
<head>
	
	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">article</cms:param>       
	</cms:include>	
	
	<nt:comments-init/>			

</head>

<body>
		
	<cms:include page="../elements/TS_Common_Header.jsp" >
  		<cms:param name="pageTitle">Forum</cms:param>  
  		<cms:param name="pageSeccion"></cms:param>
  		<cms:param name="subMenu">no</cms:param>   
  		<cms:param name="agenda">si</cms:param>
  		<cms:param name="latest">no</cms:param>      
   	</cms:include>
   	
<nt:news>

	
	<!-- Container -->
	<div id="container">
		<cms:include page="../elements/TS_Common_LiveBox.jsp" />
		<!--wrapper--> 
		<div class="wrapper">

			<!-- Banner 1 -->
			<div class="row clear marginchica"> 
				<div class="banners pos0">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">WorldPage2</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>
				</div>       
				<div class="bannerMobile">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">WorldPage2</cms:param>
						<cms:param name="key">Advert-468x60</cms:param>
					</cms:include>
				</div>
			</div>
			
			<div itemscope itemtype="http://schema.org/Article">
				<meta itemprop='isFamilyFriendly' content='True'/>
				<meta itemprop='url sameAs' content='<nt:link/>'/>
				<meta itemprop="interactionCount" content="UserComments:${news.commentcount}"/>
						
				<!-- Destacado -->
				<div class="row clear">
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
									<a href="<%=id%>" class="her" alt="<nt:category-description/>" title="<nt:category-description/>"> > <nt:category-description/></a>									
								</nt:conditional-include>
							</nt:categories>								
						</span>																											
						
						<div class="blue">
							<a class="her"><h1 itemprop="name headline"><nt:title value="detail"/></h1></a>	
							<nt:edit-buttons hasNew="true" hasDelete="true"/>							
						</div>					
					</div>					
				</div>						
			</div>
			<!-- Fin SCHEMAS -->	
			
			<div class="row clear"> 
				<div class="banners"> </div>  
			</div> 		    			
			
			<!-- Comment -->
			<cms:include page="../elements/TS_Article_Comments.jsp" />
			
		</div><!--wrapper-->
	</div><!--conteiner-->
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