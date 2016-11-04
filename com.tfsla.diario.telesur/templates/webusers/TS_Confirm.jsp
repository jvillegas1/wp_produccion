<%@ include file="../../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
	<head>
		<cms:include page="../../elements/TS_Common_Head.jsp" >
			<cms:param name="template">confirmacion</cms:param>
		</cms:include>
	</head>
	<body>
		<cms:include page="../../elements/TS_Common_Header.jsp" >
			<cms:param name="pageTitle">teleSUR</cms:param>
			<cms:param name="pageSeccion"></cms:param>
			<cms:param name="agenda">si</cms:param>
			<cms:param name="subMenu">no</cms:param>
			<cms:param name="latest">no</cms:param>       
		</cms:include>
		
		<!-- Container -->
		<div class="wrapper"><!--wrapper--> 
			<!-- Banner 1 -->
			<div class="row clear marginchica"> 
				<div class="banners pos0">
					<cms:include page="../../elements/TS_Common_Banners.jsp">
						<cms:param name="template">webusers</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
			  		</cms:include>
				</div>       
			</div>
			
			<div class="row clear bannerMobile"> 
				<cms:include page="../../elements/TS_Common_Banners.jsp">
					<cms:param name="template">webusers</cms:param>
					<cms:param name="key">Advert-468x60-mobile</cms:param>
		  		</cms:include> 
			</div>
			<cms:include page="../../elements/webusers/TS_Confirm_Email.jsp"/>
	    
		</div><!--wrapper-->
	
		<cms:include page="../../elements/TS_Common_Footer.jsp" />
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