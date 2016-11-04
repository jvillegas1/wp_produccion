<%@ include file="../../elements/TS_Common_Libraries.jsp" %>
<%@ include file="../../elements/webusers/TS_RecoverySession.jsp" %>

<%
if (!userIsLoggedIn) response.sendRedirect("/en/users/login_native.html?P=/en/users/profile_edit.html");
%>
<!doctype html>
<html>
<head>
	<cms:include page="../../elements/TS_Common_Head.jsp" >
		<cms:param name="template">home</cms:param>
	</cms:include>
	
</head>

<body>

	<cms:include page="../../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">Profile</cms:param>
		<cms:param name="pageSeccion"></cms:param>
		<cms:param name="agenda">si</cms:param>
		<cms:param name="subMenu">no</cms:param>
		<cms:param name="latest">no</cms:param>       
	</cms:include>
 
	<!-- Container -->
	<div class="wrapper"><!--wrapper--> 
  			
	        <div class="cont">
	        
	    		<div id="headerProfileSinAct">
	    		
	    			<cms:include page="../../elements/webusers/TS_Profile_UserData.jsp"/>
	    			
	    		</div>
	    		
	    		<% /** Una vez actualizado los datos volvemos a cargar los datos del usuario */ %>
	    		<div id="headerProfileAct"></div>
	    		
		</div><!-- fin col -->
		        
		<div class="col">
		
			<div class="cont titreg" style="margin-top:20px"> Profile Edit </div>

		    	<cms:include page="../../elements/webusers/TS_Profile_Edit_Form.jsp"/>
			
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