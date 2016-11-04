<%
boolean useStreamingPpal = true;
String urlStreaming = null;
if (useStreamingPpal) {
urlStreaming = "http://mblive.telesur.ultrabase.net";
//Player EC
//urlStreaming = "http://mbliveec.telesur.ultrabase.net/";
} else {
urlStreaming = "http://telesur.movipbox.com";
}
%><iframe width="100%" height="395" align="middle" frameborder="0" mozallowfullscreen="" webkitallowfullscreen="" allowfullscreen="" id="envivoid" name="envivo" src="<%=urlStreaming%>"></iframe>