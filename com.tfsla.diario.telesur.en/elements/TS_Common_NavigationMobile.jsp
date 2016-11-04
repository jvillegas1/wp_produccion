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
				<li><a href="/en/index.html" class="her" alt="Home" title="Home">Home</a></li>
				
				<% if ( name.equals("News") ) { %>	
					&gt; <li><a href="/en/section/news" class="her" alt="News" title="News">News</a></li>
				<% } %>
				<% if ( name.equals("NewsCategory") || name.equals("Country") ) { %>	
					&gt; <li><a href="/en/section/news" class="her" alt="News" title="News">News</a></li>
					
					&gt; <li><a class="her" alt="<%=titulo%>" title="<%=titulo%>"><%=titulo%></a></li>
				<% } %>
				<% if ( name.equals("Search") ) { %>	
					&gt; <li><a class="her" alt="Search" title="Search">Search</a></li>
				<% } %>
				<% if ( name.equals("Blog") ) { %>	
					&gt; <li><a href="/en/section/blog" class="her" alt="Blog" title="Blog">Blog</a></li>
				<% } %>
				<% if ( name.equals("Opinion") ) { %>	
					&gt; <li><a class="her" alt="Opinion" title="Opinion">Opinion</a></li>
				<% } %>
				<% if ( name.equals("Multimedia") ) { %>	
					&gt; <li><a class="her" alt="Multimedia" title="Multimedia">Multimedia</a></li>
				<% } %>	
				<% if ( name.equals("JoinUs") ) { %>	
					&gt; <li><a class="her" alt="Join Us" title="Join Us">Join Us</a></li>
				<% } %>	
				<% if ( name.equals("Reporter") ) { %>	
					&gt; <li><a href="/en/section/imreporter" class="her" alt="You're the Reporter" title="You're the Reporter">You're the Reporter</a></li>
				<% } %>					
			</ul>
		</div>
	</div>
</div>