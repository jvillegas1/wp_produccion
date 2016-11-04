<%@ include file="TS_Common_Libraries.jsp" %>

<!--Photo Gallery  -->
<div id="PhotoGallery" class="row clear desktop">
	<div class="infoGrap">
		<div class="headers bluegar"> Photo Gallery </div>
	</div>
	<div class="cont">
		<div class="itatitulo">
			<h3>- Photo Gallery -</h3>
		</div>
		<div class="row clear">
			<div class="cont">
			</div>
		</div>
		<div id="galeriaDestacada">
			<cms:include page="../elements/TS_Multimedia_Photo_Gallery_Top.jsp">
				<cms:param name="localpath"></cms:param>
			</cms:include>
		</div>
	</div>
</div>

<cms:include page="../elements/TS_Multimedia_Photo_Gallery_Bottom.jsp" />
	
<script type="text/javascript">		
	function cargarDestacada(_localpath){
		$.post("/system/modules/com.tfsla.diario.telesur.en/elements/TS_Multimedia_Photo_Gallery_Top.jsp",
			{ localpath:_localpath }, function(data){
			$('#galeriaDestacada').html(data);
		});  
	}
</script>
    