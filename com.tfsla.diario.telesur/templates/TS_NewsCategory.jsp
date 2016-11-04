<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<%
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);

String category = cms.property("subSeccion");
String title = cms.property("Title");
String uri = cms.getRequestContext().getUri();
    
%>
<!doctype html>
<html>
<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">news</cms:param>
	</cms:include>
	
	<script type="text/javascript">
	$(window).load(function(){

			$('#header .nav ul li a.select').parent('li').css('border', 'none'); 
			$('#header .nav ul li a.select').parent('li').prev().css('border', 'none');    
			$('#header .barra ul li a.seleccion').parent('li').prev().css('border', 'none');			
	});
	
	
	</script>
	<script type="text/javascript">
		function cargarMasNotas(_proxPag, _category, _title, _size){
			
			div = "#bloque_" + _proxPag;
			paginador = "#paginador";
			
			jQuery(paginador).hide();
		       
			$.post("/system/modules/com.tfsla.diario.telesur/elements/TS_NewsCategory_Page.jsp",
				{ pagina:_proxPag, category:_category, title:_title, size:_size }, function(data){
				$(div).html(data);
			});  
		}	
	</script>
 
</head>

<body>

	<!-- Header -->  
	
	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle"><%=title %></cms:param>
		<cms:param name="pageSeccion">news</cms:param>
		<cms:param name="subMenu">si</cms:param>
		<cms:param name="agenda">si</cms:param>
	</cms:include>
	
	<!-- Container -->
	<div id="container">
	<cms:include page="../elements/TS_Common_LiveBox.jsp" />
	
		<div class="wrapper"><!--wrapper--> 
		
			<!-- Banner 1 -->
			<div class="row clear marginchica"> 
				
				<div class="banners pos0">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">NewsCategory</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>          
				</div>
				
				<div class="bannerMobile">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">NewsCategory</cms:param>
						<cms:param name="key">Advert-468x60-b-mobile</cms:param>
					</cms:include>           
				</div>
			</div>
			
			<!-- Destacado -->
			<div class="row clear">
			
				<!-- inicio colmna izq col-six -->
				<div class="col-six">									
					
					<!-- List News -->
					<cms:include page="../elements/TS_NewsCategory_Page.jsp" >
						<cms:param name="category"><%=category %></cms:param>
						<cms:param name="title"><%=title %></cms:param>
					</cms:include>             
					
				</div><!-- fin colmna izq col-six -->
			
				<cms:include page="../elements/TS_Common_RightColumn.jsp" >
					<cms:param name="template">NewsCategory</cms:param>
				</cms:include>  
					
			</div>
	
				<!-- widget deportes -->
			<%--
			<div class="row clear">					
				
					<%  if(uri.equals("/SubSecciones/news/sport/index.html") ){%>
  						<div class="block stats">
						<h6>Estadísticas</h6>
						<cms:include page="../elements/TS_Widget_Deporte.jsp" />
						</div>				       
					<% } %>
					
				
			</div> 
			--%>
			
			
			<div class="row clear"> 
				<div class="banners"> 
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">NewsCategory</cms:param>
						<cms:param name="key">Advert-728x90-a</cms:param>
					</cms:include>
				</div>  
			
			
			
				<div class="row clear mobilshow">  
					<div class="col-mid2">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp" >
								<cms:param name="template">NewsCategory</cms:param>
								<cms:param name="key">Show-Promotion-220x145-a</cms:param>
							</cms:include>                
						</div>
					</div> 
					<div class="col-mid2">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp" >
								<cms:param name="template">NewsCategory</cms:param>
								<cms:param name="key">Show-Promotion-220x145-b</cms:param>
							</cms:include>                
						</div>
					</div>
				</div>
				
				
			
			
				
				<!-- Show PROMOTIONS -->
				<div class="row clear promotions">  
					<div class="col-qua">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">NewsCategory</cms:param>
								<cms:param name="key">Show-Promotion-220x220-a</cms:param>
							</cms:include>
						</div>
					</div> 
					
					<div class="col-qua">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">NewsCategory</cms:param>
								<cms:param name="key">Show-Promotion-220x220-b</cms:param>
							</cms:include>
						</div>
					</div>
					
					<div class="col-qua">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">NewsCategory</cms:param>
								<cms:param name="key">Show-Promotion-220x220-c</cms:param>
							</cms:include>
						</div>
					</div>
					
					<div class="col-qua">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">NewsCategory</cms:param>
								<cms:param name="key">Show-Promotion-220x220-d</cms:param>
							</cms:include>
						</div>
					</div> 
				</div>
			</div>
		</div><!--wrapper-->
	</div><!--conteiner-->
	
	<!-- Footer -->
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