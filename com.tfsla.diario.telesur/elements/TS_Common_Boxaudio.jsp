<%@ include file="TS_Common_Libraries.jsp" %>
<%
String path = ( request.getParameter("path") != null ) ? request.getParameter("path") : "";
%>
<article itemscope itemtype="http://schema.org/Article">
	<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
				<a href="/SubSecciones/audio/blog/index.html" title="${imageDescription}" alt="${imageDescription}">	
					<meta itemprop="description" content='${imageDescription}'>
					<img  src="arte/grey.gif" data-original="/arte/audio/Banner-Blog.jpg" width='306' height='172' alt="teleSUR" />
				</a>
		</div>
</article>
	<article itemscope itemtype="http://schema.org/Article">
		<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
				<a href="/SubSecciones/audio/best/index.html" title="${imageDescription}" alt="${imageDescription}">	
					<meta itemprop="description" content='${imageDescription}'>
					<img  src="arte/grey.gif" data-original="/arte/audio/Banner-Mejor.jpg" width='306' height='172' alt="teleSUR" />
				</a>
		</div>
</article>
	<article itemscope itemtype="http://schema.org/Article">
	<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject">
				<a href="/SubSecciones/audio/telesur_noticias/index.html" title="" alt="">	
					<meta itemprop="description" content='${imageDescription}'>
					<img src="arte/grey.gif" data-original="/arte/audio/Banner-Audio.jpg" width='306' height='172' alt="teleSUR" />
				</a>
		</div>
</article>