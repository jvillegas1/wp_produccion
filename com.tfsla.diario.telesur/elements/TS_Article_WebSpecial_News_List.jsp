<%@ include file="TS_Common_Libraries.jsp" %>
<%
org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);	
request.setCharacterEncoding("UTF-8");
session.setAttribute("seccion","multimedia");
session.setAttribute("url",cms.getRequestContext().getUri());
String category = request.getParameter("category");  
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 6);
int pagina = ( request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1 );
int position = 0;
String categoryPath = "/SubSecciones/multimedia/webspecial/"; 
%>
<div class="row clear">  
    <div class="col">
        <div class="rowInt">
            <nt:news-list order="user-modification-date desc" section="multimedia" page="<%=pagina%>" category="<%=categoryPath%>" size="<%=size%>">
                <article>
                    <div class="wpSmallImg">                
                        <nt:preview-image>      	
                            <nt:conditional-include oncondition="${imageDescription != ''}">
                                <meta itemprop="description" content='<nt:image-description/>'>
                                <!-- IMPORTANTE: utilizo las mejores practicas: No es necesario agregar tags para escalar las imagenes, ya que el tag de newstag lo hace automáticamente, 
                	 	pero se le pueden pasar a newstag 'image-path' todos los parámetros detallados anteriormente. 
                	 	ref: https://projects-308321000001771055.wiki.zoho.com/Imagenes---dentro---del---cms---medios.html-->   	
                                <img itemprop="contentURL" src="<nt:image-path scaletype="2" width="146" height="82" />" alt="<nt:image-description/>" />
                            </nt:conditional-include>
                            <nt:conditional-include oncondition="${imageDescription == ''}">
                                <meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
                                <!-- IMPORTANTE: utilizo las mejores practicas: No es necesario agregar tags para escalar las imagenes, ya que el tag de newstag lo hace automáticamente, 
                	 	pero se le pueden pasar a newstag 'image-path' todos los parámetros detallados anteriormente. 
                	 	ref: https://projects-308321000001771055.wiki.zoho.com/Imagenes---dentro---del---cms---medios.html-->   
                                <img itemprop="contentURL" src="<nt:image-path scaletype="2" width="146" height="82" />" alt='${news.titles[news.titleSectionNum]}' />
                            </nt:conditional-include>
                        </nt:preview-image>
                    </div>
                    <div class="overflow">
                        <a class="her" href="<nt:link/>"><h4 itemprop="name headline"><nt:title value="detail"/></h4></a>
                    </div>
                </article>
                <nt:conditional-include onposition="last">
                    <c:set var="hayMas" value="false"/>	
                    <nt:conditional-include oncondition="${newslist.size == 6}">						
                        <nt:news-list section="multimedia" size="<%=size%>" page="<%=pagina+1%>" category="<%=categoryPath%>">						
                            <c:set var="hayMas" value="true"/>								
                        </nt:news-list>
                        <c:if test="${hayMas == 'true'}" >
                            <div id="bloque_<%=pagina+1%>"></div>
                            <div class="rowInt" id="paginador" > 
                                <a class="btnVermas clear" href="javascript:cargarMasNotas('<%=pagina+1%>','<%=size%>');">Ver más </a>
                            </div>
                        </c:if>	
                    </nt:conditional-include> 
                </nt:conditional-include> 
            </nt:news-list>
        </div>
    </div>
</div>  
	     
	    