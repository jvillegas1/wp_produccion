<%@ include file="../../TS_Common_Libraries.jsp" %>

<%
String email = (String)request.getParameter("email");
%>
	<!-- inicio col-mid -->
	<div class="col">
		<div class="accesoTw">
			<strong>Tu acceso desde Twitter es correcto pero
			necesitamos verificar si todo está bien antes
			de que puedas participar en el sitio.</strong>
		</div>
		<div class="error conf">
			<div class="txtavisofondo">Te hemos enviado un mail a <%=(String)request.getParameter("email") %>
			para que confirmes tu información.
			Por favor cerrá tu correo para finalizar la registración.
			</div>
		</div>
		<div class="accesoTw">
			<h4>Gracias por participar de teleSUR.</h4>
			En caso de tener webmail (yahoo, hotmail, gmail) verificá el correo no deseado,
			puede ser que nuestro e-mail haya sido marcado como SPAM por error.
		</div>
		<div class="btnConf">
			<a href="/index.html">Continuar navegando el sitio</a>
		</div>
	</div>