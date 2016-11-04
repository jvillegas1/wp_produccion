<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
String programa = (request.getParameter("programa") == null ) ? "" : request.getParameter("programa") ;
%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/videos-programas.js</cms:link>"></script>

<script>
	jQuery(document).ready(function($){
		var primero=1;
		var ultimo=9;
		var programa="<%=programa%>";

		$( ".btnMas1" ).click(function() {
			primero = primero+9;
			ultimo = ultimo+9;
			$().GetProgramas(primero,ultimo, programa);
		});

		$().GetProgramas(primero,ultimo, programa);

	});
</script>

<div class="boxNotis">
	<h4>Últimos Programas</h4>
	<div id="ContenedorUltimos"></div>
	<div class="btnMas1">Ver más</div>
</div>