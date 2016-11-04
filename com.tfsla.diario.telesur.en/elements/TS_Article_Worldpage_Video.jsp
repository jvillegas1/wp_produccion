<%@ include file="TS_Common_Libraries.jsp" %>
				    
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.1.min.js"> </script>
<script src="http://jwpsrv.com/library/HeeyEgeeEeS9bCIAC0MJiQ.js"></script>
<%--<script type="text/javascript" src="http://www.telesurtv.net/__export/1456513189319/system/modules/com.tfsla.diario.telesur/resources/js/videos-english-fn.js"></script> --%> 

 <script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/videos-english-fn.js</cms:link>"></script> 

<script>
	
	jQuery(document).ready(function($){
		$().GetCorresponsalINT();
	});

</script>
<div class="correspo" >
	<a href="http://videos.telesurtv.net/videos/noticia/corresponsales"><h6>Videos</h6></a>
	<ul class="listvideo" id="videoCorres">
	</ul>
</div>