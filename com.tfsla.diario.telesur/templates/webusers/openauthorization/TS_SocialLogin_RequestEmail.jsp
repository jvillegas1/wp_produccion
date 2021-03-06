<%@include file="../../../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
	<head>
		<cms:include page="../../../elements/TS_Common_Head.jsp" >
			<cms:param name="template">registracion</cms:param>
		</cms:include>
	</head>

	<body>
		<div id='iframeBox'>
			<div class="wpClose"><a href="#" class="close"><p style="float: right; padding:10px; display:inline-block; color:white">Cerrar</p></a></div>
			<div class="wpIframe"></div>
		</div>
		<cms:include page="../../../elements/TS_Common_Header.jsp" >
			<cms:param name="pageTitle">teleSUR</cms:param>
			<cms:param name="pageSeccion"></cms:param>
			<cms:param name="agenda">si</cms:param>
			<cms:param name="subMenu">no</cms:param>
			<cms:param name="latest">no</cms:param>       
		</cms:include>
	
		<!-- Container -->
		<div class="wrapper"><!--wrapper--> 
	  
			<div class="row clear marginchica">
				<div class="banners pos0">
					<cms:include page="../../../elements/TS_Common_Banners.jsp">
						<cms:param name="template">webusers</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>
				</div>
			</div>
			<div class="row clear">
				<div class="banners">
					<cms:include page="../../../elements/TS_Common_Banners.jsp">
						<cms:param name="template">webusers</cms:param>
						<cms:param name="key">Advert-468x60-mobile</cms:param>
					</cms:include>
				</div>
			</div>
			<div class="row clear"> 
				<cms:include page="../../../elements/webusers/openauthorization/TS_SocialLogin_RequestEmail.jsp" />
			</div>
			
 		</div><!--wrapper--> 

	<cms:include page="../../../elements/TS_Common_Footer.jsp" />

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
<script> 
	function reloadCaptcha(){   
	    $.post("/system/modules/com.tfsla.diario.telesur/elements/webusers/TS_Registration_Form_Captcha.jsp",{}, function(data){      
	    $("#captcha_recargado").html(data);
	    });  	  
	}
</script>
</html>