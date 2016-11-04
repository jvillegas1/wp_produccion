<%@ include file="/system/modules/com.tfsla.diario.telesur/elements/TS_Common_Libraries.jsp" %>

<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery-1.11.0.min.js</cms:link>"></script>
<script src="http://jwpsrv.com/library/HeeyEgeeEeS9bCIAC0MJiQ.js"></script>
<%--<script type="text/javascript" src="//widgets.openmultimedia.biz/player/omplayer.telesur.js"></script>--%>
<script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/videos-english-fn.js</cms:link>"></script>
<script>

	$(document).ready(function(){
		$().GetVideos();
	});

</script>
<div class="block videos" id="VideosContenedor">
	<h6><a href="http://multimedia.telesurtv.net/web/telesur/#!en">Video <cms:img src="/arte/i-videos.jpg" scaleType="2" alt="Telesur" /></a><a href="http://multimedia.telesurtv.net/web/telesur/#!en">Watch all shows</a></h6>
	
	<%--Function para la API de videos en js/video-fn.js--%>
</div>