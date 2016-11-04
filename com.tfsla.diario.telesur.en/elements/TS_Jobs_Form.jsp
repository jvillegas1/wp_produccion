<%@ include file="TS_Common_Libraries.jsp" %>
<%

	String nombre = "";
	String pais = "";
	String departamento = "";
	String mensaje = "";
	boolean error  = false;
	boolean validForm = false;
	String errorMessage = null;
	
	if(request.getParameter("nombre") != null &&
	   request.getParameter("departamento") != null &&
	   request.getParameter("pais") != null &&
	   request.getParameter("mensaje") != null){	   
	   
		nombre = (String)request.getParameter("nombre");
		departamento = (String)request.getParameter("departamento");
		pais = (String)request.getParameter("pais");		
		mensaje = (String)request.getParameter("mensaje");		
		
		if(nombre.equals("") || departamento.equals("") || pais.equals("") || mensaje.equals("")){
			error = true;
		}else{		
			com.tfsla.opencms.mail.SimpleMail mailConfirmation = new com.tfsla.opencms.mail.SimpleMail();
			mailConfirmation.setSubject("Contactenos desde el Sitio Web teleSUR");
			String html = "Nombre : "+nombre+" Departamento: "+departamento+" pais: "+pais+" Mensaje: "+mensaje;
			mailConfirmation.setHtmlContents(html);
			mailConfirmation.addTo("ebarroso@telesurtv.net");
			mailConfirmation.setFrom("jobs@telesurtv.net");   
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
			<h1>Jobs teleSUR</h1>
			
			<div style="text-align: center;">&nbsp;</div>
			
			<div style="text-align: center;"><img align="middle" alt="" src="/img/multimedia/2014/06/24/jobs.jpg?__scale=c:transparent,t:4,r=0,q=90,w:null,h:null" style="width:100%; height:auto;"></div>
			
			<div class="contacto">
			<div class="col-qua">
			<div class="cont">
			<h2>Trabaja con Nosotros</h2>			
			
			</div>
			</div>
			
			<div class="col-3qua">
			<div class="cont">
			
			<form method="post" action="../templates/TS_Contacto.jsp" enctype="multipart/form-data">
				<div class="col-mid">
					<div class="cont">
						<h5>Nombre</h5>
						<input class="mal" placeholder="Escriba su nombre..." name="nombre" type="text" maxlength="150"  required="true" />						
						<h5>País</h5>
						<cms:include page="webusers/TS_Common_Countries.jsp" />
						<h5>Departamento</h5>
						<cms:include page="webusers/TS_Common_Countries.jsp" />
					</div>
				</div>
				
				<div class="col-mid">
					<div class="cont">
						<h5>Mensaje</h5>
						<textarea name="mensaje" maxlength="250" required="true"></textarea>
						<input name="archivo" type="file" />
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
				<div class="row clear"> 
					<div class="error">
						<div class="txtaviso">
					                 El formulario ha sido completado incorrectamente. Verifique los campos resaltados.
					        </div>
					</div>
				</div>
			</c:if>
			<c:if test="${validFormMessage}">
				<div class="row clear"> 
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