<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
<head>
	<cms:include page="../elements/TS_Common_Head.jsp">
		<cms:param name="template">homeNew</cms:param>
	</cms:include> 
	<nt:page-builder-init/>
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
	<%-- <div class="banners intersticial">
		<cms:include page="../elements/TS_Common_Banners.jsp">
		<cms:param name="template">Home</cms:param>
		<cms:param name="key">Intersticial-Desktop-1024x728-a</cms:param>
	</cms:include> --%>
	
</div>
	<section>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeResult</cms:param>
			</cms:include>
	<nt:page-builder>
		
	 <nt:container name="Portada3" /> 
		<div class="wrap">
			<%--<cms:include page="../elements/TS_Home_Destacada.jsp"></cms:include>--%>
	    	
			<%--<cms:include page="../elements/TS_Home_LastNews.jsp"></cms:include>--%>
			
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">Publicidad-728x90-e</cms:param>
			</cms:include>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeLastNews</cms:param>
			</cms:include>
			
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">Publicidad-728x90-a</cms:param>
			</cms:include>
			
			<%--<cms:include page="../elements/TS_Home_Video.jsp"></cms:include>--%>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeVideo</cms:param>
			</cms:include>
			
			<%--<cms:include page="../elements/TS_Home_Destacamos.jsp"></cms:include>--%>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeDestacamos</cms:param>
			</cms:include>
			
			<%--<cms:include page="../elements/TS_Home_AmericaLatina.jsp"></cms:include>--%>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeLatinAmerica</cms:param>
			</cms:include>
	    	
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">Publicidad-728x90-b</cms:param>
			</cms:include>
			
			<div class="bannerMobT">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Home</cms:param>
					<cms:param name="key">Advert-Mobile620x50-b</cms:param>
				</cms:include>
			</div>
			
			<div class="bannerMobS">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Home</cms:param>
					<cms:param name="key">Advert-Mobile320x50-a</cms:param>
				</cms:include>
			</div>
			
			<%--<cms:include page="../elements/TS_Home_InPictures.jsp"></cms:include>--%>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeInPictures</cms:param>
			</cms:include>
			
			<%--<cms:include page="../elements/TS_Home_Mundo.jsp"></cms:include>--%>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeWorld</cms:param>
			</cms:include>
			
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeAudio</cms:param>
			</cms:include>
			
			<%--<cms:include page="../elements/TS_Home_Corresponsales.jsp"></cms:include>--%>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeCorresponsales</cms:param>
			</cms:include>
	
			<%--<cms:include page="../elements/TS_Home_Opinion_Blogueros.jsp"></cms:include>--%>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeOpinionBlogueros</cms:param>
			</cms:include>
			
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">Publicidad-728x90-c</cms:param>
			</cms:include>
			
			<div class="bannerMobT">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Home</cms:param>
					<cms:param name="key">Advert-Mobile620x50-c</cms:param>
				</cms:include>
			</div>
			
			<div class="bannerMobS">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Home</cms:param>
					<cms:param name="key">Advert-Mobile320x50-b</cms:param>
				</cms:include>
			</div>
	        
			<%--<cms:include page="../elements/TS_Home_AgendaTelesur.jsp"></cms:include>--%>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeAgendaTelesur</cms:param>
			</cms:include>
	        
			<%--<cms:include page="../elements/TS_Home_Voices.jsp"></cms:include>--%>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeVoices</cms:param>
			</cms:include>
			
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">Publicidad-728x90-d</cms:param>
			</cms:include>
			
			<div class="bannerMobT">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Home</cms:param>
					<cms:param name="key">Advert-Mobile620x50-d</cms:param>
				</cms:include>
			</div>
			
			<div class="bannerMobS">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Home</cms:param>
					<cms:param name="key">Advert-Mobile320x50-c</cms:param>
				</cms:include>
			</div>
			
			<%--<cms:include page="../elements/TS_Home_Deportes.jsp"></cms:include>--%>
			<cms:include page="../elements/TS_Common_Blocks.jsp">
				<cms:param name="template">HomeSports</cms:param>
			</cms:include>
	    	
		</div>
	</section>
	</nt:page-builder>
	<cms:include page="../elements/TS_Common_Footer.jsp"></cms:include>
<!--AdsLive-->
<script async='async' src='https://www.googletagservices.com/tag/js/gpt.js'></script>
<script type="text/javascript" src="http://pfapi.xyz/AdServerApi/api/ads/js/tag.js"></script> 
<script>
  var googletag = googletag || {};
  googletag.cmd = googletag.cmd || [];
</script>

<!-- /18910235/1x1.incontent -->
<div id='div-gpt-ad-1474583384073-0'>
<script>
googletag.cmd.push(function() { googletag.display('div-gpt-ad-1474583384073-0'); });
</script>
</div>
<!-- /11322282/Telesurtv.net//1x1 -->
<div id='div-gpt-ad-1476114832443-0'>
<script>
googletag.cmd.push(function() { googletag.display('div-gpt-ad-1476114832443-0'); });
</script>
</div>
<!--AdsLive-->
</body>

</html>