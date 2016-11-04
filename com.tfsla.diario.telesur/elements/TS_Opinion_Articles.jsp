<%@ include file="TS_Common_Libraries.jsp" %>
 <% 
	int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 5 );
	int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
		
%>
<!-- Articles -->
<div class="row clear">  
	<div class="col">
		<div class="rowInt">
			<div class="headers blue">Artículos</div>
			<div class="cont">
							
				<div id="listaNot-articles">
		                         <cms:include page="../elements/TS_Opinion_Page.jsp" >
					        <cms:param name="category">articles</cms:param>
					        <cms:param name="size">5</cms:param>
					        <cms:param name="page">1</cms:param>
					 </cms:include>
		
				</div>
				<!-- ESPANOL -->
				<span style="color: rgb(255, 253, 253); font-family: &quot;Arimo&quot;,sans-serif; border-radius: 5px; text-align: center; line-height: 15px; margin: 50px; font-style: italic; background-color: rgb(26, 32, 66); padding: 5px; font-size: 12px;"> teleSUR no se hace responsable de las opiniones emitadas en esta sección </span>
				<br>
				<br>
				<hr>
				<div class="btnopi">
					<a class="seemore desktop" id="seemore-articles" href="#" title="Ver más artículos<">Ver más artículos</a>
				</div>	
		   	</div>
		      
		  </div>
	
	
	</div>


</div>

<script>
$(document).ready(function(){	



	var page = 2;
	var size = 5;
	
	$('#seemore-articles').on('click',function(e){
		e.preventDefault();
		traerPagina();	
	});
	function traerPagina(){
		$.post("/system/modules/com.tfsla.diario.telesur/elements/TS_Opinion_Page.jsp",
			{ 
			category: 'articles',
			page: page,
			size: size,
			}, function(data){
			$('#listaNot-articles').append(data);
			if( $(data).filter('.lineanews').length < 5 )
				$('#seemore-articles').css('display', 'none');
		});
		page++;
	}
			
});

</script>