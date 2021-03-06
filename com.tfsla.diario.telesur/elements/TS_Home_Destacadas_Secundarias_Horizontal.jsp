<%@ include file="TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE";
%>

<div class="wpArticlesMin">

      <nt:news-list order="priority desc,user-modification-date desc" zone="destacada_secundaria" onmainpage="home" size="5" searchindex="<%=index%>">
        <nt:conditional-include oncondition="${newslist.position > 3}"  >
        <meta itemprop="sameAs url" content="<nt:link/>"/>
            <article> 
            <div class="wpSmallImg"> 
              
            <nt:preview-image>              
                  <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                    <a href="<nt:link/>" title="${imageDescription}" alt="${imageDescription}">	
                <img itemprop="contentURL" src="<nt:image-path width='205' height='117' scaletype='2'/>"  width='205' height='107' alt="${imageDescription}" />
                    </a>
            </nt:preview-image>	 
                     
            </div>
            <div class="overflow">
            <h5> 
                <nt:categories>
                    <nt:conditional-include onposition="first">
                        <c:set var="id"><nt:category-name/></c:set>
                            <%
                                String id = pageContext.getAttribute("id").toString();
                                id = id.replaceAll("/system/categories", "");
                            %>	
                        <a href="<%=id%>" class="her" alt="<nt:category-description/>" title="<nt:category-description/>"><nt:category-description/></a>									
                    </nt:conditional-include>
                </nt:categories>								
            </h5>				
            
            <h4>
                <a href="<nt:link/>" title="<nt:title value='home' />">
                    <nt:title value='home' />						
                </a>
            </h4>
            </div>
            </nt:conditional-include> 	   		
        </article> 
            </nt:news-list>
    </div>
    