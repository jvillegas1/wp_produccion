<%@ include file="../elements/TS_Common_Libraries.jsp" %>
 <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
 <%
 try{
    String getURL=request.getRequestURL().toString();
    String[] str2 = getURL.split("/");
    String rutaURL = str2[2];
 %>
	<div class="livebox" id="slive">
		<div class="cont">
			<div class="livecont">
				<div class="row clear">
					<div class="cont">
						<!--<div class="logolive">
							<cms:img src="/arte/telesurazullive.png" alt="Live" title="Live"/>
							<div class="btnLive">live</div>
						</div>-->
					</div>            
					<div class="row clear">
						<div class="col-3qua">
							<div class="dest">
								<div class="cont">
									<div id="embedbox">
										<div class="embcont">
											<div class="titemb">Embed code<img src="<cms:link>/arte/emblive.png</cms:link>" alt="" title=""/></div>
											<textarea  name="embcode" id="embcode"><iframe width="560" height="315" src="//www.youtube.com/embed/EpnERlsfBFc" frameborder="0" allowfullscreen></iframe></textarea>
											<div class="titemb">Video size <div class="vidsize">560 x 315</div></div>
										</div>
									</div>
									<div class="img-dest" id="cajaPlayerUltra">
									</div>
								</div>
								<div class="cont desktop">
									<div class="twit-emb">
										<a href="#" class="her txtleft white" >Twitter <img src="<cms:link>/arte/ico-twitter-head.png</cms:link>" alt=""/></a>
										<div class="txt-twit white">


										<style type="text/css">
											.timeline-header{ display:none;}
										</style>
									<a class="twitter-timeline" data-border-color="#81DAF5" href="https://twitter.com/soporteteleSUR/lists/telesur" data-link-color="#ff0000" width="700" height="100" lang="ES"  data-screen-name="teleSURtv" data-show-replies="false"  data-show-replies="false" data-widget-id="480026503560720384" data-chrome="nofooter noborders noheaders transparent"  data-tweet-limit="1">Tweets de teleSUR</a>    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-qua desktop" >
							<div class="cont">
								<div class="logolistlive row">
									<img src="<cms:link>/arte/telelistli.png</cms:link>" alt=""/>
								</div>


<!--OBTENGO LA HORA ACTUAL Y ELIMINO LOS ":" PARA REALIZAR LA COMPARACION CON NUMEROS ENTEROS -->
<c:set var="now" value="<%=new java.util.Date()%>" />

<fmt:setTimeZone value="America/Caracas"/>
<% 

java.text.DateFormat fechax = new java.text.SimpleDateFormat("HH:mm");
String horaActual = fechax.format(new java.util.Date());
%>

<c:set var="horaActual" value="<%=horaActual%>" />

<fmt:formatDate pattern="E" value="${now}" var="diaActual" />

<!--FIN HORA ACTUAL -->
<%

java.text.DateFormat formatter = new java.text.SimpleDateFormat("E");
String diaActual = formatter.format(new java.util.Date());
String diaH = "";
String diaMan = "";
if( diaActual.equals("Mon") )
{
	diaH="lunes";     
	diaMan="martes";
}
else if( diaActual.equals( "Tue" ) )
{
	diaH="martes";
	diaMan="miercoles";
}
else if( diaActual.equals( "Wed" ) )
{
	diaH="miercoles";
	diaMan="jueves";
}
else if( diaActual.equals( "Thu" ) )
{
	diaH="jueves";
	diaMan="viernes";
}
else if( diaActual.equals( "Fri" ) )
{
	diaH="viernes";
	diaMan="sabado";
}
else if( diaActual.equals( "Sat" ) )
{
	diaH="sabado";
	diaMan="domingo";
}
else if( diaActual.equals( "Sun" ) )
{
	diaH="domingo";
	diaMan="lunes";
}

 %>
<c:set var="nombreDia" value="<%=diaH%>" />
<c:set var="diaNext" value="<%=diaMan%>" />

<%
String url = "http://" + rutaURL + "/xml/espanol/programacion/tvweb_esp.xml";
%>
<!-- ESTO ES UN COMENTARIOOOOOOOOOOOO <%=url%>  -->
<!-- PARA SACAR EL NUMERO DE PROGRAMAS DIARIOS -->
<c:import var="semanaActual" url="<%=url%>" charEncoding="UTF-8"/>
<x:parse xml="${semanaActual}" var="semana"/>
<x:forEach select="$semana/root/semana /*[local-name()=$nombreDia]" var="diaEntero">
<x:set var="totalProgramas" select="string($diaEntero/@cuantos)"/>
</x:forEach>
<!--FIN -->
<!--LEYENDO EL XML DE SEMANA ACTUAL -->
<c:set var="contadorProgramas" value="0" />
<x:forEach select="$semana/root/semana /*[local-name()=$nombreDia]/programas/programa" var="dia">
<c:set var="contadorProgramas" value="${contadorProgramas+1}" />
<c:set var="faltantesProg" value="${faltantesProg -1}" />
<x:set var="programaId" select="string($dia/@id)"/>
<x:set var="programaTitulo" select="$dia/nombre"/>
<x:set var="horaPrograma" select="$dia/hora_ini"/>
<x:set var="hora_fin" select="$dia/hora_fin"/>
<%-- ASIGNO LA HORA DE INICO Y FIN DEL PROGRAMA A LAS VARIABLES CORRESPONDIENTES --%>
<c:set var="horaInicial">
<x:out select="$horaPrograma" />
</c:set>
<c:set var="horaFinal">
<x:out select="$hora_fin" />
</c:set>
<%-- ELIMINO LOS ":" DE LA HORA DE INICIO Y FIN, PARA HACER MAS FACIL LA COMPARACION--%>
<c:set var="dateParts" value="${fn:split(horaInicial, ' ')}" />
<c:set var="soloHoraIni" value="${dateParts[1]}" />
<c:set var="horaIniPrint" value="${fn:substring(soloHoraIni, 0, 5)}" />
<c:set var="STR1" value="${fn:split(soloHoraIni, ':')}" />
<c:set var="horaInicial" value="${fn:join(STR1, '')}" />
<c:set var="enVivoNow" value="0" />
<c:set var="datePartsFinal" value="${fn:split(horaFinal, ' ')}" />
<c:set var="soloHoraFin" value="${datePartsFinal[1]}" />
<c:set var="horaFinPrint" value="${fn:substring(soloHoraFin, 0, 5)}" />
<c:set var="STR2" value="${fn:split(soloHoraFin, ':')}" />
<c:set var="horaFinal" value="${fn:join(STR2, '')}" />
<c:if test = "${horaFinal == 000000}">
<c:set var="horaFinal" value="240000" />
</c:if>
<%-- SI LA HORA DE INICOO DEL PROGRAMA ES MAYOR A LA ACTUAL Y LA HORA DE FIN MENOR O IGUAL A LA ACTUAL, ENTONCES ESTA AL AIRE --%>
<c:if test="${horaActual >= horaInicial &&  horaActual <= horaFinal}">
<c:set var="controFaltantes" value="${controFaltantes + 1}" />
<c:set var="enVivoNow" value="1" />
<c:set var="faltantesProg" value="3" />
								<div class="titleblue clear">
									<a href="#" class="her clear row white" style="margin:15px 0">Transmitiendo</a>
									<a href="#" class="her white"><x:out select="$programaTitulo" /></a>
									<!--<a href="#" class="her autlive">with Rosa Tarfi</a>-->
									<a href="#" class="her clear row white" style="font-size:12px; padding:5px 0"><c:out value="${horaIniPrint}"/> - <c:out value="${horaFinPrint}"/></a>  
								</div>
<c:set var="restantesProgramas" value="${totalProgramas - contadorProgramas}" />
</c:if>								
<c:if test="${restantesProgramas >= 2 && enVivoNow==0 && faltantesProg == 2}">
<div class="titleblue clear">								
									<a href="#" class="her clear row white" style="margin:15px 0">PROXIMAMENTE</a>
									<a href="#" class="her white"><x:out select="$programaTitulo" /></a>
									<a href="#" class="her clear row white" style="font-size:12px; padding:5px 0 20px 0"><c:out value="${horaIniPrint}"/> - <c:out value="${horaFinPrint}"/></a>
</c:if>
<c:if test="${restantesProgramas >=1 && enVivoNow==0 && faltantesProg == 1}">
									<a href="#" class="her clear row white"><x:out select="$programaTitulo" /></a>
									<!--<a href="#" class="her autlive">with Walter Martínez</a>-->
									<a href="#" class="her clear row white" style="font-size:12px; padding:5px 0"><c:out value="${horaIniPrint}"/> - <c:out value="${horaFinPrint}"/></a> 
									</div>
</c:if>
</x:forEach> 
<!-- SI LLEGADA LA HORA, NO EXISTEN MAS PROGRAMAS PARA EL DIA, TOCA SALTAR AL OTRO DIA Y SAcARLO DE SU XML -->
<c:if test="${faltantesProg != 0}" >
<c:set var="contadorProgramas" value="0" />
<x:forEach select="$semana/root/semana /*[local-name()=$diaNext]/programas/programa" var="dia">
<c:set var="faltantesProg" value="${faltantesProg -1}" />
<x:set var="programaId" select="string($dia/@id)"/>
<x:set var="programaTitulo" select="$dia/nombre"/>
<x:set var="horaPrograma" select="$dia/hora_ini"/>
<x:set var="hora_fin" select="$dia/hora_fin"/>
<c:if test="${faltantesProg == 2}">								
									<a href="#" class="her clear row white" style="margin:15px 0">PROXIMAMENTE</a>
									<a href="#" class="her white"><x:out select="$programaTitulo" /></a>
									<a href="#" class="her clear row white" style="font-size:12px; padding:5px 0 20px 0"><c:out value="${horaIniPrint}"/> - <c:out value="${horaFinPrint}"/></a>
</c:if>
<c:if test="${faltantesProg == 1}">
									<a href="#" class="her clear row white"><x:out select="$programaTitulo" /></a>
									<!--<a href="#" class="her autlive">with Walter Martínez</a>-->
									<a href="#" class="her clear row white" style="font-size:12px; padding:5px 0"><c:out value="${horaIniPrint}"/> - <c:out value="${horaFinPrint}"/></a> 
									</div>
</c:if>
</x:forEach>
</c:if>
								<div class="sharlive">
									
									<cms:include page="TS_Common_AddThis.jsp" >
							          <cms:param name="link">http://www.telesurtv.net/</cms:param> 
							          <cms:param name="titulo">Señal en Vivo teleSUR</cms:param>   
						            </cms:include>
																	</div>
							
							</div>
						</div>  
			
					</div>
				</div>
			</div> <!--livecont -->
		</div>
	</div> <!--fin livebox -->
	
	<% }catch(Exception e){}%>
	