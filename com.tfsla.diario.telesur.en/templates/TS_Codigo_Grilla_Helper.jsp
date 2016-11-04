<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.TimeZone"%>
<%@page import ="java.util.ArrayList"%>
<%@page import ="java.util.List"%>
<%@page import="java.security.SecureRandom"%>


                   <%                    
			String d1 = "";
			/** Listado de dias*/
			String dias[] = {"domingo", "lunes", "martes", "miercoles", "jueves", "viernes", "sabado", "sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"};
			/** Listado de meses*/
			String meses[] ={"JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
			String timeZones[] = {"America/Manaus", "America/Bogota", "Cuba", "America/Mexico_City", "America/Buenos_Aires", "Europe/Madrid", "America/New_York"};
			int defaultTimeZone = 0;
			String file = "";
			boolean isSpanish = true;
			
			if(request.getParameter("lg") != null){
				if(request.getParameter("lg").equals("en")){
					file = "tvweb_eng.xml"; 
					isSpanish = false;
				}else{
					file = "tvweb_esp.xml"; 
				}
			}else{
				file = "tvweb_esp.xml"; 
			}
			
			/** Seteo el dia de hoy buscando en el array de dias*/
			String today = "";			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			if(isSpanish){
				today = dias[cal.get(Calendar.DAY_OF_WEEK) - 1];
			}else{
				today = dias[(cal.get(Calendar.DAY_OF_WEEK) + 7) - 1];
			}
			
			/** Busco en el request si viene la variable day*/
			if (request.getParameter("day") != null) {
				d1 = (String) request.getParameter("day");
			} else {
				d1 = today;
			}				
			
			/** Busco en el request si se quieren mostrar todos los items y seteo una bandera*/
			boolean showAll = false;
			if (request.getParameter("all") != null) {
				if (((String) request.getParameter("all")).equals("true")) {
			    	showAll = true;
				}
			}
			/** Busco en el request si se paso la zona horaria y setep ñas zonas horarias*/
			DateFormat inFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			inFormat.setTimeZone(TimeZone.getTimeZone("America/Manaus"));
			
			DateFormat outFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			
			if (request.getParameter("tz") != null) {
				try{
					defaultTimeZone = Integer.parseInt(request.getParameter("tz"));
					outFormat.setTimeZone(TimeZone.getTimeZone(timeZones[defaultTimeZone]));
				} catch (Exception e) {}
			}else{
				outFormat.setTimeZone(TimeZone.getTimeZone(timeZones[defaultTimeZone]));
			}	
			
			
			/** Seteo las banderas a usar para condicionar el algoritmo*/
			boolean thereIsNow = false;
			boolean thereIsNext = false;
			boolean thereIsLater = false;
			boolean thereIsNextWeb = false;
			boolean thereIsLaterWeb = false;
			boolean isToday = false;
			boolean show = false;
			boolean isWeb = false;
			boolean iconWeb = false;
			boolean isDesktop = false;
			boolean ahora = false;

			/** Contador para el numero de notas*/
			int cont = 0;
			/** Contador general*/
			int contG = 0;
			/** numero máximo de notas a mostrar*/
			int maxNumNotas = 100;
			
			if (d1.equals(today)) {
			isToday = true;
			}
			
			/** Genero la semana actual para mostrar en los tab los dias y el mes */
			List<Date> fechas = new ArrayList<Date>();
			switch (cal.get(Calendar.DAY_OF_WEEK)) {
			    case 2:
			        break;
			    case 3:
			        cal.add(Calendar.DAY_OF_WEEK, -1);
			        break;
			    case 4:
			        cal.add(Calendar.DAY_OF_WEEK, -2);
			        break;
			    case 5:
			        cal.add(Calendar.DAY_OF_WEEK, -3);
			        break;
			    case 6:
			        cal.add(Calendar.DAY_OF_WEEK, -4);
			        break;
			    case 7:
			        cal.add(Calendar.DAY_OF_WEEK, -5);
			        break;
			    case 1:
			        cal.add(Calendar.DAY_OF_YEAR, -7);
			        cal.add(Calendar.DAY_OF_WEEK, 1);
			        break;
			}
			
			for (int i = 0; i < 7; i++) {
			    fechas.add(cal.getTime());
			    cal.add(Calendar.DAY_OF_WEEK, 1);
			}

			

                 %>
                
		 <%
		    String getURL=request.getRequestURL().toString();
		    String[] str2 = getURL.split("/");
		    String rutaURL = str2[2];
		 %>
<%
    //PARA QUE NO SE LEA CACHEADO EL XML
    SecureRandom secureRand = SecureRandom.getInstance("SHA1PRNG");
    int numAleatorio = secureRand.nextInt(9000);
    String url = "http://static.telesurtv.net/xml/grilla/tvweb_eng.xml?ckl=" + numAleatorio;
%>
        
	<c:set var="xmlFile" value="<%=file%>" />
        <c:import var="programacion" url="<%=url%>"/>

        <x:parse xml="${programacion}" var="output"/>
        <c:set var="d" value="<%=d1%>" />
        <!--Guardar el nodo del dia actual-->
        <x:set var="diaXML"  select="$output/root/semana/*[name()=$d]" />
        <div class="wrapper">
	<div class="row clear">
                    <div class="col">
                        <div class="topsche">
                            <div class="toplsch cont"> <img src="/arte/grilla/telesurazul.png" width="309" height="35" alt=""> </div>
                            <div class="toprsch cont"> Time Zone
                                <select class="sel1" id="selectTimeZones" onChange="changeTimeZone('<%= d1 %>', '<%= showAll %>')">
                                    <option value="0" <% if(defaultTimeZone == 0){ %> selected="true" <% } %> >CAR</option>
                                    <option value="1" <% if(defaultTimeZone == 1){ %> selected="true" <% } %> >BOG</option>
                                    <option value="2" <% if(defaultTimeZone == 2){ %> selected="true" <% } %> >CUB</option>
                                    <option value="3" <% if(defaultTimeZone == 3){ %> selected="true" <% } %> >MEX</option>
                                    <option value="4" <% if(defaultTimeZone == 4){ %> selected="true" <% } %> >BUE</option>
                                    <option value="5" <% if(defaultTimeZone == 5){ %> selected="true" <% } %> >MAD</option>
                                    <option value="6" <% if(defaultTimeZone == 6){ %> selected="true" <% } %> >NY</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="cont">
                    <div class="cont-tab">
                        <ul class="idTabs newtabw">
                            <div class="tabnew">
                                <li class="desktop">
                                    <a href="javascript:send('lunes','false', '<%= defaultTimeZone %>');"<% if (today.equals("lunes") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("lunes") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("lunes")) {%> class="selected">Monday <% } else {%> >Monday<%}%>
                                    <%
                                    /** Seteo los tabs para que mantenga el dia seleccionado y las variables escogida por el usuario */
                                    cal.setTime(fechas.get(0));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('martes','false', '<%= defaultTimeZone %>');" <% if (today.equals("martes") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("martes") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("martes")) {%> class="selected">Tuesday <% }else{%> >Tuesday<%}%>
                                    <%
                                    cal.setTime(fechas.get(1));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('miercoles','false', '<%= defaultTimeZone %>');"<% if (today.equals("miercoles") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("miercoles") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("miercoles")) {%> class="selected">Wednesday <% }else{%> >Wednesday<%}%>
                                    <%
                                    cal.setTime(fechas.get(2));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('jueves','false', '<%= defaultTimeZone %>');"<% if (today.equals("jueves") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("jueves") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("jueves")) {%> class="selected">Thursday <% }else{%> >Thursday<%}%>
                                    <%
                                    cal.setTime(fechas.get(3));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('viernes','false', '<%= defaultTimeZone %>');"<% if (today.equals("viernes") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("viernes") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("viernes")) {%> class="selected">Friday <% }else{%> >Friday<%}%>
                                    <%
                                    cal.setTime(fechas.get(4));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('sabado','false', '<%= defaultTimeZone %>');"<% if (today.equals("sabado") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("sabado") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("sabado")) {%> class="selected">Saturday <% }else{%> >Saturday<%}%>
                                    <%
                                    cal.setTime(fechas.get(5));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('domingo','false', '<%= defaultTimeZone %>');"<% if (today.equals("domingo") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("domingo") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("domingo")) {%> class="selected">Sunday <% }else{%> >Sunday<%}%>
                                    <%
                                    cal.setTime(fechas.get(6));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                    </a>
                                </li>
                            </div>
                        </ul>
                    </div>
                </div>               
                
                	<div class="cont" id="grilla-web">
                   
		
		<ul style="display: block;">	
                        <x:forEach var="programaDiaXML" select="$diaXML/programas/programa">
                            <x:set var="fi" select="$programaDiaXML/hora_ini"/>
                            <x:set var="ff" select="$programaDiaXML/hora_fin"/>
			    <x:set var="type" select="$programaDiaXML/tipo_xml"/>
			    <x:set var="u" select="$programaDiaXML/url"/>
                            <c:set var="fchIni">
                                <x:out select="$fi"/>
                            </c:set>
                            <c:set var="fchFin">
                                <x:out select="$ff"/>
                            </c:set>
                            <c:set var="typeNote">
                                <x:out select="$type"/>
                            </c:set>
                             <c:set var="url">
                                <x:out select="$u"/>
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
                                   
                                    
                                    /** Seteo el estilo para las imagenes grandes y la Sinopsi*/
                                    String classImg = "simg1";        
                                    String classSinopsis = "scont";                          
                                                                        
                                    /** Se crea la fecha de inicio con el formato de la timeZona America/Caracas */
                                    Date fechaInicio = inFormat.parse(((String) pageContext.getAttribute("fchIni")));  
                                    /** Se pasa la fecha de inicio a la timeZone seleccionada por el usuario y se
                                     extrae de la fecha solo la hora y minuto sin los : */
                                    String fchI = outFormat.format(fechaInicio);
                                    fchI = fchI.substring(11);
                                    /** Extraigo un substring de la fecha para mostrar */
                                    String fchIShow = fchI.substring(0, 5);
                                    fchI = fchI.replaceAll(":", "");
                                    fchI = fchI.substring(0, 4);
                                    
                                    String urlMultimedia = (String) pageContext.getAttribute("url");    
                                    if(urlMultimedia == null || urlMultimedia.equals("")){urlMultimedia = "#";}    
                                    
				    /** Se crea la fecha de fin con el formato de la timeZona America/Caracas */
				    Date fechaFin = inFormat.parse(((String) pageContext.getAttribute("fchFin")));       
                                    
                                    /** Se pasa la fecha de fin a la timeZone seleccionada por el usuario y se
                                     extrae de la fecha solo la hora y minuto sin los : */
                                    String fchF = outFormat.format(fechaFin);
                                    fchF = fchF.substring(11);
                                    /** Extraigo un substring de la fecha para mostrar */
                                    String fchFShow = fchF.substring(0, 5);
                                    fchF = fchF.replaceAll(":", "");
                                    fchF = fchF.substring(0, 4);
                                    now = now.replaceAll(":", "");                                    
                                    
                                    /** Se pasa las horas a Long para manejar las condiciones */
                                    long ini = Long.parseLong(fchI);
                                    long fin = Long.parseLong(fchF);
                                    long n = Long.parseLong(now);
                                    
                                    if  (n >= ini && n <= fin) {
                                       ahora = true;
                                     }
                                    
                                                                       
                                    if(pageContext.getAttribute("typeNote") != null &&
                                     ((String)pageContext.getAttribute("typeNote")).equalsIgnoreCase("w"))iconWeb = true;
                                    
	                                  /** COndicion para imprimir items los dias que no son TODAY y no se quiera mostrar todo el dia */
	                                    
	                                    if(!isToday && cont < maxNumNotas){                                      
	                                        show = true;
	                                        cont ++;
	                                        classImg="simg2";
	                                        classSinopsis = "scont1";
	                                        %>

		                            <li>
		                                <div class="scheduleback">   
		                                    <div class="schedule1">
		                                        <div class="sleft">
	                                    <%
	                                    /** Condicion para mostrar el now cuando la hora actual
	                                     este entre la hora de inicio y la hora fin de un programa, se establece
	                                     una bandera para que solo aparezca una vez */    
	                                    }else if ((n >= ini && n < fin) && cont < maxNumNotas && isToday) {                                        
	                                        show = true;
	                                        cont++;
	                                        classImg="simg1";
	                                    %>

		                            <li>
		                                <div class="scheduleback">   
		                                    <div class="schedule1">
		                                        <div class="sleft">
                                            <%
                                             /** Muestro solo si el dia es el dia actual y si no hay un now*/
                                             if (isToday && !thereIsNow) { thereIsNow = true; isDesktop = true; %>  <div class="swhen act">Now</div> <%}                                              
                                             
                                            /** Condiciono si no hay un Next o Later y si la hora actual es menor a la fecha de inicio,
                                             debe existir un now para que se muestre*/
                                            } else if (thereIsNow && (n < ini) && cont < maxNumNotas) {
                                                show = true;
                                                cont++;
                                                if(!thereIsNext && !showAll && isToday){
                                                	classImg="simg1";
                                                	classSinopsis = "scont";
                                                }else{
                                                	classImg="simg2";
                                                	classSinopsis = "scont1";
                                                }
                                            %>

                                            <li>
                                                <div class="scheduleback">  
                                                    <div class="schedule1">
                                                        <div class="sleft">
                                                            <% 
                                                            /** Muestro solo si el dia es el dia actual y no hay un next*/
                                                            if (isToday && !showAll && !thereIsNext) { thereIsNext = true; isDesktop = true; %> <div class="swhen <% if(isDesktop){ %> desktop <%}%>">Next</div> <%} 
                                                            else if (isToday && !showAll && !thereIsLater && thereIsNext) { thereIsLater = true; %><div class="swhen">After</div><%}
                                                             
                                           
                                           } else if (n < ini && thereIsLater && thereIsNow && thereIsNext && (cont < maxNumNotas || showAll)) {
                                                show = true;
                                                cont++;
                                                classImg="simg2"; 
                                                classSinopsis = "scont1";                                              
                                            %>

                                            <li>
                                                <div class="scheduleback">
                                                    <div class="schedule2">
                                                        <div class="sleft">
                                            <%   
                                            
                                            }else if(isToday && cont < maxNumNotas && (n < ini || n > ini )){
                                           	show = true;
                                                cont ++;
                                                classImg="simg2"; 
                                                classSinopsis = "scont1";                                              
                                            %>

                                            <li>
                                                <div class="scheduleback">
                                                    <div class="schedule2">
                                                        <div class="sleft">
                                            <%                                           
                                             }                                     
                                                if (show || showAll) {
                                                    if (showAll && !show) {
                                                    	classImg="simg2";
                                                    	classSinopsis = "scont1";

                                            %>
                                            <li>
                                                <div class="scheduleback">
                                                    <div class="schedule1">
                                                        <div class="sleft">
                                            <%}%>
                                                            <c:set var="fchIShow" value="<%= fchIShow%>"/>
                                                            <c:set var="fchFShow" value="<%= fchFShow%>"/>
                                                            <div class="sdate">
                                                            	<c:out value="${fchIShow}"/>-<c:out value="${fchFShow}"/>
                                                            	<br/>                                                                            	
                                                            </div>
                                                        </div>
                                                        <div class="sright">
                                                            <div class="<%= classImg %> <% if(isDesktop){ %> desktop <%}%>"> <a href="<%= urlMultimedia %>" class="her">
                                                            	<x:set var="ft" select="$programaDiaXML/foto"/>
	                                                        <c:set var="fto">
	                                				<x:out select="$ft"/>
	                            				</c:set>
	                            				<%
	                            					String foto = (String)pageContext.getAttribute("fto");
	                            					if(foto == null || foto.equals("") || foto.equals("0")|| foto.equals("1")){
	                            						foto = "bannerGenerico.jpg";
	                            					}
	                            				%>
                                                               <x:set var="np" select="$programaDiaXML/nombre"/>
	                                                        <c:set var="nombreP">
	                                				<x:out select="$np"/>
	                            				</c:set>      
	                            				<%
	                            					String nombrePrograma = (String)pageContext.getAttribute("nombreP");                        					
                                 
                                                                           nombrePrograma = nombrePrograma.replaceAll("Ã", "Ñ");
                                                                         		
	                            				%>            
                                                            	<img src="/arte/grilla/banners/<%=foto%>" alt="<%=nombrePrograma%>" title="<%=nombrePrograma%>" style="heigth:auto !important;"></a>
                                                            </div>
                                                            
                                                            <div class="stitle" style="min-width:235px;">
                                                            
                                                             <a class="her" href="<%= urlMultimedia %>"><%=nombrePrograma%></a>
                                                           
                                                            </div>
                                                            <div class="saut">
                                                            	<x:set var="con" select="$programaDiaXML/conductor"/>
	                                                        <c:set var="conductor">
	                                				<x:out select="$con"/>
	                            				</c:set>
	                            				<%
	                            					String withConductor = (String)pageContext.getAttribute("conductor");
	                            					if(withConductor != null && !withConductor.equals("") ){
	                            					%> with <%= withConductor %> <%
	                            					}
	                            				%>
                                                            </div>
                                                                                                                     
                                                            
                                                            <div class="<%=classSinopsis%><% if(isDesktop){ %> desktop <%}%>" style="min-width:300px;">
                                                            	<x:set var="sinp" select="$programaDiaXML/sinopsis"/>
	                                                        <c:set var="sinop">
	                                				<x:out select="$sinp"/>
	                            				</c:set>
	                            				<%
	                            					String sinopsis = (String)pageContext.getAttribute("sinop");
	                            					if(sinopsis == null && sinopsis.equals("")){	                            						
	                            						sinopsis = "The description could not be loaded.";
	                            					} 
	                            					 sinopsis = sinopsis.replaceAll("NÌ", "Ñ");
	                            					 sinopsis = sinopsis.replaceAll("â", "'");                        					
	                            				%>
	                            					<%= sinopsis %>
                                                            </div>
                                                            
                                                            <div class="sextra <% if(isDesktop){ %> desktop <%}%>" style="min-width:235px;">
                                                            	<x:set var="exc" select="$programaDiaXML/exclusivo"/>
	                                                        <c:set var="exclusivo">
	                                				<x:out select="$exc"/>
	                            				</c:set>
	                            				<%
	                            					String isExclusivo = (String)pageContext.getAttribute("exclusivo");
	                            					if(isExclusivo != null && isExclusivo.equals("true") ){
	                            					%> <img src="/arte/grilla/telexcl.png" style ="width:130px !important; height:17px !important;" alt="exclusivo" title="Exclusivo de teleSUR"> <%
	                            					}
	                            				%>
                                                            	
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <%
                                                }
                                                show = false;
                                                isDesktop = false;

                                                } catch (Exception e) {
                    			    %>
                    			    	<li>
	                    			    <div class="cont"> 
							<div class="error">
								<div class="txtaviso">
	                                            			Ah Ocurrido un error con el sitio!
	                                            		</div>
							</div>
						    </div>
						</li>
                                            <% 
                                                }
                                                contG++;
                                            %>    
												
                                        </x:forEach>

                                        <%
                                        	if(contG <= 1 && cont == 0){
                                        %>
		                                      <li>
		                                        <div class="cont"> 
								<div class="error">
									<div class="txtaviso">
							                 	No programs will be transmitted for this hours!		
							        	</div>
								</div>
							</div>
						     </li>
                                        	
                                        <%
                                        	}
                                        %> 
                                        <li>
                                            <div class="brschedule">
                                                <!--<div class="txlefts"> <a href="javascript:send('<%=d1%>','true', '<%= defaultTimeZone %>');" style="cursor:pointer" class="btndowns desktop">View all Programs of this Day</a> <a href="#" class="btndowns Mobile"> &lt; Yesterday</a> </div>-->
                                                <div class="txrights"> <a href="#" class="btndowns desktop">View Program Website</a> <a href="#" class="btndowns Mobile">Tomorrow &gt;</a> </div>
                                            </div>
                                        </li>
                                        </ul>
                          </div>
                  </div>