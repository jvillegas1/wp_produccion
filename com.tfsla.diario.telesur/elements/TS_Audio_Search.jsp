
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
     cargarMasNotas('<%=pagina%>','<%=size%>','<%=filter_autor%>',"best",$("#search_form").val());
      // $("#comentNativos").addClass("coment");
       // $("#btn-face").addClass("active");

    
     
        
            $("#best").on("click", function() {
  $("#best").addClass("active2"); 
  $("#blog").removeClass("active2");
  $("#telesur_noticias").removeClass("active2");
  cargarMasNotas('<%=pagina%>','<%=size%>','<%=filter_autor%>',"best", $("#search_form").val());   
});
       $("#blog").on( "click", function() {
      $("#blog").addClass("active2");
      $("#best").removeClass("active2");
      $("#telesur_noticias").removeClass("active2");
      addthis.init();
     cargarMasNotas('<%=pagina%>','<%=size%>','<%=filter_autor%>',"blog",$("#search_form").val());
});
$("#telesur_noticias").on( "click", function() {
  //alert("telesur_noticias");
    $("#telesur_noticias").addClass("active2");
    $("#best").removeClass("active2");
    $("#blog").removeClass("active2");
    addthis.init();           
    cargarMasNotas('<%=pagina%>','<%=size%>','<%=filter_autor%>',"telesur_noticias",$("#search_form").val());
});
        
        
        
       
         $("#buscar").click(function (e) {
             
             var url = "/system/modules/com.tfsla.diario.telesur/elements/TS_Audio_Page.jsp"; // El script a dónde se realizará la petición.

        $.ajax({
            type: "POST",
            url: url,
            data: $("#form").serialize(), // Adjuntar los campos del formulario enviado.
	
            success: function (data)

            {

                $("#result").html(data); // Mostrar la respuestas del script .

            }

        }); return false;
        
    		});
    		});
</script>
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
                    <div class="formSelec"><p class="btnmostAudio catAudio">Categorías:</p>
                        <ul class="nav nav-tabs" id="categoria">
                            <li class="active2" id="best"><a href="#.">Lo mejor del día</a></li>
                            <!--<li  id="blog"><a href="#.">Blog del Día</a></li>-->
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
        <p class="message"> Bienvenido a nuestra sección de audios. Puede bajar los archivos como mp3 desde esta sección y escucharlas directamente en la página.</p>
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