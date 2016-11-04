<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
String programa = (request.getParameter("programa") == null ) ? "" : request.getParameter("programa") ;
%>

  <script src="<cms:link>../resources/js/jquery-1.11.0.min.js</cms:link>"></script>
  <script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/videos-programasEn.js</cms:link>"></script>
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
            <h4>Latest Programs</h4>
            <div id="ContenedorUltimos"></div>
            <div class="btnMas1">View More</div>
        </div>