<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Locale"%>
<%
	
        SimpleDateFormat format_dayname = new SimpleDateFormat("EEEE", new Locale("EN"));
        SimpleDateFormat format_daynumber = new SimpleDateFormat("dd", new Locale("EN"));
        SimpleDateFormat format_month = new SimpleDateFormat("MMMMM", new Locale("EN"));
        SimpleDateFormat format_year = new SimpleDateFormat("yyyy", new Locale("EN"));
        Date now = new Date();
        
        String pageTitle = (request.getParameter("pageTitle") == null ) ? "" : request.getParameter("pageTitle") ;
        String pageSeccion = (request.getParameter("pageSeccion") == null ) ? "" : request.getParameter("pageSeccion") ;
        String subMenu = (request.getParameter("subMenu") == null ) ? "" : request.getParameter("subMenu") ;
	String agenda = (request.getParameter("agenda") == null ) ? "" : request.getParameter("agenda") ;
	String latest = (request.getParameter("latest") == null ) ? "" : request.getParameter("latest") ;
	
	try{
%>	
<script>
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
				
					<a href="/index.html">Español</a>
			</div>
		
		<div class="barTopRSS">
				<div class="btnLogoRSS">
				<a href="/english/pages/rss.html">
				<img style="float:left;" src="/arte/RSS-icon.png" width="20px" heigth="20px" /></a>				
				</div>	
				<div class="btnLangRSS">
				<a href="/english/pages/rss.html">RSS</a>
				</div>		
		</div>
		
		<div class="barTopAPP">
				<div class="btnLogoAPP">
				<a href="/english/pages/applications.html" >
				<img style="float:left;" src="/arte/mobile-icon.png" width="20px" heigth="20px" /></a>
				</div>
				<div class="btnLangAPP">
				<a href="/english/pages/applications.html">APPS</a>
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
					<form action="/english/search.html" method="post">
						<input type="text" name="search_form" value="" placeholder="Search">
						<input type="submit" name="enviar" value="">
					</form>
				</div>
			</div>
			<!-- Iniciar sesión -->
		</div>
		
		<!-- BAR TOP -->
		<div class="barMid">        
			<!--<a href="/english/index.html" class="logo">
				<div class="isoLogo"><cms:img src="/arte/log-iso-telesur.png" scaleType="2" alt="Telesur" /></div>
				<div class="tipoLogo"><cms:img src="/arte/logo-tipo-telesur.png" scaleType="2" alt="Telesur" /></div>
			</a>-->
			<a href="/english/index.html" class="logo">
				<div class="isoLogo"><cms:img src="/arte/log-iso-telesur.png" scaleType="2" alt="Telesur" /></div>
				<div class="tipoLogo"><cms:img src="/arte/logo-tipo-telesur_brand.png" scaleType="2" alt="Telesur" /></div>
			</a>
			
			
	
			
		</div>
		
		<!-- BAR MIDDLE -->
		<nav>
			<i><span></span><span></span><span></span></i>
			
		 	<cms:include page="TS_Common_Menu_OnlyHeader.jsp" >
				<cms:param name="pageSeccion" ><%=pageSeccion%></cms:param>
		        </cms:include>          
		 	
			<a href="#" class="btnBoletin" style="-moz-right:-30px;">Suscribe to the Bulletin</a>
			
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