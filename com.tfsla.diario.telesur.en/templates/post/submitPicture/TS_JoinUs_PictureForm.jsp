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
String titulo = "";
String copete = "";
List<String> images = new ArrayList<String>();
List<String> videos = new ArrayList<String>();
%>

<div class="row clear">
	<div class="col ">
		<form action="/system/modules/com.tfsla.diario.telesur.en/templates/post/TS_ProcessPreview.jsp" id="previewForm" name="previewForm" method="post" enctype="multipart/form-data">
			<input type="hidden" id="postId" name="postId" class="postId" value=""/>
		</form>
		<form action="/english/posts/process.html" id="posts" name="posts" method="post" enctype="multipart/form-data">
			
			<!--variables de estado-->
			<input type="hidden" name="isEdit" id="isEdit" value="false" />
			<input type="hidden" name="path" id="path" value="" />
			<input type="hidden" name="seccion" id="seccion" value="joinus" />			
			<input type="hidden" name="isPreview" id="isPreview" value="false" />
			<input type="hidden" name="isPublishAfterPreview" id="isPublishAfterPreview" value="false" />
			<input type="hidden" name="isDirectPublish" id="isDirectPublish" value="" />
			<input type="hidden" name="IsAjax" id="IsAjax" value="false" />
			<input type="hidden" name="postId" id="postId" class="postId" value="" />
			<!--variables que se incluyen para que no pinche el PROCESS-->
			<input type="hidden" name="volanta" id="volanta" value="" />
			<input type="hidden" name="contenido" id="contenido" value="" />
			<input type="hidden" name="temas" id="temas" value="" />
			<input type="hidden" name="fuentes[]" id="fuentes" value="" />
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
			<input type="hidden" name="categories[]" id="categoria" value="" />
			<input type="hidden" name="fb" id="fb" value="false" />
			<input type="hidden" name="tw" id="tw" value="false" />
		
			<div class="cont titreg desktop">Have a photo to share</div>
			<!-- inicio col-mid -->
			<div class="col-mid">
				<div class="cont" style="height:90px">
					
					<input type="submitstory" placeholder="Title *" name="titulo" id="titulo" value='<%=titulo%>' onclick="removeClass(this.id);" autocomplete="off">
					
					<input type="submitstory" placeholder="Description *" name="copete" id="copete" value='<%=copete%>' onclick="removeClass(this.id);" autocomplete="off">
					
				</div>
			</div>
			<!-- fin col-midx --> 
			
			<!-- inicio col-mid -->
			<div class="col-mid">
				<div class="border_form" style="border-left:1px solid #CCC">
					<div class="cont" style="height:90px">
						<div class="clear row">
							<p style="color:#666666;width:21%;margin-right:2%; float:left; font-size:1.4em;">Upload image *</p>
							<input type="file" name="images[]" id="images[]" title="Selecciona una foto de tu computadora" >
						</div>
						<div class="reg-form" id="diverrorimagen" name="diverrorimagen" style="display:none">
							<div class="anote error">The image selected is in an invalid format.</div>
						</div>
						<div class="reg-form" id="diverrorimagenvacio" name="diverrorimagenvacio" style="display:none">
							<div class="anote error">Select an image to continue. </div>
						</div>		
						<div class="reg-form" id="diverrorimagensize" name="diverrorimagensize" style="display:none">
							<div class="anote error">Images can't be heavier than 2MB.</div>
						</div>
						<p style="float:left; font-size:1.2em; ">* Required Fields</p>
						<input type="button" id="cancelar" onclick="window.location.href='<cms:link>/seccion/joinus</cms:link>';" value="Cancel" title="Cancel" style="float:right">
						<input type="submit" id="subscribe" value="Publish" onclick="ValidateForm('isDirectPublish'); return false;" title="Publish" style="float:right">
					</div>
				</div>
			</div>
			<!-- fin col-midx --> 
		</form>
	</div>
</div>

<div class="separador "></div>
		
<div class="cont">
	<div class="error" id="diverror" name="diverror" style="display:none">
		<div class="txtaviso">The form was not filled properly. Verify the highlighted fields. </div>
	</div>
</div>

<script type="text/javascript">
	var postId = "";
	function ValidateForm(mode){
		var e_titulo = false;
		var e_copete = false;	
		var e_imagen_vacio = false;
		var e_imagen_size = false;
		var e_imagen_format = false;
		$(".postId").val(postId);
		
		//validos campos obligatorios del form	
		if ( document.getElementById('titulo').value.replace(/\s/g, '').length == 0 ) e_titulo = true;
		if ( document.getElementById('copete').value.replace(/\s/g, '').length == 0 ) e_copete = true;
		
		//seteo carteles de error
		if ( e_titulo ) 
			document.getElementById('titulo').className = "mal";
		else	
			document.getElementById('titulo').className = "";
		if ( e_copete) 
			document.getElementById('copete').className = "mal";
		else	
			document.getElementById('copete').className = "";
			
		var files = $('input[name="images[]"]')[0].files;
		var filesCount = 0;
		
		if(files != null)
		filesCount = files.length;
		
		if(filesCount == 0){
			e_imagen_vacio = true;				
		}

		if(!e_imagen_vacio){
		
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
		
		if(e_titulo || e_copete || e_imagen_format || e_imagen_vacio || e_imagen_size) {
			if ( e_titulo || e_copete ) {
				document.getElementById('diverror').style.display = "block";
			}else{
				document.getElementById('diverror').style.display = "none";
			}
			if ( e_imagen_format ) {					
				document.getElementById('diverrorimagen').style.display = "block";
			}else{
				document.getElementById('diverrorimagen').style.display = "none";
			}
			if ( e_imagen_vacio ) {					
				document.getElementById('diverrorimagenvacio').style.display = "block";
			}else{
				document.getElementById('diverrorimagenvacio').style.display = "none";
			}
			if ( e_imagen_size) {					
				document.getElementById('diverrorimagensize').style.display = "block";
			}else{
				document.getElementById('diverrorimagensize').style.display = "none";
			}
		}else{
			document.getElementById('diverror').style.display = "none";
			document.getElementById('diverrorimagen').style.display = "none";
			document.getElementById('diverrorimagensize').style.display = "none";
			document.getElementById('diverrorimagenvacio').style.display = "none";
			
			if ( mode == 'isDirectPublish' ) {
				$('#buttonPublicar').prop('disabled',true);
				document.getElementById('isDirectPublish').value = "true";
				document.getElementById('posts').submit();
			}
		}
	}
	function removeClass(campo) {
		if(campo == 'titulo'){
			$("#titulo").removeClass("mal");
		}
		if(campo == 'copete'){
			$("#copete").removeClass("mal");
		}
	}  
</script>	