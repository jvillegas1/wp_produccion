<%@ include file="TS_Common_Libraries.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.TimeZone"%>
<%@page import ="java.util.ArrayList"%>
<%@page import ="java.util.List"%>
<html>
<head>
	<script>
            function send(sdia, all) {
                window.location.href = "TS_ShowPage_teleSUR.jsp?day=" + sdia + "&all=" + all;
            }
        </script>
</head>
<body>
 <div id="container">
            <div class="wrapper">
                <c:import var="programacion" url="http://telesur.cms-medios.com/xml/parrilla.xml"/>

                <x:parse xml="${programacion}" var="output"/>
                   <%                    
			String d1 = "";
			String dias[] = {"domingo", "lunes", "martes", "miercoles", "jueves", "viernes", "sabado"};
			String meses[] ={"ENE", "FEB", "MAR", "ABR", "MAY", "JUN", "JUL", "AGO", "SEP", "OCT", "NOV", "DIC"};
			String today = "";
			String timeZone = "America/Caracas";
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			today = dias[cal.get(Calendar.DAY_OF_WEEK) - 1];
			
			/* Busco en el request si viene la variable day*/
			if (request.getParameter("day") != null) {
				d1 = (String) request.getParameter("day");
			} else {
				d1 = today;
			}
			
			if (request.getParameter("timezone") != null) {
				timeZone = (String) request.getParameter("timezone");
			}
			
			boolean showAll = false;
			if (request.getParameter("all") != null) {
				if (((String) request.getParameter("all")).equals("true")) {
			    	showAll = true;
				}
			}
			
			boolean thereIsNow = false;
			boolean thereIsNext = false;
			boolean thereIsLater = false;
			boolean isToday = false;
			boolean show = false;
			int cont = 0;
			
			if (d1.equals(today)) {
			isToday = true;
			}
			
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

                <c:set var="d" value="<%=d1%>" />
                <!--Guardar el nodo del dia actual-->
                <x:set var="diaXML"  select="$output/root/semana/*[name()=$d]" />
                
                	
                <div id="grilla">    
                <div class="row clear">
                    <div class="col">
                        <div class="topsche">
                            <div class="toplsch cont"> <img src="images/telesurazul.png" width="309" height="35" alt=""> </div>
                            <div class="toprsch cont"> Time Zone
                                <select class="sel1" id="select1">
                                    <option>EST</option>
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
                                    <a href="javascript:send('lunes','false');"<% if (today.equals("lunes") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("lunes") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("lunes")) {%> class="selected">Lunes <% } else {%> >Lunes<%}%>
                                    <%
                                    cal.setTime(fechas.get(0));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('martes','false');" <% if (today.equals("martes") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("martes") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("martes")) {%> class="selected">Martes <% }else{%> >Martes<%}%>
                                    <%
                                    cal.setTime(fechas.get(1));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('miercoles','false');"<% if (today.equals("miercoles") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("miercoles") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("miercoles")) {%> class="selected">Miercoles <% }else{%> >Miercoles<%}%>
                                    <%
                                    cal.setTime(fechas.get(2));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('jueves','false');"<% if (today.equals("jueves") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("jueves") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("jueves")) {%> class="selected">Jueves <% }else{%> >Jueves<%}%>
                                    <%
                                    cal.setTime(fechas.get(3));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('viernes','false');"<% if (today.equals("viernes") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("viernes") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("viernes")) {%> class="selected">Viernes <% }else{%> >Viernes<%}%>
                                    <%
                                    cal.setTime(fechas.get(4));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('sabado','false');"<% if (today.equals("sabado") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("sabado") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("sabado")) {%> class="selected">Sabado <% }else{%> >Sabado<%}%>
                                    <%
                                    cal.setTime(fechas.get(5));                                    
                                    %>
                                    <%= meses[cal.get(Calendar.MONTH)]+" " %>
                                    <%= cal.get(Calendar.DAY_OF_MONTH)+"" %>
                                    </a>
                                    </a>
                                </li>
                                <li class="desktop">
                                    <a href="javascript:send('domingo','false');"<% if (today.equals("domingo") && d1.equals(today)) { %>class="selected">Today<%} else if(today.equals("domingo") && !d1.equals(today)) { %>>Today<%}else if(d1.equals("domingo")) {%> class="selected">Domingo <% }else{%> >Domingo<%}%>
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
                <div class="cont">
                    <ul style="display: block;">	
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
                                    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
                                    String now = sdf.format(new Date());
                                    String classImg = "simg1";

                                    Calendar calendar = new GregorianCalendar();
                                    TimeZone tz = TimeZone.getTimeZone(timeZone);
                                    calendar.setTimeZone(tz);
                                    sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
                                    calendar.setTime(sdf.parse(((String) pageContext.getAttribute("fchIni"))));

                                    String fchI = sdf.format(calendar.getTime());
                                    fchI = fchI.substring(11);
                                    String fchIShow = fchI.substring(0, 5);
                                    fchI = fchI.replaceAll(":", "");
                                    fchI = fchI.substring(0, 4);

                                    calendar.setTime(sdf.parse(((String) pageContext.getAttribute("fchFin"))));
                                    String fchF = sdf.format(calendar.getTime());
                                    fchF = fchF.substring(11);
                                    String fchFShow = fchF.substring(0, 5);
                                    fchF = fchF.replaceAll(":", "");
                                    fchF = fchF.substring(0, 4);
                                    now = now.replaceAll(":", "");
                                    long ini = Long.parseLong(fchI);
                                    long fin = Long.parseLong(fchF);
                                    long n = Long.parseLong(now);
                                     if(n > ini && !isToday && cont < 5 && !showAll){                                      
                                        show = true;
                                        cont++;
                                        classImg="simg2";
                                        %>
                            <li>
                                <div class="scheduleback">   
                                    <div class="schedule1">
                                        <div class="sleft">
                                        <%
                                    }else if (!thereIsNow && (n >= ini && n <= fin) && cont < 5) {
                                        thereIsNow = true;
                                        show = true;
                                        cont++;
                                        classImg="simg1";
                            %>
                            <li>
                                <div class="scheduleback">   
                                    <div class="schedule1">
                                        <div class="sleft">
                                            <% if (isToday) { %>  <div class="swhen act">Now</div> <%}%> 
                                            <%
                                            } else if (!thereIsNext && (n < ini)&& cont < 5) {
                                                thereIsNext = true;
                                                show = true;
                                                cont++;
                                                classImg="simg1";
                                            %>
                                            <li>
                                                <div class="scheduleback">  
                                                    <div class="schedule1">
                                                        <div class="sleft">
                                                            <% if (isToday && !showAll) { %> <div class="swhen desktop">Next</div> <%}%> 
                                                            <%
                                                            } else if (!thereIsLater && (n < ini) && cont < 5) {
                                                                thereIsLater = true;
                                                                show = true;
                                                                cont++;
                                                                classImg="simg2";
                                                            %>
                                                            <li>
                                                                <div class="scheduleback">  
                                                                    <div class="schedule1">
                                                                        <div class="sleft">
                                                                            <% if (isToday && !showAll) { %><div class="swhen">Later</div><%}%> 
                                                                            <%
                                                                            } else if (n < ini && (cont < 5 || showAll)) {
                                                                                show = true;
                                                                                cont++;
                                                                                classImg="simg2";
                                                                            %>
                                                                            <li>
                                                                                <div class="scheduleback">
                                                                                    <div class="schedule2">
                                                                                        <div class="sleft">
                                                                                            <%
                                                                                                }
                                                                                            %>

                                                                                            <%
                                                                                                if (show || showAll) {
                                                                                                    if (showAll && !show) {

                                                                                            %>
                                                                                            <li>
                                                                                                <div class="scheduleback">
                                                                                                    <div class="schedule2">
                                                                                                        <div class="sleft">
                                                                                                            <%}%>
                                                                                                            <c:set var="fchIShow" value="<%= fchIShow%>"/>
                                                                                                            <c:set var="fchFShow" value="<%= fchFShow%>"/>
                                                                                                            <div class="sdate"><c:out value="${fchIShow}"/>-<c:out value="${fchFShow}"/></div>
                                                                                                        </div>
                                                                                                        <div class="sright">
                                                                                                            <div class="<%= classImg %> desktop"> <a href="#" class="her"><img src="<x:out select="$programaDiaXML/foto"/>" width="301" height="169" alt=""></a></div>
                                                                                                            <div class="stitle"> <a href="#" class="her"><x:out select="$programaDiaXML/nombre"/></a> </div>
                                                                                                            <div class="saut"></div>
                                                                                                            <div class="scont desktop"><x:out select="$programaDiaXML/sinopsis"/></div>
                                                                                                            <div class="sextra desktop"> </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <%
                                                                                                }
                                                                                                show = false;
                                                                                                } catch (Exception e) {}
                                                                                            %>    

                                                                                        </x:forEach> 
                                                                                        <li>
                                                                                            <div class="brschedule">
                                                                                                <div class="txlefts"> <a href="javascript:send('<%=d1%>','true');" style="cursor:pointer" class="btndowns desktop">View Full Day schedule in TV Listings</a> <a href="#" class="btndowns Mobile"> &lt; Yesterday</a> </div>
                                                                                                <div class="txrights"> <a href="#" class="btndowns desktop">See show websites</a> <a href="#" class="btndowns Mobile">Tomorrow &gt;</a> </div>
                                                                                            </div>
                                                                                        </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
</body>
</html>
   
   