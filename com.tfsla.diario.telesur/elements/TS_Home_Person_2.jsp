<%@ include file="TS_Common_Libraries.jsp" %>
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
    <div class="block resultados">
        <div class="col">
            <div class="cont conttitle">
                <h6>Resultados Perú</h6>
            </div>
            <nt:person-list state="1" size="2" tipo="personas/Peru_Decide/">
                <div class="boxP"> 	                

                    <div class="ImgElec">


                        <a href="http://www.telesurtv.net/pages/Especiales/votaciones-peru/peru/index.jsp" target="_blank" title="">	

                            <img src="<nt:person-image scaletype='2' />"/>
                        </a>	

                    </div>

                    <div class="overflow">
                        <h3><a href="" alt="" title=""> </a><nt:person-name /><br>(<nt:person-shortdescription />)</h3>	

                        <p >Resultados
                        <c:set var="divisor"></c:set>

                        <a href="" class="autor" alt="" title=""> 
                            ${divisor} 
                        </a>

                        </p>

                        <div class="captionr">
                            <div class="votes" style="width:<nt:person-custom2 />;"></div>
                            <span class="porcentual"><nt:person-custom2 /></span>
                        </div>


                    </div>
                </div>

            </nt:person-list>       
        </div>
    </div>