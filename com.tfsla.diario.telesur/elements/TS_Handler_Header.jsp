<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Locale"%>
<%	
SimpleDateFormat format_dayname = new SimpleDateFormat("EEEE", new Locale("ES"));
SimpleDateFormat format_daynumber = new SimpleDateFormat("dd", new Locale("ES"));
SimpleDateFormat format_month = new SimpleDateFormat("MMMMM", new Locale("ES"));
SimpleDateFormat format_year = new SimpleDateFormat("yyyy", new Locale("ES"));
Date now = new Date();
        
String error = (request.getParameter("error") == null ) ? "" : request.getParameter("error") ;	 
%>
<header id="header">
	<div class="wrap">
		<!-- En home no se ve esto: -->
		
		<div class="barTop">
			<%--<div class="btnLang"><i></i>
				<span>Idioma</span>
				<ul>
					<li></li>
					<li><a href="/english/index.html">Inglés</a></li>
				</ul>
			</div>--%>
			
			<!-- language -->
			<div class="dateHead">
				<span><%=format_daynumber.format(now)%> <%=format_month.format(now)%></span>
				<%--<span>&middot;<cms:img src="/arte/ico-clima.png" scaleType="2" alt="Telesur" /> <strong>23</strong>° Caracas</span>--%>
			</div>
			
			<!-- date time -->
			<div class="sesionHead">
				<%--<cms:include page="webusers/TS_Login_Header.jsp" />--%>
				
				<div class="searchHead">
					<form action="/buscar.html" method="post">
						<input type="text" name="buscar" value="" placeholder="Buscar">
						<input type="submit" name="enviar" value="">
					</form>
				</div>
			</div>
			<!-- Iniciar sesión -->
		</div>
		
		<!-- BAR TOP -->
		<div class="barMid">        
			<a href="/index.html" class="logo">
				<div class="isoLogo"><cms:img src="/arte/log-iso-telesur.png" scaleType="2" alt="Telesur" /></div>
				<div class="tipoLogo"><cms:img src="/arte/logo-tipo-telesur.png" scaleType="2" alt="Telesur" /></div>
			</a>
	
			<div class="vivo">
				
			</div>
		</div>
		
		<!-- BAR MIDDLE -->
		<nav>
			<i><span></span><span></span><span></span></i>
			
		 	<ul>
				<li><a href="#" class="active">inicio</a></li>
				<li class="">
						<a class="" href="/seccion/news/index.html" target="_self" title="Noticias">Noticias</a>
				</li>
				<li class="">
						<a class="" href="http://multimedia.telesurtv.net/webstg/telesur-video/#!es" title="Videos">Videos</a>
				</li>
				<li class="">
						<a class="" href="/seccion/multimedia/index.html" target="_self" title="Multimedia">Multimedia</a>
				</li>
				<li class="">
						<a class="" href="/seccion/opinion/index.html" target="_self" title="Opinión">Opinión</a>
				</li>
				<li class="">
						<a class="" href="/seccion/blog/index.html" target="_self" title="Blogs">Blogs</a>
				</li>
				<li class="">
						<a class="" href="/seccion/analisis/index.html" target="_self" title="Análisis">Análisis</a>
				</li>
				<li class="">
						<a class="" href="/seccion/imreporter/index.html" target="_self" title="Soy Reportero">Soy Reportero</a>
				</li>
				<li class="">
						<a class="" href="/seccion/programas/index.html" target="_self" title="Programas">Programas</a>
				</li>
			</ul>        
		 	
			<a href="#" class="btnBoletin">Suscríbete al Boletín</a>
			
			<%--<cms:include page="TS_Common_Newsletter.jsp" >
				<cms:param name="name">header</cms:param>  
			</cms:include>--%>
		</nav>
	</div>
	
</header>