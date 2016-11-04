<%@ include file="../../TS_Common_Libraries.jsp" %>

<%
String email = (String)request.getParameter("email");
%>
	<!-- inicio col-mid -->
	<div class="col">
		<div class="accesoTw">
			<strong>Your access is correct but from Twitter 
			need to check if everything is OK before 
			you can participate in the site.</strong>
		</div>
		<div class="error conf">
			<div class="txtavisofondo">
				We've sent an email to <%= (String)request.getParameter("email")%> 
				you to confirm your information. 
				Please cerrá your email to complete the registration.
			</div>
		</div>
		<div class="accesoTw">
			<h4>Thanks for participating teleSUR.</h4>
			If you have webmail (yahoo, hotmail, gmail) checks the spam, 
			it may be that our email has been marked as SPAM by mistake.
		</div>
		<div class="btnConf">
			<a href="/english/index.html">Continue navigation to site</a>
		</div>
	</div>