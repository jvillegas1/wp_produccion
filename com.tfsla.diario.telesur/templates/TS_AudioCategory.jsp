<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
    org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);

    String category = cms.property("subSeccion");
    String title = cms.property("Title");
    String uri = cms.getRequestContext().getUri();

%>

<!doctype html>
<html>
    <head>
        <script src="http://jwpsrv.com/library/Cs7H6hH+EeWttA4AfQhyIQ.js"></script>
        <cms:include page="../elements/TS_Common_Head.jsp" >
            <cms:param name="template">audio</cms:param>
        </cms:include>  

        <script type="text/javascript">
            function cargarMasNotas2(_pagina, _size) {
                div = "#bloque_" + _pagina;
                paginador = "#paginador";
                jQuery(paginador).hide();
                $.post("/system/modules/com.tfsla.diario.telesur/elements/TS_Audio_Page.jsp",
                        {pagina: _pagina, size: _size}, function (data) {
                    $(div).html(data);
                });
            }

            function cargarMasNotas(_pagina, _size, _filter_autor, _filter_category, _search_form) {

                div = "#bloque_" + _pagina;
                paginador = "#paginador";
                jQuery(paginador).hide();
                $.post("/system/modules/com.tfsla.diario.telesur/elements/TS_Audio_Page.jsp",
                        {pagina: _pagina, size: _size, filter_autor: _filter_autor, filter_form: _filter_category, search_form: _search_form}, function (data) {
                    $("#result").html(data);

                });
            }
        </script> 

    </head>

    <body>

        <cms:include page="../elements/TS_Common_Header.jsp" >
            <cms:param name="pageTitle">Audio</cms:param>
            <cms:param name="pageSeccion">audio</cms:param>
            <cms:param name="agenda">si</cms:param>
            <cms:param name="subMenu">no</cms:param>
            <cms:param name="latest">no</cms:param>       
        </cms:include>


        <!-- Container -->
        <div id="container">
            <cms:include page="../elements/TS_Common_LiveBox.jsp" />
            <div class="wrapper"><!--wrapper--> 

                <!-- Banner 1 -->
                <div class="row clear marginchica"> 
                    <div class="banners pos0">
                        <cms:include page="../elements/TS_Common_Banners.jsp">
                            <cms:param name="template">Audio</cms:param>
                            <cms:param name="key">Advert-950x90</cms:param>
                        </cms:include>
                    </div>
                    <div class="bannerMobile">
                        <cms:include page="../elements/TS_Common_Banners.jsp">
                            <cms:param name="template">Audio</cms:param>
                            <cms:param name="key">Advert-468x60-c-mobile</cms:param>
                        </cms:include>
                    </div>       
                </div>

                <!--Form and Search of Audio-->

                <cms:include page="../elements/TS_Audio_Category.jsp" >
                    <cms:param name="category"><%=category%></cms:param>
                    <cms:param name="title"><%=title%></cms:param>	
                </cms:include>  

                <!-- list of audio -->

                <div class="row clear">    	

                    <%--<cms:include page="../elements/TS_Audio_Page.jsp" />	--%>  
                    <div class="banners">
                        <cms:include page="../elements/TS_Common_Banners.jsp">
                            <cms:param name="template">Audio</cms:param>
                            <cms:param name="key">Advert-728x90-a</cms:param>
                        </cms:include>
                    </div>     	
                </div>

            </div><!--wrapper-->
        </div><!--conteiner-->


        <cms:include page="../elements/TS_Common_Footer.jsp" />

    </body>
    <script type="text/javascript">
    <!-- script menu -->
        var menu = 0
        $('#header .btnMobile').click(function () {
            if (menu == 0) {
                $('#nav').slideDown(750);
                menu++
            } else {
                $('#nav').slideUp(750, function () {
                    $('#nav').removeAttr('style');
                });
                menu--
            }
        });
    </script>
</html>