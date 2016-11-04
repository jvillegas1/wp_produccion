	<%@ include file="../elements/TS_Common_Libraries.jsp" %>
  <%
  //String programaGet=request.getParameter("prog"); 
  String programaGet = (request.getParameter("prog") == null ) ? "telesur-noticias" : request.getParameter("prog") ;
  %>
  <!doctype html>
  <html>
  <head>
    <cms:include page="../elements/TS_Common_Head.jsp" >
        <cms:param name="template">programas</cms:param>
    </cms:include>      
    <script src="http://jwpsrv.com/library/HeeyEgeeEeS9bCIAC0MJiQ.js"></script>
    <script src="<cms:link>../resources/js/jquery-1.11.0.min.js</cms:link>"></script>
    <script type="text/javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/videos-programas.js</cms:link>"></script>
    <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55269af806f45371" async="async"></script>
    <script type="text/javascript">var addthis_share = { url_transforms : { shorten: { twitter: 'bitly'} }, shorteners : { bitly : {login:'telesur',apiKey:'R_8925c37a76786f9a5620d8c3f0f9e65c'} }}</script>
    <script type="text/javascript">var addthis_config = {"data_track_clickback":false};</script>
    <script type="text/javascript"> 
        function cargarMasNotas(_pagina, _size, _display_search, _filter_autor, _buscar_search){
          div = "#bloque_" + _pagina;
          paginador = "#paginador"; 
          jQuery(paginador).hide();
          $.post("/system/modules/com.tfsla.diario.telesur/elements/TS_Blogs_Page.jsp",
            { pagina: _pagina, size: _size, display_search: _display_search, filter_autor: _filter_autor, buscar_search: _buscar_search }, function(data){
              $(div).html(data);
          }); 
      } 
    </script>
    <script>
        jQuery(document).ready(function($){
          $().GetDestacadoProgramas("<%=programaGet%>");
          $().GetRecomendamos();
          $().GetHeaders("<%=programaGet%>");
      });  
    </script>
  </head>
<body>
    <cms:include page="../elements/TS_Common_Header.jsp" >
        <cms:param name="pageTitle">Programa</cms:param>
        <cms:param name="pageSeccion">programa</cms:param>
        <cms:param name="subMenu">si</cms:param>
        <cms:param name="latest">no</cms:param>
        <cms:param name="agenda">si</cms:param>
    </cms:include>
<!-- Container -->
<div id="container">
    <cms:include page="../elements/TS_Common_LiveBox.jsp" />
    <div class="wrapper">
        <div id="programas" class="altmax">
            <a name="player"></a>
            <div class="headProgramas"><div class="logoProg"></div></div>
            <div class="barBlue">
                <div class="wpRedes">
                    <a href="#" class="fb" data-red="http://facebook.com/sharer.php?u="></a>
                    <a href="#" class="tw" data-red="http://twitter.com/home?status="></a>
                    <!--<a href="#" class="mail" data-red="mailto:test@theearth.com?subject=Circle Around&body=Some blah"></a>-->
                    <a href="#" class="info" data-red="info"></a>
                </div>
            </div>
            <div style="display: none;" class="infoPrograma"></div>
            <div class="videoDestacado" id="BloqueDestacado"></div>
            <div class="boxTwitter">
                <h4>Twitter</h4>
                <div class="box" id="boxTwitter"></div>
            </div>
            <div class="boxRecom" id="BloqueRecomendamos">
                <h4>Te recomendamos</h4>
            </div>
            <cms:include page="../elements/TS_Programas_ultimos.jsp">
                <cms:param name="programa"><%=programaGet%></cms:param>
            </cms:include>
        </div>
    </div><!--wrapper-->
</div><!--conteiner-->
<cms:include page="../elements/TS_Common_Footer.jsp" />
</body>
<script>
  jQuery(document).ready(function($){
    $('.wpRedes a.info').click(function(e) {
      e.preventDefault();
      var elem = $('.infoPrograma');
      if(elem.is(':hidden')){
        elem.slideDown('slow'); 
    }else{
        elem.slideUp('slow');
    }
});
});
</script>
<script>
  $( ".wpRedes" ).delegate( "a", "click", function() {
    var claseredes = $(this).data('red');
    var link = $(location).attr('href');
    if(claseredes!="info"){
      window.open(claseredes+link, "popupWindow", "width=600, height=400, scrollbars=yes");
  }
});
</script>
</html>