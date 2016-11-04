<%@ include file="TS_Common_Libraries.jsp" %>
<%
String palabras = ( request.getParameter("palabras") != null ) ? request.getParameter("palabras") : "noticias";
%>

<script>
    var navegador_url = [];
    var titulo = [];
    var thumbnail_mediano = [];
    var categoria = [];
    var categoriaLink = [];
    items = [];
    duracion = [];
    var api = "http://multimedia.telesurtv.net/api/clip/?detalle=completo&ultimo=10&texto=<%=palabras%>";
    var urlCategoria = "http://multimedia.telesurtv.net/web/telesur/#!es/lista/noticia/";

    $.ajax({
        type: "POST",
        dataType: 'jsonp',
        url: api,
        success: function(data) {
            var len = data.length;
            for (var j = 0; j < len; j++) {
                entry = data[j];
                navegador_url.push(entry.navegador_url);
                titulo.push(entry.titulo);
                duracion.push(entry.duracion);
                thumbnail_mediano.push(entry.thumbnail_mediano);
                if (entry.categoria != null) {
                    categoria.push(entry.categoria.nombre);
                    categoriaLink.push(urlCategoria + entry.categoria.nombre);
                } else {
                    categoria.push("Noticias");
                    categoriaLink.push(urlCategoria + "noticias");
                }
            }

            for (var i = 0; i < len; i++) {
                items.push(
                        "<li>" + "<span class='duracion'>" + duracion[i] + "</span>" +
                        "<a href='" + navegador_url[i] + "' target='_blank'>" +
                        "<img src='" + thumbnail_mediano[i] + "' alt='" + titulo[i] + "'>" +
                        "</a>" +
                        "<h4>" + "<a href='" + navegador_url[i] + "' target='_blank'  >" + titulo[i] + "</a>" + "</h4>" +                            
                                  
                        "</li>"
                        );

            }
            $("#prueba").html(items);
        }
    });
</script>
<div class="blue tt-latest">Videos</div>
<div class="carruselVideo carousel" >  
    <ul class='slides' id="prueba">  

    </ul> 
</div>

<script type="text/javascript">
    $(window).load(function() {
        $('.carruselVideo').flexslider({
            animation: "slide",
            animationLoop: false,
            itemWidth: 160,
            itemMargin: 10,
            pausePlay: true,
             start: function(){
        $('.slides li').show(); 
        },
        });
    });
</script>