<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="org.opencms.relations.CmsCategoryService,org.opencms.relations.CmsCategory,java.util.List,org.opencms.jsp.CmsJspActionElement"%>
<%   
//Traer categorias
CmsJspActionElement action = new CmsJspActionElement(pageContext, request, response);
String referencePath = action.getCmsObject().getRequestContext().getUri();
CmsCategoryService cService = new CmsCategoryService();

//Country
List<CmsCategory> countries = cService.readCategories(action.getCmsObject(),"/SubSecciones/en/country",false,referencePath);

//Property
org.opencms.jsp.CmsJspXmlContentBean cms = new
org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
String title = cms.property("Title");
String subSeccion = cms.property("subSeccion");
%>

<div class="col">
	<div class="rowInt ">
		<div class="headline cont">Headlines by country</div>
	    	
	    	<c:set var="i" value="0" />
	    	<% for (CmsCategory country : countries){ 
	    	String path = country.getPath().replaceAll("SubSecciones/en","english") ;
	    	%>


			        <div class="headlinecol listhead">
			            <ul>
			     
                		    <li class="forum <% if (country.getPath().replaceAll("SubSecciones/","").equals(subSeccion+"/")) { %> headsel <% } %>">
                		   	 <a href="/<%=path %>" class="her" alt="<%=country.getTitle()%>" title="<%=country.getTitle()%>"><%=country.getTitle()%></a>
                		    </li>		
			            </ul>
			        </div>			
				<div class="headlinecol listhead ">
			            <ul>		
			            </ul>
			        </div>			
				<div class="headlinecol listhead ">
			            <ul>
				    </ul>
			        </div>
			
	        <% } %>
	        
	</div>
</div>
