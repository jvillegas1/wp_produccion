<%@ include file="TS_Common_Libraries.jsp" %>
<!-- FlexSlider -->




<script type="text/javascript">
$(window).ready(function(){
  $('.flexslider').flexslider({
	animation: "slide",
	animationLoop: false,
	itemWidth: 250,
	itemHeight: 150,
	itemMargin: 20,
	pausePlay: false,
	start: function(slider){
	  $('body').removeClass('loading');
	}
  });
  $('.simpleSlide').flexslider({
	animation: "slide",
	start: function(slider){
	  $('body').removeClass('loading');
	}
  });
});

</script>
<style>
.flex-direction-nav .flex-disabled {opacity: 1!important;filter: alpha(opacity=0);cursor: default;}
.carruselPhotosSearch .flex-pauseplay, .flex-control-nav {display: inline;}

</style>

 <div class="block resultados2">
    	<div class="col">
      	<div class="cont conttitle">
        	<h6>Resultados Argentina</h6>
        </div>
    
        	<div class="flexslider carousel">
              <ul class="slides">
              <nt:person-list state="1" tipo="personas/argentina_Decide/" >
                <li>
                <div class="data">
                 <div class="imagenr">                	
                  <a href="http://www.telesurtv.net/pages/Especiales/Elecciones-Argentina/index.jsp">   <h2 class="h2r"><nt:person-name /><br>(<nt:person-shortdescription />)</h2></a>
                </div>
                </div>
               <div class="imagenr">                	
                   <a href="http://www.telesurtv.net/pages/Especiales/Elecciones-Argentina/index.jsp"> <img src="<nt:person-image width='270' height='150' scaletype='2' />" width="170" height="150" /></a>
                </div>
                <!--<a href="#" class="her">-->
                  	 <div class="captionr">
                  	 <div class="votes" style="width:<nt:person-custom2 />;"></div>
                  	 <span class="porcentual"><nt:person-custom2 /></span>
                  	 </div>
                 <!--</a>-->
 
                 </li>

                    </nt:person-list>          
              </ul>  
			</div>
            
        </div>
      </div>  
      

 



                    
                   