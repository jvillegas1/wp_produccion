<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ page import="java.util.*" %>

<%
try{
    String getURL=request.getRequestURL().toString();
    String[] str2 = getURL.split("/");
    String rutaURL = str2[2];
 %>

 <%
String url = "http://" + rutaURL + "/xml/clima.xml";
%>
 <%
String url2 = "http://" + rutaURL + "/xml/ciudades.xml";
%>
<% String ciudadIdCookie = request.getParameter("ciudadIdCookie") != null ? request.getParameter("ciudadIdCookie") : "" ; %>


	<c:set var="ciudadIdCookie" value="<%=ciudadIdCookie %>" />

	 <c:import var="clima" url="<%=url%>" charEncoding="UTF-8"/>
	<x:parse xml="${clima}" var="outputX"/>
	
	 <c:import var="ciudades" url="<%=url2%>" charEncoding="UTF-8"/>
	<x:parse xml="${ciudades}" var="outCiudades"/>
	
	<div class="temp">
		<div id="climaTemp">
			<x:set var="default" select="$outCiudades/ciudades/default" />
			<x:set var="nodo" select="$outputX/ciudades/*[local-name()=$default/@name]" />                                                                       
			<x:set var="defaultId"  select="string($default/@name)"/>
<c:choose>			
	<c:when test="${ciudadIdCookie != ''}">

			
				<c:set var="defaultId" value="${ciudadIdCookie}" />
				<x:forEach select="$outCiudades/ciudades/ciudad" var="item">
					<x:set var="ciudadId" select="string($item/id)"/> 
					<c:if test="${defaultId == ciudadId}"> 
						<x:set var="nodo" select="$outputX/*[local-name()=$ciudadId]" />
					</c:if>
				</x:forEach> 

    </c:when>
    <c:otherwise>
    		<x:forEach select="$outCiudades/ciudades/ciudad" var="item">
    			<x:set var="ciudadId" select="string($item/id)"/> 
    				<x:set var="nodo" select="$outputX/*[local-name()=$ciudadId]" />
			</x:forEach> 

    </c:otherwise>
</c:choose>
			<x:out select="$nodo/@temp" />°
		</div>


		<div class="icoTemp">
			<img id="climaIma" width="28" height="28" src="/arte/clima/<x:out select='$nodo/imagen' />?__scale=w:35,h:22,c:transparent" />
		</div>


		<small>
			<select class="selectClima" id="climaCiud" name="ciudades" onchange="dimeTemp(this.value);" >
				<x:forEach select="$outCiudades/ciudades/ciudad" var="item">
					<x:set var="ciudadId" select="string($item/id)"/> 
					<!--AQUI ESTABA TODO EL DESPELOTE-->
					<x:set var="nodo" select="$outputX/*[local-name()=$ciudadId]" />
					<!--FIN DEL DESPELOTE-->
					<option  value="<x:out select='$nodo/@temp' />°,<x:out select='$nodo/imagen' />,<x:out select='$ciudadId' />"
					<c:if test="${defaultId == ciudadId}"> selected </c:if>
					>
					<x:out select="$item/name" />
					</option>                                                
				</x:forEach>
			</select>
		</small>
	</div>
	<% }catch(Exception e){}%>