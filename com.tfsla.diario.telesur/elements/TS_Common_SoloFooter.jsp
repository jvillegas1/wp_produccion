<%@ include file="TS_Common_Libraries.jsp" %>

<footer id="footer">
	<div class="wrap">
		<div class="colFoot logoFoot">
			<cms:img src="/arte/logo-footer.jpg" scaleType="2" alt="Telesur" />
			<a href="#" class="subirBtn" alt="Subir" title="Subir">
		    			<cms:img src="/arte/btn-subir.jpg" scaleType="2" width="50" height="65" alt="Subir" />
		    		</a>
			<ul class="footMobile">
				<li><a href="http://www.telesurtv.net/pages/terminosycondiciones.html">Términos y condiciones</a></li>
				<li>|</li>
				<li><a href="http://www.telesurtv.net/pages/privacidad.html">Privacidad</a></li>
				<li>|</li>
				<li><a href="#">Sitio Completo</a></li>
			</ul>
		</div>
		
		<div class="colFoot">
			<h4>Sobre teleSUR</h4>
			<a href="http://www.telesurtv.net/pages/sobrenosotros.html">Acerca teleSUR</a>
			<a href="http://www.telesurtv.net/pages/contacto.html">Contactos</a>
			<a href="http://www.telesurtv.net/pages/equipo.html">Equipo</a>
			<a href="http://www.telesurtv.net/pages/empleos.html">Empleos</a>
			<a href="http://www.telesurtv.net/pages/terminosdeuso.html">Terminos de uso</a>
			<a href="http://www.telesurtv.net/pages/aplicaciones.html">Aplicaciones</a>
			<a href="http://www.telesurtv.net/pages/coberturasatelital.html">Cobertura satelital</a>
			<a href="http://www.telesurtv.net/pages/rss.html">RSS</a> 
			<a href="http://www.telesurtv.net/pages/contratacionpublica.html">Contratación pública</a>
		</div>
		
		<div class="colFoot">
			<h4>Canales</h4>
			<a href="http://www.telesurtv.net/SubSecciones/news/latinaamerica/index.html">Latinoamérica</a> 
			<a href="http://www.telesurtv.net/SubSecciones/news/world/index.html">Vuelta al mundo</a> 
			<a href="http://www.telesurtv.net/SubSecciones/news/sport/index.html">Deportes</a> 
			<a href="http://www.telesurtv.net/SubSecciones/news/culture/index.html">Cultura</a> 
			<a href="http://www.telesurtv.net/seccion/opinion/index.html">Opinión</a>
			<a href="http://www.telesurtv.net/seccion/programas/index.html">Programación</a>
		</div>
		
		<div class="colFoot">
			<h4>Servicios</h4>
			<a href="http://www.telesurtv.net/pages/CatalogoServicios.html"> Catálogo de Servicios</a>
			<a href="http://www.telesurtv.net/seccion/multimedia/index.html">Multimedia</a>
			<a href="http://www.telesurtv.net/seccion/blog/index.html">Blog</a> 			
			<a href="http://multimedia.telesurtv.net/web/telesur/#!es">Videos</a> 
			<a href="http://www.telesurtv.net/seccion/programas/index.html">TV en vivo</a>
		</div>
		<div class="colFooti">
			
			<h4><a href="/english/index.html">Inglés</a></h4>
			
		</div>
		
		<div class="colFootRedes">
			<div class="wpRedesFoot">
				<a href="http://facebook.com/teleSUR" target="_blank"><cms:img src="/arte/foot-btn-facebook.jpg" scaleType="2" alt="facebook" /></a>
				<a href="http://twitter.com/teleSURtv" target="_blank"><cms:img src="/arte/foot-btn-twitter.jpg" scaleType="2" alt="twitter" /></a>
				<a href="https://plus.google.com/118206615613074383260/posts" target="_blank"><cms:img src="/arte/foot-btn-google.jpg" scaleType="2" alt="google plus" /></a>
				<a href="http://instagram.com/telesurtv" target="_blank"><cms:img src="/arte/foot-btn-instagram.jpg" scaleType="2" alt="instagram" /></a>
				<a href="http://www.pinterest.com/telesurtv/" target="_blank"><cms:img src="/arte/foot-btn-pinteres.jpg" scaleType="2" alt="pinteres" /></a>
				<a href="https://www.youtube.com/user/telesurtv" target="_blank"><cms:img src="/arte/foot-btn-youtube.jpg" scaleType="2" alt="youtube" /></a>
			</div>
			<div class="wpFootSuscrip">
				<cms:include page="TS_Common_Newsletter.jsp" >
					<cms:param name="name">footer</cms:param>  
				</cms:include> 
			</div>
		</div>  
	</div>
	
	<div class="legal">
		<small>La nueva Televisión del Sur C.A. (TVSUR) RIF: G-20004500-0</small>
		<span>© 2014 Telesur</span>
	</div>
</footer>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-736060-1', 'auto');
  ga('send', 'pageview');

</script>
<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery.flexslider.js</cms:link>"></script>
<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/function.js</cms:link>"></script>
<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/tabs.min.jquery.js</cms:link>"></script>
<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery.lazyload.min.js</cms:link>"></script>
<script>		
	$(function() {	
	    $("img.lazy").lazyload({    	
	    	effect : "fadeIn"
	    });
	});
</script>
