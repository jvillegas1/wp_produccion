<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<head>
<base target="_parent" />
<script src="<cms:link>../resources/js/jquery.responsiveiframe.min.js</cms:link>"></script>
<script>
  var ri = responsiveIframe();
  ri.allowResponsiveEmbedding();
</script>
     <cms:include page="../elements/TS_Common_Head.jsp" >
   <cms:param name="template">home</cms:param>
  </cms:include> 
</head>

	<cms:include page="../elements/TS_Common_SoloHeader.jsp" >
		<cms:param name="pageTitle">Ciudadano</cms:param>
		<cms:param name="pageSeccion">ciudadano</cms:param>
		<cms:param name="agenda">no</cms:param>
		<cms:param name="subMenu">no</cms:param>
		<cms:param name="latest">no</cms:param>       
	</cms:include>      


<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/tabs.min.jquery.js</cms:link>"></script>
