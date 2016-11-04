<%@ include file="TS_Common_Libraries.jsp" %>
<%
String link = (request.getParameter("link") == null ) ? "" : request.getParameter("link") ;
String titulo = (request.getParameter("titulo") == null ) ? "" : request.getParameter("titulo") ;
%>
<!-- JHAV <%=titulo%> -->
<div class="addthis_toolbox addthis_default_style addthis_16x16_style" addthis:title='<%=titulo%>' addthis:url="http://www.telesurtv.net<%=link%>" >
</div>

<script type="text/javascript">var addthis_share = { url_transforms : { shorten: { twitter: 'bitly'} }, shorteners : { bitly : {login:'telesur',apiKey:'R_8925c37a76786f9a5620d8c3f0f9e65c'} }}</script>
<script type="text/javascript">var addthis_config = {"data_track_clickback":false};</script>


<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5526cf194ef5933c" async="async"></script>
