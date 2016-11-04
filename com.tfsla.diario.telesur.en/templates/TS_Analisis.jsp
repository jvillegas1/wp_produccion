<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">Analysis</cms:param>
	</cms:include>        	
	
	<script type="text/javascript">	
		function cargarMasNotas(_pagina, _size, _display_search, _filter_autor, _buscar_search){
		
			div = "#bloque_" + _pagina;
			paginador = "#paginador";
			
			jQuery(paginador).hide();
		
			$.post("/system/modules/com.tfsla.diario.telesur.en/elements/TS_Analisis_Page.jsp",
				{ pagina: _pagina, size: _size, display_search: _display_search, filter_autor: _filter_autor, buscar_search: _buscar_search }, function(data){
				$(div).html(data);
				
			}); 
		}		
	</script>
</head>

<body>

	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">Analysis</cms:param>
		<cms:param name="pageSeccion">analysis</cms:param>
		<cms:param name="agenda">si</cms:param>
		<cms:param name="subMenu">no</cms:param>
		<cms:param name="latest">no</cms:param>       
	</cms:include>
	
          	
	<div class="bannerMobile fondobl">
		<cms:include page="../elements/TS_Common_Banners.jsp">
			<cms:param name="template">Analysis</cms:param>
			<cms:param name="key">Advert-468x60</cms:param>
		</cms:include>
	</div>	
	
	
     
	<!-- Container -->
	<div id="container">
		<cms:include page="../elements/TS_Common_LiveBox.jsp" />
	<div class="wrapper"><!--wrapper--> 
	  	
		<!-- Banner 1 -->
		<div class="row clear marginchica"> 
			<div class="banners adv970">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Analysis</cms:param>
					<cms:param name="key">Advert-950x90</cms:param>
				</cms:include>
			</div>       
		</div>
		    
	    	<div class="row clear">   
		   	<!-- inicio colmna izq col-six -->
		    	<div class="col-six">  
				<cms:include page="../elements/TS_Analisis_Page.jsp" />											            
	        	</div><!-- fin colmna izq col-six -->
	          	
	          	<cms:include page="../elements/TS_Common_RightColumn.jsp" >
			 	<cms:param name="template">Analisis</cms:param>
			</cms:include>
	          	
		</div>
	    
		<!-- Banner 2 -->    
		<div class="row clear"> 
			<div class="banners">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Analysis</cms:param>
					<cms:param name="key">Advert-728x90-a</cms:param>
				</cms:include>
			</div>  
			<div class="row clear mobilshow">  
				<div class="col-mid2">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Analysis</cms:param>
							<cms:param name="key">Show-Promotion-220x145-e</cms:param>
						</cms:include>
					</div>
				</div> 
				<div class="col-mid2">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Analysis</cms:param>
							<cms:param name="key">Show-Promotion-220x145-f</cms:param>
						</cms:include>
					</div>
				</div>     
			</div>
	    
			<!-- Show PROMOTIONS -->
			<div class="row clear promotions">  
				<div class="col-qua">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Analysis</cms:param>
							<cms:param name="key">Show-Promotion-220x145-a</cms:param>
				  		</cms:include>
					</div>
				</div> 
				<div class="col-qua">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Analysis</cms:param>
							<cms:param name="key">Show-Promotion-220x145-b</cms:param>
				  		</cms:include>
					</div>
				</div>
				<div class="col-qua">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Analysis</cms:param>
							<cms:param name="key">Show-Promotion-220x145-c</cms:param>
				  		</cms:include>
					</div>
				</div>
				<div class="col-qua">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Analysis</cms:param>
							<cms:param name="key">Show-Promotion-220x145-d</cms:param>
				  		</cms:include>
					</div>
				</div> 
			</div>   
	    	</div>
	    
		
	</div><!--wrapper-->
	</div><!--conteiner-->
	
	
	<cms:include page="../elements/TS_Common_Footer.jsp" />
	
</body>
<script type="text/javascript">
<!-- script menu -->
var menu = 0
$('#header .btnMobile').click(function(){
	if(menu == 0){
		$('#nav').slideDown(750);	
		menu++
	}else{			
		$('#nav').slideUp( 750, function() {
			$('#nav').removeAttr('style');
		  });
		menu--
	}
});
</script>
</html>