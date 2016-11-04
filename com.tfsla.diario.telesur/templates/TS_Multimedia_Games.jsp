<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">multimedia</cms:param>
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
	<div id="contentPopUp">
	 <cms:include page="../elements/TS_Multimedia_PopUp.jsp" >	        
	 	<cms:param name="path"></cms:param>
	 </cms:include>
	 </div>
	 <cms:include page="../elements/TS_Common_Header.jsp" >
	        <cms:param name="pageTitle">Games</cms:param>
	        <cms:param name="pageSeccion">multimedia</cms:param>
	        <cms:param name="subMenu">si</cms:param>
          	<cms:param name="latest">no</cms:param>
	 </cms:include>
	<!-- Container -->
	<div id="container">
		<cms:include page="../elements/TS_Common_LiveBox.jsp" />
		<% /** en TS_Multimedia_Web_Special esta el banner Advert-970x90 y Advert-468x60-a-mobile */ %>
		<cms:include page="../elements/TS_Multimedia_Games.jsp" />
		
		<div class="wrapper"><!--wrapper--> 
			<div class="row clear">
				<div class="banners">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Multimedia</cms:param>
						<cms:param name="key">Advert-728x90-c</cms:param>
					</cms:include>
				</div>
			</div>
		    
			<div class="row clear">
				<div class="bannerMobile">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Multimedia</cms:param>
						<cms:param name="key">Advert-468x60-c-mobile</cms:param>
					</cms:include>
				</div>
			</div>
			
			<!-- Show PROMOTIONS -->
			<div class="row clear promotions">  
				<div class="col-qua">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Multimedia</cms:param>
							<cms:param name="key">Show-Promotion-220x220-a</cms:param>
						</cms:include>
					</div>
				</div> 
				
				<div class="col-qua">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Multimedia</cms:param>
							<cms:param name="key">Show-Promotion-220x220-b</cms:param>
						</cms:include>
					</div>
				</div>
				
				<div class="col-qua">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Multimedia</cms:param>
							<cms:param name="key">Show-Promotion-220x220-c</cms:param>
						</cms:include>
					</div>
				</div>
				
				<div class="col-qua">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Multimedia</cms:param>
							<cms:param name="key">Show-Promotion-220x220-d</cms:param>
						</cms:include>
					</div>
				</div> 
			</div>
		</div>	
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