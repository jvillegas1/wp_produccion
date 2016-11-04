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
        String subMenu = (request.getParameter("subMenu") == null ) ? "" : request.getParameter("subMenu") ;
	String agenda = (request.getParameter("agenda") == null ) ? "" : request.getParameter("agenda") ;
	String latest = (request.getParameter("latest") == null ) ? "" : request.getParameter("latest") ;
%>	

<cms:include page="webusers/TS_Logout.jsp" />
<cms:include page="webusers/TS_RecoverySession.jsp" /> 

<!-- Header -->
<div id="header">

	<div class="wrapper">
		<div class="row clear">
			<div class="col">
			 	<div class="cont">
			    	<div class="logo"><a href="/index.html" title="Ir al Home"><cms:img src="/arte/logo-telesur.png" scaleColor="transparent" width="201" alt="Telesur"/></a> <a href="#" class="btnLive">VIVO</a></div>
			        <div class="dateHead"><%=format_dayname.format(now)%><span><%=format_daynumber.format(now)%></span><%=format_month.format(now)%><h2><%=pageTitle%></h2></div>
			       
			         <cms:include page="../elements/webusers/TS_Login_Header_Show.jsp" />
			    	
			    	<cms:include page="../elements/TS_Common_Header_Clima.jsp" />
			    	
			        <div class="search">
			            <form action="/buscar.html" method="post">
			            	<input type="text" name="search_form" value="">
			                <input type="submit" value="">
			            </form>
			        </div>
			    </div>
			</div>  
		</div>    
	</div><!--wrapper-->

	<div class="nav">
		<div class="wrapper">
			<div class="row clear">
			    <div class="col">
			        <div class="cont">
			        	<a class="btnMobile"><cms:img src="/arte/btn-menu-mobile.png" scaleColor="transparent" width="35" alt="Menu"/></a>
			            <ul id="nav"> 
			            	<span>                   	
						<li><a href="#">Inglés</a></li>
			                        <li><a href="#">Español</a></li>
			            	</span>
			                <li class="home"><a href="#">Home</a></li>
				        <cms:include page="TS_Common_Menu.jsp" >
						<cms:param name="pageSeccion"><%=pageSeccion%></cms:param>
				        </cms:include>                 
			            </ul>
			            <div class="dateMobile"><%=format_daynumber.format(now)%> <%=format_month.format(now)%> <%=format_year.format(now)%></div>
			        </div>
			    </div>
			</div>
		</div>
	</div>

	
	<% if ( subMenu.equals("si") ) { %>
		<!-- redbar -->
		<div class="barra">
			<div class="wrapper">
				<div class="row clear">
				    <div class="col">
				        <div class="cont">
				          <div class="redbar">
				                <div class="sharingup clear">
				                    <ul>
				                        <li>Compartir</li>
				                        <li><a href="#"><cms:img src="/arte/ico-share.png" scaleColor="transparent" alt=""/></a></li> 
				                        <li><a rel="nofollow" href="https://www.youtube.com/user/telesurtv" title="Ir a nuestro perfil de YouTube" target="_blank"><cms:img src="/arte/ico-youtube.png" scaleColor="transparent" alt="YouTube"/></a></li> 
				                        <li><a rel="nofollow" href="https://twitter.com/teleSURtv" title="Ir a nuestro perfil de Twitter" target="_blank"><cms:img src="/arte/ico-twitter.png" scaleColor="transparent" alt="Twitter"/></a></li> 
				                        <li><a rel="nofollow" href="https://www.facebook.com/teleSUR" title="Ir a nuestro perfil de Facebook" target="_blank"><cms:img src="/arte/ico-face.png" scaleColor="transparent" alt="Facebook"/></a></li>    
				                    </ul>
				       		</div>
				          </div> 
				         </div>                    
				    </div>          
				</div>                 
			</div>
		</div>   
	<!-- fin redbar -->
	<% } %>
	
	<% if ( agenda.equals("si") ) { %>
		<div class="tagsBar">
			<div class="wrapper">
				<div class="row clear">
				    <div class="col">
				        <div class="cont">				        
				        	<cms:include page="TS_Home_AgendaHeader.jsp" />
				        	
				           	<a href="#" class="subscrip">Suscríbete al boletín</a>
				           	<cms:include page="TS_Common_Newsletter.jsp" >
							<cms:param name="name">header</cms:param>  
						</cms:include> 				           					           
				        </div>
				    </div>
				</div>
			</div>
		</div>
	<% } %>  
	
	<% if ( latest.equals("si") )  { %>    
		
		<cms:include page="TS_Home_Lasted.jsp" />
	
	<% } %> 

</div><!--header-->