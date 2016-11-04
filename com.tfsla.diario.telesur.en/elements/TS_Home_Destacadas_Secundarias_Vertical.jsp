<%@ include file="TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE_EN"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";
%>
		
		<div class="asideNotas">
		<nt:news-list order="priority desc,user-modification-date desc" zone="destacada_secundaria" onmainpage="home" size="3" publication="9" searchindex="<%=index%>">
	<meta itemprop="sameAs url" content="<nt:link/>"/>
		<article> 
		<h5> 
                                 
                                    <nt:categories>
                                        <nt:conditional-include onposition="first">
                                            <c:set var="id"><nt:category-name/></c:set>
                                                <% 	
                                                String id =  pageContext.getAttribute("id").toString();
                                                id = id.replaceAll("/system/categories","");
                                                %>	
                                            <a href="<%=id%>" class="her" alt="<nt:category-description/>" title="<nt:category-description/>"><nt:category-description/></a>									
                                        </nt:conditional-include>
                                    </nt:categories>								
                               	</h5>				
								
						<nt:preview-image>							
						<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                 		<a href="<nt:link/>" title="${imageDescription}" alt="${imageDescription}">
			      			<img itemprop="contentURL" src="<nt:image-path width='205' height='117' scaletype='4'/>" alt="${imageDescription}" />
			      			</a>
			      			</nt:preview-image>	
			      
			      		
				<h4>
					<a href="<nt:link/>" title="<nt:title value='home' />">
						<nt:title value='home' />						
					</a>
				</h4>	   		
		
	</article> 
	</nt:news-list>
	</div>
	