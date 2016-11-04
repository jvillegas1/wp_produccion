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
<!-- Header -->
<header id="header">
	<div class="wrap">
		<!-- En home no se ve esto: -->
		
		<div class="barTop">
			<%--<div class="btnLang"><i></i>
				<span>Language</span>
				<ul>
					<li><a href="/index.html">Español</a></li>
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
					<form action="/english/search.html" method="post">
						<input type="text" name="buscar" value="" placeholder="Search">
						<input type="submit" name="enviar" value="">
					</form>
				</div>
			</div>
			<!-- Iniciar sesión -->
		</div>
		
		<!-- BAR TOP -->
		<div class="barMid">        
			<a href="/english/index.html" class="logo">
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
						<a class="" href="/english/section/news/index.html" target="_self" title="News">News</a>
				</li>
				<li class="">
						<a class="" href="http://multimedia.telesurtv.net/webstg/telesur-video/#!en" title="Videos">Videos</a>
				</li>
				<li class="">
						<a class="" href="/english/section/multimedia/index.html" target="_self" title="Multimedia">Multimedia</a>
				</li>
				<li class="">
						<a class="" href="/english/section/opinion/index.html" target="_self" title="Opinion">Opinion</a>
				</li>
				<li class="">
						<a class="" href="/english/section/analysis/index.html" target="_self" title="Analysis">Analysis</a>
				</li>
				<li class="">
						<a class="" href="/english/section/imreporter/index.html" target="_self" title="You're the Reporter">You're the Reporter</a>
				</li>
				
			</ul>
		 	
			<a href="#" class="btnBoletin">Suscribe to the Bulletin</a>
			
			<%--<cms:include page="TS_Common_Newsletter.jsp" >
				<cms:param name="name">header</cms:param>  
			</cms:include>--%>
		</nav>
	</div>
	
</header>