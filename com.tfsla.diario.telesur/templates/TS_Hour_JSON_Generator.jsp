<%@page import="java.util.Calendar"%>
<%@page import="net.sf.json.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	try {
		String meses[] = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
		String dias[] = {"DOMINGO", "SABADO", "LUNES", "MARTES", "MIERCOLES", "JUEVES", "VIERNES"};
	
		Calendar cal = Calendar.getInstance(); 
	    	Map map = new HashMap();
	    	map.put("dia_Semana", dias[cal.get(Calendar.DAY_OF_WEEK)]);  
		map.put( "dia", cal.get(Calendar.DAY_OF_MONTH) );  
		map.put( "mes", meses[cal.get(Calendar.MONTH)] );  
		map.put( "ano", cal.get(Calendar.YEAR) ); 		  
		JSONObject jsonObject = JSONObject.fromObject( map ); 
		response.getOutputStream().print(new String(jsonObject.toString().getBytes("UTF-8"), "UTF-8"));							
		
	} catch (Exception e) {
	%>IOException<%
	}
		
%>