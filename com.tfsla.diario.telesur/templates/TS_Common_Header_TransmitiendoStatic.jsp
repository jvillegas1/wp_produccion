<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%
	try{
%>

<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:setTimeZone value="America/Caracas"/>


<% 

java.text.DateFormat fechax = new java.text.SimpleDateFormat("HH:mm");
String horaActual = fechax.format(new java.util.Date());
%>
<c:set var="horaActualizada" value="<%=horaActual%>" />
<%--<fmt:formatDate pattern="HH:mm" value="${now}" var="horaActualizada" />--%>
<c:set var="string2" value="${fn:split(horaActualizada, ':')}" />
<c:set var="horaActual" value="${fn:join(string2, '')}" />

<fmt:formatDate pattern="E" value="${now}" var="diaActual" />
<%

java.text.DateFormat formatter = new java.text.SimpleDateFormat("E");
String diaActual = formatter.format(new java.util.Date());
String diaH = "";

if( diaActual.equals("Mon") )
{
      diaH="lunes";     
}
else if( diaActual.equals( "Tue" ) )
{
           diaH="martes";
}
else if( diaActual.equals( "Wed" ) )
{
          diaH="miercoles";
}
else if( diaActual.equals( "Thu" ) )
{
           diaH="jueves";
}
else if( diaActual.equals( "Fri" ) )
{
            diaH="viernes";
}
else if( diaActual.equals( "Sat" ) )
{
           diaH="sabado";
}
else if( diaActual.equals( "Sun" ) )
{
           diaH="domingo";
}

 %>
<c:set var="nombreDia" value="<%=diaH%>" />


 <%
    String getURL=request.getRequestURL().toString();
    String[] str2 = getURL.split("/");
    String rutaURL = str2[2];
    String url = "http://" + rutaURL + "/xml/espanol/programacion/tvweb_esp.xml";
 %>


<c:import var="semanaActual" url="<%=url%>" charEncoding="UTF-8"/>
<x:parse xml="${semanaActual}" var="semana"/>
<x:forEach select="$semana/root/semana /*[local-name()=$nombreDia]/programas/programa" var="dia">
	<x:set var="programaId" select="string($dia/@id)"/>
	<x:set var="programaTitulo" select="$dia/nombre"/>
	<x:set var="horaPrograma" select="$dia/hora_ini"/>
	<x:set var="hora_fin" select="$dia/hora_fin"/>
	<x:set var="tp" select="$dia/tipo_xml"/>
	<c:set var="type">
        	<x:out select="$tp"/>
        </c:set>
	<%
		String type = (String) pageContext.getAttribute("type");  
		if(!type.equalsIgnoreCase("w")){
		
	%>
	

	<c:set var="horaInicial">
	<x:out select="$horaPrograma" />
	</c:set>
	
	<c:set var="horaFinal">
	<x:out select="$hora_fin" />
	</c:set>
	

	
	<c:set var="dateParts" value="${fn:split(horaInicial, ' ')}" />
	<c:set var="soloHoraIni" value="${dateParts[1]}" />
	<c:set var="STR1" value="${fn:split(soloHoraIni, ':')}" />
	<c:set var="horaInicial" value="${fn:join(STR1, '')}" />
	
	<c:set var="datePartsFinal" value="${fn:split(horaFinal, ' ')}" />
	<c:set var="soloHoraFin" value="${datePartsFinal[1]}" />
	<c:set var="STR2" value="${fn:split(soloHoraFin, ':')}" />
	<c:set var="horaFinal" value="${fn:join(STR2, '')}" />
	
<%--Actual: <c:out value="${horaActual}"/> -- Inicial: <c:out value="${horaInicial}"/> -- Final: <c:out value="${horaFinal}"/> <br />--%>
	<c:if test="${horaActual >= horaInicial &&  horaActual <= horaFinal}">
	<div class="transmision">Transmitiendo: <x:out select="$programaTitulo" /></div>
	</c:if>
	<%
		}
	%>
</x:forEach>

<%
	}catch(Exception e){
%> <%		
	}
%>