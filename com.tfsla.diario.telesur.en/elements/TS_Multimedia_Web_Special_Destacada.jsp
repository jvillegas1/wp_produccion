<%@ include file="TS_Common_Libraries.jsp" %>
<%
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 5 );
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
int position = 0;
String categoryPath = "/system/categories/SubSecciones/en/multimedia/destacadawebspecial/"; 
%> 
<nt:news-list order="priority asc,user-modification-date" section="multimedia"  category="<%=categoryPath%>"  size="1" publication="9">	
    <article class="mmdDst interna">		
        <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">								
            <nt:preview-image>							
                <c:set var="imageDescription" scope="page">
                    <nt:image-description/>
                </c:set>			      				
                <nt:conditional-include oncondition="${imageDescription == ''}">
                    <c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
                </nt:conditional-include>
                <a href="
                    <nt:link/>" title="${imageDescription}">	
                    <meta itemprop="description" content='${imageDescription}'>														
                        <img itemprop="contentURL" src="
                            <nt:image-path width='950' height='378' scaletype='2'/>" width='950' height='378' alt="${imageDescription}" />
                </a>			
            </nt:preview-image>										
        </nt:conditional-include>        
	<div class="socleMmd">	
            <small>special</small>
            <hgroup>	
                <h3 itemprop="name headline">				
                    <a href="
                        <nt:link/>" title="<nt:title value='home' />">
                        <nt:title value='home' />	
                        <nt:edit-buttons hasNew="true" hasDelete="true"/>	
                    </a>
                </h3>
                <h4 itemprop="description alternativeHeadline">
                	${news.subtitle}
                </h4>		             
            </hgroup>
        </div>	
    </article>
</nt:news-list>