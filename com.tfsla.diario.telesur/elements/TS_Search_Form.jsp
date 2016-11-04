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
	<form name="buscador" class="formSearch1" action="/buscar.html" method="post">    	
		<div class="wrapper">
			<div class="row clear">
				<div class="col">
					<div class="cont">
	
						<div class="contesel change1" >
							<div class="filasel" >
								<div class="txtsel">Buscar:</div>
								<input type="text" name="search_form" value="<%=search_form %>" class="contsearch1"> 
								<input id="subscribe" class="Mobile" type="submit" value="Buscar" name="submit">
							</div>
						</div>
	
						<div class="contesel">
							<div class="filasel">
								<div class="txtsel">Buscar por:</div>
								<select class="sel" id="filter" data-val="<%=filter_form %>" name="filter_form">
									<option value="" >Todas las categorías</option>
									<option value="latinaamerica" >Latina América</option>
									<option value="world" >Vuelta al mundo</option>
									<option value="sport" >Deportes</option>
									<option value="culture" >Cultura</option>
									<option value="webspecial" >Especiales Web</option>
									<option value="infographics" >Infografías</option>
									<option value="games" >Juegos</option>
									<option value="galleries" >Galerías</option>
									<option value="articles" >Notas</option>
									<option value="interviews" >Encuestas</option>
									<option value="context" >Foros</option>                  
								</select>
							</div>
						</div>
	
						<div class="contesel  sclear" >
							<div class="filasel">
								<div class="txtsel">Fecha de publicación:</div>
								<select class="sel" id="published" data-val="<%=published_form %>" name="published_form" >
									<option value="" >Todas las fechas</option>                            
									<option value="7d" >Última semana</option>                                                          
									<option value="30d" >Último mes</option>
									<option value="1y" >Último año</option>
								</select>
							</div>
						</div>
	
						<div class="contesel change2" >
							<div class="filasel" >
								<div class="txtsel">Sección:</div>
								<select class="sel change3" id="section" data-val="<%=section_form %>" name="section_form" >
									<option value="" >Todas las secciones</option>
									<option value="soyreportero" >Soy Reportero</option>
									<option value="news" >Noticias</option>
									<option value="videos" >Vídeos</option>
									<option value="multimedia" >Multimedia</option>
									<option value="opinion" >Opinión</option>
									<option value="blog" >Blogs</option>
									<option value="joinus" >Únete</option>
									<option value="shows" >Shows</option>
									<option value="telesur_agenda" >teleSUR Agenda</option>                              
								</select>
								<div class="desktop">
									<input id="subscribe" type="submit" class="subscribeSearch" value="Buscar" name="submit">
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
	<form name="form2" method="post" class="formSearch1" action="/busquedaAvanzada.html"> 	
		<div class="wrapper">
			<div class="cont">
				<input type="hidden" name="search_form" value="" onkeyup="buscador.search_form.value=form2.search_form.value"> 
				<input type="submit" id="buscar"  name="submit" class="subscribeSearch" value="Busqueda Avanzada" onclick="document.form2.search_form.value=document.buscador.search_form.value">
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
<script type="text/javascript">
</script>
