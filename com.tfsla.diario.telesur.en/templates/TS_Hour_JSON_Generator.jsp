<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@page import="java.util.Calendar"%>
<%@page import="net.sf.json.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page pageEncoding="utf-8" %>


<%	
	try {
		String meses[] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
		String dias[] = {"SUNDAY ", "SATURDAY ", "MONDAY ", "TUESDAY ", "WEDNESDAY ", "THURSDAY ", "FRIDAY"};
	
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