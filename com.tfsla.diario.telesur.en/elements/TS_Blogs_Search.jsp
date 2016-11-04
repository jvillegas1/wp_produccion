<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="org.opencms.relations.CmsCategoryService,org.opencms.relations.CmsCategory,java.util.List,org.opencms.jsp.CmsJspActionElement"%>
<%   
//Traer categorias
CmsJspActionElement action = new CmsJspActionElement(pageContext, request, response);
String referencePath = action.getCmsObject().getRequestContext().getUri();
CmsCategoryService cService = new CmsCategoryService();

//Country
List<CmsCategory> countries = cService.readCategories(action.getCmsObject(),"/usuarios/region",false,referencePath);
	
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);

String display_search = (request.getParameter("display_search") != null ) ? request.getParameter("display_search") : "" ; 
String filter_pais = (request.getParameter("filter_pais") != null ) ? request.getParameter("filter_pais") : "" ; 
String filter_autor = (request.getParameter("filter_autor") != null ) ? request.getParameter("filter_autor") : "" ;       
String buscar_search = (request.getParameter("buscar_search") != null ) ? request.getParameter("buscar_search") : "" ;     
%>

<!-- blueBar -->  
<form method="POST" action="/english/section/blog" name="buscadorBlog" >
<div class="blogBar">
  <div class="wrapper">
      <div class="row clear">
          <div class="col">
              <div class="cont">
                  <div class="contesel">
                      <div class="filasel">
                          <div class="txtsel">Display Search:</div>
                          <select name="display_search" data-val="<%=display_search %>" class="sel" id="order">
                              <option value="LAST">Latest</option>
                              <option value="COME">Most Read</option>
                              <option value="COMP">Most Share</option>
                          </select>
                      </div>
                  </div>
                 <div class="contesel">
                      <div class="filasel">
                          <div class="txtsel">Authors:</div>
                          <cms:include page="TS_Blogs_Author.jsp"/>
                          <!-- <select name="filter_pais" data-val="<%=filter_pais%>" class="sel" id="pais" >
                          	<option value="" >All Countries</option>    
                          	<% for (CmsCategory country : countries){ %>
					<option value="/system/categories/<%=country.getPath()%>" >
						<% if( country != null && country.equals(country.getTitle())){out.print("selected");} %> <%=country.getTitle()%>					
					</option>
                              	<% } %>
                          </select> -->
                      </div>
                  </div>
                  <!--<div class="and">  and</div>
                  <div class="txtsel">Search By:</div>
                  <div class="contesel">
                      <div class="filasel" id="filasel">
                       		<cms:include page="TS_Blogs_Author.jsp"/>	   
                      </div>
                  </div>-->
                  <div class="contesel">
                      <div class="filasel">
                          <div class="txtsel">Search:</div>
                          <form method="post">
                              <input type="text" name="buscar_search" value="<%=buscar_search %>" class="contsearch">  
                              <input id="subscribe" type="submit" value="Search" name="submit"></form>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
</div>
</form>
<script type="text/javascript">	
$(document).ready(function(){	
	
	$('#pais').on('change',function(e){
		e.preventDefault();
		cambiaAutor();	
	});
	var myselect = document.getElementById("pais");
	function cambiaAutor(){
		$.post("/system/modules/com.tfsla.diario.telesur/elements/TS_Blogs_Author.jsp",
			{ 
			autor: myselect.options[myselect.selectedIndex].value,
			}, function(data){
			$('#filasel').html(data);
		});
	}
			
});
</script>
<!-- fin blueBar -->  
<script type="text/javascript">
    var valor="";
        if($("#order").data('val')!=""){
            valor = $("#order").data('val')
            $("#order option[value="+ valor +"]").attr("selected",true);        
        }
    valor="";
        if($("#autor").data('val')!=""){
            valor = $("#autor").data('val')
            $("#autor option[value="+ valor +"]").attr("selected",true);        
        }
    valor="";
        if($("#pais").data('val')!=""){
            valor = $("#pais").data('val')
            $("#pais option[value="+ valor +"]").attr("selected",true);        
        }        
</script>