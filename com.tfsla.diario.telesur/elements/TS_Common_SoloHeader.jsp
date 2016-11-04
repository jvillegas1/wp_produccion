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
        
        String pageTitle = (request.getParameter("pageTitle") == null ) ? "" : request.getParameter("pageTitle") ;
        String pageSeccion = (request.getParameter("pageSeccion") == null ) ? "" : request.getParameter("pageSeccion") ;
	String agenda = (request.getParameter("agenda") == null ) ? "" : request.getParameter("agenda") ;
	String latest = (request.getParameter("latest") == null ) ? "" : request.getParameter("latest") ;
	
	try{
%>	
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
$(document).ready(function() {
    $('.btnLangs').click(function() {
      var clas = $('.btnLangs').attr('class');
	  if(clas=="btnLangs actv"){
	  	$('.btnLangs').removeClass('actv');
	  }else{
	  	$('.btnLangs').addClass('actv');
	  }
  });  
});

  
var showSignal = false;
  function mostrar_ocultar() {
	  // cambia de true a false o de false a true
	  showSignal = !showSignal; 
	
	  if (showSignal){
	    document.getElementById("cajaPlayerUltra").style.display="block";
	    document.getElementById("cajaPlayerUltra").innerHTML='<cms:include page="Live_Streaming.Code.jsp" />';
	  }
	  else {
	    document.getElementById("cajaPlayerUltra").style.display="none";
	    document.getElementById("cajaPlayerUltra").innerHTML=" ";
	  }
  }
</script>

<cms:include page="webusers/TS_Logout.jsp" />
<cms:include page="webusers/TS_RecoverySession.jsp" />

<header id="header">
	<div class="wrap">
		<!-- En home no se ve esto: -->
		<% if(pageTitle != ""){ %>
			<div class="sectionName"><%=pageTitle%></div>
		<% } %>
		
		<div class="barTop">
			<div class="btnLang">
				
					<a href="/english/index.html">English</a>
			</div>		
		
		<div class="barTopRSS">
				<div class="btnLogoRSSs">
				<a href="/pages/rss.html">
				<img style="float:left;" src="/arte/RSS-icon.png" width="20px" heigth="20px" /></a>				
				</div>	
				<div class="btnLangRSSs">
				<a href="/pages/rss.html">RSS</a>
				</div>		
		</div>
		
		<div class="barTopAPP">
				<div class="btnLogoAPP">
				<a href="/pages/aplicaciones.html" >
				<img style="float:left;" src="/arte/mobile-icon.png" width="20px" heigth="20px" /></a>
				</div>
				<div class="btnLangAPP">
				<a href="/pages/aplicaciones.html">APPS</a>
				</div>		
		</div>	
			
			<!-- language -->
			<div class="dateHead">
				<span><%=format_daynumber.format(now)%> <%=format_month.format(now)%></span>
				<%--<span>&middot;<cms:img src="/arte/ico-clima.png" scaleType="2" alt="Telesur" /> <strong>23</strong>° Caracas</span>--%>
			</div>
			
			<!-- date time -->
			<div class="sesionHead">
				<cms:include page="webusers/TS_Login_Header.jsp" />
				
				<div class="searchHead">
					<form action="/buscar.html" method="post">
						<input type="text" name="search_form" value="" placeholder="Buscar">
						<input type="submit" name="enviar" value="">
					</form>
				</div>
			</div>
			<!-- Iniciar sesión -->
		</div>
		
		<!-- BAR TOP -->
		<div class="barMid">        
			<!--<a href="/index.html" class="logo">
				<div class="isoLogo"><cms:img src="/arte/log-iso-telesur.png" scaleType="2" alt="Telesur" /></div>
				<div class="tipoLogo"><cms:img src="/arte/logo-tipo-telesur.png" scaleType="2" alt="Telesur" /></div>
			</a>-->
			<a href="/index.html" class="logo">
				<div class="isoLogo"><cms:img src="/arte/log-iso-telesur.png" scaleType="2" alt="Telesur" /></div>
				<div class="tipoLogo"><cms:img src="/arte/logo-tipo-telesur_brand.png" scaleType="2" alt="Telesur" /></div>
				
				
			</a>
	
			<div class="vivo">
				<span>
					<c:import var="data" url="http://www.telesurtv.net/_static_rankings/static_liveHeaderN.html"/>
					<c:out value="${data}" escapeXml="false" />
				</span>
				<a href="#">en vivo</a>
			</div>
		</div>
		
		<!-- BAR MIDDLE -->
		<nav>
			<i><span></span><span></span><span></span></i>
			
		 	<cms:include page="TS_Common_Menu-SoloHeader.jsp" >
				<cms:param name="pageSeccion"><%=pageSeccion%></cms:param>
		        </cms:include>          
		 	
			<a href="#" class="btnBoletin">Suscríbete al Boletín</a>
			
			<cms:include page="TS_Common_Newsletter.jsp" >
				<cms:param name="name">header</cms:param>  
			</cms:include>
		</nav>
	</div>
	
	<cms:include page="TS_Common_Menu_submenu.jsp" >
		<cms:param name="pageSeccion"><%=pageSeccion%></cms:param>
        </cms:include>
	
	<% if ( agenda.equals("si") ) { %>
		<cms:include page="TS_Home_AgendaHeader.jsp" />
	<% } %>
	
	<% if ( latest.equals("si") )  { %>   
		<cms:include page="TS_Home_Lasted.jsp" />
	<% } %>
</header>

<%
	}catch(Exception e){
	
	}
%>