<%@ include file="TS_Common_Libraries.jsp" %>
<%
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 3);
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
int i = 0;
String categoryPath = "/system/categories/SubSecciones/en/multimedia/infographics/"; 
%>

    <nt:news-list order="priority asc,user-modification-date desc"  page="<%=pagina%>" section="multimedia"  category="<%=categoryPath%>"  size="<%=size%>" publication="9">
	 <% i++;%>
	 <%if(i == 2){%><div class="aside"><%}%>
	 <article class="
	 <%if(i == 1){%>
	 important
	 <%}	 
	 if(i==2 || i==3){%>
	 dest	 
	 <%} %>">
	                         	
                    <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
	        		<nt:preview-image>
							
					<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
	      				
					<nt:conditional-include oncondition="${imageDescription == ''}">
						<c:set var="imageDescription" scope="page">${news.titles[news.titleHomeNum]}</c:set>
					</nt:conditional-include>
					
					<a href="<nt:link/>" title="${imageDescription}">	
						<meta itemprop="description" content='${imageDescription}'>
						<img itemprop="contentURL" src="<nt:image-path width='<%if(i == 1){%>628<%}if(i==2 || i==3){%>306<%}if(i==4 || i==5){%>467<%}%>'
										 height='<%if(i == 1){%>353<%}if(i==2 || i==3){%>172<%}if(i==4 || i==5){%>263<%}%>'
										  scaletype='2'/>"
										   width='<%if(i == 1){%>628<%}if(i==2 || i==3){%>306<%}if(i==4 || i==5){%>467<%}%>' 
										   height='<%if(i == 1){%>353<%}if(i==2 || i==3){%>172<%}if(i==4 || i==5){%>263<%}%>'
										   alt="${imageDescription}" />
						 
					<span class="inf">${news.titles[news.titleHomeNum]}</span>
						
					</a>
					
				</nt:preview-image>	                                 
                        </nt:conditional-include>            
                        <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
	                           <cms:img src="/arte/sinFoto_420x260.jpg" alt="<nt:title value='home'/>"  />		                        
	                           <span class="inf"><span itemprop="name headline"></span><nt:title value='home'/></span>
                        </nt:conditional-include>
                       	                        
                	             
        </article>
        <%if(i == 3){%></div><%}%>
       	               
</nt:news-list>