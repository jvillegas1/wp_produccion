<%@ include file="TS_Common_Libraries.jsp" %>
<%
int pagina 	= ( request.getParameter("pagina") != null ) ? Integer.parseInt(request.getParameter("pagina")) : 1;
int size 	= ( request.getParameter("size") != null ) ? Integer.parseInt(request.getParameter("size")) : 10;
%>
<div class="rowInt">
	<div class="headers blue" style="margin-bottom:0 !important">Forum</div>
	<div class="cont">
		 <div class="contfor">
		 	<ul>
		 		<li>
					<div class="forpostpop forbold">Post Popular Topics</div>
					<div class="forpost forbold">Posts</div>
					<div class="forup forbold">Updated</div>					
				</li>
				<cms:include page="TS_JoinUs_ForumPage.jsp"/>
			</ul>
		</div>
		
	</div>
</div>

<script type="text/javascript">	
	function cargarMasNotas(_pagina, _size){
	
		div = "#bloque_" + _pagina;
		paginador = "#paginador";
		
		jQuery(paginador).hide();
	
		$.post("/system/modules/com.tfsla.diario.telesur.en/elements/TS_JoinUs_ForumPage.jsp",
			{ pagina: _pagina, size: _size }, function(data){
			$(div).html(data);
			
		}); 
	}		
</script>