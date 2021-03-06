<%@ include file="TS_Common_Libraries.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
 <%
    String getURL=request.getRequestURL().toString();
    String[] str2 = getURL.split("/");
    String rutaURL = str2[2];
 %>


 <%
String url = "http://static.telesurtv.net/xml/grilla/tvweb_eng.xml";
%>
<style>
	.invisible{
		visibility: collapse;
   		display: none;
	}	
</style>
<c:import var="programacion" url="<%=url%>"/>
<x:parse xml="${programacion}" var="output"/>
	<div class="row clear">
			<div class="separador"></div>
	          <div class="banners adv970">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Home</cms:param>
						<cms:param name="key">Advert-970x90</cms:param>
					</cms:include>
	           </div> 
	           <div class="separador"></div>
	           <div id="grilla-superior">
		   	<div class="col-3qua">   					
			    <div class="cont">
			        <div class="dest">
			            <div class="img-shows">
			                <div class="txtshow-over desktop">
			                    <div class="title"></div>
			                    <div class="date"></div>
			                    <div class="likeshow"></div>
			                </div>
			                <a class="her" href="#">
			                     <cms:include page="../elements/Live_Streaming.Code.jsp" />		                     
			                
			                     <cms:include page="../elements/TS_Descripcion.jsp" />			               
			                </a> 
			            </div>
			            <div class="blue bold1 desktop"></div>
			            <p class="txtno desktop"></p>
			        </div>
			    </div>
			 </div>
			 <div class="col-quat">
			 	<div class="cont">
			        <%
				String dias[] = {"domingo", "lunes", "martes", "miercoles", "jueves", "viernes", "sabado"};
				String timeZones[] = {"America/Caracas", "America/Bogota", "Cuba", "America/Mexico_City", "America/Buenos_Aires", "Europe/Madrid", "America/New_York"};
				int defaultTimeZone = 0;
				String today = "";
				Calendar cal = Calendar.getInstance();
				cal.setTime(new Date());
				today = dias[cal.get(Calendar.DAY_OF_WEEK) - 1];
				
				/** Busco en el request si se paso la zona horaria y seteo las zonas horarias*/
				DateFormat inFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
				inFormat.setTimeZone(TimeZone.getTimeZone("America/Caracas"));
				
				DateFormat outFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
				
				if (request.getParameter("tz") != null) {
					try{
						defaultTimeZone = Integer.parseInt(request.getParameter("tz"));
						outFormat.setTimeZone(TimeZone.getTimeZone(timeZones[defaultTimeZone]));
					} catch (Exception e) {}
				}else{
					outFormat.setTimeZone(TimeZone.getTimeZone(timeZones[defaultTimeZone]));
				}
				
				boolean thereIsNowUp = false;
				boolean thereIsComingUp = false;		
				boolean showUp = false;
				boolean separator = false;
				int cont = 0;
			        %>
			            <c:set var="d" value="<%=today%>" />
				    <x:set var="diaXML"  select="$output/root/semana/*[name()=$d]" />
			            <x:forEach var="programaDiaXML" select="$diaXML/programas/programa">
			                    <x:set var="fi" select="$programaDiaXML/hora_ini"/>
			                    <x:set var="ff" select="$programaDiaXML/hora_fin"/>
			                    <c:set var="fchIni">
			                        <x:out select="$fi"/>
			                    </c:set>
			                    <c:set var="fchFin">
			                        <x:out select="$ff"/>
			                    </c:set>                        
						
						       <%
			                                try {    
			                                
			                                /** Se crea la fecha actual usando el formato de la timeZone default y
							luego lo convierto a la zona horaria seleccionada*/	
							DateFormat nowFormat = new SimpleDateFormat("HH:mm");
							nowFormat.setTimeZone(TimeZone.getTimeZone(timeZones[defaultTimeZone]));
							Date nowDate = new Date();
							inFormat.format(nowDate);
							String now = nowFormat.format(nowDate);
							
							/** Se crea la fecha de inicio con el formato de la timeZona America/Caracas */
							Date fechaInicio = inFormat.parse(((String) pageContext.getAttribute("fchIni")));  
							/** Se pasa la fecha de inicio a la timeZone seleccionada por el usuario y se
							extrae de la fecha solo la hora y minuto sin los : */
							String fchI = outFormat.format(fechaInicio);
							fchI = fchI.substring(11);
							String fchIShow = fchI.substring(0, 5);
							fchI = fchI.replaceAll(":", "");
							fchI = fchI.substring(0, 4);
							/** Se crea la fecha de fin con el formato de la timeZona America/Caracas */
							Date fechaFin = inFormat.parse(((String) pageContext.getAttribute("fchFin")));       
							
							/** Se pasa la fecha de fin a la timeZone seleccionada por el usuario y se
							extrae de la fecha solo la hora y minuto sin los : */
							String fchF = outFormat.format(fechaFin);
							fchF = fchF.substring(11);
							String fchFShow = fchF.substring(0, 5);
							fchF = fchF.replaceAll(":", "");
							fchF = fchF.substring(0, 4);
							now = now.replaceAll(":", "");                                    
							
							/** Se pasa las horas a Long para manejar las condiciones */
							long ini = Long.parseLong(fchI);
							long fin = Long.parseLong(fchF);
							long n = Long.parseLong(now);                                    
							
							if(!thereIsNowUp && (n >= ini && n <= fin) && cont < 5){ 
								thereIsNowUp = true;                                     
								showUp = true;
								cont++;
			                                %>        
							          <div class="blueback">Now on <img style="width:78px;" src="/arte/grilla/logo-footer.png" width="78" height="17" alt=""></div>
							<%
							}else if(!thereIsComingUp && thereIsNowUp && n < ini && cont < 5){
								thereIsComingUp = true;
								showUp = true;
								cont++;
							%>  
								<div class="blueback">Coming up</div>
							<%
							}else if(n < ini && thereIsComingUp && thereIsNowUp && cont < 5){
								showUp = true;
								cont++;
								separator = true;
							}else{
								showUp = false;
							}
							%> 
							<% if(showUp){%>       
							          <div class="titleblue"><a href="#" class="her"><x:out select="$programaDiaXML/nombre"/></a></div>
							          <div class="autshow"> <a href="#" class="her"></a></div>
							          <div class="bluedate"><%= fchIShow+" - " %><%= fchFShow+"" %></div>
							          <% if(separator){ %> <div class="separador2"></div><% } %>
						        <% }
						          
						        } catch (Exception e) {}
						         %>  
						          
						        
					</x:forEach> 
					<%
					   /** Esto es para ingles*/	
				       	   if(!thereIsNowUp){
				       	   %><script type="text/javascript"> $("#grilla-superior").addClass("invisible");  </script> <%	
				       	   }
					
					%>
				</div>
			</div>
		</div>
	</div>
	
	
 <div class="separador"></div>	
	<!-- Future Shows JESUS-->
    
      <div class="row clear">
      <div class="col">
        <div class="conttitle">
          <div class="cont">
            <div class="tituloazul">Future Shows</div>
          </div>
          
          <nt:news-list order="priority desc, user-modification-date desc" onmainpage="section" section="joinus" zone="streaming" size="4">
              <nt:conditional-include oncondition="${newslist.position < 5}">
              <nt:conditional-include oncondition="${newslist.position < 2}">
              	<div>
            		<ul>
	    	 </nt:conditional-include>
	              <li style="width: 25%; float: left;">
	                <div class="cont"> <iframe width="100%" src="<nt:generic-news-value element="HTTP_Stream"/>" frameborder="0" allowfullscreen></iframe>
	                  <div class="titfutur"> <a href="#" class="her">North Korea confirms ouster</a> </div>
	                </div>
	              </li>
            <nt:conditional-include oncondition="${newslist.position == 4}">
            </ul>
	  </nt:conditional-include>
	  </nt:conditional-include>		   
        </nt:news-list>
          </div>        
        </div>
      </div>
    </div>
    <!-- fin Future Shows -->
	
	    
	<div class="separador"></div>
	<div class="banners">
				<cms:include page="../elements/TS_Common_Banners.jsp">
					<cms:param name="template">Home</cms:param>
					<cms:param name="key">Advert-728x90-a</cms:param>
				</cms:include>
	</div>
	<div class="separador"></div>