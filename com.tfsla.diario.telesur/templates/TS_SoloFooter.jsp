<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
<head>

    <cms:include page="../elements/TS_Common_Head.jsp" >
        <cms:param name="template">home</cms:param>
    </cms:include>
	
</head>

<body>
	
	
	 <cms:include page="../elements/TS_Common_SoloFooter.jsp" />
	
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

	$(function() {						
		$('#slideVertical').ulslide({
			width: 170,
			height: 105,
			effect: {
				type: 'carousel', // slide or fade
				axis: 'y',        // x, y
				showCount: 3
			},
			nextButton: '#slide_next',
			prevButton: '#slide_prev',
			duration: 800,
		});
	});

</script>

<%--<script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery.isotope.min.js</cms:link>"></script>--%>

</html>