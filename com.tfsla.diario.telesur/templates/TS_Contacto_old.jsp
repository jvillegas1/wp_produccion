<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
org.opencms.jsp.CmsJspXmlContentBean cms = new
org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
 
String title = cms.property("Title");
String uri = cms.getRequestContext().getUri();
%>
<!doctype html>
<html>
<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">home</cms:param>
	</cms:include>

</head>

<body>

	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle"><%=title%></cms:param>
		<cms:param name="pageSeccion"></cms:param>
		<cms:param name="agenda">si</cms:param>
		<cms:param name="subMenu">no</cms:param>
		<cms:param name="latest">no</cms:param>       
	</cms:include>      
     
	<div class="wrapper"> 
		<%cms.include(uri, "body");%>
		<%cms.include(uri, "text1");%>
		<%cms.include(uri, "text2");%>		                                              	
	</div><!--wrapper-->
	<cms:include page="../elements/TS_Contact_Form.jsp" />
	
	<cms:include page="../elements/TS_Common_Footer.jsp" />
	
</body>
<script type="text/javascript">
<!-- script menu -->
var menu = 0
$('#header .btnMobile').click(function(){
	if(menu == 0){
		$('#nav').slideDown(750);	
		menu++
	}else{			
		$('#nav').slideUp( 750, function() {
			$('#nav').removeAttr('style');
		  });
		menu--
	}
});
$().ready(function() {
	$("#form-jobs").load(function () {
		alert('en el iframe');
		$( "table.webform_table" ).replaceWith("<div class='col-mid'><div class='cont'><h5>Nombre</h5><input type='text' name='InputField-1' value=''><h5>País</h5><select name='InputField-2'><option value='Seleccione su Pais '>Seleccione su Pais </option><option value=' Argentina '> Argentina </option><option value=' Colombia '> Colombia </option><option value=' Brasil '> Brasil </option><option value=' Mexico '> Mexico </option><option value=' Venezuela '> Venezuela </option><option value=' Ecuador'> Ecuador</option></select><h5>Departamento</h5><input type='text' name='InputField-3' value=''></div></div><div class='col-mid'><div class='cont'><h5>Mensaje</h5><textarea cols='5' rows='5' name='InputField-4' ></textarea><input type='file'></div></div><div class='btnForm clear'><input class='enviar' type='submit' value='Enviar'><input type='reset' value='Cancelar' class='formbutton resetbutton'></div>");
	});	
});

</script>
</html>