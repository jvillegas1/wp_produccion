<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html>
<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
	<cms:param name="template">article</cms:param>
	</cms:include>

<title>Response Headers</title>

</head>
<body>
<p>
Aqui van las cabeceras
</p>

<p>
wait for it........
</p>


<h2>
tiempo actual es:
</h2>
<p>
<% out.println((new java.util.Date()).toString()); %>
</p>
<%=format_daynumber.format(now)%> <%=format_month.format(now)%>
<p>
Respo Headers gruiz escribió esto ashoritaq
</p>
<script type="text/JavaScript">
var geturl;

 geturl = $.ajax({
    type: "GET",
    url: 'http://www.telesurtv.net',
    success: function () {

       var geoip = geturl.getResponseHeader ("X-Planisys-CDN-geoip");
            console.log("X-Planisys-CDN-geoip: " + geoip);
          var pais = geoip.substring(geoip.length - 2, geoip.length);  
          
          console.log("X-Planisys-CDN-geoip: " + pais);
    }
  });
</script>


</body>
</html>