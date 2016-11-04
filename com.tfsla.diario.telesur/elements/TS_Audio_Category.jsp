<%
    /**
     * Search Form
     *
     *
     */
%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<%@ include file="TS_Common_Libraries.jsp" %>
<%
    org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);

    String search_form = (request.getParameter("search_form") != null) ? request.getParameter("search_form") : "";
    String published_form = (request.getParameter("published_form") != null) ? request.getParameter("published_form") : "";
    String section_form = (request.getParameter("section_form") != null) ? request.getParameter("section_form") : "";
    String filter_autor = (request.getParameter("filter_autor") != null) ? request.getParameter("filter_autor") : "";
    String autor = request.getParameter("autor");
    String filter_form = (request.getParameter("filter_form") != null) ? request.getParameter("filter_form") : "best";
    String category = (request.getParameter("category") != null) ? request.getParameter("category") : "best";

    int pagina = (request.getParameter("pagina") != null) ? Integer.parseInt(request.getParameter("pagina")) : 1;
    int size = (request.getParameter("size") != null) ? Integer.parseInt(request.getParameter("size")) : 6;
%>
<script>
    $(document).ready(function (e) {
        $(".share-rs").css({"margin-bottom": "70px"});
        cargarMasNotas('<%=pagina%>', '<%=size%>', '<%=filter_autor%>', '<%=category%>', $("#search_form").val());

        var categy = "<%=category%>";

        if (categy == "audio/blog") {
            $("#blog").addClass("active2");
            $("#best").removeClass("active2");
            $("#telesur_noticias").removeClass("active2");
        }
        if (categy == "audio/best") {
            $("#best").addClass("active2");
            $("#blog").removeClass("active2");
            $("#telesur_noticias").removeClass("active2");
        }
        if (categy == "audio/telesur_noticias") {
            $("#telesur_noticias").addClass("active2");
            $("#best").removeClass("active2");
            $("#blog").removeClass("active2");
        }

        $("#best").click(function (e) {
            // alert("best");
            $("#best").addClass("active2");
            $("#blog").removeClass("active2");
            $("#telesur_noticias").removeClass("active2");
            cargarMasNotas('<%=pagina%>', '<%=size%>', '<%=filter_autor%>', "best", $("#search_form").val());

        });
        $("#blog").click(function (e) {
            // alert("blog");
            $("#blog").addClass("active2");
            $("#best").removeClass("active2");
            $("#telesur_noticias").removeClass("active2");

            cargarMasNotas('<%=pagina%>', '<%=size%>', '<%=filter_autor%>', "blog", $("#search_form").val());


        });
        $("#telesur_noticias").click(function (e) {
            //alert("telesur_noticias");
            $("#telesur_noticias").addClass("active2");
            $("#best").removeClass("active2");
            $("#blog").removeClass("active2");

            cargarMasNotas('<%=pagina%>', '<%=size%>', '<%=filter_autor%>', "telesur_noticias", $("#search_form").val());
        });
        $("#buscar").click(function (e) {

            var url = "/system/modules/com.tfsla.diario.telesur/elements/TS_Audio_Page.jsp"; // El script a dónde se realizará la petición.

            $.ajax({
                type: "POST",
                url: url,
                data: $("#form").serialize(), // Adjuntar los campos del formulario enviado.

                success: function (data)

                {

                    $("#result").html(data); // Mostrar la respuestas del script PHP.

                }

            });
            return false;

        });
    });


</script>
<!--/seccion/audio/index.html-->
<div class="blueBar approach">
    <form name="buscador" id="form" class="formSearch1" method="post">    	
        <div class="wrapper">
            <div class="row clear">
                <div class="col">
                    <div class="cont">
                        <div class="changueAudio" >
                            <div class="filasel" >
                                <input type="text" name="search_form" id="search_form" value="<%=search_form%>" class="form-control" placeholder="Introduzca su busqueda..."/>  
                            </div>
                        </div>
                        <div class="contesel2 change2" >
                            <div class="filasel" >
                                <div class="desktop">
                                    <button type="submit" id="buscar" class="btn btn-default" value="Buscar" name="submit"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--select-->
                    <div class="gallery-head text-center"> 
                    </div>
                    <div class="formSelec"><p class="btnmostAudio catAudio">Categorias:</p>      
                        <ul class="nav nav-tabs" id="categoria">
                            <li class="active2" id="best"><a href="#.">Lo mejor del dia</a></li>
                            <li  id="blog"><a href="#.">Blog del Dia</a></li>
                            <li  id="telesur_noticias"><a href="#.">teleSUR Noticias</a></li>
                        </ul>
                    </div>   
                </div>
            </div>
        </div>
    </form>
</div>
<div class="row clear">
    <div class="cont">
        <div class="menusearchbotAudio"></div></br>
        <div class="menusearchbotAudio">
            <div class="pagsearchAudio"></div>
        </div>
    </div>

    <script type="text/javascript">
        $("#textFilter").html($("#filter option:selected").text());
        $("#textPublished").html($("#published option:selected").text());
        $("#textSection").html($("#section option:selected").text());
    </script>
</div>

<div class="row clear">
    <div>
        <p class="message">Bienvenido a nuestra sección de programas de audio. se puede bajar estos archivos como mp3 desde esta sección, escucharlas directamente desde la pagina.</p>
        <div class="noResultado" style="display:none">
            <h2 class="noResul">No se encontraron resultados...</h2>
            <div class="pieblog" style="border-top:0"></div>
        </div>
        <div class="wrapper approach">
            <div class="container">
                <div id="result"></div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    var valor = "";
    if ($("#published").data('val') != "") {
        valor = $("#published").data('val');
        $("#published option[value=" + valor + "]").attr("selected", true);
    }
    valor = "";
    if ($("#autor").data('val') != "") {
        valor = $("#autor").data('val');
        $("#autor option[value=" + valor + "]").attr("selected", true);
    }

    valor = "";
    if ($("#filter").data('val') != "") {
        valor = $("#filter").data('val');
        $("#filter option[value=" + valor + "]").attr("selected", true);
    }

    valor = "";
    if ($("#section").data('val') != "") {
        valor = $("#section").data('val')
        $("#section option[value=" + valor + "]").attr("selected", true);
    }

</script>