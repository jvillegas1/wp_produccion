<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
org.opencms.jsp.CmsJspXmlContentBean cms = new
org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
 
String category = cms.property("subSeccion");
String title = cms.property("Title");

int contNota = 0;
%>
<!doctype html>
<html>
<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">news</cms:param>
	</cms:include>
    
    	<script type="text/javascript">
		function cargarMasNotas(_proxPag, _category, _title, _size){
			
			div = "#bloque_" + _proxPag;
			paginador = "#paginador";
			
			jQuery(paginador).hide();
		       
			$.post("/system/modules/com.tfsla.diario.telesur/elements/TS_Country_Page.jsp",
				{ pagina:_proxPag, category:_category, title:_title, size:_size }, function(data){
				$(div).html(data);
			});  
		}	
	</script>

</head>

<body>

	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle"><%=title%></cms:param>
		<cms:param name="pageSeccion"></cms:param>
		<cms:param name="agenda">si</cms:param>
		<cms:param name="subMenu">no</cms:param>
		<cms:param name="latest">no</cms:param>       
	</cms:include>
	   
     
	<!-- Container -->
	<div class="wrapper"><!--wrapper--> 
	  	<cms:include page="../elements/TS_Common_LiveBox.jsp" />
		<!-- Banner 1 -->
		<div class="row clear marginchica"> 
			<div class="banners pos0">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Country</cms:param>
					<cms:param name="key">Advert-950x90</cms:param>
				</cms:include>
			</div>       
			<div class="bannerMobile">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Country</cms:param>
					<cms:param name="key">Advert-468x60-c-mobile</cms:param>
				</cms:include>
			</div>
		</div>
		    
	    	<div class="row clear">   
		   	<!-- inicio colmna izq col-six -->
		    	<div class="col-six"> 
				<div class="rowInt">      	
					<div class="cont">	
						<nt:news-list order="user-modification-date desc" category="<%=category%>">
							<%contNota++;%>	
						</nt:news-list>	
						<% if (contNota == 0){ %>
							<div class="fraseComment"> No hay noticias en esta categoria. </div>
						<% } else { %>																																		 
							<cms:include page="../elements/TS_Country_Page.jsp"> 
								<cms:param name="category"><%=category %></cms:param>
								<cms:param name="title"><%=title%></cms:param>
		          				</cms:include>	
	          				<% } %>
	          			</div>
	          		</div>													            
	        	</div><!-- fin colmna izq col-six -->
	          	
	          	<cms:include page="../elements/TS_Common_RightColumn.jsp" >
			 	<cms:param name="template">Country</cms:param>
			</cms:include>
	          		      		
		</div>
	    
		<!-- Banner 2 -->    
		<div class="row clear"> 
			<div class="banners">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Country</cms:param>
					<cms:param name="key">Advert-728x90-b</cms:param>
				</cms:include>
			</div>  
			<div class="row clear mobilshow">  
				<div class="col-mid2">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Country</cms:param>
							<cms:param name="key">Show-Promotion-220x145-e</cms:param>
						</cms:include>
					</div>
				</div> 
				<div class="col-mid2">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Country</cms:param>
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
							<cms:param name="template">Country</cms:param>
							<cms:param name="key">Show-Promotion-220x145-a</cms:param>
				  		</cms:include>
					</div>
				</div> 
				<div class="col-qua">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Country</cms:param>
							<cms:param name="key">Show-Promotion-220x145-b</cms:param>
				  		</cms:include>
					</div>
				</div>
				<div class="col-qua">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Country</cms:param>
							<cms:param name="key">Show-Promotion-220x145-c</cms:param>
				  		</cms:include>
					</div>
				</div>
				<div class="col-qua">
					<div class="cont">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Country</cms:param>
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