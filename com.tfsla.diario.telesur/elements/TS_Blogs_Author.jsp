<%@ include file="TS_Common_Libraries.jsp" %>

<%   

String autor = (request.getParameter("autor") != null ) ? request.getParameter("autor") : "" ;
String filter_autor = (request.getParameter("filter_autor") != null ) ? request.getParameter("filter_autor") : "" ;       

if (autor.equals("")){ 
%>
	<select name="filter_autor" data-val="<%=filter_autor %>" class="sel" id="autor">
		<option value="" >Todos los autores</option>
		<nt:user-list order="name" group="Bloggers" >                            	
			<option value="<nt:user-name/>"><nt:user-firstname/> <nt:user-lastname/></option>
		</nt:user-list>                       	                             
	</select>
<% } else { %>
	<select name="filter_autor" data-val="<%=filter_autor %>" class="sel" id="autor">
		<nt:user-list order="name" group="Bloggers" country="<%=autor%>">                            	
			<option value="<nt:user-name/>"><nt:user-firstname/> <nt:user-lastname/></option>
		</nt:user-list>                       	                             
	</select>
<% } %>