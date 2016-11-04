<%@ include file="TS_Common_Libraries.jsp" %>
<%

	String nombre = "";
	String correo = "";
	String pais = "";
	String mensaje = "";
	boolean error  = false;
	boolean validForm = false;
	String errorMessage = null;
	
	if(request.getParameter("nombre") != null &&
	   request.getParameter("correo") != null &&
	   request.getParameter("pais") != null &&
	   request.getParameter("mensaje") != null){	   
	   
		nombre = (String)request.getParameter("nombre");
		correo = (String)request.getParameter("correo");
		pais = (String)request.getParameter("pais");		
		mensaje = (String)request.getParameter("mensaje");		
		
		if(nombre.equals("") || correo.equals("") || pais.equals("") || mensaje.equals("")){
			error = true;
		}else{		
			com.tfsla.opencms.mail.SimpleMail mailConfirmation = new com.tfsla.opencms.mail.SimpleMail();
			mailConfirmation.setSubject("Contactenos desde el Sitio Web teleSUR");
			String html = "<html><head></head><mailbody>Mensaje de contacto desde TeleSUR <br/> Nombre : "+nombre+"<br/> Correo: "+correo+"<br/> pais: "+pais+"<br/> Mensaje: "+mensaje+"</mailbody></html>";
			mailConfirmation.setHtmlContents(html);
			mailConfirmation.addTo("contactenos@telesurtv.net");
			mailConfirmation.setFrom(correo);   
			mailConfirmation.send();
			validForm = true;
		}
	}else{
		if(request.getParameter("send") != null){
			error = true;
		}
	}

%>
   <c:set var="validFormMessage" scope="page" value="<%= validForm %>" />
   <c:set var="errorMessage" scope="page" value="<%= error %>" />
	<div class="wrapper">
		<div class="row clear">
			<div class="col">
			<div class="cont">
			<h1>Contacto</h1>
			
			<div style="text-align: center;">&nbsp;</div>
			
			<div style="text-align: center;"><img align="middle" alt="" src="/arte/about/imgcontacto.jpg" style="width:100%; height:auto;"></div>
			
			<div class="contacto">
			<div class="col-qua">
			<div class="cont">
			<h4>Dirección</h4>
			
			<p>Calle Vargas con Calle Santa Clara, Edificio TeleSUR.<br>
			Urbanización Boleíta Norte.<br>
			Caracas - Venezuela</p>
			
			<h4>Teléfono</h4>
			
			<p>(58) (212) 600.02.02</p>
			</div>
			</div>
			
			<div class="col-3qua">
			<div class="cont">
			<h2 style="margin-left:10px">Contáctanos por internet</h2>
			
			<form method="post" action="/pages/contacto.html">
				<div class="col-mid">
					<div class="cont">
						<h5>Nombre</h5>
						<input placeholder="Escriba su nombre..." name="nombre" type="text" maxlength="150"  required="true" />
						<h5>Correo</h5>
						<input type="email" placeholder="Escriba su correo..." name="correo" maxlength="150" required="true" />
						<h5>País</h5>
						<cms:include page="webusers/TS_Common_Countries.jsp" />
					</div>
				</div>
				
				<div class="col-mid">
					<div class="cont">
						<h5>Mensaje</h5>
						<textarea name="mensaje" maxlength="250" required="true"></textarea>
					</div>
				</div>
				<input type="hidden" name="send" value="0" />
				<div class="btnForm clear">
					<input class="enviar" type="submit" value="Enviar"> <a class="cancelar" href="#">Cancelar</a>
				</div>
			</form>
			</div>
			</div>
			
			<c:if test="${errorMessage}">
				<div class="cont"> 
					<div class="error">
						<div class="txtaviso">
					                 El formulario ha sido completado incorrectamente. Verifique los campos resaltados.
					        </div>
					</div>
				</div>
			</c:if>
			<c:if test="${validFormMessage}">
				<div class="cont"> 
					<div class="aprobado">
						<div class="txtaviso">
					                 Pronto nuestro equipo establecerá contacto con usted. Gracias por escribirnos.
					        </div>
					</div>
				</div>
			</c:if>			
			</div>
			</div>
			</div>
		</div>
	</div>	