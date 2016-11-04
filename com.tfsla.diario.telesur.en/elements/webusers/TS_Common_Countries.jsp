<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ page import="org.opencms.relations.CmsCategoryService,org.opencms.relations.CmsCategory,java.util.List,org.opencms.jsp.CmsJspActionElement"%>
<%   
//Traer categorias
CmsJspActionElement action = new CmsJspActionElement(pageContext, request, response);
CmsCategoryService cService = new CmsCategoryService();
String pais = (request.getParameter("pais") != null ) ? request.getParameter("pais") : "" ;
String referencePath = "/system/categories/usuarios/region/" ;
String categoryPath = "/usuarios/region/" ;
List<CmsCategory> subcategories = cService.readCategories(action.getCmsObject(),categoryPath,false, referencePath);
%>
<select class="selreg" id="select" name="pais" style="margin-bottom:0;margin-top:20px">
<% 	if ( pais.equals("") ) {  
%>
        	<option class="opt" value="">*Select</option>
<% 	} 
	for (CmsCategory subcategory : subcategories){  
	 	String select = (pais.indexOf(subcategory.getPath()) > -1 )  ? "selected" : "";
%>
			<option class="opt" value="/system/categories/<%=subcategory.getPath()%>" title="<%=subcategory.getTitle()%>" <%=select %> > <%=subcategory.getTitle()%></option>
<% 	
	} 
%>
</select>
