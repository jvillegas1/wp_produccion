<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="nt" uri="http://www.tfsla.com/taglib/tfsNewsTags" %>

<% 
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);

String grupo = "";
String category = "";

if (request.getParameter("template_poll") != null)  grupo = request.getParameter("template_poll");
if (request.getParameter("category") != null)  category = request.getParameter("category");
if (grupo.indexOf("Programa") > -1 ||  grupo.indexOf("Deporte") > -1 || grupo.indexOf("Club") > -1 ) 
{
	category = cms.property("subSeccion");
	grupo = "Sumario";
}
if (grupo.indexOf("Home") > -1) grupo = "Home";
if (grupo.indexOf("Nota") > -1) grupo = "Noticia";

//out.println("grupo "+  grupo );
//out.println("category" + category);
%>

<% if (!category.equals("") && !grupo.equals("")){ %>
	<article class="encuesta"><nt:polls-box size="1" state="inactive" category="<%=category%>" group="<%=grupo%>" style="TS-ES/CLOSE">
	</nt:polls-box></article>
<% }%>

<% if (!category.equals("") && grupo.equals("")){ %>
	<article class="encuesta"><nt:polls-box size="1" state="inactive" category="<%=category%>" style="TS-ES/CLOSE">
	</nt:polls-box></article>
<% }%>

<% if(category.equals("") && !grupo.equals("")){ %>
     	<article class="encuesta"><nt:polls-box size="1" state="inactive" group="<%=grupo%>" style="TS-ES/CLOSE">
	</nt:polls-box></article>
<% } %>

<div id="ultimaEncuestaCerrada"> </div>

<script>
function viewResultPollClose(categoryName, grupoName) {

     $.post('/system/modules/com.tfsla.diario.telesur/elements/TS_Common_PollClose.jsp',{ category: categoryName, grupo: grupoName }, function(data){
	$("#ultimaEncuestaCerrada").html(data);

     }); 
     
     document.getElementById("openPool").style.display = "none";
     document.getElementById("ultimaEncuestaCerrada").style.display = "block";
}
</script>