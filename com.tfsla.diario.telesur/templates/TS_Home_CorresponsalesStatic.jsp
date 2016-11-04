<%@ include file="/system/modules/com.tfsla.diario.telesur/elements/TS_Common_Libraries.jsp" %>
<script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery-1.11.0.min.js</cms:link>"></script>
<script src="http://jwpsrv.com/library/HeeyEgeeEeS9bCIAC0MJiQ.js"></script>
<script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/videos-fn.js</cms:link>"></script>
<script>

	$(document).ready(function(){
		$().GetCorresponsales();
	});

</script>
<div class="block corres" id="CorresContenedor">
	<a href="http://multimedia.telesurtv.net/web/telesur/#!es/lista/noticia/corresponsales"><h6>Corresponsales <cms:img src="/arte/i-corres.jpg" scaleType="2" alt="Telesur" /></h6></a>
	
	<%--Function para la API de videos (corresponsales) en js/videos-fn.js--%>
</div>