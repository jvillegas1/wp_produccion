<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
	<head>
	<title>teleSURtv.net - Programas</title>
	 <meta itemprop="name" content="teleSUR señal en vivo" />
	 		<meta property="og:title" content="Conectate a teleSUR en streaming" />
		<meta property="og:type" content="article" />
		<meta property="og:url" content="http://www.telesurtv.net/seccion/programas/index.html" />
		<meta property="og:description" content="Disfruta nuestra señal en tiempo real vía streaming a través de nuestra plataforma web" />
		<meta property="og:locale" content="es_ES" />	
		<meta property="og:site_name" content="teleSUR" />
		<meta name="keywords" content="teleSUR señal en vivo"/>
		<meta name="description" content="Disfruta nuestra señal en tiempo real vía streaming a través de nuestra plataforma web ">
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="0"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta name="GENERATOR" content="teleSUR">
		<meta name="organization" content="teleSUR"/>
		<meta name="Googlebot" content="all"/>
		<meta name="language" content="es_ES"/>
		<meta name="revisit-after" content="1 days">
		<meta name="Author" content="teleSUR">
		<meta name="robots" content="index,follow">
		<meta property="og:image" content="http://www.telesurtv.net/arte/ENVIVO.jpg" /> 

		
		<!-- INICIA TWITTER CARD ESPAÑOL -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@teleSURtv">
		<meta name="twitter:title" property="og-title" content="Disfruta nuestra señal en tiempo real vía streaming a través de nuestra plataforma web">
		<meta name="twitter:description" property="og:description" content="Disfruta nuestra señal en tiempo real vía streaming a través de nuestra plataforma web.">
		<meta name="twitter:url" property="og:url" content="http://www.telesurtv.net/seccion/programas/index.html">
		
			<meta name="twitter:image:src" property="og:image" content="http://www.telesurtv.net/arte/ENVIVO.jpg" />
		
		<!-- FINALIZA TWITTER CARD -->
		<cms:include page="../elements/TS_Common_Head.jsp" >
			<cms:param name="template">Programa</cms:param>
		</cms:include>
		
		<script type="text/javascript">
			$(window).load(function(){
			  //if
			  $(function(){
				$('#header .nav ul li a.select').parent('li').css('border', 'none') 
				});
			});
		</script>
		
	</head>
	
	<body>
				
		<cms:include page="../elements/TS_Common_Header.jsp" >
		        <cms:param name="pageTitle">Programa</cms:param>
		        <cms:param name="pageSeccion">programa</cms:param>
		        <cms:param name="subMenu">si</cms:param>
	          	<cms:param name="latest">no</cms:param>
		</cms:include>
		
		
	<div class="wrapper"> 
		<cms:include page="../elements/TS_codigo_Grilla_Youtube.jsp" />
		
		</div> 
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

</html>