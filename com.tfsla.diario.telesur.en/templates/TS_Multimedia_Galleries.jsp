<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<!doctype html>
<html>
<head>
	<cms:include page="../elements/TS_Common_Head.jsp" >
            <cms:param name="template">multimedia</cms:param>
        </cms:include>
	<link href="<cms:link>../resources/css/flexslider.css</cms:link>" rel="stylesheet"  type="text/css" media="screen" />
	<script src="<cms:link>../resources/js/jquery.flexslider.js</cms:link>"></script>
	<script src="<cms:link>../resources/js/tabs.min.jquery.js</cms:link>"></script>
	<style>
		.oculto{
			display:block !important;
		}
	</style>
</head>

<body>
	<cms:include page="../elements/TS_Common_Header.jsp" >
        <cms:param name="pageTitle">Galleries</cms:param>
        <cms:param name="pageSeccion">multimedia</cms:param>
        <cms:param name="subMenu">si</cms:param>
        <cms:param name="agenda">si</cms:param>
        <cms:param name="latest">no</cms:param>
        </cms:include>
	<section>
		<div class="wrap multimedia galerias">
		    	<div class="boxMmd int">
		            <cms:include page="../elements/TS_Multimedia_Galleries_Listados_Destacados.jsp"/>
			    
			   
		            
		            <div id="reload-listado">
				    <%--<cms:include page="../elements/TS_Galleries_Listados.jsp">--%>
				    <cms:include page="TS_Common_Listado_Multimedia.jsp">
				    <cms:param name="category">galleries</cms:param>
				    <cms:param name="titulo">Galleries</cms:param>
				    </cms:include>
			    </div>	        	    
	        	</div>
	        </div>
	        <div class="banners pos1"></div>
	    </div>
	</section>
	<cms:include page="../elements/TS_Common_Footer.jsp" />
	<script type="text/javascript">
		  function loadMore(size, page) {
        $("#cargando").html('<p class="loading" style="text-align:center;"><img src="/arte/loading2.gif" style=" height:100px; width:100px;"/></p>');
        $("#reload-listado").load('listing.html?size=' + size + '&page=' + page + '&category=galleries&titulo=Galleries', function(response, status, xhr) {
            $('#cargando').html("");
        });

    }
	</script>
</body>
</html>