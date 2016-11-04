<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
/** Variables de session para mantener la ruta de navegacion del usuario*/
session.setAttribute("seccion","opinion");
session.setAttribute("url",cms.getRequestContext().getUri());
%>
<!doctype html>
<html>
<head>

    <cms:include page="../elements/TS_Common_Head.jsp" >
        <cms:param name="template">opinion</cms:param>
    </cms:include>

	<script type="text/javascript">
		$(window).load(function(){
		  //if
		  $(function(){
			$('#header .nav ul li a.select').parent('li').css('border', 'none') 
			});
		});
	</script>
	
	<script type="text/javascript">	
		function cargarMasNotas(_pagina, _size, _display_search, _filter_autor, _buscar_search){
		
			div = "#bloque_" + _pagina;
			paginador = "#paginador";
			
			jQuery(paginador).hide();
		
			$.post("/system/modules/com.tfsla.diario.telesur.en/elements/TS_Opinion_Articles.jsp",
				{ pagina: _pagina, size: _size, display_search: _display_search, filter_autor: _filter_autor, buscar_search: _buscar_search }, function(data){
				$(div).html(data);
				
			}); 
		}		
	</script>

</head>

<body>
	
	 <cms:include page="../elements/TS_Common_Header.jsp" >
	        <cms:param name="pageTitle">Opinion</cms:param>
	        <cms:param name="pageSeccion">opinion</cms:param>
	        <cms:param name="subMenu">no</cms:param>
	        <cms:param name="agenda">no</cms:param>
	        <cms:param name="latest">no</cms:param>
	 </cms:include>
	
	<cms:include page="../elements/TS_Opinion_Search.jsp" />
     
	<!-- Container -->
	<div id="container">
	<cms:include page="../elements/TS_Common_LiveBox.jsp" />
		<div class="wrapper"><!--wrapper--> 
	  	
	    		<div class="row clear"> 
				<div class="banners pos0">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Opinion</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>
				</div>       
				<div class="bannerMobile">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Opinion</cms:param>
						<cms:param name="key">Advert-468x60-b-mobile</cms:param>
					</cms:include>
				</div>
			</div>
	    
		    <!-- Destacado -->
		    <div class="row clear">
	    
	    
		  	<!-- inicio colmna izq col-six -->
		    	<div class="col-six">
		            
			 	<cms:include page="../elements/TS_Opinion_Articles.jsp" >
		        		<cms:param name="page"> 1 </cms:param>
		        		<cms:param name="size"> 5 </cms:param>
		        	</cms:include>  
			 
			       	<div class="row clear"> 
				        <div class="bannerMobile">	
				      		<cms:include page="../elements/TS_Common_Banners.jsp">
				      			<cms:param name="template">Opinion</cms:param>
							<cms:param name="key">Advert-300x250-a</cms:param>
						</cms:include>
				        </div>  
				</div>  
			        
			      
			    	<cms:include page="../elements/TS_Opinion_Interviews.jsp" />
			            
			        <div class="row clear"> 
				        <div class="bannerMobile">
				      		<cms:include page="../elements/TS_Common_Banners.jsp">
				        		<cms:param name="template">Opinion</cms:param>
							<cms:param name="key">Advert-300x250-b</cms:param>
						</cms:include>
				        </div>  
				</div> 
		                
		        </div><!-- fin colmna izq col-six -->
	      
		
				<% /** hay un banner en la posiscion 3 de opinion_context*/ %>
			<div>
				<cms:include page="../elements/TS_Common_RightColumn.jsp" >
					 	<cms:param name="template">Opinion</cms:param>
					</cms:include>
			</div>
			<div class="col-for">
				
				<%--<cms:include page="../elements/TS_Opinion_Context.jsp" />--%>
			
			</div><!--colfor-->  
		</div>
	    
	   	<div class="row clear"> 
			 <div class="banners">	
		      		<cms:include page="../elements/TS_Common_Banners.jsp">
		        		<cms:param name="template">Opinion</cms:param>
					<cms:param name="key">Advert-728x90-a</cms:param>
				</cms:include>
			</div>              
			<div class="bannerMobile">
		      		<cms:include page="../elements/TS_Common_Banners.jsp">
		        		<cms:param name="template">Opinion</cms:param>
					<cms:param name="key">Advert-300x250-a</cms:param>
				</cms:include>
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

	$(function() {						
		$('#slideVertical').ulslide({
			width: 170,
			height: 105,
			effect: {
				type: 'carousel', // slide or fade
				axis: 'y',        // x, y
				showCount: 3
			},
			nextButton: '#slide_next',
			prevButton: '#slide_prev',
			duration: 800,
		});
	});

</script>
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

<script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery.isotope.min.js</cms:link>"></script>

</html>