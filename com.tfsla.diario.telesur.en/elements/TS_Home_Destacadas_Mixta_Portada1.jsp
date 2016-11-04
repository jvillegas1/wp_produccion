<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE_EN"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";
%>
<div class="listNotas abierto">  
<nt:news-list order="user-modification-date" onmainpage="home" zone="zona_mixta" size="9" publication="9" searchindex="<%=index%>">            
<article>
            <div class="wpSmallImg">        	
	                    <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
	                    
	                    <c:set var="tituloPrincipal" scope="page">
	                    	<nt:title value='section'/>
	                    </c:set>
		        		<nt:preview-image>		        		
	                                        <c:set var="imageDescription" scope="page">
	                                        	<nt:image-description/>
	                                        </c:set>
	                                        <nt:conditional-include oncondition="${imageDescription != ''}">
	                                        	<a href="<nt:link/>" title='<c:out value="${tituloPrincipal}"/>'>
	                                            		<img src="../arte/grey.gif" data-original="<nt:image-path width='146' height='82' scaletype='2'/>" draggable="false" alt="<nt:image-description/>" />
	                                            	</a>
	                                        </nt:conditional-include>
	                                        <nt:conditional-include oncondition="${imageDescription == ''}">
	                                        	<a href="<nt:link/>" title='<c:out value="${tituloPrincipal}"/>'>
	                                            		<img src="../arte/grey.gif" data-original="<nt:image-path width='146' height='82' scaletype='2' />" draggable="false" alt='${news.titles[news.titleHomeNum]}'/>
	                                            	</a>
	                                        </nt:conditional-include>	                                        
	                            	</nt:preview-image>			                                 
	                        </nt:conditional-include>           
	                       <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
		                        <a href="<nt:link/>" title="<nt:title value='section'/>">
		                            <cms:img src="/arte/sinFoto_420x260.jpg" width="100%" height="82" alt="<nt:title value='home'/>"  />
		                        </a>
	                        </nt:conditional-include>
            </div>
            <div class="overflow">
                <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
                    <a href="<nt:link/>" title="<nt:title value='section'/>"><nt:title value="section"/></a>
                </nt:conditional-include>                                   	
                <h4>
                    <a href="<nt:link/>" title="<nt:title value='section'/>"><nt:title value="section"/></a>
                </h4>
            </div>
          </article>
            </nt:news-list>
    </div>