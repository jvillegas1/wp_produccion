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


						
<div class="wrapper">
<div class="filesRSS" >
<div id="freestyle">
     <h1>RSS teleSUR</h1>
</div>
	
     <ul>
     <li>
     <a  href="http://www.telesurtv.net/english/rss/RssHome.html" target="_blank">Home</a></li>
     <li>
     <a  href="http://www.telesurtv.net/english/rss/RssLatinoamerica.xml" target="_blank">Latin America</a></li>
     <li>
     <a href="http://www.telesurtv.net/english/rss/RssWorld.xml" target="_blank">World</a></li>
     <li>
     <a  href="http://www.telesurtv.net/english/rss/RssSports.xml" target="_blank">Sport</a></li>
     <li>
     <a  href="http://www.telesurtv.net/english/rss/RssCulture.xml" target="_blank">Culture</a></li>
     <li>
     <a  href="http://www.telesurtv.net/english/rss/RssOpinion.xml" target="_blank">Opinion</a></li>
     <li>
     <a  href="http://www.telesurtv.net/english/rss/RssAnalisis.xml" target="_blank">Analysis</a></li>
     </ul>
</div>

<div class="cont">
<p class="sur"><strong>(*) Recommendation:</strong>  For you to better read RSS content, we advise you to install a RSS reader.</p>
</div>
</div>	    
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