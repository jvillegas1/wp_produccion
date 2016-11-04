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
String url = "http://static.telesurtv.net/xml/grilla/tvweb_esp.xml";
%>

<c:import var="programacion" url="<%=url%>" charEncoding="UTF-8"/>
<x:parse xml="${programacion}" var="output"/>
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
							          <div class="blue bold1 desktop">Descripción</div>
							<%
							}else if(!thereIsComingUp && thereIsNowUp && n < ini && cont < 1){
								thereIsComingUp = true;
								showUp = true;
								cont++;
							%>  
								
							<%
							}
							else if(n < ini && thereIsComingUp && thereIsNowUp && cont < 1){
								showUp = true;
								cont++;
								separator = true;
							}else{
								showUp = false;
							}
							%> 
							<% if(showUp){%>       
							         <p class="txtno desktop"><x:out select="$programaDiaXML/sinopsis"/></p>
							         
							          <% if(separator){ %> <div class="separador2"></div><% } %>
						        <% }
						        
						        } catch (Exception e) {}
						         %>  
						         
						        
					</x:forEach> 