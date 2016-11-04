<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
<head>





	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">search</cms:param>
	</cms:include>

	<script type="text/javascript">
	$(window).load(function(){
		
	  //if
	  $(function(){
		$('#header .nav ul li a.select').parent('li').css('border', 'none'); 
		$('#header .nav ul li a.select').parent('li').prev().css('border', 'none');
		});
	  
	});
	</script>
	 
</head>

<body>

        
    
	<!-- Header -->
	<cms:include page="../elements/TS_Common_Header.jsp" >
	    <cms:param name="pageTitle">Buscar</cms:param>
	    <cms:param name="pageSeccion"></cms:param>
	    <cms:param name="subMenu">no</cms:param>
	    <cms:param name="agenda">si</cms:param>
	</cms:include>
	
	


	
	<!-- Container -->
	<div id="container">
		<cms:include page="../elements/TS_Common_LiveBox.jsp" />
		<div class="wrapper"><!--wrapper--> 	
			<div class="row clear"> 
			         <link rel="stylesheet" href="/system/modules/com.tfsla.diario.telesur/resources/css/navigataur.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script>
      window.fbAsyncInit = function() {
        FB.init({
          appId      : '1441268399520835',
          xfbml      : true,
          version    : 'v2.3'
        });
      };

      (function(d, s, id){
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = "//connect.facebook.net/es_LA/all.js";
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));
    </script>
   <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1&version=v2.3&appId=1441268399520835";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<script>
    $(document).ready(function () {
        $("#comentNativos").addClass("coment");
        $("#btn-face").addClass("active");

        $("#btn-cf").click(function () {
            // alert("btn-facebook");
            $("#comentNativos").addClass("coment");
            $("#btn-face").addClass("active");
            $(".fb_ltr").css({width: "780px"});
            $("#comentFace").removeClass("coment");
            $("#btn-nativo").removeClass("active");


        });
        $("#btn-cn").click(function () {
            // alert("btn-nativo");
            $("#comentFace").addClass("coment");
            $("#comentNativos").removeClass("coment");
            $("#btn-nativo").addClass("active");
            $("#btn-face").removeClass("active");
        });
    });
</script>



<div class="contner">
    <div class="clearfix">
      
            <div class="nav">
                <input type="checkbox" id="toggle" />
                <label for="toggle" class="toggle" onclick></label>
                <ul class="menu">
                    <li id="btn-face" class="">
                        <a id="btn-cf" href="#.">
                            <span class="icofb"> </span>
                            Comentarios con facebook   (<span class="fb-comments-count" data-href="http://www.telesurtv.net/news/Nuevo-terremoto-de-74-en-Nepal-deja-al-menos-42-muertos-20150512-0062.html"></span>)</a>
                    </li>
                    <li id="btn-nativo" class="">
                        <a id="btn-cn" href="#.">
                            <span class="icots"> </span>
                            Comentarios con teleSUR ()</a>
                    </li>		
                </ul>

            </div><!-- End of Navigation -->

    </div><!-- End of Header -->
    <div class="comentArtic">
        <div id="comentFace">
            <div class="wrapper">
                </br> 
                <div class="row clear"> 
                    <div class="fb-comments" data-href="http://www.telesurtv.net/news/Nuevo-terremoto-de-74-en-Nepal-deja-al-menos-42-muertos-20150512-0062.html" data-numposts="10" data-colorscheme="light"></div>             
                </div>
             
            </div>
        </div>
        <div id="comentNativos"> 
         
               
        </div>
    </div>
</div><!-- End of Container -->
				
				</div>
			</div>

	

		</div><!--wrapper-->  
	</div><!--conteiner-->
    
<cms:include page="../elements/TS_Common_Footer.jsp" />

</body>
</html>