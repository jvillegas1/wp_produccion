<%
    /**
    *  Search Form Footer
    *  Formlario de Busqueda del footer
    *
    */
%>
<%@ include file="TS_Common_Libraries.jsp" %>
<%
    String search_form = ( request.getParameter("search_form") != null ) ? request.getParameter("search_form") : "";
    
    org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
%>

<form name="buscadorFooter" class="formSearchFooter" action="/en/search.html" method="post">    
    <div class="wrapper">
        <div class="cont">
            <div class="serchbox">
                <div class="searchboti">Search</div>
                <div class="searchbarbot">
                    <input class="mailbot1" type="text" required  name="search_form" value="<%=search_form %>" >            
                    <input id="subscribebot1" type="submit" value="Search" name="submit">
                </div>
            </div>
        </div>
    </div>
</form>