<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>


<c:import var="deportes" url="http://deportes.starmedia.com/rss-deportes-full.xml" charEncoding="utf-8"/>
<x:parse xml="${deportes}" var="output"/>
<c:set var="count" value="0" scope="page" />
	
<div class="cont">
	<div class="headers blue">
	                Deportes Starmedia
	</div>
	<div id="Latest">
		<ul>
			<% try { %>
				<x:forEach select="$output/rss/channel/item" var="item">
		                    <c:if test="${count < 5}">
		                        <x:set var="tituloItem" select="string($item/title)"/> 
		                        <x:set var="linkItem" select="string($item/link)"/> 
		                        <x:set var="descriptionItem" select="string($item/description)"/>
		                         
		                        <li>
		                            <div class="modnews">
		                                <div class="titslidenew"><a href="<x:out select="$linkItem" />" class="her" /><x:out select="$tituloItem"/></a></div>
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
