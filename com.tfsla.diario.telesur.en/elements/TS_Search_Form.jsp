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
String filter_form = ( request.getParameter("filter_form") != null ) ? request.getParameter("filter_form") : "";
String published_form = ( request.getParameter("published_form") != null ) ? request.getParameter("published_form") : "";
String section_form = ( request.getParameter("section_form") != null ) ? request.getParameter("section_form") : "";
%>
<div class="blueBar redbg">
	<form name="buscador" class="formSearch1" action="/english/search.html" method="post">    	
		<div class="wrapper">
			<div class="row clear">
				<div class="col">
					<div class="cont">
	
						<div class="contesel change1" >
							<div class="filasel" >
								<div class="txtsel">Search:</div>
								<input type="text" name="search_form" value="<%=search_form %>" class="contsearch1" id="parameter" > 
								<input id="subscribe" class="Mobile" type="submit" value="Search" name="submit" style="background-color:#661B1B">
							</div>
						</div>
						
						<div class="contesel" id="ocultarfiltro">
							<div class="filasel">
								<div class="txtsel">Filter by:</div>
								<select class="sel" id="filter" data-val="<%=filter_form %>" name="filter_form">
									<option value="" >All media results</option>
									<option value="latinaamerica" >Latin America</option>
									<option value="world" >World</option>
									<option value="sport" >Sport</option>
									<option value="culture" >Culture</option>
									<option value="webspecial" >Web Special</option>
									<option value="infographics" >Infographics</option>
									<option value="games" >Games</option>
									<option value="galleries" >Galleries</option>
									<option value="articles" >Articles</option>
									<option value="interviews" >Interviews</option>
									<option value="context" >Context</option>                  
								</select>
							</div>
						</div>
	
                                            <div class="contesel  sclear" id="ocultarfiltro2" >
							<div class="filasel">
								<div class="txtsel">Published:</div>
								<select class="sel" id="published" data-val="<%=published_form %>" name="published_form" >
									<option value="" >All dates</option>                            
									<option value="7d" >Past Week</option>                                                          
									<option value="30d" >Past Month</option>
									<option value="1y" >Past Year</option>
								</select>
							</div>
						</div>
	
                                            <div class="contesel change2"  >
							<div class="filasel" id="ocultarfiltro3" >
								<div class="txtsel">Section:</div>
								<select class="sel change3" id="section" data-val="<%=section_form %>" name="section_form" >
									<option value="" >All sections</option>
									<option value="soyreportero" >You're the Reporter</option>
									<option value="news" >News</option>
									<option value="videos" >Videos</option>
									<option value="multimedia" >Multimedia</option>
									<option value="opinion" >Opinion</option>
									<option value="blog" >Blogs</option>
									<option value="joinus" >Join Us</option>
									<option value="shows" >Shows</option>
									<option value="telesur_agenda" >teleSUR Agenda</option>                              
								</select>
								</div>
								<div class="desktop">
									<div id="ocultarfiltro4">	
										<input id="subscribe" type="submit" class="subscribeSearch" value="Search" name="submit">
									</div>
								</div>
							</div>
						</div>
						
						
	
					</div>
				</div>
			</div>
		</div>
		
	</form>
</div>
<!--Form Cxense Search -->

<div class="blueBar redbg">
	<form name="form2" method="post" class="formSearch1" action="/english/searchAdvanced.html"> 	
		<div class="wrapper">
			<div class="cont">
				<input type="hidden" name="search_form" value="" onkeyup="buscador.search_form.value=form2.search_form.value"> 
				<input type="submit" id="buscar"  name="submit" class="subscribeSearch" value="Advanced Search " onclick="document.form2.search_form.value=document.buscador.search_form.value">
			</div>	
		</div>
	</form>
</div>

<!--Fin Form Cxense Search-->
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