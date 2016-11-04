<%@ include file="TS_Common_Libraries.jsp" %>

<footer id="footer">
	<div class="wrap">
		<div class="colFoot logoFoot">
			<cms:img src="/arte/logo-footer.jpg" scaleType="2" alt="Telesur" />
			<a href="#" class="subirBtn" alt="Back to Top" title="Back to Top">
		    			<cms:img src="/arte/btn-top.jpg" scaleType="2" width="50" height="65" alt="Subir" />
		    		</a>
			<ul class="footMobile">
				<li><a href="/english/pages/termsofuse.html">Terms of Use</a></li>				
			</ul>
		</div>
		
		<div class="colFoot">
			<h4>About teleSUR</h4>
			<a href="/english/pages/about.html">About Us</a>
			<!--<a href="/english/pages/contact.html">Contacts</a> -->
			<a href="/english/pages/team.html">Team</a>
			<!--<a href="/english/pages/jobs.html">Jobs teleSUR</a>-->
			<a href="/english/pages/termsofuse.html">Terms of Use</a>
			<a href="/english/pages/applications.html">teleSUR Apps</a>
			<a href="/english/pages/satellitecoverage.html">Satellite Coverage</a>
			<a href="/english/pages/rss.html">RSS</a> 
			<a href="/english/pages/publicprocurement.html">Public Procurement</a>
		</div>
		
		<div class="colFoot">
			<h4>Channels</h4>
			<a href="/SubSecciones/en/news/latinaamerica/index.html">Latin America</a> 
			<a href="/SubSecciones/en/news/world/index.html">World</a> 
			<a href="/SubSecciones/en/news/sport/index.html">Sports</a> 
			<a href="/SubSecciones/en/news/culture/index.html">Culture</a> 
			<a href="/english/section/opinion/index.html">Opinion</a>
			<a href="/english/section/programs/index.html">Programs</a>
		</div>
		
		<div class="colFoot">
			<h4>Services</h4>
			<a href="/english/section/multimedia/index.html">Multimedia</a>
			<a href="/english/section/blog/index.html">Blog</a> 			
			<a href="http://multimedia.telesurtv.net/web/telesur/#!en">Videos</a> 
			<%-- <a href="/english/section/programs/index.html">Live Tv</a> --%>
		</div>
		<div class="colFooti">
			<h4>	
			<a href="/index.html">Spanish</a>
			</h4>
		</div>
		
		<div class="colFootRedes">
			<div class="wpRedesFoot">
				<a href="https://www.facebook.com/telesurenglish" target="_blank"><cms:img src="/arte/foot-btn-facebook.jpg" scaleType="2" alt="facebook" /></a>
				<a href="https://twitter.com/telesurenglish" target="_blank"><cms:img src="/arte/foot-btn-twitter.jpg" scaleType="2" alt="twitter" /></a>
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
<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/function1.js</cms:link>"></script>
<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/tabs.min.jquery.js</cms:link>"></script>
<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery.lazyload.min.js</cms:link>"></script>

<script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.newsTags/resources/js/DirectEditButtons.js</cms:link>"></script>
<script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.newsTags/resources/js/pollsFunctions.js</cms:link>"></script>
<script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.newsTags/resources/js/commentsFunctions.js</cms:link>"></script>
<script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.newsTags/resources/js/rankTagsFiller.js</cms:link>"></script>		
<script>		
	$(function() {	
	    $("img").lazyload({    
	        placeholder : "../arte/grey.gif",	
	    	effect : "fadeIn"
	    });
	});
</script>