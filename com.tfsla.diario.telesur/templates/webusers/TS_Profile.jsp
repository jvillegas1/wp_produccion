<%@ include file="../../elements/TS_Common_Libraries.jsp" %>
<!doctype html>
<html>
<head>
	<cms:include page="../../elements/TS_Common_Head.jsp" >
		<cms:param name="template">home</cms:param>
	</cms:include>
	
</head>

<body>

	<cms:include page="../../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">Perfil Publico</cms:param>
		<cms:param name="pageSeccion"></cms:param>
		<cms:param name="agenda">si</cms:param>
		<cms:param name="subMenu">no</cms:param>
		<cms:param name="latest">no</cms:param>       
	</cms:include>
 	<cms:include page="../../elements/TS_Blogs_Search.jsp" />
 	</br>
	<!-- Container -->
	<div class="wrapper"><!--wrapper--> 
    		<cms:include page="../../elements/webusers/TS_Profile_UserData.jsp"/>	   
		<div class="row clear">
		
			<div class="row">
				<div class="col">
			    		<cms:include page="../../elements/webusers/TS_Profile_NewsList.jsp"/>
			    	</div>
			    	
			    	<div class="col">
			    		<cms:include page="../../elements/webusers/TS_Profile_NewsList_Pending.jsp"/>
			    	</div>
			</div>
			<!--
			<div class="col-mid">
			    	<cms:include page="../../elements/webusers/TS_Profile_CommentList.jsp"/>
			</div>
			-->
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
	    $.post("/system/modules/com.tfsla.diario.telesur/elements/webusers/TS_Registration_Form_Captcha.jsp",{}, function(data){      
	    $("#captcha_recargado").html(data);
	    });  	  
	}
</script>
</html>