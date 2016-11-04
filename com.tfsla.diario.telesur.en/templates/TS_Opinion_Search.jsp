 <%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">search</cms:param>
	</cms:include>

	<script type="text/javascript">
	$(window).load(function(){
		
	  //if
	  $(function(){
		$('#header .nav ul li a.select').parent('li').css('border', 'none'); 
		$('#header .nav ul li a.select').parent('li').prev().css('border', 'none');
		});
	  
	});
	</script>
	 
</head>

<body>
 
	<!-- Header -->
	<cms:include page="../elements/TS_Common_Header.jsp" >
	    <cms:param name="pageTitle">Opinion</cms:param>
	    <cms:param name="pageSeccion">opinion</cms:param>
	    <cms:param name="subMenu">no</cms:param>
	    <cms:param name="agenda">no</cms:param>
	</cms:include>
		
	<cms:include page="../elements/TS_Opinion_Search.jsp" />
	
	<!-- Container -->
	<div id="container">
	<cms:include page="../elements/TS_Common_LiveBox.jsp" />
		<div class="wrapper"><!--wrapper--> 	
			<div class="row clear"> 
				<div class="banners pos0">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Search</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>
				</div>       
				<div class="bannerMobile">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Search</cms:param>
						<cms:param name="key">Advert-468x60-a-mobile</cms:param>
					</cms:include>
				</div>
			</div>
			
			<div class="row clear">   
			   	<!-- inicio colmna izq col-six -->
			    	<div class="col-six">  
															            
			<!-- Search Result -->			
			<cms:include page="../elements/TS_Opinion_Result.jsp" />			
    			</div>
    			<!-- fin colmna izq col-six -->
    			
    			<cms:include page="../elements/TS_Common_RightColumn.jsp" >
					 	<cms:param name="template">Opinion</cms:param>
					</cms:include>
	     	     	
			</div>
			<!-- Slider VIdeos MOBILE -->
			<div class="row clear" id="latestMobile">  
			<%--	<cms:include page="../elements/TS_Common_Videos_Mobile.jsp" />  --%>
			</div><!-- FIN VIdeos MOBILE -->
    
			<!-- Slider  photos mobile-->
			<div class="row clear" id="latestMobile">  
			<%--	<cms:include page="../elements/TS_Search_Photos_Mobile.jsp" /> --%>
			</div><!-- FIN  photos mobile -->  
    
			<!-- Slider Telesur Specials mobile -->
			<div class="row clear" id="latestMobile">  
			<%--	<cms:include page="../elements/TS_Search_Specials_Mobile.jsp" />  --%>
			</div><!-- FIN Telesur Specialss -->    

			<!--Videos-->
			<div class="row clear desktop"> 
			<%--	<cms:include page="../elements/TS_Common_Videos.jsp" />  --%>
			</div>
			<!--fin Videos-->
       
			<!--Photos-->
			<div class="row clear desktop"> 
			<%--	<cms:include page="../elements/TS_Search_Photos.jsp" />  --%>
			</div>
			<!--fin Photos-->
			  	
  
			<div class="row clear">  
				<div class="banners adv970">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Search</cms:param>
						<cms:param name="key">Advert-728x90</cms:param>
					</cms:include>
				</div>       
				<div class="bannerMobile">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Search</cms:param>
						<cms:param name="key">Advert-728x90-a</cms:param>
					</cms:include>
				</div>
			</div>

		</div><!--wrapper-->
		
		<!--<div class="searchbot">
		<%--	<cms:include page="../elements/TS_Search_Form_Footer.jsp" />--%>
		</div>  -->
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

 $("#footer").css('border-top', '5px solid #A51717');
 $("#footer").css('margin-top', '0');

</script>
</html>