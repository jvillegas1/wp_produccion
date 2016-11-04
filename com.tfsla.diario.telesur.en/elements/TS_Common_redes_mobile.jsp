<%@ include file="TS_Common_Libraries.jsp" %>
<%
String link = (request.getParameter("link") == null ) ? "" : request.getParameter("link") ;
String titulo = (request.getParameter("titulo") == null ) ? "" : request.getParameter("titulo") ;
%>


<div class="a2a_kit a2a_kit_size_32 a2a_floating_style a2a_default_style" style="margin-left:20%;">
<a class="a2a_dd" href="https://www.addtoany.com/share_save?linkurl=http%3A%2F%2Fwww.telesurtv.net&amp;linkname=teleSUR"></a>
<a class="a2a_button_facebook"></a>
<a class="a2a_button_whatsapp"></a>
<a class="a2a_button_twitter"></a>
<a class="a2a_button_google_plus"></a>
</div>
<script type="text/javascript">
var a2a_config = a2a_config || {};
a2a_config.linkname = '<%=titulo%>';
a2a_config.track_links = 'bitly';
a2a_config.track_links_key = 'telesur|R_8925c37a76786f9a5620d8c3f0f9e65c'; 
a2a_config.linkurl = "http://www.telesurtv.net<%=link%>";
a2a_config.locale = "es";
</script>
<script type="text/javascript" src="//static.addtoany.com/menu/page.js"></script>