<%
boolean useStreamingPpal = true;
String urlStreaming = null;
if (useStreamingPpal) {
urlStreaming = "http://mblive.telesur.ultrabase.net/audioonly.php";
} else {
urlStreaming = "http://telesur.movipbox.com";
}
%><iframe width="100%" height="100%" align="middle" frameborder="0" mozallowfullscreen="" webkitallowfullscreen="" allowfullscreen="" id="envivoid" name="envivo" src="<%=urlStreaming%>"></iframe>