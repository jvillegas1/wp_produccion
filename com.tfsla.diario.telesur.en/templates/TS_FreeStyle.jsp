<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
org.opencms.jsp.CmsJspXmlContentBean cms = new
org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
 
String title = cms.property("Title");
String uri = cms.getRequestContext().getUri();
%>
<!doctype html>
<html>
<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">home</cms:param>
	</cms:include>

</head>

<body>

	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle"><%=title%></cms:param>
		<cms:param name="pageSeccion"></cms:param>
		<cms:param name="agenda">si</cms:param>
		<cms:param name="subMenu">no</cms:param>
		<cms:param name="latest">no</cms:param>       
	</cms:include>      
     
	<div class="wrapper"> 
		<%cms.include(uri, "body");%>
		<%cms.include(uri, "text1");%>
		<%cms.include(uri, "text2");%>		                                              	
	</div><!--wrapper-->
	
	
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
</script>
</html>