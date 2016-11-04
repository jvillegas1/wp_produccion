	<%
    /**
    *  Search Form
    *
    *
    */
%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<%@ include file="TS_Common_Libraries.jsp" %>
<%
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);

String search_form = ( request.getParameter("search_form") != null ) ? request.getParameter("search_form") : "";
String published_form = ( request.getParameter("published_form") != null ) ? request.getParameter("published_form") : "";
String section_form = ( request.getParameter("section_form") != null ) ? request.getParameter("section_form") : "";
String filter_autor = (request.getParameter("filter_autor") != null ) ? request.getParameter("filter_autor") : "" ;  
String autor = request.getParameter("autor");      
String filter_form = (request.getParameter("filter_form") != null) ? request.getParameter("filter_form") : "best";   	

int pagina  = ( request.getParameter("pagina") != null ) ? Integer.parseInt(request.getParameter("pagina")) : 1;
int size = ( request.getParameter("size") != null ) ? Integer.parseInt(request.getParameter("size")) : 6;
%>

<script>
    if (window.addthis) {
        window.addthis = null;
        window._adr = null;
        window._atc = null;
        window._atd = null;
        window._ate = null;
        window._atr = null;
        window._atw = null;
        }  
    var uniqueUrl = "http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5526cf6d4144ea13";
    $.getScript(uniqueUrl)
    .done(function(script) {
      addthis.init();
    }); 
</script>
<script>
       $(document).ready(function (e) {
       $(".share-rs").css({"margin-bottom": "70px"});
       cargarMasNotas('<%=pagina%>','<%=size%>','<%=filter_autor%>',"best",$("#search_form").val());

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
             
             var url = "/system/modules/com.tfsla.diario.telesur.en/elements/TS_Audio_Page.jsp"; // El script a dónde se realizará la petición.

        $.ajax({
            type: "POST",
            url: url,
            data: $("#form").serialize(), // Adjuntar los campos del formulario enviado.
	
            success: function (data)

            {

                $("#result").html(data); // Mostrar la respuestas del script PHP.

            }

        }); return false;
        
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
                                <input type="text" name="search_form" id="search_form" value="<%=search_form %>" class="form-control" placeholder="Search..."/>  
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
                    <div class="formSelec"><p class="btnmostAudio catAudio">Categories:</p>                    
                        <ul class="nav nav-tabs" id="categoria">
				  <li class="active2" id="best"><a href="#.">Programs</a></li>
				  <li  id="blog"><a href="#.">News</a></li>
				  <li  id="telesur_noticias"><a href="#.">Opinion & Analysis</a></li>
			</ul>
                    </div>
                    <!--end select-->     
                </div>
            </div>
        </div>
</form>
</div>
<div class="row clear">
    <div class="cont">
        <div class="menusearchbotAudio"></div></br>
        <div class="menusearchbotAudio">
            <div class="pagsearchAudio"><%-- <%= category%>: <%=pag%> de<%=cont%> resultados--%> </div>
            <!--<a href="#" class="pagsearchAudio" data-order="LAST" >Más recientes</a><a href="#" class="pagsearchAudio" data-order="RELE" >Menos recientes</a>-->
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
        <p class="message">Welcome to teleSUR's audio section. From here you may download audio files in MP3 format, listen to them from this page.</p>
        <div class="noResultado" style="display:none">
            <h2 class="noResul">No result...</h2>
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
    var valor="";
        if($("#published").data('val')!=""){
            valor = $("#published").data('val');
            $("#published option[value="+ valor +"]").attr("selected",true);        
        }
    valor="";
        if($("#autor").data('val')!=""){
            valor = $("#autor").data('val');
        $("#autor option[value="+ valor +"]" ). attr("selected",true);        
         }
            
   valor="";
            if($("#filter").data('val')!=""){
        valor= $("#filter").data('val');
                $("#filter option[value="+ valor +"]").attr("selected",true);        
        }     
         
                valor="";
        if($("#section").data('val')!=""){
                valor =  $("#section").data('val')
    $("#section option[value="+ valor +"]").attr("selected",true);        
    }        
        
</script>