<%@ include file="TS_Common_Libraries.jsp" %>
<% 
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 5 );
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );		
%>
<!-- Interviews -->
<div class="row clear">  
	<div class="col">
		<div class="rowInt">
			<div class="headers red">Entrevistas</div>
			<div class="cont">
				<div id="listaNot-interviews">
		            		<cms:include page="../elements/TS_Opinion_Page.jsp" >
							<cms:param name="category">interviews</cms:param>
							<cms:param name="size">5</cms:param>
							<cms:param name="page">1</cms:param>
					 </cms:include>     
		         

				</div>

				<div class="btnopi">
					<a class="seemore desktop"  id="seemore-interviews" href="#" title="Ver más entrevistas">Ver más entrevistas</a>
				</div> 	
		        
			</div>
			
		</div>
	</div>
</div> 
      
 
<script>
$(document).ready(function(){	



	var page = 2;
	var size = 5;
	
	$('#seemore-interviews').on('click',function(e){
		e.preventDefault();
		traerPagina();	
	});
	function traerPagina(){
		$.post("/system/modules/com.tfsla.diario.telesur/elements/TS_Opinion_Page.jsp",
			{ 
			category: 'interviews',
			page: page,
			size: size,
			}, function(data){
			$('#listaNot-interviews').append(data);
			if( $(data).filter('.lineanews').length < 5 )
				$('#seemore-interviews').css('display', 'none');
		});
		page++;
	}
			
});
</script>