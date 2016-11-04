<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>

<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">soyreportero</cms:param>
	</cms:include>
	
	<script type="text/javascript">	
		function cargarMasNotas(_pagina, _size){
		
			div = "#bloque_" + _pagina;
			paginador = "#paginador";
			
			jQuery(paginador).hide();
		
			$.post("/system/modules/com.tfsla.diario.telesur/elements/TS_SoyReportero_Page.jsp",
				{ pagina: _pagina, size: _size }, function(data){
				$(div).html(data);
				
			}); 
		}		
	</script>

</head>

<body>

	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">Soy Reportero</cms:param>
		<cms:param name="pageSeccion">reporter</cms:param>
		<cms:param name="agenda">no</cms:param>
		<cms:param name="subMenu">si</cms:param>
		<cms:param name="latest">no</cms:param>
	</cms:include>

	<!-- Container -->
	<div id="container">
	<cms:include page="../elements/TS_Common_LiveBox.jsp" />
		<div class="wrapper">
		<!--wrapper-->	
			<!-- Banner -->
			<div class="row clear marginchica">
				<div class="banners adv970">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">SoyReportero</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>
				</div>
				<div class="bannerMobile">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">SoyReportero</cms:param>
						<cms:param name="key">Advert-468x60-c-mobile</cms:param>
					</cms:include>
				</div>
			</div>	
			<!-- Destacado -->
			<div class="row clear">
				<!-- inicio colmna izq col-six -->
				<div class="col-six">		
	
		                   	<cms:include page="../elements/TS_SoyReportero_Destacado.jsp" />
		
					<!-- Page List -->
					<cms:include page="../elements/TS_SoyReportero_Page.jsp" />
		
					<!-- Banner 1 -->
					<div class="row clear marginchica">
						<div class="bannerMobile">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">SoyReportero</cms:param>
								<cms:param name="key">Advert-468x60-d-mobile</cms:param>
							</cms:include>
						</div>
					</div>
	
				</div>	
				
				<!-- Modificacion posterior para que apararesca el raking -->
				<cms:include page="../elements/TS_Common_RightColumn.jsp" >
				 	<cms:param name="template">SoyReportero</cms:param>
				</cms:include>
				
				
				<!-- Show PROMOTIONS -->
				<div class="row clear">
					<div class=" col-mid ">
						<div class="col-mid">
							<div class="cont">
								<cms:include page="../elements/TS_Common_Banners.jsp">
									<cms:param name="template">SoyReportero</cms:param>
									<cms:param name="key">Show-Promotion-220x220-a</cms:param>
								</cms:include>
							</div>
						</div> 
						<div class="col-mid">
							<div class="cont">
								<cms:include page="../elements/TS_Common_Banners.jsp">
									<cms:param name="template">SoyReportero</cms:param>
									<cms:param name="key">Show-Promotion-220x220-b</cms:param>
								</cms:include>
							</div>
						</div> 
                    			</div>
					<div class=" col-mid ">
						<div class="col-mid">
							<div class="cont">
								<cms:include page="../elements/TS_Common_Banners.jsp">
									<cms:param name="template">SoyReportero</cms:param>
									<cms:param name="key">Show-Promotion-220x220-c</cms:param>
								</cms:include>
							</div>
						</div> 
						<div class="col-mid">
							<div class="cont">
								<cms:include page="../elements/TS_Common_Banners.jsp">
									<cms:param name="template">SoyReportero</cms:param>
									<cms:param name="key">Show-Promotion-220x220-d</cms:param>
								</cms:include>
							</div>
						</div> 
					</div>
               			 </div>
            		</div>
        	</div>
        </div>

    	<cms:include page="../elements/TS_Common_Footer.jsp" />
	
</body>
</html>

    <script type="text/javascript">
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