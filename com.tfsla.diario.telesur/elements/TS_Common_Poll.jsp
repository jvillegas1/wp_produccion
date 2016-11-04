<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="nt" uri="http://www.tfsla.com/taglib/tfsNewsTags" %>

<% 
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);

Boolean isProjectOnline = cms.getCmsObject().getRequestContext().currentProject().isOnlineProject();
String index = "TS_POLLS_ONLINE";
if (!isProjectOnline) index = "TS_POLLS_ONLINE";

String grupo = "Home";
String category = "";

if (request.getParameter("category") != null)  category = request.getParameter("category");
if (grupo.indexOf("Programa") > -1 ||  grupo.indexOf("Deporte") > -1 || grupo.indexOf("Club") > -1 ) 
{
	category = cms.property("subSeccion");
	grupo = "Sumario";
}
if (grupo.indexOf("Home") > -1) grupo = "Home";
if (grupo.indexOf("Nota") > -1) grupo = "Noticia";

/**
out.println("grupo "+  grupo );
out.println("category" + category);
*/
%>

<% if (!category.equals("") && !grupo.equals("")){ %>
	<nt:polls-box size="1" state="active" category="<%=category%>" group="<%=grupo%>" style="TS-ES/TS">
	</nt:polls-box>
<% }%>

<% if (!category.equals("") && grupo.equals("")){ %>
	<nt:polls-box size="1" state="active" category="<%=category%>" style="TS-ES/TS">
	</nt:polls-box>
<% }%>

<% if(category.equals("") && !grupo.equals("")){ %>
     	<nt:polls-box size="1" state="active" group="<%=grupo%>" style="TS-ES/TS">
	</nt:polls-box>
<% } %>

<% if(category.equals("") && grupo.equals("")){ %>
     	<nt:polls-box size="1" state="active" style="TS-ES/ES">
	</nt:polls-box>
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

function viewResultPollActive() {
     document.getElementById("ultimaEncuestaCerrada").style.display = "none";
     document.getElementById("openPool").style.display = "block";
     document.getElementById("surv").style.display = "block";
}
</script>