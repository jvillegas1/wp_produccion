<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<!doctype html>
<html>
<head>
	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="title">Videos</cms:param>
	</cms:include>
</head>

<body>
	

	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">Videos</cms:param>
		<cms:param name="pageSeccion"></cms:param>
		<cms:param name="subMenu"></cms:param>
		<cms:param name="agenda">no</cms:param>
		<cms:param name="latest">no</cms:param>
	</cms:include>
	
	<!-- Container -->
	<div id="container">
		
		<cms:include page="../elements/TS_Common_LiveBox.jsp" />	
		
		<div class="wrapper"><!--wrapper--> 
	
			
		</div><!--wrapper-->
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
$('#nav').slideUp(750);	
menu--
}
});
</script>
</html>