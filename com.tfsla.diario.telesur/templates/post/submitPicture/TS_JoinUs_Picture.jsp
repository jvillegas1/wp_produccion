<%@ include file="../../../elements/TS_Common_Libraries.jsp" %>
<%@ include file="../../../elements/webusers/TS_RecoverySession.jsp" %>

<%	
if (!userIsLoggedIn){
	response.sendRedirect("/usuarios/login_nativo.html?P=/posts/post_picture.html");
	return;
}
	
boolean postOk = (request.getParameter("ok") == null ) ? false : true;
%>

<!doctype html>
<html>
<head>

	<cms:include page="../../../elements/TS_Common_Head.jsp" >
		<cms:param name="template">home</cms:param>
	</cms:include> 
		 
</head>

<body>

	<cms:include page="../../../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">Únete</cms:param>
		<cms:param name="pageSeccion">joinus</cms:param>
		<cms:param name="agenda">si</cms:param>
		<cms:param name="subMenu">no</cms:param>
		<cms:param name="latest">no</cms:param>       
	</cms:include>
	

	<cms:include page="../../../elements/TS_Common_LiveBox.jsp" />
	<!--wrapper-->
	<div class="wrapper"> 

		<!-- Banner-->
		<div class="row clear marginchica"> 
			<div class="banners adv970">				
				<cms:include page="../../../elements/TS_Common_Banners.jsp">
					<cms:param name="template">JoinUs</cms:param>
					<cms:param name="key">Advert-970x90</cms:param>
				</cms:include>					
			</div>
			<div class="bannerMobile">
				<cms:include page="../../../elements/TS_Common_Banners.jsp">
					<cms:param name="template">JoinUs</cms:param>
					<cms:param name="key">Advert-468x60-a-mobile</cms:param>
				</cms:include>
			</div>      
		</div>
				
		<% if (!postOk) {%>	
	                                
                	<cms:include page="TS_JoinUs_PictureForm.jsp" />					
			
		<% } else { %>
		
			<cms:include page="TS_JoinUs_PictureOK.jsp" />
		
		<% } %>			
				
		
	</div>

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
</html>