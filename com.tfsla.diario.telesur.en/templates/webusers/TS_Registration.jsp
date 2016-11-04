<%@ include file="../../elements/TS_Common_Libraries.jsp" %>
<!doctype html>
<html>
<head>
	<cms:include page="../../elements/TS_Common_Head.jsp" >
		<cms:param name="template">home</cms:param>
	</cms:include>
	
	<script>
	$(document).ready(function(){	
	//Mas Info
		$('#terms').click(function(){
			$('#iframeBox .wpIframe').html("<iframe src='/en/pages/TS_GuidlineIamReporter.html' width='100%' height='600px'></iframe>");
			$('#iframeBox').fadeIn(500);
			$('body').css('overflow','hidden');
			
		});
		$('#iframeBox, #iframeBox .wpClose').click(function(){
			$('#iframeBox').fadeOut(500);		
			$('body').css('overflow','auto');	
		});
	});
	</script>
</head>

<body>

	<div id="iframeBox">
	   	<div class="wpClose">
		   	<a class="close" style="cursor:pointer;">
		   		<p style="float: right; padding:10px; display:inline-block; color:white">Close</p>
		   	</a>
	   	</div>
		<div class="wpIframe"></div>
	</div>
 
	<cms:include page="../../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">Register</cms:param>
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
		
		<!-- Banner mobile 
		<div class="row clear bannerMobile"> 
			<cms:include page="../../elements/TS_Common_Banners.jsp">
				<cms:param name="template">webusers</cms:param>
				<cms:param name="key">Advert-468x60-a-mobile</cms:param>
	  		</cms:include> 
		</div>-->
		
    		<div class="row clear">
   			<!-- inicio col-mid -->
		        <div class="col">
			    	<div class="col-mid">

			    		<cms:include page="../../elements/webusers/TS_Registration_Form.jsp"/>
			    		
				</div><!-- fin col-midx -->
			        
			        <!-- inicio col-mid -->
			    	<div class="col-mid">

			    		<cms:include page="../../elements/webusers/openauthorization/TS_SocialLogin_Login.jsp"/>
					
					<cms:include page="../../elements/webusers/TS_Registration_Comunidad.jsp"/>
					 
			        </div><!-- fin col-midx -->
		     	</div>
		     	
		</div>
   
	</div><!--wrapper-->
	</div><!--conteiner-->
	
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
<script> 
	function reloadCaptcha(){   
	    $.post("/system/modules/com.tfsla.diario.telesur.en/elements/webusers/TS_Registration_Form_Captcha.jsp",{}, function(data){      
	    $("#captcha_recargado").html(data);
	    });  	  
	}
</script>
</html>