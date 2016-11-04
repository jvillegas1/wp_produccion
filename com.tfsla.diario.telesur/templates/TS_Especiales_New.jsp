<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
<head>
	<cms:include page="../elements/TS_Common_Head.jsp">
		<cms:param name="template">homeNew</cms:param>
	</cms:include>
</head>

<body>

	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle"></cms:param>
		<cms:param name="pageSeccion">home</cms:param>
		<cms:param name="subMenu"></cms:param>
		<cms:param name="agenda">si</cms:param>
		<cms:param name="latest">si</cms:param>
	</cms:include>
	
	<cms:include page="../elements/TS_Common_LiveBox.jsp"></cms:include>
	 <div class="banners intersticial">
		<cms:include page="../elements/TS_Common_Banners.jsp">
		<cms:param name="template">Home</cms:param>
		<cms:param name="key">Intersticial-Desktop-1024x728-a</cms:param>
	</cms:include>
	
</div>
			<cms:include page="../elements/TS_News_Specials.jsp"></cms:include>

	
	
	<cms:include page="../elements/TS_Common_Footer.jsp"></cms:include>
	
</body>

</html>