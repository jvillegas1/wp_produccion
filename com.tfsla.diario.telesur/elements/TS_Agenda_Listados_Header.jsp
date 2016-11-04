<%@ include file="TS_Common_Libraries.jsp" %>
<%
	int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 3);
	int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
	int i = 0;
%>

<nt:news-list order="priority desc,user-modification-date desc" publication="8" onmainpage="home" zone="agenda_header" size="3" >
	 <% i++; %>
	 <%if(i == 2){%><div class="aside"><%}%>
	 <article class="<%if(i == 1){%>important<%}else{%>dest<%}%>">
    		<a href="<nt:link/>">                   	
                    <nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
	        		<nt:preview-image>		        		
                                        <c:set var="imageDescription" scope="page">
                                        	<nt:image-description/>
                                        </c:set>
                                        <nt:conditional-include oncondition="${imageDescription != ''}">
                                            		<img src="<nt:image-path />" draggable="false" alt="<nt:image-description/>" style="max-height: <%if(i == 1){%>353<%}else{%>173<%}%>px !important;" />
                                            		<span class="inf">${news.titles[news.titleHomeNum]}</span>
                                        </nt:conditional-include>
                                        <nt:conditional-include oncondition="${imageDescription == ''}">
                                            		<img src="<nt:image-path />" draggable="false" alt='${news.titles[news.titleHomeNum]}' style="max-height: <%if(i == 1){%>353<%}else{%>173<%}%>px !important;"/>
                                            		<span class="inf">${news.titles[news.titleHomeNum]}</span>
                                        </nt:conditional-include>	                                        
                            	</nt:preview-image>			                                 
                        </nt:conditional-include>            
                        <nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
	                           <cms:img src="/arte/sinFoto_420x260.jpg" width="100%" alt="<nt:title value='home'/>"  />		                        
	                           <span class="inf"><nt:title value='home'/></span>
                        </nt:conditional-include>	                        
                </a>	             
        </article>
        <%if(i == 4){%></div><%}%>	               
</nt:news-list>        