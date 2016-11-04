<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
String path = (request.getParameter("path") != null ) ? request.getParameter("path") : ""; 
%>
<div id="iframeBox">
	<div class="wpClose" onclick="javascript:cerrarPopUp();	return false;" >
		<p style="float: left; padding:10px; display:inline-block; color:white">Title</p>
		<a href="#" class="close">
			<p style="float: right; padding:10px; display:inline-block; color:white">Close</p>
		</a> 
	</div>
	<div class="wpIframe">  
		<nt:polls-box url="<%=path%>" style="TS-EN/MULTIMEDIA-POPUP">
		</nt:polls-box> 
	</div>
</div>