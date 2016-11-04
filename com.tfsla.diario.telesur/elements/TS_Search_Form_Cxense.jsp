<%
    /**
    *  Search Form
    *
    *
    */
%>

<%@ include file="TS_Common_Libraries.jsp" %>
<%
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);

String search_form = ( request.getParameter("search_form") != null ) ? request.getParameter("search_form") : "";
String b = ( request.getParameter("parameter") != null ) ? request.getParameter("parameter") : "";
String filter_form = ( request.getParameter("filter_form") != null ) ? request.getParameter("filter_form") : "";
String published_form = ( request.getParameter("published_form") != null ) ? request.getParameter("published_form") : "";
String section_form = ( request.getParameter("section_form") != null ) ? request.getParameter("section_form") : "";
%>
<div class="blueBar redbg">
	<form name="buscador" class="formSearch1" action="/busquedaAvanzada.html" method="post">    	
		<div class="wrapper wrapadvanced">
			<div class="row clear">
				<div class="col">
					<div class="cont">
	
						<div class="contesel change1 changeadvanced" >
							<div class="filasel" >
								<div class="txtsel">Buscar:</div>
								<input type="text" name="search_form" value="<%=search_form %>" class="contsearch1" id="parameter" placeholder="Introduzca la busqueda..."> 
								<input id="subscribe" class="Mobile" type="submit" value="Buscar" name="submit">
							</div>
						</div>
						
						<div class="contesel" id="ocultarfiltro">
							<div class="filasel"></div>
						</div>
	
                                            <div class="contesel  sclear" id="ocultarfiltro2" >
							<div class="filasel"></div>
					     </div>
	
                                            <div class="contesel change2"  >
							<div class="filasel" id="ocultarfiltro3" ></div>
								<div class="desktop">
									
									<input type="button" id="buscar" class="subscribeSearch btn-click advanced" value="Busqueda Avanzada">  
								</div>
							</div>
						</div>
						
						
	
					</div>
				</div>
			</div>
		</div>
		
	</form>
</div>



<script type="text/javascript">
    var valor="";
        if($("#published").data('val')!=""){
            valor = $("#published").data('val')
            $("#published option[value="+ valor +"]").attr("selected",true);        
        }
    valor="";
        if($("#filter").data('val')!=""){
            valor = $("#filter").data('val')
            $("#filter option[value="+ valor +"]").attr("selected",true);        
        }
    valor="";
        if($("#section").data('val')!=""){
            valor = $("#section").data('val')
            $("#section option[value="+ valor +"]").attr("selected",true);        
        }        
</script>