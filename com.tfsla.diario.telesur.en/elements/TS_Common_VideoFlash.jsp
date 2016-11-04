<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="org.opencms.jsp.CmsJspActionElement" %>
<%@ page import="org.opencms.jsp.CmsJspNavElement" %>
<%@ page import="org.opencms.file.CmsFile" %>
<%@ page import="org.opencms.file.CmsObject" %>
<%@ page import="org.opencms.file.CmsResource" %>


<%
Random generator = new Random();

int r = (request.getParameter("r") != null ) ? Integer.parseInt(request.getParameter("r")) : generator.nextInt(99999);
String paths = request.getParameter("video");
paths = paths.replaceAll(",,",",-,");

String imagen = request.getParameter("imagen");
String width = request.getParameter("width");
String height = request.getParameter("height");
String autoplay = request.getParameter("autoplay") != null ? request.getParameter("autoplay") : "false";
String titulo = request.getParameter("titulo");

paths = paths.replaceAll(",,",",-,");
paths = paths.replaceAll(",;",",-;");
paths = paths.replaceAll(";,",";-,");

if ( paths.substring(paths.length()-1).equals(",")  )
	paths += "-";
	
String[] videos = paths.split(";");
String[] onevideo = videos[0].split(",");


CmsJspActionElement action = new CmsJspActionElement(pageContext, request, response);
String template = action.getCmsObject().getRequestContext().getUri();
%>

<div id="video-<%=r%>"></div>
<script type="text/javascript">
	jwplayer("video-<%= r %>").setup({
		flashplayer: "/system/modules/com.tfsla.diario.telesur/resources/jwplayer/player.swf",
		<% if ( videos.length == 1 ){ %>
			<% if ( !onevideo[2].equals("-") ){ %>
			title: '<%=onevideo[2]%>', 
			<% } %>
			<% if ( !onevideo[1].equals("-") ){ %>
			image: "<%=onevideo[1]%>",
			<% } %>
			file: "<%=onevideo[0]%>",
		<% }else{ %>		
			playlist: [
			<% for (int i = 0; i < videos.length; i++) { 
				String[] video = videos[i].split(",");
			%>
			{				
				<% if ( !video[1].equals("-") ){ %>
			        image: "<%=video[1]%>",
			        <% } %>
				<% if ( !video[1].equals("-") ){ %>
				title: '<%=video[2]%>', 
				<% } %>
			        file: "<%=video[0]%>"
			},
			<% } %>
			],								
		<% } %>
		width:	"<%=width %>",
		height: "<%=height %>",
		controls: 'true',
		controlbar: 'over',
		aspectratio: '16:9', 
		fallback: 'false', 
		primary: 'html5', 
		stretching: 'fill', 
		autostart: '<%=autoplay%>',
		ga: '{}',
		wmode : "transparent"	
	});
	<% if (template.equals("/index.html")) { %>
		jwplayer("video-<%= r %>").onPlay(function(){		    
			$('#caption-<%= r %>').fadeOut('fast');
			JWPlay( "video-<%= r %>" );
		});
		jwplayer("video-<%= r %>").onPause(function(){
			$('#caption-<%= r %>').fadeIn('fast');
			JWPause( "video-<%= r %>" );   	
		});
		jwplayer("video-<%= r %>").onComplete(function(){
			JWPause( "video-<%= r %>" );
		});
	<% } %>
</script>