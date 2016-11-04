<%@ include file="TS_Common_Libraries.jsp" %>

<%
String name = (request.getParameter("name") == null ) ? "" : request.getParameter("name") ;
String titulo = (request.getParameter("titulo") == null ) ? "" : request.getParameter("titulo") ;
%>


<div class="barratitle" style="margin-top:-15px">
	<div class="wrapper">
		<div class="row clear">
			<div class="col">
				<div class="titredbar"> <%=titulo%> </div>
			</div>
		</div>
	</div>
</div>
<div class="bread">
	<div class="row clear">
		<div class="col">
			<ul>
				<li><a href="/index.html" class="her" alt="Home" title="Home">Home</a></li>
				
				<% if ( name.equals("Noticias") ) { %>	
					&gt; <li><a href="/seccion/news" class="her" alt="Noticias" title="Noticias">Noticias</a></li>
				<% } %>
				<% if ( name.equals("NewsCategory") || name.equals("Country") ) { %>	
					&gt; <li><a href="/seccion/news" class="her" alt="Noticias" title="Noticias">Noticias</a></li>
					
					&gt; <li><a class="her" alt="<%=titulo%>" title="<%=titulo%>"><%=titulo%></a></li>
				<% } %>
				<% if ( name.equals("Buscar") ) { %>	
					&gt; <li><a class="her" alt="Buscar" title="Buscar">Buscar</a></li>
				<% } %>
				<% if ( name.equals("Blog") ) { %>	
					&gt; <li><a href="/seccion/blog" class="her" alt="Blog" title="Blog">Blog</a></li>
				<% } %>
				<% if ( name.equals("Opinión") ) { %>	
					&gt; <li><a class="her" alt="Opinión" title="Opinión">Opinión</a></li>
				<% } %>
				<% if ( name.equals("Multimedia") ) { %>	
					&gt; <li><a class="her" alt="Multimedia" title="Multimedia">Multimedia</a></li>
				<% } %>	
				<% if ( name.equals("Únete") ) { %>	
					&gt; <li><a class="her" alt="Únete" title="Únete">Únete</a></li>
				<% } %>	
				<% if ( name.equals("SoyReportero") ) { %>	
					&gt; <li><a href="/seccion/imreporter" class="her" alt="Soy Reportero" title="Soy Reportero">Soy Reportero</a></li>
				<% } %>					
			</ul>
		</div>
	</div>
</div>