<% /**
* Search Result Muestra de Resultados de opciones selecciondas en
* Search y Shearch by tags Seleccion de Orden Most Relevat (
* Prioridad ) y Most Recent ( Ultimos )
*
*/
%>
<%@ include file="TS_Common_Libraries.jsp" %>

<%            /**
* Create a JSP action element
*/
org
.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

request.setCharacterEncoding("UTF-8");

/**
* Asigna y valida elemntos que ingresan por post o get
*/
//si viene t es navegacion por tags
String t = (request.getParameter("t") != null) ? request.getParameter("t") : "";

//variables del post
String search_form = (request.getParameter("search_form") != null) ? request.getParameter("search_form") : "";
String b = (request.getParameter("parameter") != null) ? request.getParameter("parameter") : "";
String filter_form = (request.getParameter("filter_form") != null) ? request.getParameter("filter_form") : "";
String published_form = (request.getParameter("published_form") != null) ? request.getParameter("published_form") : "";
String section_form = (request.getParameter("section_form") != null) ? request.getParameter("section_form") : "";

String order = (request.getParameter("order") != null) ? request.getParameter("order") : "LAST";
int pag = (request.getParameter("pag") != null) ? Integer.parseInt(request.getParameter("pag")) : 1;
int size = (request.getParameter("size") != null) ? Integer.parseInt(request.getParameter("size")) : 10;

/**
* Orden de Busqueda
*/
if (order.equals("LAST")) {
order = "user-modification-date desc";
}
if (order.equals("RELE")) {
order = "user-modification-date asc";
}
if (order.equals("null")) {
order = "user-modification-date";
}

/**
*
* Verifica si la busqueda es por Search o Search por tags Y asigna
* parametros para aplicar en los newslist correspondientes
*
*/
String q = search_form;
String query = "";

// Reemplazo caracteres que rompen las búsquedas
// Busqueda NORMAL
q = q.replaceAll("Ã¡", "á").replaceAll("Ã", "Á").replaceAll("Ã©", "é").replaceAll("Ã", "É").replaceAll("Ã­", "í").replaceAll("Ã", "Í");
q = q.replaceAll("Ã³", "ó").replaceAll("Ã", "Ó").replaceAll("Ãº", "ú").replaceAll("Ã", "Ú").replaceAll("Ã±", "ñ").replaceAll("Ã", "Ñ");

q = q.replaceAll("\\:", "").replaceAll("\\!", "").replaceAll("\\¡", "").replaceAll("\\?", "").replaceAll("\\\"", "");
q = q.replaceAll("\\¿", "").replaceAll("\\\'", "").replaceAll("\\,", "").replaceAll("\\@", "");

// Busqueda por TAGS
t = t.replaceAll("Ã¡", "á").replaceAll("Ã", "Á").replaceAll("Ã©", "é").replaceAll("Ã", "É").replaceAll("Ã­", "í").replaceAll("Ã", "Í");
t = t.replaceAll("Ã³", "ó").replaceAll("Ã", "Ó").replaceAll("Ãº", "ú").replaceAll("Ã", "Ú").replaceAll("Ã±", "ñ").replaceAll("Ã", "Ñ");

t = t.replaceAll("\\:", "").replaceAll("\\!", "").replaceAll("\\¡", "").replaceAll("\\?", "").replaceAll("\\\"", "");
t = t.replaceAll("\\¿", "").replaceAll("\\\'", "").replaceAll("\\,", "").replaceAll("\\@", "");

if (t.equals("") || !q.equals("")) {
// Online-Offline
String q_alguna = "";

//##############################################################################################################
//LÓGICA DE BÚSQUEDA Y PONDERACIÓN DE RESULTADOS
query += "( ";
query += "titulo:( \"" + q.trim() + "\" )^5 OR ";
query += "volanta:( \"" + q.trim() + "\" )^5 OR ";
query += "copete:( \"" + q.trim() + "\" )^5 OR ";
query += "keywords:(\"" + q.trim() + "\")^4 OR ";
query += "cuerpo:( \"" + q.trim() + "\"~0.8 )^1 ";

//condiciones para búsquedas por palabras separadas en titulo, keywords y autor
StringTokenizer stk = new StringTokenizer(q, " ");
int aux = 0;
while (stk.hasMoreTokens()) {
String palabra = stk.nextToken().trim();
if (!palabra.equals("")) {
if (!q_alguna.equals("")) {
q_alguna = q_alguna + "+" + palabra + "~0.8 ";
} else {
q_alguna = palabra + "~0.8 ";
}
}

aux++;
}
if (aux > 1) {
query += "OR titulo:( " + q_alguna + ")^1 OR ";
query += "volanta:( " + q_alguna + ")^1 OR ";
query += "copete:( " + q_alguna + ")^1 OR ";
query += "keywords:( " + q_alguna + ")^1 ";
}

query += ")";
} else {
/**
* Search por Tags
*/

query = "keywords:(\"" + t.trim().replace("-", " ") + "\")";
}
//############################################################################################################## 
%>
<%
int cont = 0;
if (t.equals("") || !q.equals("")) {
%>
<!--/**
*
* Paginador
* 
* Obtiene cantidad paginas
*
*/ -->  
<nt:news-list size="100" order="<%=order%>" advancedfilter='<%=query%>' from="<%=published_form%>" section="<%=section_form%>" category="<%=filter_form%>" state="publicada">
    <% cont++; %>
</nt:news-list> 
<%
} else {
%> 
<!--/**
*
* Paginador
* 
* Obtiene cantidad paginas
*
*/ --> 
<nt:news-list size="100" order="<%=order%>" tags="<%=query%>" from="<%=published_form%>" section="<%=section_form%>" category="<%=filter_form%>" state="publicada">
    <% cont++; %>
</nt:news-list> 
<%
}
%> 

<!--inicio search advanced -->
<!doctype html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>Advaced Search</title>


        <meta name="viewport" content="width=device-width">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/highlight.pack.js</cms:link>"></script>
        <script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/script.js</cms:link>"></script>
     	<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/filtrify.min.js</cms:link>"></script>
     	<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jPages.min.js</cms:link>"></script>
     	<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery.lazyload.min.js</cms:link>"></script>
     	<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery-ui.js</cms:link>"></script>      
     	<script src="/system/modules/com.tfsla.diario.telesur/resources/js/jquery-ui.js"></script>
        <script>
            $(function() {
                $("#from").datepicker({
                    onClose: function(selectedDate) {
                        $("#to").datepicker("option", "minDate", selectedDate);
                        $("#to").datepicker("option", {dateFormat: "yy-mm-dd"});
                    }

                });
                $("#to").datepicker({
                    onClose: function(selectedDate) {
                        $("#from").datepicker("option", "maxDate", selectedDate);
                        $("#from").datepicker("option", {dateFormat: "yy-mm-dd"});
                    }
                });
            });</script>
	        <script type="text/javascript">
	            function foco(idElemento) {
	                document.getElementById(idElemento).focus();
	            }
	        </script>
    </head>
    <body>
        <div id="main" role="main">
            <div id="content" class="demo">
                <div class="headers red">Advanced search results</div>


                <div id="triggers">
                    <strong></strong>    
                    <span id="thriller"></span>
                    <span id="comedy"></span>
                    <span id="thrillerComedy"></span>
                    <span id="thrillerComedyTomHanks"></span>
                </div>
               	<div class="menuFechas">
                    <span>Date Range </span>
               	</div>
                <div class="boox">    
                    <span class="fontFecha"></br>
                        <p class="rage">From:</p>
                        <input type="text" id="from" name="from" size="9" class="datapicket" />
                        </br>
                        <p class="rage">To:</p>
                        <input type="text" id="to" name="to" size="9" class="datapicket"/>
                        <input type="button" id="rango" value="Filter" class="filterfecha btn-click">			
                    </span>
                </div>   
                <span class="titleFechas"> Dates </span> 
                <div class="boxfechas">
                    <ul id="menufecha">
                        <li id="hoy" class="btn-click"><a href="#" title="">Today</a></li>
                        <li id="semana" class="btn-click"><a href="#" title=""> Last Week</a></li>
                        <li id="mes" class="btn-click"><a href="#" title="">Last Month</a></li>
                        <li id="ano" class="btn-click"><a href="#" title="">Last Year</a></li>   
                    </ul>
                </div> 
                <div id="filterpersona">
                        <ul id="filtperson" class="ft-menu">
                            <li class="ft-field">
                                <span class="ft-label" id="idpersona">Person</span>
                                <div class="ft-panel ft-opened" style="z-index: 124;">
                                    <ul style="display:none;" class="ft-selected" id="personSelected">
                                    </ul>
                                    <ul id="person" class="ft-tags">
                                    </ul>
                                    <div class="ft-mismatch ft-hidden">
                                    </div>

                                </div>
                            </li>
                            <li class="ft-field">
                                <span class="ft-label" id="idlugares">Places</span>
                                <div class="ft-panel ft-opened" style="z-index: 124;">
                                    <ul style="display:none;" class="ft-selected" id="lugaresSelected">
                                    </ul>
                                    <ul id="lugares" class="ft-tags">
                                    </ul>
                                    <div class="ft-mismatch ft-hidden">
                                    </div>

                                </div>
                            </li>
                            <li class="ft-field">
                                <span class="ft-label" id="idpclaves">Keywords</span>
                                <div class="ft-panel ft-opened" style="z-index: 124;">
                                    <ul style="display:none;" class="ft-selected" id="keywordSelected">
                                    </ul>
                                    <ul id="keyword" class="ft-tags">
                                    </ul>
                                    <div class="ft-mismatch ft-hidden">
                                    </div>

                                </div>
                            </li>
                           
                        </ul>              
                    <div id="placeHolder"></div>
                    </div>
                <div class="well">
                    <table>
                        <tbody id="containerPage">
                        <div id="widget">
                        <!-- Cxense content widget: search_ingles -->
				  <%--<div id="cx_4e2ccc9bd44545ffb07fe2718493f3b90bc24f85" style="display:none"></div>
				<script type="text/javascript">
				    var cX = cX || {}; cX.callQueue = cX.callQueue || [];
				    cX.callQueue.push(['insertWidget', {
				        widgetId: '4e2ccc9bd44545ffb07fe2718493f3b90bc24f85',
				        insertBeforeElementId: 'cx_4e2ccc9bd44545ffb07fe2718493f3b90bc24f85',
				        width: 3985, height: 390, renderTemplateUrl: 'auto'
				    }]);
				
				    // Async load of cx.js
				    (function(d,s,e,t){e=d.createElement(s);e.type='text/java'+s;e.async='async';
				    e.src='http'+('https:'===location.protocol?'s://s':'://')+'cdn.cxense.com/cx.js';
				    t=d.getElementsByTagName(s)[0];t.parentNode.insertBefore(e,t);})(document,'script');
				</script>--%> 
				<!-- End of Cxense content widget -->
                        </div>  
                        <div id="widget768">
			      <!-- Cxense content widget: searchEnglish768 -->
				 <%-- <div id="cx_cdf2ca32bdc20dc489a5693dc52f803d550d3e69" style="display:none"></div>
				<script type="text/javascript">
				    var cX = cX || {}; cX.callQueue = cX.callQueue || [];
				    cX.callQueue.push(['insertWidget', {
				        widgetId: 'cdf2ca32bdc20dc489a5693dc52f803d550d3e69',
				        insertBeforeElementId: 'cx_cdf2ca32bdc20dc489a5693dc52f803d550d3e69',
				        width: 548, height: 1146, renderTemplateUrl: 'auto'
				    }]);
				
				    // Async load of cx.js
				    (function(d,s,e,t){e=d.createElement(s);e.type='text/java'+s;e.async='async';
				    e.src='http'+('https:'===location.protocol?'s://s':'://')+'cdn.cxense.com/cx.js';
				    t=d.getElementsByTagName(s)[0];t.parentNode.insertBefore(e,t);})(document,'script');
				</script>--%>
				<!-- End of Cxense content widget -->
                        </div>
                        </tbody>
                    </table>
                    <p id="noresult"></p>
                    <div id="pagination" onclick="foco('parameter')"></div>
                </div>  


                <script>
                    $(document).ready(function() {
      
                            $("#ocultarfiltro").css("display", "none");
                            $("#ocultarfiltro2").css("display", "none");
                            $("#ocultarfiltro3").css("display", "none");
                            $(".subscribeSearch").css({color: "#FFFFFF", background: "#FF0000", margin: "7%",height: "27px", width: "46%"});
                            $("#ocultarfiltro4").css("display", "none");
                            $(".change1").css({width: "62%"});
                            $(".wrapper").css({width: "915px"});
                           
                           window.onload = function() {
                           	  var url = "";
                                busqueda(url);
				}
                       //Query a cxense
                        var busqueda = function(url) {
                            var texto = "";
                            var tag = $("#parameter").val();
                            var filterPerson = "";
                            if (tag === "") {
                                 $("#widget").css("display", "block");

                            } else {
                                $("#widget").css("display", "none");
                                $("#widget768").css("display", "none");
                            var url;
                                    if (url == "") {

                                        url = 'http://sitesearch.cxense.com/api/search/9222352440756601878?p_aq=query%28%22' + tag + '%22%29%20and%20not%20filter%28category0:%22shows%22%29%29%20or%20not%20filter%28category0:%22avances%22%29%29&p_c=60&p_rs=fl:[recs-publishtime,url,title,createtime,description,dominantimage,category0,kw-location,keywords,author]&media=json&p_f=%7B%22kw-person%22:%7B%22d%22:%22all%22,%22c%22:%2210%22,%22lf%22:%2220%22%7D,%22keyword%22:%7B%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22%7D,%22kw-location%22:%7B%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22%7D%7D';

                                    } else {

                                        url = url;

                                    }                        
                            console.log("Buscando");
                            $.ajax({
                                url: url,
                                jsonp: 'p_callback',
                                dataType: 'jsonp',
                                success: function(datos) {
                                    console.debug(datos);
                                    var texto = "";
                                    var filterPerson = "";
                                    var filterLocation = "";
                                    var filterCompany = "";
                                    console.debug(texto);
                                    $.each(datos.facets, function (i, obj) {
                                                var idPerson;
                                                if (i === "kw-location") {
                                                    var facetsLocation = obj;
                                                    $.each(facetsLocation, function (j, o) {
                                                        idPerson = o.label;
                                                        var mayLocation = MaysPrimera(idPerson);
                                                        function MaysPrimera(idPerson) {
                                                            return idPerson.charAt(0).toUpperCase() + idPerson.slice(1);
                                                        }
                                                        filterLocation += "<li  class='personas' id='" + idPerson + "'  data-count='" + o.count + "'>" + "<a href='#'>" + mayLocation + " " + "</a>" + "</li>";
                                                    });
                                                    if (filterLocation === "") {
                                                        $("#idlugares").css("display", "none");
                                                    }
                                                    $("#lugares").empty();
                                                    $("#lugares").append(filterLocation);
                                                }
                                                if (i === "kw-person") {
                                                    var facetsPerson = obj;
                                                    $.each(facetsPerson, function (j, o) {
                                                        idPerson = o.label;
                                                        var mayPerson = MaysPrimera(idPerson);
                                                        function MaysPrimera(idPerson) {
                                                            return idPerson.charAt(0).toUpperCase() + idPerson.slice(1);
                                                        }
                                                        filterPerson += "<li  class='personas' id='" + idPerson + "'  data-count='" + o.count + "'>" + "<a href='#'>" + mayPerson + " " + "</a>" + "</li>";
                                                    });
                                                    if (filterPerson === "") {
                                                        $("#idpersona").css("display", "none");
                                                    }
                                                    $("#person").empty();
                                                    $("#person").append(filterPerson);
                                                }
                                                if (i === "keyword") {
                                                    var facetsCompany = obj;
                                                    $.each(facetsCompany, function (j, o) {
                                                        idPerson = o.label;
                                                        var mayKeyword = MaysPrimera(idPerson);
                                                        function MaysPrimera(idPerson) {
                                                            return idPerson.charAt(0).toUpperCase() + idPerson.slice(1);
                                                        }
                                                        if (mayKeyword === "Null") {
                                                            mayKeyword = "teleSUR";
                                                        } else {
                                                            mayKeyword = mayKeyword;
                                                        }
                                                        filterCompany += "<li  class='personas' id='" + idPerson + "'  data-count='" + o.count + "'>" + "<a href='#'>" + mayKeyword + " " + "</a>" + "</li>";
                                                    });
                                                    if (facetsCompany === "") {
                                                        $("#idcompany").css("display", "none");
                                                    }
                                                    $("#keyword").empty();
                                                    $("#keyword").append(filterCompany);
                                                }

                                            });


                                    $.each(datos.matches, function(i, item) {
					var fechaNota = item.document.fields.createtime;
					var urlNota = item.document.fields.url;
						var section = item.document.fields.category0;
						var keywords = item.document.fields.keywords;
	                                        var cont;
	                                        var author;
                                        	var authorNota;
                                        	 if (keywords === "null") {
	                                                keywords = "";
	                                            } else {
	                                                keywords = item.document.fields.keywords;
	                                            }
                                        	var sectionNota = section;                                     
                                        	if (sectionNota === "opinion") {
	                                            author = item.document.fields.author;
	                                            authorNota = "' data-autor='" + author;
	                                            }
	                                        else if (sectionNota === "bloggers") {
	                                            author = item.document.fields.author;
	                                            authorNota = "' data-autor='" + author;
	                                        }
	                                        else {
	                                            authorNota = "";
	                                        }
	                                        var palabrasclave = keywords  .split(",");
	                                        for (x = 0; x < palabrasclave.length; x++)
	                                             cont = x;
                                                var descNota = item.document.fields.description;
						    if (typeof (section) === "undefined") {
						      section = "";
						    } else {
						      section = item.document.fields.category0;
					     	    }
					   
	                                            if (typeof(urlNota) === "undefined"){
	                                              urlNota = "#";                                           
	                                          
	                                            }else{
	                                              urlNota = item.document.fields.url;
	                                            }
						  
	                                            if (typeof(descNota) === "undefined") {
	                                                descNota = "";                                               
	                                            }else{
	                                                descNota= item.document.fields.description;                                          
	                                            }
	                                            var autorNota = item.document.fields.author;
	                                            if (typeof(autorNota) === "undefined") {
	                                                autorNota = "teleSUR";                                               
	                                            }else{
	                                                autorNota= item.document.fields.author;                                          
	                                            }

                                        if (i <= 10) {
                                            texto += "<tr data-category='" + item.document.fields.category0 + authorNota + "'><td>" + "" + "</p>";
                                        } else {
                                            texto += "<tr data-category='" + item.document.fields.category0 + authorNota + "'><td>" + ""+ "</p>";
                                        }

                                        texto += "<div class='ressearch'>";
                                        texto += "<ul>";
                                        texto += "<li>";
                                        texto += "<div class='imgsearch'>";
                                        texto += "<a href='" + urlNota + "'>" + "<img src='" + item.document.fields.dominantimage + "' />" + "</a>";
                                        texto += "</div>"; //fin imgsearch
                                        texto += "<div class='txtsearch1'";
                                        texto += "<div class='titsearch'>";
                                        texto += "<a href='" + urlNota + "'>" + "<p class='titsearch2'>" + item.document.fields.title + "</p>" + "</a>";
                                        texto += "</div>";
                                        texto += "<div class='contsearch'>" + descNota + "</div>";
                                        texto += "</br>";
                                        texto += "<p class='fechasearch datafecha'>"+fechaNota.slice(0, 10)+" | "+fechaNota.slice(11, 16)+" | "+item.document.fields.author+"</p>";
                                        texto += "</div>"; //fin de txtsearch  
                                        texto += "</li>";
                                        texto += "</ul>";
                                        texto += "</div>"; //fin ressearch
                                        texto += "</div>";
                                        texto += "</td></tr>";
                                    });
                                    if (texto === "") {
                                                $("#containerPage").empty();
                                                $("#noresult").empty();
                                                $("#noresult").append("There are no publications that match your search .");
                                                $("#pagination").css("display", "none");
                                                $("#filterpersona").css("display", "none");

                                            } else {

                                                $("#containerPage").empty();
                                                $("#containerPage").append(texto);
                                                $("#noresult").empty();
                                                $("#pagination").css("display", "block");
                                                $("#filterpersona").css("display", "block");
                                            }

                                    // Paginacio de los resultados

                                    var containerPage = $("#containerPage"),
                                            pagination = $("#pagination");
                                    setLazyLoad(containerPage);
                                    setPagination(pagination);
                                    
				   // Filtro de Resultados
                                    $.filtrify("containerPage", "placeHolder", {
                                        block: "data-original",
                                        callback: function() {
                                            destroyPagination(pagination);
                                            setPagination(pagination);
                                        }
                                    });                                
                                },
                                error: function(e) {
                                    console.log('Error: ' + JSON.stringify(e, null, 4));
                                }
                            });
                            return false;   
                        }}

                        function setLazyLoad(containerPage) {
                            containerPage.find("img").lazyload({
                                event: "turnPage",
                                effect: "fadeIn"
                            });
                        };
			
			//Funciones del paginador
                        function setPagination(pagination) {
                            pagination.jPages({
                                containerID: "containerPage",
                                perPage: 6,
                                direction: "auto",
                                animation: "fadeInUp",
	                        previous: "Previous",
                                next: "Next",
                                callback: function(pages, items) {
                                    items.showing.find("img").trigger("turnPage");
                                    items.oncoming.find("img").trigger("turnPage");
                                }
                            });
                        };
                        
                        function destroyPagination(pagination) {
                            pagination.jPages("destroy");
                        };  
                           
			 //Ocultar input del formulario
                            $("#buscar").click(function() {
                               $("#noresult").text("loading...");
                                var tag = $("#parameter").val();
                                var url = 'http://sitesearch.cxense.com/api/search/9222352440756601878?p_aq=query%28%22' + tag + '%22%29%20and%20not%20filter%28category0:%22shows%22%29%29%20or%20not%20filter%28category0:%22avances%22%29%29&p_c=60&p_rs=fl:[recs-publishtime,url,title,createtime,description,dominantimage,category0,kw-location,keywords,author]&media=json&p_f=%7B%22kw-person%22:%7B%22d%22:%22all%22,%22c%22:%2210%22,%22lf%22:%2220%22%7D,%22keyword%22:%7B%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22%7D,%22kw-location%22:%7B%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22%7D%7D';
                                $("#ocultarfiltro").css("display", "none");
                                $("#ocultarfiltro2").css("display", "none");
                                $("#ocultarfiltro3").css("display", "none");
                                $(".subscribeSearch").css({color: "#FFFFFF", background: "#FF0000", margin: "7%", height: "27px", width: "46%"});
                                $("#ocultarfiltro4").css("display", "none");
                                $(".change1").css({width: "68%"});
                                $(".wrapper").css({width: "915px"});
                                console.log(url);
                                busqueda(url);
                            });

                            /**rango de fecha seleccionado*/
                            $(".btn-click").click(function() {
                                $("#noresult").text("loading...");
                                var tag = $("#parameter").val();
                                var tipo = $(this).attr("id");
                                rangoFecha = calculaRangoFecha(tipo);
                                var url = 'http://sitesearch.cxense.com/api/search/9222352440756601878?p_aq=query(%22' + tag + '%22)%20and%20not%20filter(category0:%22shows%22)%20and%20not%20filter(category0:%22avances%22)%20and%20filter(createtime:range[%22' + rangoFecha[0] + 'T00:00:00.000Z%22,%22' + rangoFecha[1] + 'T00:00:00.000Z%22])%20&p_c=25&p_rs=fl:[title,url,tls-section,section,description,category0,dominantimage,createtime,kw-location,keywords,author]&media=json&p_f=%7B%22kw-person%22:%7B%22d%22:%22all%22,%22c%22:%2210%22,%22lf%22:%2220%22%7D,%22keyword%22:%7B%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22%7D,%22kw-location%22:%7B%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22%7D%7D';
                                busqueda(url);
                                return false;

                            });

                            /**Filtro por persona seleccionado*/
                            $("#person").click(function(e) {
                                $("#noresult").text("loading...");
                                var tag = $("#parameter").val();
                                var liselec = "";
                                var li = e.target.parentNode;
                                var persona = li.id;
                                var url = 'http://sitesearch.cxense.com/api/search/9222352440756601878?p_aq=query(%22' + tag + '%22)%20and%20query(kw-person:%22' + persona + '%22)%20and%20not%20filter(category0:%22shows%22)%20and%20not%20filter(category0:%22avances%22)%20&p_c=25&p_rs=fl:%5Btitle,url,tls-section,section,description,category0,dominantimage,createtime,kw-location,keywords,author%5D&media=json&p_f={%22kw-person%22:{%22d%22:%22all%22,%22c%22:%2210%22,%22lf%22:%2220%22},%22keyword%22:{%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22},%22kw-location%22:{%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22}}';
//                                alert(url);
                                $("#personSelected").css("display", "block");
                                liselec += "<li>" + persona + "</li>";
                                $("ul#filtperson li #personSelected").empty();
                                $("ul#filtperson li #personSelected").append(liselec);
                                $("#person").addClass("ft-no-items-hidden");
                                $("ul#filtperson li").addClass("item-line");
                                busqueda(url);
                            });
                             /**Eliminar seleccion*/
                            $("ul#filtperson li .ft-selected").click(function () {
                                $("#noresult").text("Cargando...");
                                $("#person").removeClass("ft-no-items-hidden");
                                $("#lugares").removeClass("ft-no-items-hidden");
                                $("#keyword").removeClass("ft-no-items-hidden");
                                $("ul#filtperson li").removeClass("item-line");
                                $(".ft-selected").css("display", "none");
                                $("#idpersona").css("display", "block");
                                $("#idcompany").css("display", "block");
                                $("#idlugares").css("display", "block");

                                var tag = $("#parameter").val();
                                var url = 'http://sitesearch.cxense.com/api/search/9222352440756601878?p_aq=query%28%22' + tag + '%22%29%20and%20not%20filter%28category0:%22shows%22%29%29%20or%20not%20filter%28category0:%22avances%22%29%29&p_c=60&p_rs=fl:[recs-publishtime,url,title,createtime,description,dominantimage,category0,kw-location,keywords,author]&media=json&p_f=%7B%22kw-person%22:%7B%22d%22:%22all%22,%22c%22:%2210%22,%22lf%22:%2220%22%7D,%22keyword%22:%7B%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22%7D,%22kw-location%22:%7B%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22%7D%7D';
                                busqueda(url);

                            });
                            /**Filtro por lugares seleccionado*/
                            $("#lugares").click(function(e) {
                                $("#noresult").text("loading...");
                                var tag = $("#parameter").val();
                                var liselec = "";
                                var li = e.target.parentNode;
                                var lugar = li.id;
                                var url = 'http://sitesearch.cxense.com/api/search/9222352440756601878?p_aq=query(%22' + tag + '%22)%20and%20query(kw-location:%22' + lugar + '%22)%20and%20not%20filter(category0:%22shows%22)%20and%20not%20filter(category0:%22avances%22)%20&p_c=25&p_rs=fl:%5Btitle,url,tls-section,section,description,category0,dominantimage,createtime,kw-location,keywords,author%5D&media=json&p_f={%22kw-person%22:{%22d%22:%22all%22,%22c%22:%2210%22,%22lf%22:%2220%22},%22keyword%22:{%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22},%22kw-location%22:{%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22}}';
                                //   alert(url);
                                $("#lugaresSelected").css("display", "block");
                                liselec += "<li>" + lugar + "</li>";
                                $("ul#filtperson li #lugaresSelected").empty();
                                $("ul#filtperson li #lugaresSelected").append(liselec);
                                $("#lugares").addClass("ft-no-items-hidden");
                                $("ul#filtperson li").addClass("item-line");
                                busqueda(url);
                            });
                            /**Filtro por keyword seleccionado*/
                            $("#keyword").click(function (e) {
                                $("#noresult").text("loading...");
                                var tag = $("#parameter").val();
                                var liselec = "";
                                var li = e.target.parentNode;
                                var keyword = li.id;
                                var url = 'http://sitesearch.cxense.com/api/search/9222352440756601878?p_aq=query(%22' + tag + '%22)%20and%20query(keyword:%22' + keyword + '%22)%20and%20not%20filter(category0:%22shows%22)%20and%20not%20filter(category0:%22avances%22)%20&p_c=25&p_rs=fl:%5Btitle,url,tls-section,section,description,category0,dominantimage,createtime,kw-location,keywords,author%5D&media=json&p_f={%22kw-person%22:{%22d%22:%22all%22,%22c%22:%2210%22,%22lf%22:%2220%22},%22keyword%22:{%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22},%22kw-location%22:{%22d%22:%221000%22,%22c%22:%2210%22,%22lf%22:%2210%22}}';                                //   alert(url);
                                $("#keywordSelected").css("display", "block");
                                liselec += "<li>" + keyword + "</li>";
                                $("ul#filtperson li #keywordSelected").empty();
                                $("ul#filtperson li #keywordSelected").append(liselec);
                                $("#keyword").addClass("ft-no-items-hidden");
                                $("ul#filtperson li").addClass("item-line");
                                busqueda(url);
                            });

                            
                            //calculando el  rango de fecha para filtrar

                            function calculaRangoFecha(tipo) {
                                var f = new Date();
                                var factual = f.getFullYear() + "-" + (f.getMonth() + 1) + "-" + f.getDate();
                                var ayer = f.getFullYear() + "-" + (f.getMonth() + 1) + "-" + (f.getDate() - 1);
                                var rangoFecha = [];

                                if (tipo === "hoy") {
                                    rangoFecha[0] = ayer;
                                    rangoFecha[1] = factual;
                                } else {
                                    if (tipo === "rango") {
                                        var rango1 = $("#from").val();
                                        var rango2 = $("#to").val();

                                        //arreglo rangoFecha = [rango1, rango2]

                                        rangoFecha[0] = rango1;
                                        rangoFecha[1] = rango2;
                                    } else {
                                        if (tipo === "semana") {
                                            function getMonday(d) {
                                                d = new Date(d);
                                                var day = d.getDay(),
                                                        diff = d.getDate() - day + (day === 0 ? -6 : 1);
                                                return new Date(d.setDate(diff));
                                            }

                                            var semana = getMonday(new Date());
                                            var ultimaSemana = semana.getFullYear() + "-" + (semana.getMonth() + 1) + "-" + semana.getDate();
                                            rangoFecha[0] = ultimaSemana;
                                            rangoFecha[1] = factual;

                                        } else {
                                            if (tipo === "mes") {
                                                var ultimoMes = f.getFullYear() + "-" + (f.getMonth() + 1) + "-" + 1;
                                                rangoFecha[0] = ultimoMes;
                                                rangoFecha[1] = factual;

                                            } else {
                                                var ultimoanio = (f.getFullYear() - 1) + "-" + f.getMonth() + "-" + 1;
                                                rangoFecha[0] = ultimoanio;
                                                rangoFecha[1] = factual;
                                            }
                                        }
                                    }
                                }

                                return rangoFecha;
                            }
                    });
			
                </script>

            </div>
        </div>

    </body>
</html>

<!--fin search advanced-->


<script type="text/javascript">
    /**
     **  Function paginador
     **  Function orden list
     */
    $(document).ready(function() {
        $(".pageId").click(function(event) {
            $("#pageId").val($(this).data("nro"));
            $(".subscribeSearchFooter").click();
            event.preventDefault();
        });
        $(".btnmost").click(function(event) {
            $("#orderId").val($(this).data("order"));
            $(".subscribeSearchFooter").click();
            event.preventDefault();
        });

    });



    /**
     **  visualizacion del cartel "No se encontraron resultados..."
     */

    if ($(".ressearch ul li").length == 0)
    {
        $(".noResultado").css('display', 'block');
        $(".menusearchbot").css('display', 'none');
    }
</script>