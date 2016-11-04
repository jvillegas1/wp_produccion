<%@ include file="TS_Common_Libraries.jsp" %>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
<script src="http://jwpsrv.com/library/HeeyEgeeEeS9bCIAC0MJiQ.js"></script>

<%
    String keiwords = (request.getParameter("keiwords") == null) ? "" : request.getParameter("keiwords");
%>

<script>

    window.onload = function () {
        var active = 0;
        var wheight = $(window).height();
        $('#animate').animate({scrollTop: 930}, '2000', function () {

            busqueda(active);
        });
    }

    var busqueda = function (active) {
        console.log(active);
        var total = 0;
        var limit = 3;
        var vact = active;
        var navegador_url = [];
        var titulo = [];
        var thumbnail_mediano = [];
        var categoria = [];
        var categoriaLink = [];
        var itags;
        var cont;
        var hashtag;
        items = [];
        itemsImport = [];
        var archivo_url = [];
        var thumbnail_grande = [];
        var descripcion = [];
        var twitter = [];
        var urlTwitter = "https://twitter.com/";
        var keiwords = "<%=keiwords%>";
        hashtag = keiwords.split(",");
        var api = "http://multimedia.telesurtv.net/en/api/clip/?detalle=completo=true&ultimo=5&hashtag=" + hashtag[0];
        console.log("API CONSULTA: "+api);
        var urlCategoria = "http://multimedia.telesurtv.net/web/telesur/#!es/lista/noticia/";

        $.ajax({
            type: "POST",
            dataType: 'jsonp',
            url: api,
            success: function (data) {
                var len = data.length;
                for (var j = 0; j < len; j++) {
                    entry = data[j];
                    navegador_url.push(entry.url);
                    archivo_url.push(entry.archivo_url);
                    thumbnail_grande.push(entry.thumbnail_grande);
                    titulo.push(entry.titulo);
                    thumbnail_mediano.push(entry.thumbnail_mediano);
                    descripcion.push(entry.descripcion);
                    if (entry.categoria != null) {
                        categoria.push(entry.categoria.nombre);
                        categoriaLink.push(urlCategoria + entry.categoria.nombre);
                    } else {
                        categoria.push("Noticias");
                        categoriaLink.push(urlCategoria + "noticias");
                    }
                }

                itemsImport.push("<div class='aside'>" +
                        "<h4>Videos</h4>"+
                        "<img class='icotitIMG' src='/arte/icon-video-red.jpg' alt='Videos'>" +
                        "<span>" + titulo[active] + "</span>" +
                        " </div>" +
                        "<div class='overflow'><div id='VideoDestacado'></div> " +
                        " <p class='bdv'>" + descripcion[active] + "</p>" +
                        "</div>");


                for (var i = 0; i < len; i++) {
                    if (i >= 1) {

                        items.push("<div class='view'>" +
                                "<a href='javascript:;' onclick='myFunction(this.id)' id='" + i + "' class='btn-vid'>" +
                                "<img src='/arte/ico-videos.png' alt='" + titulo[i] + "' class='iplay'>" +
                                "<img src='" + thumbnail_mediano[i] + "' alt='" + titulo[i] + "' height='82px'>" +
                                "</a>" +
                                "<div class='mask'>" +
                                "<a href='javascript:;' onclick='myFunction(this.id)' id='" + i + "' class='btn-vid'>" +
                                "<h2>" + titulo[i] + "</h2>" +
                                "</a>" +
                                "<a href='javascript:;' onclick='myFunction(this.id)' id='" + i + "' class='btn-vid info'>" +
                                "<img src='/arte/ico-play.png' alt='" + titulo[i] + "' class='icoPlay' target='_blank'>" +
                                "</a>" +
                                "</div>" +
                                "</div>");
                    }
                }
                $('#espVideos').empty();
                $('#espVideos').append(itemsImport);

                jwplayer("VideoDestacado").setup({
                    file: archivo_url[vact],
                    image: thumbnail_grande[vact],
                    width: "100%",
                    aspectratio: "16:9"
                });

                $("#bloque-videos-long").html(items);
            }
        });

    }

    function myFunction(clicked_id) {
        var active = clicked_id;
        busqueda(active);
    }

</script> 

<div class="wrap multimedia">
    <div id="animate" class="boxMmd int"> 
        <!--bloque video destacado-->
        <div class="boxEspecial video2 video" id="espVideos"> </div>
        <!--lista de videos-->
        <div  class='container2' id='bloque-videos-long'></div>
    </div>
</div>