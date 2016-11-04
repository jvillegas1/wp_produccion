<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<!doctype html>
<html>
    <head>
       <cms:include page="../elements/TS_Common_Head.jsp" >
            <cms:param name="template">multimedia</cms:param>
        </cms:include>
        <!-- FlexSlider -->
<script src="js/function.js"></script>
<link href="<cms:link>../resources/css/flexslider.css</cms:link>" rel="stylesheet"  type="text/css" media="screen" />
	<style>
		.oculto{
			display:block !important;
		}
	</style>
        
    </head>
    <body>   
        
        <cms:include page="../elements/TS_Common_Header.jsp" >            
                <div class="subMenu">
                    <cms:param name="pageTitle">Infographics</cms:param>
                    <cms:param name="pageSeccion">multimedia</cms:param>
                    <cms:param name="subMenu"></cms:param>
                </div> 
                <div class="diaryHead"> 
                    <cms:param name="agenda">si</cms:param>
                    <cms:param name="latest">no</cms:param>
                </div>
        </cms:include> 
        <cms:include page="../elements/TS_Common_LiveBox.jsp"></cms:include>        	
        <section>           
            <div class="wrap multimedia infografias">         
                <div class="boxMmd int">                                        
                     <cms:include page="../elements/TS_Multimedia_Infografic_Destacadas.jsp">
			    </cms:include>
		            <article>
		            </article>            
		            <article>
		            </article>
                    <div id="reload-listado">
				<cms:include page="TS_Common_Listado_Multimedia.jsp">					
					<cms:param name="category">infographics</cms:param>
					<cms:param name="titulo">Infographics</cms:param>
				</cms:include>
		    </div>                                 		
                </div>     
		<div class="banners">
        		<cms:include page="../elements/TS_Common_Banners.jsp">
            		<cms:param name="template">Multimedia</cms:param>
           		<cms:param name="key">Advert-728x90</cms:param>
        		</cms:include>
    		</div>           
            </div>        
        </section>   	       
    <cms:include page="../elements/TS_Common_Footer.jsp"></cms:include> 
     <script type="text/javascript">
		   function loadMore(size, page) {      
		   	$("#cargando").html('<p class="loading" style="text-align:center;"><img src="/arte/loading2.gif" style=" height:100px; width:100px;"/></p>');      
		    	$("#reload-listado").load( 'listing.html?size=' + size + '&page=' +page+'&category=infographics&titulo=Infographics' , function( response, status, xhr ){
		    		$('#cargando').html("");
		    	});
		    	
	            }
</script>

    </body>
</html>