<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<%
    Boolean worldPage = false;
    Boolean reporteroPage = false;
    Boolean agendaPage = false;
    Boolean analisisPage = false;
    Boolean galleryPage = false;
    Boolean InfographicsPage = false;
    Boolean WebSpecial = false;
    Boolean audioPage = false;
    Boolean Opinion = false;
    Boolean NotaScrollPage = false;

%>

<nt:news>

    <c:set var="state" scope="page">${news.state} </c:set> 

    <%        String estado = (String) pageContext.getAttribute("state");
        if (estado.equalsIgnoreCase("pendienteModeracion") || estado.equalsIgnoreCase("rechazada")) {
    %>
    <script type="text/javascript">
        window.location.href = "/index.html";
    </script>
    <%
        }
    %>
    <c:set var="seccion" scope="page"><nt:section-name/></c:set>



    <c:set var="category" scope="page"><nt:categories>
            <nt:category-description/>
        </nt:categories></c:set>


    <jsp:useBean id="category" type="java.lang.String" />
    <jsp:useBean id="seccion" type="java.lang.String" />


    <% if (seccion.indexOf("imreporter") > -1) {
            reporteroPage = true;

        } else {

            if (seccion.indexOf("telesur_agenda") > -1) {
                agendaPage = true;

            } else {
                if (seccion.indexOf("analysis") > -1) {
                    analisisPage = true;

                } else {

                    if (seccion.indexOf("audio") > -1) {
                        audioPage = true;
                    } else {

                        if (category.indexOf("Galleries") > -1) {
                            galleryPage = true;
                        } else {

                            if (category.indexOf("Infographics") > -1) {
                                InfographicsPage = true;
                            } else {
                                if (seccion.indexOf("opinion") > -1) {
                                    Opinion = true;
                                } else {
                                    if (category.indexOf("NotaScroll") > -1) {
                                        NotaScrollPage = true;
                                    } else {

                                        if (category.indexOf("WebSpecial") > -1) {
                                            WebSpecial = true;
                                        } else {
                                            worldPage = true;

                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

        }
    %>

</nt:news>

<% if (reporteroPage) { %>
<cms:include page="TS_Article_SoyReportero.jsp" />
<% } else {
    if (worldPage) { %>
<cms:include page="TS_Article_WorldPage2.jsp" />
<% } else {
    if (analisisPage) { %>
<cms:include page="TS_Article_Analisis.jsp" />
<%} else {
    if (InfographicsPage) { %>
<cms:include page="TS_Article_Infografias.jsp" />
<%} else {
    if (galleryPage) { %>
<cms:include page="TS_Article_Galleries.jsp" />
<%} else {
    if (audioPage) { %>
<cms:include page="TS_Article_Audio.jsp" />		
<% } else {
    if (WebSpecial) { %>
<cms:include page="TS_Article_WebSpecial.jsp" />
<% } else {
    if (Opinion) { %>
<cms:include page="TS_Article_Opinion.jsp" />
<% } else {
    if (NotaScrollPage) { %>
<cms:include page="TS_Article_Nota_Long.jsp" />
<% } else { %>
<cms:include page="TS_Article_Agenda.jsp" />
<%
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
%>