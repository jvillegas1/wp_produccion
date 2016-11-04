<%@ include file="TS_Common_Libraries.jsp" %>

<%
String category = request.getParameter("category") != null ? request.getParameter("category") : "";	

String claseTitulo = "new-tit"; 
if (category.indexOf("/sport/") > -1 ) claseTitulo = "verde" ; 
if (category.indexOf("/culture/") > -1 ) claseTitulo = "celeste" ; 
%>
<nt:news-list section="news" order="user-modification-date desc" category="<%=category%>" size="7" >			            	
	
	<nt:conditional-include onposition="1,2">
		<!--Noticia -->
		<div class="news-lit lineanews <nt:conditional-exclude onposition='1'> espacio </nt:conditional-exclude>" itemscope itemtype="http://schema.org/Article">
			<nt:preview-image>
		      		<div class="minnews" itemscope itemtype="http://schema.org/ImageObject">
		      			<a href="<nt:link/>" class="her">
		      				<c:set var="imageDescription1" scope="page"><nt:image-description/></c:set>
		  				<nt:conditional-include oncondition="${imageDescription1 != ''}">
		  					<meta itemprop="description" content='<nt:image-description/>'>
							<img itemprop="contentURL" src="<nt:image-path width='268' height='139'  scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' width="268" height="139" />
						</nt:conditional-include>
						<nt:conditional-include oncondition="${imageDescription1 == ''}">
							<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
							<img itemprop="contentURL" src="<nt:image-path width='268' height='139'  scaletype='2'/>" alt='${fn:escapeXml(news.titles["section"])}' title='${fn:escapeXml(news.titles["section"])}' width="268" height="139" />
						</nt:conditional-include>
		      			</a>
		      		</div>
	       		</nt:preview-image>
			<div class="txt-news">
		            	<div class="new-tit" itemprop="name headline">
		                 	<h3>
		                 		<a href="<nt:link/>" class="<%=claseTitulo %>" alt='<nt:title value="section"/>' title='<nt:title value="section"/>'>
		                 			<nt:title value="section"/>
		                 		</a>
		                 	</h3>
		                 	<nt:edit-buttons hasNew="true" hasDelete="true"/>
		             	</div>
		             	
		             	<nt:conditional-include oncondition="${news.hideCopete == 'false'}">
		             		<div class="new-bajada" itemprop="description alternativeHeadline">${news.subtitle}</div>
		             	</nt:conditional-include>
	
				<div class="new-link">                    
				    <c:set var="i" value="0" />
				    <ul class="arrow">  
				    <nt:related-news onmainpage="home">
				        <c:set var="i" value="${i+1}" /> 
				        <c:if test="${i<=2}">
				            <li>
				                <a class="new-arrow blue" href="<nt:link/>" alt='<nt:title value="section"/>' title='<nt:title value="section"/>'><nt:title value="section"/></a>
				            </li>   
				        </c:if> 
				        <c:if test="${i>2 }">                  
				            </ul>
				        </c:if>                    
				    </nt:related-news>              
				</div>	        
	        	</div>
	 	</div>
 	</nt:conditional-include>

    	<nt:conditional-include onposition="3,4">	
		<div class="news-lit <nt:conditional-exclude onposition='4'> espacio </nt:conditional-exclude> <nt:conditional-exclude onposition='3'> lineanews </nt:conditional-exclude>" itemscope itemtype="http://schema.org/Article">	
			<nt:preview-image>	                    
	    			<div class="min80" itemscope itemtype="http://schema.org/ImageObject"> 
	    				<a href="<nt:link/>" class="her" >
						<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
		      				<nt:conditional-include oncondition="${imageDescription != ''}">
		      					<meta itemprop="description" content='<nt:image-description/>'>	
							<img itemprop="contentURL" src="<nt:image-path width='80' height='80'  scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' width="80" height="80" />
						</nt:conditional-include>
						<nt:conditional-include oncondition="${imageDescription == ''}">
							<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
							<img itemprop="contentURL" src="<nt:image-path width='80' height='80'  scaletype='2'/>" alt='${fn:escapeXml(news.titles["section"])}' title='${fn:escapeXml(news.titles["section"])}' width="80" height="80" />
						</nt:conditional-include>
	    				</a>
	    			</div>
			</nt:preview-image>
			<div class="txt-newslit">
	 			<div class="new-tit" itemprop="name headline">
	 				<h4><a href="<nt:link/>" class="<%=claseTitulo %>" alt='<nt:title value="section"/>' title='<nt:title value="section"/>'><nt:title value="section"/></a></h4>
	 				<nt:edit-buttons hasNew="true" hasDelete="true"/>
	 			</div>
	 			<nt:conditional-include oncondition="${news.hideCopete == 'false'}">
	 				<div class="new-bajada"  itemprop="description alternativeHeadline">${news.subtitle}</div>
	 			</nt:conditional-include>             
	        	</div>
	 	</div> 
 	</nt:conditional-include>
	
	
 	<nt:conditional-include onposition="5,6,7">
 		<nt:conditional-include onposition="5">
 			<div class="news-lit espacio lineanews">
 		</nt:conditional-include>		                					                    
			         <div class="new-tit" itemscope itemtype="http://schema.org/Article">			         	
			         	<a class="ita <%=claseTitulo %>" href="<nt:link/>" alt='<nt:title value="section"/>' title='<nt:title value="section"/>' itemprop="name headline">
				         	<nt:title value="section"/> <nt:edit-buttons hasNew="true" hasDelete="true"/>
			         	</a>
			         </div>					        						                                                                 
		<nt:conditional-include oncondition="${newslist.size == newslist.position}">
			</div>	
		</nt:conditional-include>
	</nt:conditional-include>	      	
</nt:news-list>     			                