<%@ include file="TS_Common_Libraries.jsp" %>

<%   
System.out.println(request.getParameter("autor"));

String autor = (request.getParameter("autor") != null ) ? request.getParameter("autor") : "" ;
String filter_autor = (request.getParameter("filter_autor") != null ) ? request.getParameter("filter_autor") : "" ;       



if (autor.length() == 0){ 
%>
	<select name="filter_autor" data-val="<%=filter_autor %>" class="sel" id="autor" style="width:130px">
		<option value="0" id="default" >By author</option>
		<nt:user-list order="name" group="Articulista" >                            	
			<option value="<nt:user-name/>"><nt:user-firstname/> <nt:user-lastname/></option>
		</nt:user-list>                       	                             
	</select>
<% } else { %>
	<select name="filter_autor" data-val="<%=filter_autor %>" class="sel" id="autor" style="width:130px">
		<nt:user-list order="name" group="Articulista" country="<%=autor%>">  
		                          	
			<option value="<nt:user-name/>"><nt:user-firstname/> <nt:user-lastname/></option>
			
		</nt:user-list>                       	                             
	</select>
<% } %>