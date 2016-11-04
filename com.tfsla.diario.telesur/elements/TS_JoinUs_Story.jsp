<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="org.opencms.mail.CmsSimpleMail,
			org.opencms.jsp.CmsJspLoginBean" %>

<% 
/**
* Titulo del Story
* Para que el titulo del bloque "Your Story" sea ma dinamico y facil de modificar,
* se debera cambiar la variable string "tituloStory"
* La pregunta debera estar entre "" 
*/
	String tituloStory = "¿Qué conoces sobre El Asalto al Cuartel Moncada?";
/**
* FIN Titulo del Story
*/

String name = request.getParameter("storyName");

if (request.getParameter("storyName") != null && !request.getParameter("storyName").equals("")) { %>

	<cms:include page="TS_JoinUs_StoryMailRedaccion.jsp"/>
	
	<cms:include page="TS_JoinUs_StoryMailUsuario.jsp"/>		
	
	<div class="cont">
		<div class="titleredju headers men" id="success">Tu historia</div>
		<div class="graybxju">	
			<div class="cont">
				<div class="titboxju rojo"><%=tituloStory%></div>
				<div class="txtstoryju">Cuéntanos lo que sepas de esta historia y forma parte de nuestros especiales.</div>
			</div>					
			<div class="cont">
				<div class="aprobado" style="float:left;font-size: 1.2em;">
					<div class="txtaviso">Estimado <%=name%>, hemos recibido su reporte, le estaremos informando cuando el mismo sea publicado en nuetra sección Soy Reportero. Agradecemos su aporte a nuestra comunidad teleSUR</div>
				</div>
			</div>
		</div>
	</div>		
		
<% } else { %>		

	<div class="cont">
		<div class="titleredju headers men">Tu historia</div>
		<div class="graybxju">
			<div class="cont">
				<div class="titboxju rojo"><%=tituloStory%></div>
				<div class="txtstoryju">Cuéntanos lo que sepas de esta historia y forma parte de nuestros especiales.</div>
				<div class="regju">
					<form name="ContactoForm" class="reg-form" method="post" action="#success" onsubmit="return EnviarForm_ok()">
						<%-- AGREGAR EL TITULO DEL FORMULARIO EN EL VALUE DEL INPUT HIDDEN, PARA SER ENVIADO AL MAIL --%>
						<input type="hidden" name="storyTitle" value="<%=tituloStory%>">
						<input type="textregju" placeholder="Nombre *" name="storyName" id="storyName" onclick="removeClass(this.id);">
						<input type="textregju" placeholder="Email *" name="storyEmail" id="storyEmail" onclick="removeClass(this.id);">
						<input type="textregju" placeholder="Número telefónico *" name="storyNumber" id="storyNumber" onclick="removeClass(this.id);">
						<textarea id="storyComment" class="textareaju" tabindex="4" name="storyComment" rows="4" cols="20" placeholder="Comentarios *" onclick="removeClass(this.id);"></textarea>
						<label class="txtstoryju" style="margin-left:10px;">(*) Campos Obligatorios</label>
						<input id="subscribe" type="submit" value="Enviar">
					</form>
				</div>
			</div> 
			<div class="cont">
				<div class="error" id="mensaje-error" style="float:left;font-size: 1.2em;display:none">
					<div class="txtaviso">El formulario ha sido completado incorrectamente. Verifique los campos resaltados.</div>
				</div>
			</div>
			<div class="cont">
				<div class="aprobado" style="float:left;font-size: 1.2em;display:none">
					<div class="txtaviso">Hemos recibido su reporte, le estaremos informando cuando el mismo sea publicado en nuetra sección Soy Reportero. Agradecemos su aporte a nuestra comunidad teleSUR</div>
				</div>
			</div>
		</div>
	</div>
	
<% } %>
<script type="text/javascript">       
	function EnviarForm_ok() {
	  	var frm = document.forms["ContactoForm"];
	  	var retorno = true;
	  	  	
	  	if (frm.storyName.value == ""){
	  		$("#storyName").addClass("mal");
	  		$("#mensaje-error").css("display","block");
	     		retorno = false;
	  	}
	  	
	  	var t = /[0-9\s\+\-]/;
	  	if ( !(frm.storyNumber.value).match(t) ){
	  		$("#storyNumber").addClass("mal");
	  		$("#mensaje-error").css("display","block");
	     		retorno = false;
	  	}
	  	
	  	if (frm.storyComment.value == ""){
	  		$("#storyComment").addClass("mal");
	  		$("#mensaje-error").css("display","block");
	     		retorno = false;
	  	}		
	  	
		var p = '^[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+@[-!#$%&\'*+\\/0-9=?A-Z^_`a-z{|}~]+\.[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+$';	
		if ( !(frm.storyEmail.value).match(p) ) {
			$("#storyEmail").addClass("mal");
			$("#mensaje-error").css("display","block");
		     	retorno = false;
		}	
		
	  	return retorno;	
	}     
	function removeClass(campo) {
		if(campo == 'storyName'){
			$("#storyName").removeClass("mal");
	  		//$("#mensaje-error").css("display","none");
		}
		if(campo == 'storyNumber'){
			$("#storyNumber").removeClass("mal");
	  		//$("#mensaje-error").css("display","none");
		}
		if(campo == 'storyComment'){
			$("#storyComment").removeClass("mal");
	  		//$("#mensaje-error").css("display","none");
		}
		if(campo == 'storyEmail'){
			$("#storyEmail").removeClass("mal");
			//$("#mensaje-error").css("display","none");
		}
	}  
</script>