<%@ include file="TS_Common_Libraries.jsp" %>

<div class="headlive">Context</div>
	<div class="backop ">
		<div class="cont">
			<div id="listaNot-context">
	                         <cms:include page="../elements/TS_Opinion_Page.jsp" >
						<cms:param name="category">context</cms:param>
						<cms:param name="size">7</cms:param>
						<cms:param name="page">1</cms:param>
				 </cms:include>
  			</div>
  			<div class="censee" id="content-seemore-context">
				<div class="btnopi">
					<a class="seemore desktop seemore-context" href="#" title="See more" alt="See more">See more</a>
				</div>
			</div>
		</div>
    	</div>
</div>

<script>
$(document).ready(function(){

	var page = 2;
	var size = 7;
	
	$('.seemore-context').on('click',function(e){
 		e.preventDefault();
		traerPagina();	
	});
	function traerPagina(){
		$.post("/system/modules/com.tfsla.diario.telesur.en/elements/TS_Opinion_Page.jsp",
			{ 
			category: 'context',
			page: page,
			size: size,
			}, function(data){
			$('#listaNot-context').append(data);	
			if( $(data).filter('.context2').length < 7 )
				$('#content-seemore-context').css('display', 'none');
		});
		page++;
	}
			
});
</script>