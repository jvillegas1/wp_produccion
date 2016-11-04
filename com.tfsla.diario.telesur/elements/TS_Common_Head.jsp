<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="java.net.URLEncoder" %>
<%
String template = (request.getParameter("template") == null ) ? "home" : request.getParameter("template") ;
String copy = (request.getParameter("copy") == null ) ? "si" : request.getParameter("copy") ;
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
String Title = cms.property("Title");
String Keywords = cms.property("Keywords");
String Description = cms.property("Description");
String LastUpdate =  cms.property("ultimaModificacion");
String currentUri = cms.getRequestContext().getUri();
if (Title == null) Title = "teleSUR";
%>
	
	<link rel="shortcut icon" href="http://www.telesurtv.net/arte/favicon.ico" type="image/x-icon"  />
	<meta charset="utf-8">
	<meta name="robots" content="NOODP">
	<meta name="description" content="teleSUR representa la alternativa informativa para el mundo. Nuestra agenda visibiliza a los pueblos, lo que no cuentan los grandes medio lo encuentra en teleSUR" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes" />
	<meta property="fb:pages" content="186321186178" />
	
	
	
<% if (template.equals("home") || template.equals("homeNew") || template.equals("search")){ %>	
	<title><%=Title%></title>
	
	<meta name="cXense :recs:recommendable" content="false"/>
	<meta name="cXenseParse:pageclass" content="frontpage"/>
	<link rel="canonical" href="http://www.telesurtv.net"/>
	<!-- Inicio AdsLive -->

	<script type='text/javascript'>
	  var googletag = googletag || {};
	  googletag.cmd = googletag.cmd || [];
	  (function() {
	    var gads = document.createElement('script');
	    gads.async = true;
	    gads.type = 'text/javascript';
	    var useSSL = 'https:' == document.location.protocol;
	    gads.src = (useSSL ? 'https:' : 'http:') +
	      '//www.googletagservices.com/tag/js/gpt.js';
	    var node = document.getElementsByTagName('script')[0];
	    node.parentNode.insertBefore(gads, node);
	  })();
	</script>

	<script type='text/javascript'>
	  googletag.cmd.push(function() {
	    googletag.defineSlot('/18910235/home_bottom', [300, 250], 'div-gpt-ad-1465261469364-0').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/home_lead1', [728, 90], 'div-gpt-ad-1465261469364-1').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/home_lead2', [728, 90], 'div-gpt-ad-1465261469364-2').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/home_lead3', [728, 90], 'div-gpt-ad-1465261469364-3').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/home_lead4', [728, 90], 'div-gpt-ad-1465261469364-4').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/home_lead5', [728, 90], 'div-gpt-ad-1465261469364-5').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/home_lead6', [728, 90], 'div-gpt-ad-1465261469364-6').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/home_sky', [160, 600], 'div-gpt-ad-1465261469364-7').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/envivo_top', [180, 150], 'div-gpt-ad-1465262063828-0').addService(googletag.pubads());
	    googletag.pubads().enableSingleRequest();
	    googletag.enableServices();
	  });
	</script>
	<script>
	  (function() {
	    var useSSL = 'https:' == document.location.protocol;
	    var src = (useSSL ? 'https:' : 'http:') +
	        '//www.googletagservices.com/tag/js/gpt.js';
	    document.write('<scr' + 'ipt src="' + src + '"></scr' + 'ipt>');
	  })();
	</script>
	
	<script>
  	    googletag.cmd.push(function() {
	    googletag.defineOutOfPageSlot('/11322282/Telesurtv.net//1x1', 'div-gpt-ad-1476114832443-0').addService(googletag.pubads());
	    googletag.pubads().enableSingleRequest();
	    googletag.pubads().enableSyncRendering();
	    googletag.pubads().setTargeting("Telco-GT",pf()); 
	    googletag.enableServices();
	  });
	</script>
	
	<script>
	  googletag.cmd.push(function() {
	    googletag.defineOutOfPageSlot('/18910235/1x1.incontent', 'div-gpt-ad-1474583384073-0').addService(googletag.pubads());
	    googletag.pubads().enableSingleRequest();
	    googletag.pubads().enableSyncRendering();
	    googletag.enableServices();
	  });
	</script>
	
	<script>
	  googletag.cmd.push(function() {
	    googletag.defineSlot('/138871148/telesurtv.dw.1x1.incontent', [1, 1], 'div-gpt-ad-1476920783262-0').addService(googletag.pubads());
	    googletag.pubads().enableSingleRequest();
	    googletag.enableServices();
	  });
	</script>
	<!-- Fin AdsLive -->
<% } %>

<% if (template.equals("news") || template.equals("multimedia") || template.equals("opinion") || template.equals("Analysis") || template.equals("blog") || template.equals("joinus") || template.equals("telesur_agenda") || template.equals("soyreportero")) { %>	
	<title><%=Title%> | teleSUR</title>
	
	<meta name="cXenseParse:recs:recommendable" content="false"/>
	<meta name="cXenseParse:pageclass" content="frontpage"/>
	<!-- Inicio AdsLive -->
	<script type='text/javascript'>
	  var googletag = googletag || {};
	  googletag.cmd = googletag.cmd || [];
	  (function() {
	    var gads = document.createElement('script');
	    gads.async = true;
	    gads.type = 'text/javascript';
	    var useSSL = 'https:' == document.location.protocol;
	    gads.src = (useSSL ? 'https:' : 'http:') +
	      '//www.googletagservices.com/tag/js/gpt.js';
	    var node = document.getElementsByTagName('script')[0];
	    node.parentNode.insertBefore(gads, node);
	  })();
	</script>
	<script type='text/javascript'>
	  googletag.cmd.push(function() {
	    googletag.defineSlot('/18910235/Blogs_home_bottom', [728, 90], 'div-gpt-ad-1465260742613-0').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/Blogs_home_rec', [180, 150], 'div-gpt-ad-1465260742613-1').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/Blogs_home_top', [728, 90], 'div-gpt-ad-1465260742613-2').addService(googletag.pubads());	
    	    googletag.defineSlot('/18910235/Noticias_home_bottom', [728, 90], 'div-gpt-ad-1465261571410-0').addService(googletag.pubads());
            googletag.defineSlot('/18910235/Noticias_home_top', [728, 90], 'div-gpt-ad-1465261571410-1').addService(googletag.pubads());
            googletag.defineSlot('/18910235/Multimedia_top', [728, 90], 'div-gpt-ad-1465262113338-0').addService(googletag.pubads());
            googletag.defineSlot('/18910235/SoyReportero_top', [728, 90], 'div-gpt-ad-1465261946820-0').addService(googletag.pubads());
            googletag.defineSlot('/18910235/SoyReportero_sq1', [200, 200], 'div-gpt-ad-1465261946820-1').addService(googletag.pubads());
            googletag.defineSlot('/18910235/envivo_top', [180, 150], 'div-gpt-ad-1465262063828-0').addService(googletag.pubads());
	    googletag.pubads().enableSingleRequest();
	    googletag.enableServices();
	  });
	</script>
	<script>
	  (function() {
	    var useSSL = 'https:' == document.location.protocol;
	    var src = (useSSL ? 'https:' : 'http:') +
	        '//www.googletagservices.com/tag/js/gpt.js';
	    document.write('<scr' + 'ipt src="' + src + '"></scr' + 'ipt>');
	  })();
	</script>
	
	<script>
	  googletag.cmd.push(function() {
	    googletag.defineOutOfPageSlot('/18910235/1x1.incontent', 'div-gpt-ad-1474583384073-0').addService(googletag.pubads());
	    googletag.pubads().enableSingleRequest();
	    googletag.pubads().enableSyncRendering();
	    googletag.enableServices();
	  });
	</script>
	<!-- Fin AdsLive -->
<% } %>
<% if (template.equals("article") || template.equals("soyreporteropage") || template.equals("multimediapage")) { %>			
	
	<nt:news>
		<c:set var="title" scope="page"><nt:title/></c:set>
		<jsp:useBean id="title" type="java.lang.String" />
		<c:set var="subtitle" scope="page">${news.subtitle}</c:set>
		<jsp:useBean id="subtitle" type="java.lang.String" />
		
		<title> <%=StringEscapeUtils.escapeHtml(title)%> | <nt:section/> | teleSUR</title>
		<meta property="og:type" content="article" />
		<meta property="fb:app_id" content="1009084795820552" />
 		<meta property="fb:admins" content="100010801890653" />	
 		<meta property="fb:article_style" content="InstaART">
		<meta name="keywords" content="<%=Keywords%>"/>
		<meta name="description" content="<%=StringEscapeUtils.escapeHtml(subtitle)%>"/>
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="0"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta name="GENERATOR" content="teleSUR">
		<meta name="organization" content="teleSUR"/>
		<meta name="Googlebot" content="all"/>
		<meta name="language" content="es_ES"/>
		<meta name="revisit-after" content="1 days">
		<meta name="publish-date" content="<nt:last-modified format="yyyy-MM-dd HH:mm:ss"/>">
		


		<nt:authors>
			<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
			<c:if test="${not empty internalUser}">
				<nt:user username="${internalUser}">				
				<meta name="Author" content="<nt:user-firstname/> <nt:user-lastname/>"/>
				</nt:user>
			</c:if>	
			<c:if test="${empty internalUser}">
				<meta name="Author" content="<nt:author-name/>"/>
			</c:if> 
		</nt:authors>
		
		<%--<nt:conditional-include oncondition="${news.authorscount != 0}">
			<meta name="Author" content="<nt:authors><nt:author-name/></nt:authors >">
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.authorscount == 0}">
			<meta name="Author" content="teleSUR">
		</nt:conditional-include> --%>
		
		<meta name="robots" content="index,follow">
		<meta name="classification" content="<nt:section-description/><nt:categories>, <nt:category-description/></nt:categories>"/>	
		<nt:conditional-include oncondition="${news.imagepreviewset == true}">
			<nt:preview-image >
				<meta property="og:image" content="http://www.telesurtv.net<nt:image-path width="300" height="300" scaletype="2" />" />
			</nt:preview-image >
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.imagepreviewset != true && news.imagescount > 0}">
			<nt:image-gallery item="1">
				<meta property="og:image" content="http://www.telesurtv.net<nt:image-path width="300" height="300" scaletype="2" />" />
			</nt:image-gallery>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.imagepreviewset != true && news.imagescount < 1}">
			<!--<meta property="og:image" content="<cms:link>http://www.telesurtv.net/arte/sinFoto_170x105.jpg</cms:link>" />-->
			<meta property="og:image" content="http://www.telesurtv.net/export/sites/telesur/arte/sinFoto_420x260.jpg_1782346201.jpg" />
		</nt:conditional-include>
		
		<meta name="cXenseParse:title" content="<nt:title/>"/>
		<meta name="cXenseParse:recs:articleid" content="<nt:generic-news-value element="ultimaModificacion"/>"/>
				
		<nt:conditional-include oncondition="${news.categoriescount != 0}">
			<nt:categories>
				<meta name="cXenseParse:recs:category" content="<nt:section-description/>/<nt:category-description/>"/>
			</nt:categories>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.categoriescount == 0}">
			<meta name="cXenseParse:recs:category" content="<nt:section-description/>"/>
		</nt:conditional-include>
		<meta name="cXenseParse:pageclass" content="article"/>		
		<meta name="cXenseParse:recs:publishtime" content="<nt:last-modified format="yyyy-MM-dd'T'HH:mm:ss'Z'"/>"/>
		
	<!-- INICIA TWITTER CARD ESPAÑOL -->
	<meta name="twitter:card" content="summary_large_image">
	<meta name="twitter:site" content="@teleSURtv">
	<meta name="twitter:title" property="og:title" content="<%=StringEscapeUtils.escapeHtml(title)%>">
	<meta name="twitter:description" property="og:description" content="<%=StringEscapeUtils.escapeHtml(subtitle)%>">
	<meta name="twitter:url" property="og:url" content="http://www.telesurtv.net<nt:link/>">
	<nt:preview-image >
	<meta name="twitter:image:src" property="og:image" content="http://www.telesurtv.net<nt:image-path width="600" height="330" scaletype="1"/>" />
	</nt:preview-image > 	
    	<!-- FINALIZA TWITTER CARD -->
    
		<link rel="canonical" href="http://www.telesurtv.net<nt:link/>"/>
	</nt:news>
	<!-- Inicio AdsLive -->
	<script type='text/javascript'>
	  var googletag = googletag || {};
	  googletag.cmd = googletag.cmd || [];
	  (function() {
	    var gads = document.createElement('script');
	    gads.async = true;
	    gads.type = 'text/javascript';
	    var useSSL = 'https:' == document.location.protocol;
	    gads.src = (useSSL ? 'https:' : 'http:') +
	      '//www.googletagservices.com/tag/js/gpt.js';
	    var node = document.getElementsByTagName('script')[0];
	    node.parentNode.insertBefore(gads, node);
	  })();
	</script>

	<script type='text/javascript'>
	  googletag.cmd.push(function() {
	    googletag.defineSlot('/18910235/Noticias_interno_lead1', [728, 90], 'div-gpt-ad-1465261644610-0').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/Noticias_interno_med1', [300, 250], 'div-gpt-ad-1465261644610-1').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/Noticias_interno_med2', [300, 250], 'div-gpt-ad-1465261644610-2').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/Noticias_interno_top', [728, 90], 'div-gpt-ad-1465261644610-3').addService(googletag.pubads());
	    googletag.defineSlot('/18910235/Blogs_interno_bottom', [728, 90], 'div-gpt-ad-1465261147720-0').addService(googletag.pubads());
            googletag.defineSlot('/18910235/Blogs_interno_rec', [180, 150], 'div-gpt-ad-1465261147720-1').addService(googletag.pubads());
            googletag.defineSlot('/18910235/Blogs_interno_top', [728, 90], 'div-gpt-ad-1465261147720-2').addService(googletag.pubads());
            googletag.defineSlot('/18910235/envivo_top', [180, 150], 'div-gpt-ad-1465262063828-0').addService(googletag.pubads());
	    googletag.pubads().enableSingleRequest();
	    googletag.enableServices();
	  });
	</script>
	
	
	<script>
	  (function() {
	    var useSSL = 'https:' == document.location.protocol;
	    var src = (useSSL ? 'https:' : 'http:') +
	        '//www.googletagservices.com/tag/js/gpt.js';
	    document.write('<scr' + 'ipt src="' + src + '"></scr' + 'ipt>');
	  })();
	</script>
	
	<script>
	  googletag.cmd.push(function() {
	    googletag.defineOutOfPageSlot('/18910235/1x1.incontent', 'div-gpt-ad-1474583384073-0').addService(googletag.pubads());
	    googletag.pubads().enableSingleRequest();
	    googletag.pubads().enableSyncRendering();
	    googletag.enableServices();
	  });
	</script>
	<!-- Fin AdsLive -->
	
	<!--<meta property="article:publisher" content="https://www.facebook.com/teleSUR" />-->
<% } %>	
	
<link href='http://fonts.googleapis.com/css?family=Arimo:400,700,400italic' rel='stylesheet' type='text/css'>
<%--<link href="<cms:link>../resources/fonts/fonts.css</cms:link>" rel="stylesheet" type="text/css" />   --%>
<link href="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/css/reset.css</cms:link>" rel="stylesheet" type="text/css" />
<link href="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/css/css.css</cms:link>" rel="stylesheet" type="text/css" />
<link href="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/css/flexslider.css</cms:link>" rel="stylesheet" type="text/css" media="screen" />

<!-- jQuery -->
<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery-1.11.0.min.js</cms:link>"></script>

<%--<% if (template.equals("homeNew")) { %>
	<link href="<cms:link>../resources/css/css.css</cms:link>" rel="stylesheet" type="text/css" />
	<link href="<cms:link>../resources/css/estilos-new.css</cms:link>" rel="stylesheet" type="text/css" />
	<script src="http://jwpsrv.com/library/HeeyEgeeEeS9bCIAC0MJiQ.js"></script>
	<%--<script type="text/javascript" src="//widgets.openmultimedia.biz/player/omplayer.telesur.js"></script>--%>
	<%--<script type="text/javascript" src="<cms:link>../resources/js/videos-fn.js</cms:link>"></script>
	<script>

		$(document).ready(function(){
			$().GetVideos();
		});
	
	</script>
	<% }else{ %>
	<link href="<cms:link>../resources/css/css.css</cms:link>" rel="stylesheet" type="text/css" />	
	<link href="<cms:link>../resources/css/estilos-new.css</cms:link>" rel="stylesheet" type="text/css" />
	<link href="<cms:link>../resources/css/flexslider.css</cms:link>" rel="stylesheet"  type="text/css" media="screen" />
<% } %>--%>



<% if (template.equals("article") || template.equals("blog") || template.equals("Analysis") ) { %>	
	<!-- FlexSlider -->
	<script src="<cms:link>../resources/js/jquery.flexslider.js</cms:link>"></script>		
	<script type="text/javascript">
	$(window).load(function(){
  
		$('.flexslider').flexslider({
			animation: "slide",
			animationLoop: false,
			itemWidth: 420,
			itemHeight: 265,
			itemMargin: 20,
			pausePlay: false,
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		  
		  $('.simpleSlide').flexslider({
			animation: "slide",
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
	  });
	</script>
	  
	<!-- Vertical Carrousel -->
	<script type="text/javascript" src="<cms:link>../resources/js/jquery.ulslide.js?v=4</cms:link>"></script>
	<!--<script type="text/javascript">
	$(function() {						
		$('#slideVerticalBlog').ulslide({
			width: 335,
			height: 12,
			effect: {
				type: 'carousel', // slide or fade
				axis: 'y',        // x, y
				showCount: 4
			},
			nextButton: '.slide_next',
			prevButton: '#slide_prev',
			duration: 800,
		});
	});
	</script>-->
	
	<script src="<cms:link>../resources/js/slides.min.jquery.js</cms:link>"></script>
	<!--<script> 
	Esta función esta colocada directamente en el template que la usa /post/TS_Preview
	$(function(){
	        $('#slides').slides({
	            preload: true,
	            play: false,
	            generateNextPrev: true
	        });
	    });
	</script>-->
<% } %>

<% /** ini home */ %>
<% if (template.equals("home") ||  template.equals("news") || template.equals("opinion") || template.equals("search") || template.equals("joinus") || template.equals("soyreportero") || template.equals("login") ) { %>	
	
	<!-- FlexSlider -->
	
	<!-- Vertical Carrousel -->
	<script type="text/javascript" src="<cms:link>../resources/js/jquery.ulslide.js?v=4</cms:link>"></script>


	<script type="text/javascript">
	<!-- News Carrousel -->
	$(function() {						
		$('#slidenews').ulslide({
			width: 700,
			height: 25,
			effect: {
				type: 'fade', // slide or fade
				axis: 'x',        // x, y
				showCount: 3
			},
			nextButton: '#new_next',
			prevButton: '#new_prev',
			autoslide: 10000,
			duration: 400,
		});
		 $('.flexslider').flexslider({
			animation: "slide",
			animationLoop: true,
			itemWidth: 420,
			//itemHeight: 265,
			itemMargin: 20,
			pausePlay: false,
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		  $('.simpleSlide').flexslider({
			animation: "slide",
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
	});

	</script>
<% } %>
<% /** fin home */ %>

<% /** ini news */ %>
<!-- Línea original con article, se saca de este condicional porque no lo usa ninguna de las jsp que cuyo template es article template.equals("article"), también se quita soyreportero -->
<% if (template.equals("news") || template.equals("article") || template.equals("opinion") || template.equals("search")) { %>	
	<!-- VerticalNews Carrousel -->
	<script type="text/javascript">
		$(function() {						
			$('#slideVerticalNew').ulslide({
				width: 368,
				height: 125,
				effect: {
					type: 'carousel', // slide or fade
					axis: 'y',        // x, y
					showCount: 7
				},
				nextButton: '#slide_next',
				prevButton: '#slide_prev',
				duration: 800,
			});
			$('#slideVerticalNew1').ulslide({
				width: 368,
				height: 125,
				effect: {
					type: 'carousel', // slide or fade
					axis: 'y',        // x, y
					showCount: 7
				},
				nextButton: '#slide_next1',
				prevButton: '#slide_prev1',
				duration: 800,
			});
			$('#slideVerticalNew2').ulslide({
				width: 368,
				height: 125,
				effect: {
					type: 'carousel', // slide or fade
					axis: 'y',        // x, y
					showCount: 7
				},
				nextButton: '#slide_next2',
				prevButton: '#slide_prev2',
				duration: 800,
			});
			$('#slideVerticalWorld').ulslide({
				width: 380,
				height: 95,
				effect: {
					type: 'carousel', // slide or fade
					axis: 'y',        // x, y
					showCount: 5
				},
				nextButton: '#slide_next',
				prevButton: '#slide_prev',
				duration: 800,
			});
			$('#slideVerticalRelated').ulslide({
				width: 380,
				height: 125,
				effect: {
					type: 'carousel', // slide or fade
					axis: 'y',        // x, y
					showCount: 4
				},
				nextButton: '#slide_next2',
				duration: 800,
			});
			$('#slideHorizontal').ulslide({
			width: 170,
			height: 150,
			effect: {
				type: 'carousel', // slide or fade
				axis: 'x',        // x, y
				showCount: 5,
				distance:9
			},
			nextButton: '#slideHor_next',
			prevButton: '#slideHor_prev',
			duration: 800,
		});
		});
	</script>
<% } %>
<% /** fin  news */ %>

<% if (template.equals("soyreporteropage") ) { %>
	<script type="text/javascript">
		$(function() {						
			$('#slideVerticalRelated').ulslide({
				width: 361,
				height: 125,
				effect: {
					type: 'carousel', // slide or fade
					axis: 'y',        // x, y
					showCount: 4
				},
				nextButton: '#slide_next2',
				duration: 800,
			});		
			$('#slideHorizontal').ulslide({
				width: 170,
				height: 150,
				effect: {
					type: 'carousel', // slide or fade
					axis: 'x',        // x, y
					showCount: 5,
					distance:9
				},
				nextButton: '#slideHor_next',
				prevButton: '#slideHor_prev',
				duration: 800,
			});
		});
	</script>
<% } %>

<% /** ini blog */ %>
<% if ( template.equals("blog") || template.equals("Analysis") || template.equals("article")  || template.equals("opinion")) { %>	
	<!-- Vertical Carrousel -->
	<script type="text/javascript">
		$(function() {						
			$('#slideVerticalBlog1').ulslide({
				width: 368,
				height: 125,
				effect: {
					type: 'carousel', // slide or fade
					axis: 'y',        // x, y
					showCount: 5
				},
				nextButton: '#slide_next1',
				prevButton: '#slide_prev1',
				duration: 800,
			});
			$('#slideVerticalBlog2').ulslide({
				width: 368,
				height: 125,
				effect: {
					type: 'carousel', // slide or fade
					axis: 'y',        // x, y
					showCount: 5
				},
				nextButton: '#slide_next2',
				prevButton: '#slide_prev2',
				duration: 800,
			});
			$('#slideVerticalBlog3').ulslide({
				width: 368,
				height: 125,
				effect: {
					type: 'carousel', // slide or fade
					axis: 'y',        // x, y
					showCount: 5
				},
				nextButton: '#slide_next3',
				prevButton: '#slide_prev3',
				duration: 800,
			});
		});
	</script>			
<% } %>
<% /** fin  blog */ %>
	
	<script type="text/javascript">
	$(window).load(function(){
	   //if
	  $(function(){
		$('#header .nav ul li a.select').parent('li').css('border', 'none'); 
		$('#header .nav ul li a.select').parent('li').prev().css('border', 'none');
		});
	  
	  
	<%-- $('#slideHorizontalPhotos').ulslide({
				width: 170,
				height: 150,
				effect: {
					type: 'carousel', // slide or fade
					axis: 'x',        // x, y
					showCount: 5,
					distance:11
				},
				nextButton: '#slideHor_next2',
				prevButton: '#slideHor_prev2',
				duration: 800,
			});--%>		  
	  
	});

	$(document).ready(function() {
		$('body img').last().css('height','0px');
	});
	
	$(document).ready(function(){
	  $(".subscrip").click(function(){
	    $("#div1").fadeToggle();
		
	    });
	});
	
	$(document).ready(function(){
	  $(".btnLive").click(function(){
	    $("#slive").fadeToggle(0);
		
	    });
	});
	$(document).ready(function(){
	  $(".embedlive").click(function(){
	    $("#embedbox").fadeToggle(0);
	    });
	});
	
	<%--$(function() {						
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
	});--%>
	</script>
	
	<cms:editable provider="org.opencms.workplace.editors.directedit.CmsDirectEditDefaultProvider" />

<% if (template.equals("multimedia") ) { %>
	<!--<link href="<cms:link>../resources/css/estilos-new.css</cms:link>" rel="stylesheet" type="text/css" />-->
	<!-- FlexSlider -->
	<script src="<cms:link>../resources/js/jquery.flexslider.js</cms:link>"></script>
	<!-- Vertical Carrousel -->
	<script type="text/javascript" src="<cms:link>../resources/js/jquery.ulslide.js?v=4</cms:link>"></script>

	<script type="text/javascript">
	$(window).load(function(){
			
			
		  $('.flexslider').flexslider({
			animation: "slide",
			animationLoop: false,
			itemWidth: 870,
			itemHeight: 505,
			itemMargin: 0,
			pausePlay: false,
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		  $('.flexslidermul').flexslider({
			animation: "slide",
			animationLoop: false,
			itemWidth: 170,
			itemHeight: 140,
			itemMargin: 0,
			pausePlay: false,
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		  $('.flexsliderMobile .flexslidermul').flexslider({
			animation: "slide",
			animationLoop: false,
			itemWidth: 420,
			itemHeight: 265,
			itemMargin: 20,
			pausePlay: false,
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		  $('.flexsliderMobile .flexslider').flexslider({
			animation: "slide",
			animationLoop: false,
			itemWidth: 420,
			itemHeight: 265,
			itemMargin: 20,
			pausePlay: false,
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		  //if
		  $(function(){
			$('#header .nav ul li a.select').parent('li').css('border', 'none') 
			$('#header .nav ul li ul li a.seleccion').parent('li').css('border', 'none');
			});
		  $('.simpleSlide').flexslider({
			animation: "slide",
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		
				
		$('#slideHorizontaLL').ulslide({
			width: 170,
			height: 150,
			effect: {
				type: 'carousel', // slide or fade
				axis: 'x',        // x, y
				showCount: 5,
				distance:11
			},
			nextButton: '#slideHoRR_next',
			prevButton: '#slideHoRR_prev',
			duration: 800,
		});
		
		 $('#slideHorizontaL, #slideHorizontaLA').flexslider({
			animation: "slide",
			animationLoop: false,
			itemWidth: 170,
			itemMargin: 9,
			pausePlay: true,
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		
		$('#slideHorizontal').ulslide({
			width: 170,
			height: 150,
			effect: {
				type: 'carousel', // slide or fade
				axis: 'x',        // x, y
				showCount: 5,
				distance:9
			},
			nextButton: '#slideHor_next',
			prevButton: '#slideHor_prev',
			duration: 800,
		});
		
		<%--$('.popUp').click(function(){
			//var href = $(this).attr('rel');
			//$('#iframeBox .wpIframe').html("<iframe src='"+href+"' width='100%' height='600px'><iframe>");  
			$('#iframeBox').fadeIn(500);
			$('body').css('overflow','hidden');
			
		});--%>
	});
	
	function showPopUpPoll(idDiv){
	
		$.post("/system/modules/com.tfsla.diario.telesur/elements/TS_Multimedia_PopUp.jsp",
			{ path:idDiv}, function(data){
			$('#contentPopUp').html(data);
		}).done(function() {
		
			$('#iframeBox').fadeIn(500);
			$('body').css('overflow','hidden');
	        });
		return false;
		  	
	}
	function cerrarPopUp(){
		$('#iframeBox').fadeOut(500);		
		$('body').css('overflow','auto');
		return false;
	}
	
	function showPopUpResultPoll(idDiv) {
		
		$('#openPool_'+idDiv).fadeOut(500);
		setTimeout(function() {
	            $('#resultPool_'+idDiv).fadeIn(500);
	        }, 600);
	}
	function hideResultPopUpPoll(idDiv) {
		
		$('#resultPool_'+idDiv).fadeOut(500);
		setTimeout(function() {
	            $('#openPool_'+idDiv).fadeIn(500);
	        }, 600);
	}
	
	function submitPopUpPool(idDiv) {
	
		var urlResource = $("#" + idDiv).attr("path");
		var params = "encuestaURL=" + urlResource;
		var flag = "";
		
		$('#' + idDiv).find('[name="respuesta"]:checked').each(function(index){
	 		params += "&respuesta=" + $(this).val(); 
	 		flag = $(this).val(); 
	 	});
	 	
	 	if(flag != ""){
	
			$.ajax({
			  url: '<%= cms.link("/system/modules/com.tfsla.diario.newsTags/elements/polls/votePoll.jsp") %>',
			  data: params,
			  dataType: "xml",
			  success: function(xml){
			  
			  	var result = $(xml).find('result').text();
			  	if (result=="ok"){
			  		$.post('<%= cms.link("/system/modules/com.tfsla.diario.newsTags/elements/polls/TS-ES/MULTIMEDIA-POPUP/pollClose.jsp") %>',{ path: urlResource, id:idDiv }, function(data){
					$("#" + idDiv).html(data);
				     });  
			  	}
			  	else {
			  		alert($(xml).find('message').text());
			  	}
			  	
			  	return false;
			  },
			  error: function(jqXHR, textStatus, errorThrown) {
			  	alert(errorThrown);
			  	
			  	return false;
			  }
			   
			});
	
		}
	
		return false;
	}
	</script>
<% } %>	

<% if (template.equals("joinus") || template.equals("search")) { %>
	<script type="text/javascript" src="<cms:link>../resources/jsmodal/jquery.fancybox.js?v=2.1.5</cms:link>"></script>
	<link rel="stylesheet" type="text/css" href="<cms:link>../resources/jsmodal/jquery.fancybox.css?v=2.1.5</cms:link>" media="screen" />
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			 *  Simple image gallery. Uses default settings
			 */
		
			$('.fancybox').fancybox();
		});
	</script>
	<script>
		$(document).ready(function(){	
		
		//Mas Info
			$('#masInfo').click(function(){
				var href = $(this).attr('rel');
				$('#iframeBox .wpIframe').html("<iframe src='"+href+"' width='100%' height='600px'></iframe>");  
				$('#iframeBox').fadeIn(500);
				$('body').css('overflow','hidden');
				
			});
			$('#iframeBox, #iframeBox .wpClose').click(function(){
				$('#iframeBox').fadeOut(500);		
				$('body').css('overflow','auto');	
			});
		});
	</script>
<% } %>	

<!-- Cxense script begin -->
	<div id="cX-root" style="display:none"></div>
	<script type="text/javascript">
		var cX = cX || {}; cX.callQueue = cX.callQueue || [];
		cX.callQueue.push(['setSiteId', '9222352440756601877']);
		cX.callQueue.push(['sendPageViewEvent']);
	</script>
	<script type="text/javascript">
		(function() { try { var scriptEl = document.createElement('script'); scriptEl.type = 'text/javascript'; scriptEl.async = 'async';
		scriptEl.src = ('https:' == location.protocol) ? 'https://scdn.cxense.com/cx.js' : 'http://cdn.cxense.com/cx.js';
		var targetEl = document.getElementsByTagName('script')[0]; targetEl.parentNode.insertBefore(scriptEl, targetEl); } catch (e) {};} ());
	</script>
<!-- Cxense script end -->
<% if (copy.equals("si")) { %>
<script type="text/javascript">	
	function addLink() {
	var body_element = document.getElementsByTagName('body')[0];
	var selection;
	selection = window.getSelection();
	var pagelink = "<br /><br /> Este contenido ha sido publicado originalmente por teleSUR bajo la siguiente dirección: <br /> <a href='"+document.location.href+"'>"+document.location.href+"</a>. Si piensa hacer uso del mismo, por favor, cite la fuente y coloque un enlace hacia la nota original de donde usted ha tomado este contenido. www.teleSURtv.net"; 
	var copytext = selection + pagelink;
	var newdiv = document.createElement('pre');
	newdiv.style.position='absolute';
	newdiv.style.left='-99999px';
	body_element.appendChild(newdiv);
	newdiv.innerHTML = copytext;
	selection.selectAllChildren(newdiv);
	window.setTimeout(function() {
		body_element.removeChild(newdiv);
	},0);
}
//document.oncopy = addLink;
</script>

<% } %>

<%--<script type="text/javascript">

	function dimeTemp(propeties) {
	    	
	    	var fields = propeties.split(",");
		var temperatura = fields[0];
	        var imagen = "/arte//" + fields[1] + "?__scale=w:35,h:22,c:transparent";
	        var ciudadId = fields[2];
	        document.getElementById("climaTemp").innerHTML = temperatura;
	        document.getElementById("climaIma").src = imagen;
	        
	      	createCookie('teleSUR_Clima','',-1);	
	        createCookie('teleSUR_Clima',fields[2],90);	
	}

	$(document).ready(function(){
		
		var teleSUR_Clima = getCookie("teleSUR_Clima");
		var propeties = unescape(teleSUR_Clima);	
		
		if (propeties != "") {
		
			$.post("/system/modules/com.tfsla.diario.telesur/elements/TS_Common_Header_Clima.jsp",
				{ ciudadIdCookie : propeties }, function(data){
				$("#BoxClima").html(data);
			});  
		 }
		 
	});
	 
	
	function createCookie(name,value,days) { //days=0 deletes cookie
		
		if (days) {
			var date = new Date();
			date.setTime(date.getTime()+(days*24*60*60*1000));
			var expires = "; expires="+date.toGMTString();
		} else { 
			var expires = "";
		}
		
		document.cookie = name+"="+escape(value)+expires;
	}
	
	
	function eraseCookie(name) {
		createCookie(name,"",-1);
	}
	
	function getCookie(cname) {
	    var name = cname + "=";
	    var ca = document.cookie.split(';');
	    for(var i = 0; i < ca.length; i++) {
	        var c = ca[i].trim();
	        if (c.indexOf(name) == 0) {
	        	return c.substring(name.length,c.length);
	        }
	    }
	}

</script>
--%>


<script>
	var device = navigator.userAgent
	var movil = device.match(/Iphone/i)|| 
	device.match(/Ipod/i)|| 
	device.match(/Android/i)|| 
	device.match(/J2ME/i)|| 
	device.match(/BlackBerry/i)|| 
	device.match(/iPhone|iPad|iPod/i)|| 
	device.match(/Opera Mini/i)|| 
	device.match(/IEMobile/i)|| 
	device.match(/Mobile/i)|| 
	device.match(/Windows Phone/i)|| 
	device.match(/windows mobile/i)|| 
	device.match(/windows ce/i)|| 
	device.match(/webOS/i)|| 
	device.match(/palm/i)|| 
	device.match(/bada/i)|| 
	device.match(/series60/i)|| 
	device.match(/nokia/i)|| 
	device.match(/symbian/i)|| 
	device.match(/HTC/i);
</script>
<%--
<nt:news>
	<meta name="twitter:card" content="summary_large_image">
	<meta name="twitter:site" content="@TelesurTV">
</nt:news>--%>