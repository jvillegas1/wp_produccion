<%@ include file="../elements/TS_Common_Libraries.jsp" %>


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
Aqui van cabeceras las que definen el país
</p>

<script type="text/JavaScript">
var geturl;
  geturl = $.ajax({
    type: "GET",
    url: 'http://www.telesurtv.net',
    success: function () {
      alert("done!"+ geturl.getResponseHeader("X-Planisys-CDN-geoip"));
    }
  });
</script>



</body>
</html>