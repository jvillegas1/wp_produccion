<%@ include file="../elements/TS_Common_Libraries.jsp" %>


<!doctype html>
<html>
<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">news</cms:param>
	</cms:include>
	
	<script type="text/javascript">
	$(window).load(function(){
	//if
	$(function(){
		$('#header .nav ul li a.select').parent('li').css('border', 'none') 
	});
	});
	</script>

</head>

<body>
  
	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">News</cms:param>
		<cms:param name="pageSeccion">news</cms:param>
		<cms:param name="subMenu">si</cms:param>
		<cms:param name="latest">no</cms:param>
		<cms:param name="agenda">si</cms:param>
	</cms:include>
	
	<!-- Container -->
	<div id="container">
	<cms:include page="../elements/TS_Common_LiveBox.jsp" />
		<div class="wrapper"><!--wrapper--> 
		      
		       <!-- Banner 1 -->
			<div class="row clear marginchica"> 
				<div class="banners pos0">          
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">News</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>
				</div>       
				<div class="bannerMobile">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">News</cms:param>
						<cms:param name="key">Advert-468x60-d-mobile</cms:param>
					</cms:include>
				</div>
			</div>
		      
		   	 <!-- Destacado -->
			<div class="row clear">     
			        <!-- inicio colmna izq col-six -->
				<div class="col-six">
					<div class="cont">
					
						<cms:include page="../elements/TS_News_Destacado.jsp" />			

					</div>  
			             	<!--FIN Slider WORLD -->
			                
			        	<!-- Latin America -->
					<div class="row clear">  
						<div class="col">
							<div class="rowInt">                
								<div class="headers blue">Latin America</div>
								<div class="cont">
									<cms:include page="../elements/TS_News_Categories.jsp">
										<cms:param name="category">/SubSecciones/en/news/latinaamerica/</cms:param>
									</cms:include>                
								</div>                                            
							</div>              
						</div>
				        </div> 
			        	<!--FIN Latin America -->
				          
				          
				        <!-- World -->
					<div class="row clear">  
						<div class="col">
							<div class="rowInt">
								<div class="headers blue">World</div>
								<div class="cont">
									<cms:include page="../elements/TS_News_Categories.jsp">
										<cms:param name="category">/SubSecciones/en/news/world/</cms:param>
									</cms:include>     
								</div>    
								<!-- banner2 -->
								<div class="row clear"> 
									<div class="bannersblog cont bannerMobile">
										<cms:include page="../elements/TS_Common_Banners.jsp">
											<cms:param name="template">News</cms:param>
											<cms:param name="key">Advert-300x250-a</cms:param>
										</cms:include>
									</div>     
								</div>
							</div>          
						</div>
					</div> 
				        <!-- fin mid WORLD -->
				          
					<!-- Sports -->
					<div class="row clear">  
						<div class="col">
							<div class="rowInt">
								<div class="headers green">Sport</div>
								<div class="cont">
									<cms:include page="../elements/TS_News_Categories.jsp">
										<cms:param name="category">/SubSecciones/en/news/sport/</cms:param>
									</cms:include>                      
								</div>                 
							</div>        
						</div>
					</div> 
					<!-- fin mid Sports -->
			          
					<!-- Culture -->
					<div class="row clear">  
						<div class="col">
							<div class="rowInt">
								<div class="headers cyan">Culture</div>
								<div class="cont">
									<cms:include page="../elements/TS_News_Categories.jsp">
										<cms:param name="category">/SubSecciones/en/news/culture/</cms:param>
									</cms:include>                    
								</div>    
								
								<!-- banner3 -->    
								<div class="row clear"> 
									<div class="bannersblog cont bannerMobile">
										<cms:include page="../elements/TS_Common_Banners.jsp">
											<cms:param name="template">News</cms:param>
											<cms:param name="key">Advert-300x250-b</cms:param>
										</cms:include>
									</div>   
								</div>
							</div>          
						</div>
					</div> <!-- fin culture -->
					
				</div>  <!-- fin colmna izq col-six -->    
			        
			        <cms:include page="../elements/TS_Common_RightColumn.jsp" >
					<cms:param name="template">News</cms:param>
				</cms:include>  
				
			</div> <!-- Destacado -->
			<div class="row clear">
				<div class="banners">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">News</cms:param>
						<cms:param name="key">Advert-780x90-a</cms:param>
					</cms:include>
				</div>
				<div class="bannerMobile">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">News</cms:param>
						<cms:param name="key">Advert-468x60-e-mobile</cms:param>
					</cms:include>
				</div>
			</div>
		</div> <!--wrapper-->
		
	</div><!--conteiner-->

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

  $(function() {            
    $('#slideVertical').ulslide({
      width: 170,
      height: 105,
      effect: {
        type: 'carousel', // slide or fade
        axis: 'y',        // x, y
        showCount: 3
      },
      nextButton: '#slide_next',
      prevButton: '#slide_prev',
      duration: 800,
    });
  });

</script>

</html>