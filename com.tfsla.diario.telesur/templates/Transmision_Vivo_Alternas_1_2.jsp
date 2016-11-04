<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<!doctype html>
<html>
<head>	
<title>teleSUR - Transmisiones en vivo</title>
<script type="text/javascript">
var cX = cX || {}; cX.callQueue = cX.callQueue || [];
cX.callQueue.push(['setSiteId', '9222352440756601877']);
cX.callQueue.push(['sendPageViewEvent']);
</script>
<script type="text/javascript">
(function() { try { var scriptEl = document.createElement('script'); scriptEl.type = 'text/javascript'; scriptEl.async = 'async';
scriptEl.src = ('https:' == location.protocol) ? 'https://scdn.cxense.com/cx.js' : 'http://cdn.cxense.com/cx.js';
var targetEl = document.getElementsByTagName('script')[0]; targetEl.parentNode.insertBefore(scriptEl, targetEl); } catch (e) {};} ());
</script>


<style>
	body{
	margin:0px;
	padding:0px;
	height:1000;
	top:0;
        left: 0;
	background-color:#DADADA;
	
	}

	table {
		background: url('/arte/transmisiones_en_vivo/Streaming-ENG-Lula-900x500.jpg') no-repeat;
		background-size: 900px 500px;
	}
	
	


</style>

</head>

<body>
	
<cms:include page="../elements/Transmision_Vivo_Alternas_1_2.jsp" />

</body>
</html>