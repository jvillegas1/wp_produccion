<%@ include file="../elements/TS_Common_Libraries.jsp" %>



<!doctype html>
<html>
<head>
<script type='text/javascript' src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script>
$(document).ready(function(){
//$("#header").addClass("sticky");
	
	
});
</script>

	<cms:include page="../elements/TS_Common_Head.jsp">
		<cms:param name="template">homeNew</cms:param>
	</cms:include>
</head>

<body>

	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">Contacto</cms:param>
		<cms:param name="pageSeccion">home</cms:param>
		<cms:param name="subMenu"></cms:param>
		<cms:param name="agenda">si</cms:param>
		<cms:param name="latest">si</cms:param>
	</cms:include>
	
	
	
</div>

	
	<div class="image1">
	<a id="contact"></a>
	<a id="coment"></a>

	<div class="wrapper">
<div class="titContact">Contacto</div>
</div>
</div>

	<cms:include page="../elements/TS_Contact_Page.jsp" />

	
<cms:include page="../elements/TS_Contact_Form.jsp" />
	
	
	
</body>
	<cms:include page="../elements/TS_Common_Footer.jsp"></cms:include>

</html>