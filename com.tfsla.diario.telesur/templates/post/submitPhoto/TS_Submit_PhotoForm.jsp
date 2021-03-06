<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="org.opencms.relations.CmsCategoryService,org.opencms.relations.CmsCategory,java.util.List,org.opencms.jsp.CmsJspActionElement"%>
<%@ include file="../../../elements/TS_Common_Libraries.jsp" %>
<%@ include file="../../../elements/webusers/TS_RecoverySession.jsp" %>
<%@ page buffer="none" session="false" import="org.opencms.frontend.templateone.*" %>
<%@ page import="org.opencms.jsp.CmsJspActionElement"%>
<%@ page import="org.opencms.jsp.CmsJspLoginBean" %>
<%@ page import="org.opencms.file.CmsObject" %>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.opencms.webusers.openauthorization.*" %>
<%@ page import="com.tfsla.opencms.webusers.TfsUserHelper" %>
<%@ page import="org.opencms.file.CmsUser" %>

<%
//recupero variables del request
Boolean isPreview = ( request.getParameter("isPreview") != null ) ? Boolean.parseBoolean(request.getParameter("isPreview")) : false;
Boolean error = ( request.getParameter("error") != null ) ? Boolean.parseBoolean(request.getParameter("error")) : false;
String path = ( request.getParameter("path") != null ) ? request.getParameter("path") : null;

Boolean isEdit = (path != null) ? true : false;

String seccion = "";
String titulo = "";
String temas = "";
String autor = loginBean.getUserName();
List<String> fuentes = new ArrayList<String>();
List<String> images = new ArrayList<String>();
List<String> videos = new ArrayList<String>();
%>
	
	<form action="/system/modules/com.tfsla.diario.telesur/templates/post/TS_ProcessPreview.jsp" id="previewForm" name="previewForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="postId" name="postId" class="postId" value=""/>
	</form>
	<form action="/posts/process.html" id="posts" name="posts" method="post" enctype="multipart/form-data">
	
		<input type="hidden" name="isEdit" id="isEdit" value="<%=isEdit%>" />
		<input type="hidden" name="path" id="path" value="<%=path%>" />
		<input type="hidden" name="seccion" id="seccion" value="imreporter" />					
		<!--variables de estado-->
		<input type="hidden" name="isPreview" id="isPreview" value="<%=isPreview%>" />
		<input type="hidden" name="isPublishAfterPreview" id="isPublishAfterPreview" value="" />
		<input type="hidden" name="isDirectPublish" id="isDirectPublish" value="" />
		<input type="hidden" name="IsAjax" id="IsAjax" value="false" />
		<input type="hidden" name="postId" id="postId" class="postId" value="" />
		<!--variables necesarias para completar formulario-->
		<input type="hidden" name="volanta" id="volanta" value="" />
		<input type="hidden" name="copete" id="copete" value="" />
		<input type="hidden" name="categories[]" id="categorias" value="" />
		<input type="hidden" name="fb" id="fb" value="false" />
		<input type="hidden" name="tw" id="tw" value="false" />
		<input type="hidden" name="contenido" id="contenido" value="" />
		<%
		for ( String item:videos ) {
			String[] array = item.split("src=\"");
			String url = array[1].replace("\">","");
			       url = url.replace("</iframe>","");
		%>
			<input type="hidden" name="videos[]" id="videos[]" value="<%=url%>" />
		<%
		}
		%>
	

		<div class="row clear">
			<div class="col ">
				<div class="cont titreg desktop"> Subir tu foto </div>													
					
				<!--Seteo el mensaje de error generico al ingresar mal un campo-->
				<div class="cont clear">
					<div class="error" id="diverror" name="diverror" style="display:none">
						<div class="txtaviso">El formulario ha sido completado incorrectamente. Verifique los campos resaltados. </div>
					</div>						
				</div>	
				
				<!-- inicio col-mid -->
				<div class="col-mid">
					<div class="cont">	
										
						<input type="submitstory" placeholder="Título *" name="titulo" id="titulo" value='<%=titulo%>' autocomplete="off">				
						
						<div class="wpCheck">
							<div class="squaredThree">
								<input type="checkbox" id="checkFuente" onclick="javascript:fuentes.value=''"/>
								<label for="checkFuente"></label>
							</div>
							<label for="checkFuente">
								<div class="txtregister">El contenido de este reporte es de mi autoría *</div>
							</label>
						</div>	
						<input type="submitstory" placeholder="Fuentes *" id="fuentes" name="fuentes[]" value="" autocomplete="off">							
						
						<input type="submitstory" placeholder="Tags *" name="temas" value="<%=temas%>" id="temas" autocomplete="off">	
						<div class="reg-form" id="diverrortema" name="diverrortema" style="display:none;margin:0;float:right">					
							<div class="anote error" style="margin:0;">No puede seleccionar espacios como tema.</div>
						</div>
						
						<p style="font-size:1.2em;float:left;">* Campos Obligatorios</p>
					</div>
				</div>					
				<!-- fin col-midx --> 
	
				<!-- inicio col-mid -->
				<div class="col-mid">
					<div class="border_form" style="border-left:1px solid #CCC">
						<div class="cont">
							<div class="clear row">
								<div class="clear row">
									<p style="color:#666666;width:21%;margin-right:2%; float:left; font-size:1.4em;">Subir imagen principal *</p>
									
									<input type="file" name="images[]" id="images[]" onchange="handleFileSelect(this);" title="Selecciona una foto de tu computadora" multiple="">										
								</div>
								
								<div class="reg-form" id="diverrorimagen" name="diverrorimagen" style="display:none">
									<div class="anote error">La imagen seleccionada no tiene un formato válido.</div>
								</div>
								<div class="reg-form" id="diverrorimagencantidad" name="diverrorimagencantidad" style="display:none">
									<div class="anote error">Superó el límite de imágenes a subir. Puede subir hasta 20 imágenes.</div>
								</div>
								<div class="reg-form" id="diverrorimagenvacia" name="diverrorimagenvacia" style="display:none">
									<div class="anote error">Debe seleccionar una imagen para continuar.</div>
								</div>		
								<div class="reg-form" id="diverrorimagensize" name="diverrorimagensize" style="display:none">
									<div class="anote error">Superó el tamaño máximo permitido para una imagen. (2MB)</div>
								</div>																														
					                        
						              	<div class="contImg">
						              		<div class="imgMiniatura" style="margin-bottom:15px">
						              			<div id="ArchivoImg" style="display:none;clear:both;"> 
						              				<label>Imagen seleccionada</label> 
						              			</div>
				                       				<div id="ArchivosImg" style="display:none;clear:both;"> 
				                       					<label>Imagenes seleccionadas</label> 
				                       				</div>
				                       				
				                       				<!--En #listImg agrega el div con el nombre de la imagen mediante function handleFileSelect()-->
						              			<output id="listImg"></output>							
									</div>
						              	</div>
						              	
						              	<div class="separador clear" style="margin:15px 0"></div>

							</div>
																	 								

							<div class="checkline">
								<div class="squaredThree">
									<input type="checkbox" id="acceptTerms" />
									<label for="acceptTerms"></label>
								</div>
								<div class="txtregister">
									<label for="acceptTerms">
										<a id="terms" style="margin-left:0px;cursor:pointer;">Acepto las condiciones de uso *</a> 
									</label>										
								</div>
							</div>
							<div class="reg-form" id="diverrorterms" name="diverrorterms" style="display:none">
								<div class="anote error">Aceptá los terminos y condiciones.</div>
							</div>								
	
							<div class="clear"></div>								
							
							<a style="color:#C11717;font-size: 1.4em;display:block;margin:30px 0;text-align:center;cursor:pointer" onclick="ValidateForm('isPreview');" title="Previsualizar reporte" alt="Previsualizar reporte">Previsualizar reporte</a>

							<input type="submit" id="subscribe" value="Enviar" onclick="ValidateForm('isDirectPublish'); return false;" title="Enviar">
							<input id="cancelar" type="button" onclick="window.location.href='<cms:link>/seccion/imreporter/</cms:link>';" value="Cancelar" title="Cancelar publicación">
						</div>
					</div>
				</div>
				<!-- fin col-midx -->
			</div>
		</div>	
		
		<div class="separador"></div>
	</form>
	<form action="/posts/publishAfterPreview.html" id="PublishAfterPreview" name="PublishAfterPreview" method="post">
	        <input type="hidden" name="path" value="<%=path%>" />
	        <input type="hidden" name="isEdit" value="false" />
	        <input type="hidden" name="isPreview" value="false" />
	        <input type="hidden" name="isPublishAfterPreview" value="true" />
	        <input type="hidden" name="isDirectPublish" value="false" />
    	</form>  

<script type="text/javascript">
	var postId = "";
	function ValidateForm(mode){
		var isEdit = <%=isEdit %>;
		var e_titulo = false;		
		var e_temas = false;
		var e_temas_espacios = false;
		var e_imagen_count = false;
		var e_imagen_vacia = false;
		var e_imagen_size = false;
		var e_imagen_format = false;
		var e_fuente = false;
		var e_accept_terms = true;
		 $(".postId").val(postId);
		
		//validos campos obligatorios del form
		if ( document.getElementById('titulo').value.replace(/\s/g, '').length == 0 ) e_titulo = true;				
		if ( document.getElementById('temas').value.replace(/\s/g, '').length == 0 ) e_temas = true;
		var t = document.getElementById('temas').value;
		var arrayTemas = t.split(",");
		for (var k = 0; k < arrayTemas.length; k++){
			if (arrayTemas[k] == " ")
				e_temas_espacios = true;
		}	
		if ( document.getElementById('fuentes').value.replace(/\s/g, '').length == 0 ) e_fuente = true;
		if ($('#fuentes').length == 0) { e_fuente = true; }
		if ($('#checkFuente').is(':checked') && e_fuente){ e_fuente = false; }	
		if ($('#acceptTerms').is(':checked') ){ e_accept_terms = false; }
		
		//para previsualizar no es obligatorio que valide el campo
		if ( mode == 'isPreview' ) {
			e_accept_terms = false;
		}
		
		//seteo carteles de error								
		if ( e_titulo ) 
			document.getElementById('titulo').className = "mal";
		else	
			document.getElementById('titulo').className = "";
		
		if ( e_temas || e_temas_espacios ) 
			document.getElementById('temas').className = "mal";
		else	
			document.getElementById('temas').className = "";

		if ( e_fuente ) 
			document.getElementById('fuentes').className = "mal";
		else	
			document.getElementById('fuentes').className = "";					
		
		var files = $('input[name="images[]"]')[0].files;
		var filesCount = 0;
		
		if(files != null)
			filesCount = files.length;
		
		if(filesCount > 20){
			e_imagen_count = true;				
		}
		
		if(filesCount == 0){
			e_imagen_vacia = true;				
		}

		if(!e_imagen_count){
		
			for (var i = 0; i < filesCount; i++)
			{
				var oFile = files[i];
				var filename = oFile.fileName;
				
				if ('name' in oFile)
					filename = oFile.name;
				
				if(!oFile.name.toLowerCase().match("\\S+\\.(jpg|png|gif|jpeg)$")){						
					e_imagen_format = true;
					break;
				}
				
				//2MB = 2097152
				if(oFile.size > 2097152){
					e_imagen_size = true;
					break;					
				}
				
			}
		}			
		
		if( e_titulo || e_temas || e_temas_espacios || e_imagen_vacia || e_imagen_count || e_imagen_size || e_imagen_format || e_fuente || e_accept_terms ){
			if ( e_titulo || e_temas || e_temas_espacios || e_imagen_vacia || e_imagen_count || e_imagen_size || e_imagen_format || e_fuente || e_accept_terms ) {
				document.getElementById('diverror').style.display = "block";
			}else{
				document.getElementById('diverror').style.display = "none";
			}
			
			if (e_temas_espacios ) 
				document.getElementById('diverrortema').style.display = "block";
			else	
				document.getElementById('diverrortema').style.display = "none";
				
			if ( e_imagen_vacia ) {					
				document.getElementById('diverrorimagenvacia').style.display = "block";
			}else{
				document.getElementById('diverrorimagenvacia').style.display = "none";
			}
				
			if ( e_imagen_format ) {					
				document.getElementById('diverrorimagen').style.display = "block";
			}else{
				document.getElementById('diverrorimagen').style.display = "none";
			}
			
			if ( e_imagen_size ) {					
				document.getElementById('diverrorimagensize').style.display = "block";
			}else{
				document.getElementById('diverrorimagensize').style.display = "none";
			}
			
			if ( e_imagen_count ) {					
				document.getElementById('diverrorimagencantidad').style.display = "block";
			}else{
				document.getElementById('diverrorimagencantidad').style.display = "none";
			}
			
			if ( e_accept_terms ) {				
				document.getElementById('diverrorterms').style.display = "block";
			}else{
				document.getElementById('diverrorterms').style.display = "none";
			}
			
			$('body, html').animate({scrollTop: 0}, 300);				
		} else {
			document.getElementById('diverror').style.display = "none";
			document.getElementById('diverrortema').style.display = "none";
			document.getElementById('diverrorimagen').style.display = "none";
			document.getElementById('diverrorimagensize').style.display = "none";
			document.getElementById('diverrorimagencantidad').style.display = "none";
			document.getElementById('diverrorterms').style.display = "none";		
			document.getElementById('diverrorimagenvacia').style.display = "none";
			
			if ( mode == 'isPreview' ) {
				ShowPreview();
			}else if ( mode == 'isPublishAfterPreview' ) {
				document.getElementById('PublishAfterPreview').submit();
				$('#buttonPublicar').prop('disabled',true);
			}else if ( mode == 'isDirectPublish' ) {
				$('#buttonPublicar').prop('disabled',true);
				document.getElementById('isDirectPublish').value = "true";
				document.getElementById('posts').submit();
			}
		}
	}
	//check de fuente - bloqueo y desbloqueo
	$('#checkFuente').change(function(){
		if ($("#fuentes").is(":disabled")) {
				$('#fuentes').prop('disabled', false);
			}
			else {
				$('#fuentes').prop('disabled', 'disabled');
			}
		 $('#fuentes').attr('value',"");
	});
	
	function ShowPreview(){
		$('#iframeBox .wpIframe').css('display','none');
		$('#iframeBox').fadeIn(500);		
		$('#popupPreview').fadeIn(500);
		$('body').css('overflow','hidden');	
		var data = new FormData();
		
		data.append('titulo', document.getElementById('titulo').value);
		data.append('volanta', document.getElementById('volanta').value);
		data.append('copete', document.getElementById('copete').value);
		data.append('seccion', document.getElementById('seccion').value);
		data.append('contenido', document.getElementById('contenido').value);
		data.append('temas', document.getElementById('temas').value);
		data.append('fb', document.getElementById('fb').value);
		data.append('tw', document.getElementById('tw').value);
		
		data.append('categories[]', document.getElementById('categorias').value);
		data.append('path', document.getElementById('path').value);
		data.append('isEdit',document.getElementById('isEdit').value);
		data.append('isPreview', 'true');
		data.append('isPublishAfterPreview', 'false');
		data.append('isDirectPublish', 'false');		
		data.append('IsAjax', 'true');
		data.append('postId', postId);
		
		jQuery.each( $('[name="categoria[]"]'), function(j) {
			categoria = $(this).val();
			data.append('categoria['+j+']', categoria);
		});
		
		jQuery.each( $('input[name="fuentes[]"]'), function(j) {
			fuente = $(this).val();
			data.append('fuente['+j+']',fuente);
		});
		
		jQuery.each( $('input[name="videos[]"]'), function(k) {
			video = $(this).val();
			data.append('videos['+k+']',video);
		});
			
		jQuery.each( $('input[name="images[]"]')[0].files, function(i, file) {
			data.append('images['+i+']', file);
		});
		
		$.ajax({
			url: '/system/modules/com.tfsla.diario.telesur/templates/post/TS_Process.jsp',
			data: data,
			cache: false,
			contentType: false,  
			processData: false,
			type: 'POST',
			success: function(data){
			
			var result = $(data).find('result').text();
			var valueResult = $(data).find('message').text();
			        
			if( valueResult !=""){
				postId = valueResult;
				$(".postId").val(postId);
					$.post('/system/modules/com.tfsla.diario.telesur/templates/post/TS_Preview.jsp', { id: valueResult, preview: true } ,
					function(txt) {  
						var text = txt;	
						$('#iframeBox .wpIframe').css('display','block');						
						$("#iframeBox .wpIframe").html("<iframe srcdoc='"+text+"' src='/posts/preview.html' width='600px' height='600px'><iframe>");							
					});
					$('#popupPreview').fadeOut(1000);										
					$('#iframeBox .wpClose').click(function(){
						$('#iframeBox').fadeOut(500);		
						$('body').css('overflow','auto');
					});		
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
			  	alert(errorThrown);
			}
		});
		$('body, html').animate({scrollTop: 0}, 300);			
	}
	
	function handleFileSelect(evt) {
		var files = evt.files;
		
		document.getElementById('listImg').innerHTML = "";
		
		var output = [];
		for (var i = 0, f; f = files[i]; i++) {
			var reader = new FileReader();
			
			// Closure to capture the file information.
			reader.onload = (function(theFile) {
				return function(e) {
					// Render thumbnail.
					var span = document.createElement('span');
					span.innerHTML = [' <div class="imgsReporter">', escape(theFile.name) , '</div>'].join('');
					document.getElementById('listImg').insertBefore(span, null);
					if (i == 1 ){
						document.getElementById("ArchivosImg").style.display = "none"; 
						document.getElementById("ArchivoImg").style.display = "block"; 		
					}
					if (i > 1 ){ 
						document.getElementById("ArchivoImg").style.display = "none"; 
						document.getElementById("ArchivosImg").style.display = "block"; 			
					}
				};
			})(f);
			// Read in the image file as a data URL.
			reader.readAsDataURL(f);
		}
	}
</script>