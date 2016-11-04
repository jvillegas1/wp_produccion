<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>


<c:import var="deportes" url="http://deportes.starmedia.com/rss-deportes-full.xml" charEncoding="utf-8"/>
<x:parse xml="${deportes}" var="output"/>
<c:set var="count" value="0" scope="page" />
	
<div class="cont">
	<div>
		<a href="http://www.starmedia.com/" target="_blank">
			<cms:img src="/arte/LogoStartmedia382_1.png" alt="Deportes Starmedia" />    
		</a>    
	</div>
	<div id="Latest">
		<ul>
			<% try { %>
				<x:forEach select="$output/rss/channel/item" var="item">
		                    <c:if test="${count < 5}">
		                        <x:set var="tituloItem" select="string($item/title)"/> 
		                        <x:set var="linkItem" select="string($item/link)"/> 
		                        <x:set var="descriptionItem" select="string($item/description)"/>
		                        <x:set var="imagenItem" select="string($item/enclosure/@url)" />
		                         
		                        <li>
		                            <div class="modnews">
		                            	<div class="contimgsli">
		                            	<a href="<x:out select="$linkItem" />" class="her" target="_blank">
		                            	<img src="<x:out select="$imagenItem"/>" width="170" height="105" />
		                            	</div>
		                                <p class="titslidenew"><x:out select="$tituloItem"/></p>
		                                </a>
		                                <div class="clear"></div>
		                            </div>    
		                        </li>
		                        
		                        <c:set var="count" value="${count + 1}" scope="page" />
		                    </c:if>
		                </x:forEach>
	            	<%
			}catch(Exception ex){
			%>
			Cargando...
			<%
			}
			%>
		</ul>
	</div>
</div>