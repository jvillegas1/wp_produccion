<%
boolean useStreamingPpal = false;
String urlStreaming = null;
if (useStreamingPpal) {
urlStreaming = "http://mbliveocasional.telesur.ultrabase.net/";
} else {
urlStreaming = "http://mbliveecbackup.telesur.ultrabase.net/";
}
%><iframe width="100%" height="395" align="middle" frameborder="0" mozallowfullscreen="" webkitallowfullscreen="" allowfullscreen="" id="envivoid" name="envivo" src="<%=urlStreaming%>"></iframe>