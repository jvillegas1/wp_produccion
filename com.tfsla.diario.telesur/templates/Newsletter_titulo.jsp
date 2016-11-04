<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>     
<nt:news-list advancedfilter="(category:/system/categories/SubSecciones/news/latinaamerica/ AND category:/system/categories/SubSecciones/newsletter/) OR category:/system/categories/SubSecciones/news/latinaamerica/" order="user-modification-date" size="1">
	<nt:title/>
</nt:news-list>       