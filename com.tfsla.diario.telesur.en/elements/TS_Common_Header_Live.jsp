
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="livebox" id="slive" style="display: block;">
		<div class="cont">
			<div class="livecont">
				<div class="row clear">
					<div class="cont">
						<div class="logolive">
							<img src="/export/sites/telesur/arte/telesurazullive.png_818099647.png" width="115" height="25" title="Live" alt="Live">
							<div class="btnLive">live</div>
						</div>
					</div>            
					<div class="row clear">
						<div class="col-3qua">
							<div class="dest">
								<div class="cont">
									<div id="embedbox">
										<div class="embcont">
											<div class="titemb">Embed code<img src="/__export/1394733199996/sites/telesur/arte/emblive.png" alt="" title=""></div>
											<textarea name="embcode" id="embcode">&lt;iframe width="560" height="315" src="//www.youtube.com/embed/EpnERlsfBFc" frameborder="0" allowfullscreen&gt;&lt;/iframe&gt;</textarea>
											<div class="titemb">Video size <div class="vidsize">560 x 315</div></div>
										</div>
									</div>
									<div class="img-dest"><a href="#" class="her"><img src="/export/sites/telesur/images_borrables/img1.jpg_563529523.jpg" width="700" height="395"></a></div>
								</div>
								<div class="cont desktop">
									<div class="twit-emb">
										<a href="#" class="her txtleft white">Twitter <img src="/__export/1394733200684/sites/telesur/arte/ico-twitter-head.png" alt=""></a>
										<div class="txt-twit white">
											<span>@Greenpeace</span> Â¡JUEGA! Ayuda a Julio el ambientalista a subsanar los daÃ±os de Chevron <span>http://bit.ly/17nIxJ1</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-qua desktop">
							<div class="cont">
								<div class="logolistlive row">
									<img src="/__export/1394733201846/sites/telesur/arte/telelistli.png" alt="">
								</div>
								
								
								<!--OBTENGO LA HORA ACTUAL Y ELIMINO LOS ":" PARA REALIZAR LA COMPARACION CON NUMEROS ENTEROS -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate pattern="HH:mm" value="${now}" var="horaActualizada" />
<c:set var="string2" value="${fn:split(horaActualizada, ':')}" />
<c:set var="horaActual" value="${fn:join(string2, '')}" />

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

<!-- PARA SACAR EL NUMERO DE PROGRAMAS DIARIOS -->
<c:import var="semanaActual" url="http://telesur.cms-medios.com/xml/semanaActual.xml" charEncoding="UTF-8"/>
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
<c:set var="STR1" value="${fn:split(soloHoraIni, ':')}" />
<c:set var="horaInicial" value="${fn:join(STR1, '')}" />
<c:set var="enVivoNow" value="0" />
<c:set var="datePartsFinal" value="${fn:split(horaFinal, ' ')}" />
<c:set var="soloHoraFin" value="${datePartsFinal[1]}" />
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
									<a href="#" class="her clear row white" style="margin:15px 0">LIVE NOW</a>
									<a href="#" class="her white"><x:out select="$programaTitulo" /></a>
									<a href="#" class="her autlive">with Mario Vasco</a>
									<a href="#" class="her clear row white" style="font-size:12px; padding:5px 0">1820 - 1930</a>  
								</div>
								
								
								<c:set var="restantesProgramas" value="${totalProgramas - contadorProgramas}" />
</c:if>

<c:if test="${restantesProgramas >= 2 && enVivoNow==0 && faltantesProg == 2}">
								
								<div class="titleblue clear">
									<a href="#" class="her clear row white" style="margin:15px 0">COMING UP</a>
									<a href="#" class="her white"><x:out select="$programaTitulo" /></a>
									<a href="#" class="her clear row white" style="font-size:12px; padding:5px 0 20px 0">1930 - 2030</a>
									
									
									</c:if>


<c:if test="${restantesProgramas >=1 && enVivoNow==0 && faltantesProg == 1}">
									<a href="#" class="her clear row white"><x:out select="$programaTitulo" /></a>
									<a href="#" class="her autlive">with Walter MartÃ­nez</a>
									<a href="#" class="her clear row white" style="font-size:12px; padding:5px 0">2035 - 2130</a>  
								
								
								
								</c:if></div>

</x:forEach>

								
								
								
								<div class="sharlive">
									<a href="#" class="sharelive">Share</a>
									<a class="embedlive">Embed code</a>
								</div>
							
							
							
							
							
							
							
							
							
							</div>
						</div>  
			
					</div>
				</div>
			</div> <!--livecont -->
		</div>
	</div>