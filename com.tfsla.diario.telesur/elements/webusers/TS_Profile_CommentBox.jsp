<%@include file="../TS_Common_Libraries.jsp" %>

<%
String path = request.getParameter("path"); 
String textComment = request.getParameter("textComment");
%>

<nt:news path="<%=path %>">

	<div class="news oculta" style="padding:3%; width:94%; background-color:#F6F6F6; margin-bottom:20px">
		<div class="txt-news">
			<div class="new-bajada" style="border-bottom:1px solid #ccc">
				<%=textComment %>
			</div>
			<div class="new-tit" style="padding:15px 0;">
				<a class="her" href="<nt:link/>">
					<h4><nt:title /></h4>
				</a>
			</div>
		<div class="blogrs" style="margin-top:0">
			<div class="gblogrs" style="margin:0">
				<div class="num">${news.commentcount}</div>
				<cms:img src="/arte/globe-red.png" width="31" height="27" alt="${news.commentcount}" title="${news.commentcount}" scaleColor="transparent"/> 
			</div>
				<%--<div class="fbblogrs"> <a href="#" class="likeblog">Like</a> 21 Likes </div>
				<div class="fbblogrs rojo sharblogrs">
				<div class="sharblogrs"> <a href="#" alt=""><img src="images/sharedblog.png" width="17" height="17" longdesc="#"></a> </div>
				34 </div> 
				--%>
			</div>
		</div>
	</div>
	
</nt:news>